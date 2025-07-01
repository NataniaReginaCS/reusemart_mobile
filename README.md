# ReuseMart 🛒

Reusemart is a platform designed to support sustainable second-hand item sales, donations, and warehouse management. Built with Laravel for the backend and a modern UI on the frontend, Reusemart facilitates item consignments, donation management, and role-based access across various user types, including owners, couriers, warehouse staff, hunters, and customers.

#### Fitur Utama
- Item Consignment (Barang Titipan): Allows users with the "Penitip" role to consign items for sale. Supports multi-item consignments in a single transaction and detailed item management.
- Donations: Users can donate items, which are reviewed and approved by the Owner role. Donations are linked to organizations.
- Warehouse Management: Warehouse staff can manage the status, stock, and storage location of consigned items.
- Commission System: Customizable commission rules based on item conditions, extensions, and whether a hunter is involved.
- Point Redemption: Buyers can redeem accumulated points for rewards. Only available to users with the "Pembeli" role.
- Rating & Discussion: "Penitip" users can receive ratings and engage in discussions related to their items.
- User & Role Management: Uses Spatie Laravel Permission to implement fine-grained role-based access for Owners, Admins, Couriers, Warehouse Staff, Hunters, and Customers.
- Reports & Logs: Includes structured reports that log consignments, commissions, and transactions involving hunters and warehouses.
- Integrated Payment: One fixed payment method for simplicity.
- Internal Delivery: Deliveries are managed exclusively by internal couriers (no third-party services).
- Badge System: Badges are awarded to "Penitip" users based on performance or milestones.

## Preview
![image](https://github.com/user-attachments/assets/ed73da58-44bd-4bfe-857e-1e0586a6ae34)
![image](https://github.com/user-attachments/assets/f0b4bb41-3820-443f-973a-fe648f365e4e)


