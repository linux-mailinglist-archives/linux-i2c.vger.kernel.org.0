Return-Path: <linux-i2c+bounces-941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645D81C578
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 08:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959B01C2459B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 07:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA709449;
	Fri, 22 Dec 2023 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qOyxm1vt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182209447;
	Fri, 22 Dec 2023 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1703229663; x=1734765663;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oESX+BUkZxAz71jZzvKrM1mTNFhevHp5W8rdO0Z8t8k=;
  b=qOyxm1vttUy88HxeHgoXiyoxLPht8cgleL8PykWCxaQP4kCHh4gyI1pW
   98jWy88C7IJ/I97H0q2gpe9nwdtzO8mzsVd/qg52a3Wg61kCN9eYpUUP5
   9XE5Lzc23lwHr/1SVQNGC5094UbdbhvcAnjMEW4WKZotdrZvavB12pZlM
   E2Zto7SUBq0cK9q4UGa6J2nWCmexGLjMZxsrwmVvmvgMux62hLgXnvHjN
   njj92o0HDlOutAe7dn9xBsUXiIOrGFYJ6pVSNIt1qJaUQ6ohvR6sv9NeB
   MSATt4OtUhISLiZCK02xz0UGx+FZSsheuahYEm8hkGd7fHgRKOIDUU4VP
   A==;
X-CSE-ConnectionGUID: uQcjyDEvQcSDMcpGsIQQjQ==
X-CSE-MsgGUID: ihjFEEizT2KDbbSmitun8g==
X-IronPort-AV: E=Sophos;i="6.04,294,1695657600"; 
   d="scan'208";a="5470580"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2023 15:20:56 +0800
IronPort-SDR: CEXHnKjsHPutQt4oO99rmFjy4dRq+Z84fz/I7IzL0A9/t4Vlba6q6kLNRo4Tf95lMjCm/UT4bF
 JGk8z1zsQPVg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Dec 2023 22:31:37 -0800
IronPort-SDR: Ki4y3sc9eanqLVJPSvRK3Plkkqvm3WxSIucGgKGnkHBj3F+BvXY4RLXkR4vt4wHn+H01ihUrVB
 ptcRjJhjLbrw==
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 21 Dec 2023 23:20:54 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v2] platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
Date: Fri, 22 Dec 2023 16:20:54 +0900
Message-ID: <20231222072054.1640144-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

p2sb_bar() unhides P2SB device to get resources from the device. It
guards the operation by locking pci_rescan_remove_lock so that parallel
rescans do not find the P2SB device. However, this lock causes deadlock
when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
Hence the deadlock.

To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar().
Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
for fs_initcall which gets and caches the P2SB resources. At p2sb_bar(),
refer the cache and return to the caller.

Link: https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
This patch reflects discussions held at the Link tag. I confirmed this patch
fixes the problem using a system with i2c_i801 device, building i2c_i801
module as both built-in and loadable. Reviews will be appreicated.

Changes from v1:
* Reflected review comments by Andy

Changes from RFC v2:
* Reflected review comments on the list
* Removed RFC prefix

Changes from RFC v1:
* Fixed a build warning poitned out in llvm list by kernel test robot

 drivers/platform/x86/p2sb.c | 172 +++++++++++++++++++++++++++---------
 1 file changed, 131 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 1cf2471d54dd..9693ed065782 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -26,6 +26,19 @@ static const struct x86_cpu_id p2sb_cpu_ids[] = {
 	{}
 };
 
+/*
+ * Cache BAR0 of P2SB device functions 0 to 7.
+ * TODO: Move this definition to pci.h together with same other definitions.
+ */
+#define NR_P2SB_RES_CACHE 8
+
+struct p2sb_res_cache {
+	u32 bus_dev_id;
+	struct resource res;
+};
+
+static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
+
 static int p2sb_get_devfn(unsigned int *devfn)
 {
 	unsigned int fn = P2SB_DEVFN_DEFAULT;
@@ -39,10 +52,15 @@ static int p2sb_get_devfn(unsigned int *devfn)
 	return 0;
 }
 
+static int p2sb_valid_resource(struct resource *res)
+{
+	return res->flags ? 0 : -ENOENT;
+}
+
 /* Copy resource from the first BAR of the device in question */
-static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
+static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 {
-	struct resource *bar0 = &pdev->resource[0];
+	struct resource *bar0 = pci_resource_n(pdev, 0);
 
 	/* Make sure we have no dangling pointers in the output */
 	memset(mem, 0, sizeof(*mem));
@@ -56,12 +74,11 @@ static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 	mem->end = bar0->end;
 	mem->flags = bar0->flags;
 	mem->desc = bar0->desc;
-
-	return 0;
 }
 
-static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+static int p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
 {
+	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
 	struct pci_dev *pdev;
 	int ret;
 
@@ -69,34 +86,58 @@ static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct re
 	if (!pdev)
 		return -ENODEV;
 
-	ret = p2sb_read_bar0(pdev, mem);
+	ret = p2sb_valid_resource(pci_resource_n(pdev, 0));
+	if (ret)
+		return ret;
+
+	p2sb_read_bar0(pdev, &cache->res);
+	cache->bus_dev_id = bus->dev.id;
 
 	pci_stop_and_remove_bus_device(pdev);
-	return ret;
+	return 0;
 }
 
