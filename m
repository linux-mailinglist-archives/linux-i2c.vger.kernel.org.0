Return-Path: <linux-i2c+bounces-1111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20C8240CC
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 12:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14F4BB23CB1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 11:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB755210E9;
	Thu,  4 Jan 2024 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="L1tRvwpB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23071EA78;
	Thu,  4 Jan 2024 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704368454; x=1735904454;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qqIvYHyZtLDFAG79w4D4ay9phSmtVsCHIRzxtgkUTcw=;
  b=L1tRvwpB3g+RvVATubn95IJW7nWLjG9UT+3ebAiCGiHyWtU2U5b0aLTo
   CqR9+ctOyICVX8GOmlr8KeWvsC2+ZI1aHpnsHffGQvWTAbTioyREE4caO
   wkpfwKBHIZPv5xgwTx7oUx2yKV/iJDVK3ff+1WbPW0oMfhjPn8lSjs9Qu
   XV7v4EPny4U7bXc7S8tjVAWxsBqeODTsTfVczOoAR/rXSrs2WWY7NqBET
   UyHjAwuOvFboOy01DYV9IQg27vI+l3jwiyT8RLfiVb+leZgUBdcmiBoIq
   PX+xkl6YR20wXalfVAJL7+oJ8/iye8u28An2fRQEOlOOK/bI5RA5J36H6
   w==;
X-CSE-ConnectionGUID: bAfmldJFRd2b9Jg7TTT1Aw==
X-CSE-MsgGUID: yf1mnJNbTzadazHLIv+q4w==
X-IronPort-AV: E=Sophos;i="6.04,330,1695657600"; 
   d="scan'208";a="6144984"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2024 19:40:52 +0800
IronPort-SDR: R+P7sbiHEViQ4NkJ/ftwW/jSdvJwQ1K0y2IcbKfo2dTPaSmLBwxuH1cOxbbUupLKAp7xS1ypYB
 0Tkmx5DyNGEA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jan 2024 02:51:17 -0800
IronPort-SDR: SnGRchTRJhByQoNUkYWi+SpSOIqtcbfy6YFlPS+KFnTPmnm3CEBMQGkv4u8n5sV/DQj/dLOQMq
 Y051cudheaKg==
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 04 Jan 2024 03:40:51 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH] Revert "platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe"
Date: Thu,  4 Jan 2024 20:40:50 +0900
Message-ID: <20240104114050.3142690-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit b28ff7a7c3245d7f62acc20f15b4361292fe4117.

The commit introduced P2SB device scan and resource cache during the
boot process to avoid deadlock. But it caused detection failure of
IDE controllers on old systems [1]. The IDE controllers on old systems
and P2SB devices on newer systems have same PCI DEVFN. It is suspected
the confusion between those two is the failure cause. Revert the change
at this moment until the proper solution gets ready.

Link: https://lore.kernel.org/platform-driver-x86/CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com/T/#m07b30468d9676fc5e3bb2122371121e4559bb383 [1]
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
Ilpo, it's my sorrow but could you handle this revert patch to be pulled to
Linus master branch? As reported in the link [1], the commit caused the IDE
controller detection failure. It does not look straight forward to fix it,
and it will take time to prepare the proper fix. v6.7 release date is close.
Sorry but let me ask your quick action. If I should directly send this revert
request to Linus, please let me know.

 drivers/platform/x86/p2sb.c | 172 +++++++++---------------------------
 1 file changed, 41 insertions(+), 131 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index fcf1ce8bbdc5..1cf2471d54dd 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -26,21 +26,6 @@ static const struct x86_cpu_id p2sb_cpu_ids[] = {
 	{}
 };
 
-/*
- * Cache BAR0 of P2SB device functions 0 to 7.
- * TODO: The constant 8 is the number of functions that PCI specification
- *       defines. Same definitions exist tree-wide. Unify this definition and
- *       the other definitions then move to include/uapi/linux/pci.h.
- */
-#define NR_P2SB_RES_CACHE 8
-
-struct p2sb_res_cache {
-	u32 bus_dev_id;
-	struct resource res;
-};
-
-static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
-
 static int p2sb_get_devfn(unsigned int *devfn)
 {
 	unsigned int fn = P2SB_DEVFN_DEFAULT;
@@ -54,16 +39,8 @@ static int p2sb_get_devfn(unsigned int *devfn)
 	return 0;
 }
 
-static bool p2sb_valid_resource(struct resource *res)
-{
-	if (res->flags)
-		return true;
-
-	return false;
-}
-
 /* Copy resource from the first BAR of the device in question */
-static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
+static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 {
 	struct resource *bar0 = &pdev->resource[0];
 
@@ -79,64 +56,47 @@ static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 	mem->end = bar0->end;
 	mem->flags = bar0->flags;
 	mem->desc = bar0->desc;
+
+	return 0;
 }
 
