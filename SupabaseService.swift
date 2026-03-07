import Foundation
import Supabase

class SupabaseService {

    static let shared = SupabaseService()

    let client: SupabaseClient

    private init() {

        guard
            let url = ProcessInfo.processInfo.environment["SUPABASE_URL"],
            let key = ProcessInfo.processInfo.environment["SUPABASE_KEY"]
        else {
            fatalError("Missing Supabase environment variables")
        }

        client = SupabaseClient(
            supabaseURL: URL(string: url)!,
            supabaseKey: key
        )
    }

    func fetchDays() async throws -> [DayEntry] {

        let response: [DayEntry] = try await client
            .from("planning")
            .select()
            .execute()
            .value

        return response
    }

    func saveDay(_ day: DayEntry) async throws {

        try await client
            .from("planning")
            .upsert(day)
            .execute()
    }
}