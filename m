Return-Path: <linux-i2c+bounces-573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 994ED8008DB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 11:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B42301C20F02
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 10:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AC41DA53;
	Fri,  1 Dec 2023 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="p1ThHVde"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7C8196;
	Fri,  1 Dec 2023 02:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1701427683; x=1732963683;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1i0nYG8BuzdMoGOOxzTWiNdBaogXPvI/CqoXRLh93/Q=;
  b=p1ThHVdeZ3WlXJUF6yzfUDQAFB/gBtmKuDpbVMKpqKZvfTScJqhZx9jT
   40AgvAiqRafWyOw3z95Oeg38ZvzXr/qTlDuGceqAdZ8TBfffZurmt3LYh
   w8CxkaULCcE/W9JUmW6B5pKt7QYnt3KSUyyTVT+TFz18KUE5BPAGeo4US
   ZQy+jwz6Iq2tyWsGsIubsqRUADueC11AeqV5hLQoUO3dbwZHCqS7xEUvK
   jvOHe1KSU+toXAZ2DRsq1O/tliA8Z1N9KpS2VMLK5TgeAC2OlwbfZjTLU
   ZW19GOMmgklJxzobaPHPEkJTwGzcrSPyKVUH6bzATDPOuXYSnKmOC46JQ
   A==;
X-CSE-ConnectionGUID: jaWBBaG1RuefeGN4A/L58Q==
X-CSE-MsgGUID: zGVqcCVzQTufvbGrciDdvw==
X-IronPort-AV: E=Sophos;i="6.04,241,1695657600"; 
   d="scan'208";a="3756297"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2023 18:48:02 +0800
IronPort-SDR: R2c5retJyX9F08/9Yfn07zgYsa899TWEuSZ0fyL4uVbe5kUb8/afLQgWteztnxki+V+xhswqWG
 nX6FlbVkpWhw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Dec 2023 01:59:08 -0800
IronPort-SDR: qhAolU6TQ3AsAvnL3+Fh3q14Qe6lFJqpy71gbIcgTnHkT3k93XCSQUBqD9oQIh0nx5eY42R4J0
 vvflOUIKuGyw==
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com) ([10.149.53.55])
  by uls-op-cesaip01.wdc.com with ESMTP; 01 Dec 2023 02:48:01 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH RFC] platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
Date: Fri,  1 Dec 2023 19:47:59 +0900
Message-ID: <20231201104759.949340-1-shinichiro.kawasaki@wdc.com>
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

 drivers/platform/x86/p2sb.c | 125 +++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 1cf2471d54dd..97e9b44f5f1a 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -26,6 +26,16 @@ static const struct x86_cpu_id p2sb_cpu_ids[] = {
 	{}
 };
 
+/* Cache BAR0 of P2SB device from function 0 ot 7 */
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
@@ -39,8 +49,13 @@ static int p2sb_get_devfn(unsigned int *devfn)
 	return 0;
 }
 
+static bool p2sb_invalid_resource(struct resource *res)
+{
+	return res->flags == 0;
+}
+
 /* Copy resource from the first BAR of the device in question */
-static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
+static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 {
 	struct resource *bar0 = &pdev->resource[0];
 
@@ -56,48 +71,29 @@ static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 	mem->end = bar0->end;
 	mem->flags = bar0->flags;
 	mem->desc = bar0->desc;
-
-	return 0;
 }
 
-static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
 {
 	struct pci_dev *pdev;
 	int ret;
+	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
 
 	pdev = pci_scan_single_device(bus, devfn);
-	if (!pdev)
+	if (!pdev || p2sb_invalid_resource(&pdev->resource[0]))
 		return -ENODEV;
 
-	ret = p2sb_read_bar0(pdev, mem);
+	p2sb_read_bar0(pdev, &cache->res);
+	cache->bus_dev_id = bus->dev.id;
 
 	pci_stop_and_remove_bus_device(pdev);
 	return ret;
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
+static int p2sb_cache_resources(void)
 {
-	struct pci_dev *pdev_p2sb;
-	unsigned int devfn_p2sb;
+	struct pci_bus *bus;
+	unsigned int devfn_p2sb, slot_p2sb, fn;
 	u32 value = P2SBC_HIDE;
 	int ret;
 
@@ -106,8 +102,8 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	if (ret)
 		return ret;
 
-	/* if @bus is NULL, use bus 0 in domain 0 */
-	bus = bus ?: pci_find_bus(0, 0);
+	/* Assume P2SB is on the bus 0 in domain 0 */
+	bus = pci_find_bus(0, 0);
 
 	/*
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
@@ -115,18 +111,31 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
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
+	/* Scan the P2SB device and cache its BAR0 */
+	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
+	if (ret)
+		goto out;
 
+	/*
+	 * When function number of the P2SB device is zero, scan other function
+	 * numbers. If devices are available, cache their BAR0.
+	 */
+	if (!PCI_FUNC(devfn_p2sb)) {
+		slot_p2sb = PCI_SLOT(devfn_p2sb);
+		for (fn = 1; fn < 8; fn++)
+			p2sb_scan_and_cache(bus, PCI_DEVFN(slot_p2sb, fn));
+	}
+
+out:
 	/* Hide the P2SB device, if it was hidden */
 	if (value & P2SBC_HIDE)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
@@ -136,9 +145,49 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	if (ret)
 		return ret;
 
-	if (mem->flags == 0)
+	return 0;
+}
+
+/**
+ * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
+ * @bus: PCI bus to communicate with
+ * @devfn: PCI slot and function to communicate with
+ * @mem: memory resource to be filled in
+ *
+ * if @bus is NULL, the bus 0 in domain 0 will be used.
+ * If @devfn is 0, it will be replaced by devfn of the P2SB device.
+ *
+ * Caller must provide a valid pointer to @mem.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+{
+	int ret;
+	struct p2sb_res_cache *cache;
+
+	bus = bus ? bus : pci_find_bus(0, 0);
+
+	if (!devfn) {
+		ret = p2sb_get_devfn(&devfn);
+		if (ret)
+			return ret;
+	}
+
+	cache = &p2sb_resources[PCI_FUNC(devfn)];
+	if (p2sb_invalid_resource(&cache->res) ||
+	    cache->bus_dev_id != bus->dev.id)
 		return -ENODEV;
 
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
+fs_initcall(p2sb_fs_init);
-- 
2.43.0