-static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
+static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 {
-	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
 	struct pci_dev *pdev;
+	int ret;
 
 	pdev = pci_scan_single_device(bus, devfn);
 	if (!pdev)
-		return;
+		return -ENODEV;
 
-	p2sb_read_bar0(pdev, &cache->res);
-	cache->bus_dev_id = bus->dev.id;
+	ret = p2sb_read_bar0(pdev, mem);
 
 	pci_stop_and_remove_bus_device(pdev);
-	return;
-}
-
-static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
-{
-	unsigned int slot, fn;
-
-	if (PCI_FUNC(devfn) == 0) {
-		/*
-		 * When function number of the P2SB device is zero, scan it and
-		 * other function numbers, and if devices are available, cache
-		 * their BAR0s.
-		 */
-		slot = PCI_SLOT(devfn);
-		for (fn = 0; fn < NR_P2SB_RES_CACHE; fn++)
-			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
-	} else {
-		/* Scan the P2SB device and cache its BAR0 */
-		p2sb_scan_and_cache_devfn(bus, devfn);
-	}
-
-	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
-		return -ENOENT;
-
-	return 0;
-}
-
-static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
-{
-	static struct pci_bus *p2sb_bus;
-
-	bus = bus ?: p2sb_bus;
-	if (bus)
-		return bus;
-
-	/* Assume P2SB is on the bus 0 in domain 0 */
-	p2sb_bus = pci_find_bus(0, 0);
-	return p2sb_bus;
+	return ret;
 }
 
-static int p2sb_cache_resources(void)
+/**
+ * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
+ * @bus: PCI bus to communicate with
+ * @devfn: PCI slot and function to communicate with
+ * @mem: memory resource to be filled in
+ *
+ * The BIOS prevents the P2SB device from being enumerated by the PCI
+ * subsystem, so we need to unhide and hide it back to lookup the BAR.
+ *
+ * if @bus is NULL, the bus 0 in domain 0 will be used.
+ * If @devfn is 0, it will be replaced by devfn of the P2SB device.
+ *
+ * Caller must provide a valid pointer to @mem.
+ *
+ * Locking is handled by pci_rescan_remove_lock mutex.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 {
-	struct pci_bus *bus;
+	struct pci_dev *pdev_p2sb;
 	unsigned int devfn_p2sb;
 	u32 value = P2SBC_HIDE;
 	int ret;
@@ -146,9 +106,8 @@ static int p2sb_cache_resources(void)
 	if (ret)
 		return ret;
 
-	bus = p2sb_get_bus(NULL);
-	if (!bus)
-		return -ENODEV;
+	/* if @bus is NULL, use bus 0 in domain 0 */
+	bus = bus ?: pci_find_bus(0, 0);
 
 	/*
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
@@ -156,16 +115,17 @@ static int p2sb_cache_resources(void)
 	 */
 	pci_lock_rescan_remove();
 
-	/*
-	 * The BIOS prevents the P2SB device from being enumerated by the PCI
-	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
-	 * Unhide the P2SB device here, if needed.
-	 */
+	/* Unhide the P2SB device, if needed */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
 	if (value & P2SBC_HIDE)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
 
-	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
+	pdev_p2sb = pci_scan_single_device(bus, devfn_p2sb);
+	if (devfn)
+		ret = p2sb_scan_and_read(bus, devfn, mem);
+	else
+		ret = p2sb_read_bar0(pdev_p2sb, mem);
+	pci_stop_and_remove_bus_device(pdev_p2sb);
 
 	/* Hide the P2SB device, if it was hidden */
 	if (value & P2SBC_HIDE)
@@ -173,62 +133,12 @@ static int p2sb_cache_resources(void)
 
 	pci_unlock_rescan_remove();
 
-	return ret;
-}
-
-/**
- * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
- * @bus: PCI bus to communicate with
- * @devfn: PCI slot and function to communicate with
- * @mem: memory resource to be filled in
- *
- * If @bus is NULL, the bus 0 in domain 0 will be used.
- * If @devfn is 0, it will be replaced by devfn of the P2SB device.
- *
- * Caller must provide a valid pointer to @mem.
- *
- * Return:
- * 0 on success or appropriate errno value on error.
- */
-int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
-{
-	struct p2sb_res_cache *cache;
-	int ret;
-
-	bus = p2sb_get_bus(bus);
-	if (!bus)
-		return -ENODEV;
-
-	if (!devfn) {
-		ret = p2sb_get_devfn(&devfn);
-		if (ret)
-			return ret;
-	}
+	if (ret)
+		return ret;
 
-	cache = &p2sb_resources[PCI_FUNC(devfn)];
-	if (cache->bus_dev_id != bus->dev.id)
+	if (mem->flags == 0)
 		return -ENODEV;
 
-	if (!p2sb_valid_resource(&cache->res))
-		return -ENOENT;
-
-	memcpy(mem, &cache->res, sizeof(*mem));
 	return 0;
 }
 EXPORT_SYMBOL_GPL(p2sb_bar);
-
-static int __init p2sb_fs_init(void)
-{
-	p2sb_cache_resources();
-	return 0;
-}
-
-/*
- * pci_rescan_remove_lock to avoid access to unhidden P2SB devices can
- * not be locked in sysfs pci bus rescan path because of deadlock. To
- * avoid the deadlock, access to P2SB devices with the lock at an early
- * step in kernel initialization and cache required resources. This
- * should happen after subsys_initcall which initializes PCI subsystem
- * and before device_initcall which requires P2SB resources.
- */
-fs_initcall(p2sb_fs_init);
-- 
2.43.0