-/**
- * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
- * @bus: PCI bus to communicate with
- * @devfn: PCI slot and function to communicate with
- * @mem: memory resource to be filled in
- *
- * The BIOS prevents the P2SB device from being enumerated by the PCI
- * subsystem, so we need to unhide and hide it back to lookup the BAR.
- *
- * if @bus is NULL, the bus 0 in domain 0 will be used.
- * If @devfn is 0, it will be replaced by devfn of the P2SB device.
- *
- * Caller must provide a valid pointer to @mem.
- *
- * Locking is handled by pci_rescan_remove_lock mutex.
- *
- * Return:
- * 0 on success or appropriate errno value on error.
- */
-int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
+{
+	unsigned int slot, fn;
+	int ret;
+
+	/* Scan the P2SB device and cache its BAR0 */
+	ret = p2sb_scan_and_cache_devfn(bus, devfn);
+	if (ret)
+		return ret;
+
+	/*
+	 * When function number of the P2SB device is zero, scan other function
+	 * numbers.
+	 */
+	if (PCI_FUNC(devfn) != 0)
+		return 0;
+
+	/* If devices are available, cache their BAR0 */
+	slot = PCI_SLOT(devfn);
+	for (fn = 1; fn < NR_P2SB_RES_CACHE; fn++)
+		p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
+
+	return 0;
+}
+
+static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
+{
+	static struct pci_bus *p2sb_bus;
+
+	bus = bus ?: p2sb_bus;
+	if (bus)
+		return bus;
+
+	/* Assume P2SB is on the bus 0 in domain 0 */
+	p2sb_bus = pci_find_bus(0, 0);
+	return p2sb_bus;
+}
+
+static int p2sb_cache_resources(void)
 {
-	struct pci_dev *pdev_p2sb;
+	static struct pci_bus *bus;
 	unsigned int devfn_p2sb;
 	u32 value = P2SBC_HIDE;
 	int ret;
@@ -106,8 +147,9 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	if (ret)
 		return ret;
 
-	/* if @bus is NULL, use bus 0 in domain 0 */
-	bus = bus ?: pci_find_bus(0, 0);
+	bus = p2sb_get_bus(NULL);
+	if (!bus)
+		return -ENODEV;
 
 	/*
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
@@ -115,30 +157,78 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	 */
 	pci_lock_rescan_remove();
 
-	/* Unhide the P2SB device, if needed */
+	/*
+	 * The BIOS prevents the P2SB device from being enumerated by the PCI
+	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
+	 * Unhide the P2SB device here, if needed.
+	 */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
 	if (value & P2SBC_HIDE)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
 
-	pdev_p2sb = pci_scan_single_device(bus, devfn_p2sb);
-	if (devfn)
-		ret = p2sb_scan_and_read(bus, devfn, mem);
-	else
-		ret = p2sb_read_bar0(pdev_p2sb, mem);
-	pci_stop_and_remove_bus_device(pdev_p2sb);
+	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
 
 	/* Hide the P2SB device, if it was hidden */
 	if (value & P2SBC_HIDE)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
-
 	pci_unlock_rescan_remove();
 
-	if (ret)
-		return ret;
+	return ret;
+}
+
+/**
+ * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
+ * @bus: PCI bus to communicate with
+ * @devfn: PCI slot and function to communicate with
+ * @mem: memory resource to be filled in
+ *
+ * If @bus is NULL, the bus 0 in domain 0 will be used.
+ * If @devfn is 0, it will be replaced by devfn of the P2SB device.
+ *
+ * Caller must provide a valid pointer to @mem.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+{
+	struct p2sb_res_cache *cache;
+	int ret;
+
+	bus = p2sb_get_bus(bus);
+	if (!bus)
+		return -ENODEV;
 
-	if (mem->flags == 0)
+	if (!devfn) {
+		ret = p2sb_get_devfn(&devfn);
+		if (ret)
+			return ret;
+	}
+
+	cache = &p2sb_resources[PCI_FUNC(devfn)];
+	if (cache->bus_dev_id != bus->dev.id)
 		return -ENODEV;
 
+	ret = p2sb_valid_resource(&cache->res);
+	if (ret)
+		return ret;
+
+	memcpy(mem, &cache->res, sizeof(*mem));
 	return 0;
 }
 EXPORT_SYMBOL_GPL(p2sb_bar);
+
+static int __init p2sb_fs_init(void)
+{
+	p2sb_cache_resources();
+	return 0;
+}
+
+/*
+ * pci_rescan_remove_lock avoids access to unhidden P2SB devices, but it causes
+ * deadlock with sysfs pci bus rescan. To avoid the deadlock, access to P2SB
+ * devices at an early step in kernel initialization and cache required
+ * resources. This should happen after subsys_initcall which initializes PCI
+ * subsystem and before device_initcall which requires P2SB resources.
+ */
+fs_initcall(p2sb_fs_init);
-- 
2.43.0


