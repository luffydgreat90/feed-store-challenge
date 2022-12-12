//
// Copyright © Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedFeedImage)
final class ManagedFeedImage: NSManagedObject {
	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: ManagedCache
}

extension ManagedFeedImage {
	static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map({ local in
			let manage = ManagedFeedImage(context: context)
			manage.id = local.id
			manage.url = local.url
			manage.imageDescription = local.description
			manage.location = local.location
			return manage
		}))
	}

	var local: LocalFeedImage {
		return LocalFeedImage(id: id,
		                      description: imageDescription,
		                      location: location,
		                      url: url)
	}
}
