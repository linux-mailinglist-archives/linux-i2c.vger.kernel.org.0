Return-Path: <linux-i2c+bounces-12426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B00B3524D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 05:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6593A8BFE
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 03:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F5E2D3731;
	Tue, 26 Aug 2025 03:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2BtS25GH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2947257825;
	Tue, 26 Aug 2025 03:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756179898; cv=none; b=tJ6hrbNXygCmsXWFzY858jWjFvY6AaW9UjPFgn8UHtQ73AsPZEZI+2vMsspAoOlwrJzmX55xpJBFfrhKDUpj4DcOLTsBLxwMdAmmc6bibZxsLykePwvCRa5lSKFnDGTkyO6x9rb2gxhlCi9kU6CxtgtLXh1vxOw+z4Vpvz5dpYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756179898; c=relaxed/simple;
	bh=8ukb//mvVuTkGejFGQ7BOo35mzSCQOdtmiHyfkQPWF4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NmUZLzPBhEtYpGE6/I32t4VbLYJ4z5sG0xWNa1jUQ/v0jdR88QS5Ba+tNlB4EwnlVuWdxg686zZa6XaxCzJLThWQ3Gy+35vSt+kymxWH0QgFuFplpBaObCrJzyzxJjNhjy2ymZpcUML1J+irawcmmRHt+kN1jaT9UVY/N3goTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2BtS25GH; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756179897; x=1787715897;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8ukb//mvVuTkGejFGQ7BOo35mzSCQOdtmiHyfkQPWF4=;
  b=2BtS25GHXNUg3SOA1aiF8mkG8gT42d2f2CSe1APCuOKL1FLSR3rERNi9
   jNKzRmp4q+fV8327IXxR3R4Wqwc8jmyOAVp7JaRUcYJQNVuuvbfkkJetP
   mEZ2LzMOyEdnNXahVXCBvI2IA/2HlVCfMwQp5KCLsHJjRJTuJGXbZdQGA
   OMSSCpzTfGOZfk1d3yxv3gyNFQSEo1g0kENHElZV+PyNSOyHt/MbNVplQ
   yapYAqMP+45/sP9R4SJPANtOKkS9rIege1zhHyM1k0FEmC5XgYziGdzex
   7mIEIQ4HfNbdwbLvG05biHKDk/xjpeVj8EltBMTWfxzHLWCa1GbM8I511
   w==;
X-CSE-ConnectionGUID: ol3xAaW4TMCMWnKGSyp44Q==
X-CSE-MsgGUID: QNYLLhVoSCqli9xDLdwXNA==
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="45641330"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 20:44:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 20:44:15 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 25 Aug 2025 20:44:13 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <tharunkumar.pasumarthi@microchip.com>,
	<kumaravel.thiagarajan@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH RESEND v1 i2c-master] i2c: mchp-pci1xxxx: PCIe Hot reset disable support for Rev C0+ devices
Date: Tue, 26 Aug 2025 09:10:09 +0530
Message-ID: <20250826034010.8084-1-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Systems that issue PCIe hot reset requests during a suspend/resume
cycle cause PCI1XXXX device revisions prior to C0 to get its SMBUS
controller registers reset to hardware default values. This results
in device inaccessibility and I2C read/write failure. Starting with
Revision C0, support was added in the device hardware (via the Hot
Reset Disable Bit) to allow resetting only the PCIe interface and its
associated logic, but preserving the SMBUS registers during a hot
reset. This patch enables the hot reset disable feature during suspend/
resume for C0 and later revisions of the device.

Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index cb9455b38c1d..797ccac8b339 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -21,6 +21,7 @@
 
 #define SMBUS_MAST_CORE_ADDR_BASE		0x00000
 #define SMBUS_MAST_SYS_REG_ADDR_BASE		0x01000
+#define CONFIG_REG_ADDR_BASE			0x00000
 
 /* SMB register space. */
 #define SMB_CORE_CTRL_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x00)
@@ -300,6 +301,7 @@
 #define SMBUS_RESET_REG		(SMBUS_MAST_CORE_ADDR_BASE + 0x248)
 
 #define PERI_SMBUS_D3_RESET_DIS		BIT(16)
+#define PERI_SMBUS_HOT_RESET_DIS	BIT(17)
 
 #define SMBUS_MST_BUF		(SMBUS_MAST_CORE_ADDR_BASE + 0x280)
 
@@ -316,6 +318,14 @@
 #define SMB_GPR_REG		(SMBUS_MAST_CORE_ADDR_BASE + 0x1000 + 0x0c00 + \
 				0x00)
 
+/* Device Revision Register. */
+#define SMB_GPR_DEV_REV_REG	(SMBUS_MAST_CORE_ADDR_BASE + \
+				 SMBUS_MAST_SYS_REG_ADDR_BASE + \
+				 CONFIG_REG_ADDR_BASE + \
+				 0x0000)
+
+#define SMB_GPR_DEV_REV_MASK	GENMASK(7, 0)
+
 /* Lock Register. */
 #define SMB_GPR_LOCK_REG	(SMBUS_MAST_CORE_ADDR_BASE + 0x1000 + 0x0000 + \
 				0x00A0)
@@ -327,6 +337,7 @@ struct pci1xxxx_i2c {
 	bool i2c_xfer_in_progress;
 	struct i2c_adapter adap;
 	void __iomem *i2c_base;
+	u32 dev_rev;
 	u32 freq;
 	u32 flags;
 };
@@ -1086,6 +1097,8 @@ static int pci1xxxx_i2c_suspend(struct device *dev)
 	 * registers.
 	 */
 	regval = readl(p);
+	if (i2c->dev_rev >= 0xC0)
+		regval |= PERI_SMBUS_HOT_RESET_DIS;
 	regval |= PERI_SMBUS_D3_RESET_DIS;
 	writel(regval, p);
 
@@ -1108,6 +1121,8 @@ static int pci1xxxx_i2c_resume(struct device *dev)
 	writew(regval, p1);
 	pci1xxxx_i2c_config_high_level_intr(i2c, SMBALERT_WAKE_INTR_MASK, false);
 	regval = readl(p2);
+	if (i2c->dev_rev >= 0xC0)
+		regval &= ~PERI_SMBUS_HOT_RESET_DIS;
 	regval &= ~PERI_SMBUS_D3_RESET_DIS;
 	writel(regval, p2);
 	i2c_mark_adapter_resumed(&i2c->adap);
@@ -1126,6 +1141,25 @@ static void pci1xxxx_i2c_shutdown(void *data)
 	pci1xxxx_i2c_configure_core_reg(i2c, false);
 }
 
+static int pci1xxxx_i2c_get_device_revision(struct pci1xxxx_i2c *i2c)
+{
+	void __iomem *p = i2c->i2c_base + SMB_GPR_DEV_REV_REG;
+	u32 regval;
+	int ret;
+
+	ret = set_sys_lock(i2c);
+
+	if (ret)
+		return ret;
+
+	regval = readl(p);
+	i2c->dev_rev = regval & SMB_GPR_DEV_REV_MASK;
+
+	release_sys_lock(i2c);
+
+	return ret;
+}
+
 static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
 				  const struct pci_device_id *ent)
 {
@@ -1158,6 +1192,10 @@ static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
 	init_completion(&i2c->i2c_xfer_done);
 	pci1xxxx_i2c_init(i2c);
 
+	ret = pci1xxxx_i2c_get_device_revision(i2c);
+	if (ret)
+		return ret;
+
 	ret = devm_add_action(dev, pci1xxxx_i2c_shutdown, i2c);
 	if (ret)
 		return ret;
-- 
2.25.1


