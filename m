Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE04F47C644
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240053AbhLUSTP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:19:15 -0500
Received: from mga01.intel.com ([192.55.52.88]:5883 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241116AbhLUSTO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110754; x=1671646754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BM+GedXU52ed9LruLT4278kSKAXmeTbOHJsmjmUCNNk=;
  b=nUynxcRdY32+My7JTwYlKRu3ov5+YQSKZ4xSjbwYaPimTZZ7vsSOnv5O
   FcMDkQ0Y+S7zaBDejL+AZfK0uChVzkz8+TtbO4T78W+5zrEVlTFDK4r41
   aiLNir83YL5SnCViFlryc71+/skvgRUGs6L8P7m88xbKRqKA1CzEHNpC0
   0vJqpJYQLckfr6HqVYXUtkw9LNcIEqypcQJk9/Eq5uyfoAr6lFW3D15Q5
   EZ96EcnNX5mdgUJqeuY8Yk9FUqwM+FvqgQYK6+x4XmwJl4+gA0frlCDNO
   /CKkh7a47KqHTKohLBKYT5SVFg81ejlJ+bHJkCjMSbJcIdjauCiJGdk2U
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="264655636"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="264655636"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 10:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="616857788"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 21 Dec 2021 10:15:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ECB662D2; Tue, 21 Dec 2021 20:15:39 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v3 2/8] PCI: Convert __pci_read_base() to __pci_bus_read_base()
Date:   Tue, 21 Dec 2021 20:15:20 +0200
Message-Id: <20211221181526.53798-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some drivers would like to read PCI BAR of the devices which has been not or
can't be enumerated.

In particular such mechanism is required to read PCI BAR of hidden
devices behind Primary to Sideband (P2SB) bridge.

Refactor __pci_read_base() to provide __pci_bus_read_base() and
represent the former one as static inline helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/pci.h   | 16 +++++++++--
 drivers/pci/probe.c | 69 +++++++++++++++++++++++----------------------
 2 files changed, 50 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3d60cabde1a1..a03fd2da89b6 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -233,8 +233,20 @@ bool pci_bus_generic_read_dev_vendor_id(struct pci_bus *bus, int devfn, u32 *pl,
 int pci_idt_bus_quirk(struct pci_bus *bus, int devfn, u32 *pl, int crs_timeout);
 
 int pci_setup_device(struct pci_dev *dev);
-int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
-		    struct resource *res, unsigned int reg);
+
+int __pci_bus_read_base(struct pci_bus *bus, unsigned int devfn,
+			enum pci_bar_type type,
+			struct resource *res, unsigned int reg,
+			bool mmio_always_on);
+static inline int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
+				  struct resource *res, unsigned int reg)
+{
+	res->name = pci_name(dev);
+
+	return __pci_bus_read_base(dev->bus, dev->devfn, type, res, reg,
+				   dev->mmio_always_on);
+}
+
 void pci_configure_ari(struct pci_dev *dev);
 void __pci_bus_size_bridges(struct pci_bus *bus,
 			struct list_head *realloc_head);
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 82014b248f4d..a5b28073822f 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -130,7 +130,7 @@ static u64 pci_size(u64 base, u64 maxbase, u64 mask)
 	return size;
 }
 
-static inline unsigned long decode_bar(struct pci_dev *dev, u32 bar)
+static inline unsigned long decode_bar(u32 bar)
 {
 	u32 mem_type;
 	unsigned long flags;
@@ -166,16 +166,21 @@ static inline unsigned long decode_bar(struct pci_dev *dev, u32 bar)
 #define PCI_COMMAND_DECODE_ENABLE	(PCI_COMMAND_MEMORY | PCI_COMMAND_IO)
 
 /**
- * __pci_read_base - Read a PCI BAR
- * @dev: the PCI device
+ * __pci_bus_read_base - Read a PCI BAR
+ * @bus: the PCI bus
+ * @devfn: the PCI device and function
  * @type: type of the BAR
  * @res: resource buffer to be filled in
  * @pos: BAR position in the config space
+ * @mmio_always_on: disallow turning off IO/MEM decoding during BAR sizing
  *
  * Returns 1 if the BAR is 64-bit, or 0 if 32-bit.
+ * In case of error resulting @res->flags is 0.
  */
-int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
-		    struct resource *res, unsigned int pos)
+int __pci_bus_read_base(struct pci_bus *bus, unsigned int devfn,
+			enum pci_bar_type type,
+			struct resource *res, unsigned int pos,
+			bool mmio_always_on)
 {
 	u32 l = 0, sz = 0, mask;
 	u64 l64, sz64, mask64;
@@ -185,20 +190,18 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 	mask = type ? PCI_ROM_ADDRESS_MASK : ~0;
 
 	/* No printks while decoding is disabled! */
-	if (!dev->mmio_always_on) {
-		pci_read_config_word(dev, PCI_COMMAND, &orig_cmd);
+	if (!mmio_always_on) {
+		pci_bus_read_config_word(bus, devfn, PCI_COMMAND, &orig_cmd);
 		if (orig_cmd & PCI_COMMAND_DECODE_ENABLE) {
-			pci_write_config_word(dev, PCI_COMMAND,
+			pci_bus_write_config_word(bus, devfn, PCI_COMMAND,
 				orig_cmd & ~PCI_COMMAND_DECODE_ENABLE);
 		}
 	}
 
-	res->name = pci_name(dev);
-
-	pci_read_config_dword(dev, pos, &l);
-	pci_write_config_dword(dev, pos, l | mask);
-	pci_read_config_dword(dev, pos, &sz);
-	pci_write_config_dword(dev, pos, l);
+	pci_bus_read_config_dword(bus, devfn, pos, &l);
+	pci_bus_write_config_dword(bus, devfn, pos, l | mask);
+	pci_bus_read_config_dword(bus, devfn, pos, &sz);
+	pci_bus_write_config_dword(bus, devfn, pos, l);
 
 	/*
 	 * All bits set in sz means the device isn't working properly.
@@ -217,7 +220,7 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 		l = 0;
 
 	if (type == pci_bar_unknown) {
-		res->flags = decode_bar(dev, l);
+		res->flags = decode_bar(l);
 		res->flags |= IORESOURCE_SIZEALIGN;
 		if (res->flags & IORESOURCE_IO) {
 			l64 = l & PCI_BASE_ADDRESS_IO_MASK;
@@ -237,26 +240,25 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 	}
 
 	if (res->flags & IORESOURCE_MEM_64) {
-		pci_read_config_dword(dev, pos + 4, &l);
-		pci_write_config_dword(dev, pos + 4, ~0);
-		pci_read_config_dword(dev, pos + 4, &sz);
-		pci_write_config_dword(dev, pos + 4, l);
+		pci_bus_read_config_dword(bus, devfn, pos + 4, &l);
+		pci_bus_write_config_dword(bus, devfn, pos + 4, ~0);
+		pci_bus_read_config_dword(bus, devfn, pos + 4, &sz);
+		pci_bus_write_config_dword(bus, devfn, pos + 4, l);
 
 		l64 |= ((u64)l << 32);
 		sz64 |= ((u64)sz << 32);
 		mask64 |= ((u64)~0 << 32);
 	}
 
-	if (!dev->mmio_always_on && (orig_cmd & PCI_COMMAND_DECODE_ENABLE))
-		pci_write_config_word(dev, PCI_COMMAND, orig_cmd);
+	if (!mmio_always_on && (orig_cmd & PCI_COMMAND_DECODE_ENABLE))
+		pci_bus_write_config_word(bus, devfn, PCI_COMMAND, orig_cmd);
 
 	if (!sz64)
 		goto fail;
 
 	sz64 = pci_size(l64, sz64, mask64);
 	if (!sz64) {
-		pci_info(dev, FW_BUG "reg 0x%x: invalid BAR (can't size)\n",
-			 pos);
+		pci_bus_info(bus, devfn, FW_BUG "reg 0x%x: invalid BAR (can't size)\n", pos);
 		goto fail;
 	}
 
@@ -266,8 +268,9 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 			res->flags |= IORESOURCE_UNSET | IORESOURCE_DISABLED;
 			res->start = 0;
 			res->end = 0;
-			pci_err(dev, "reg 0x%x: can't handle BAR larger than 4GB (size %#010llx)\n",
-				pos, (unsigned long long)sz64);
+			pci_bus_err(bus, devfn,
+				    "reg 0x%x: can't handle BAR larger than 4GB (size %#010llx)\n",
+				    pos, (unsigned long long)sz64);
 			goto out;
 		}
 
@@ -276,8 +279,9 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 			res->flags |= IORESOURCE_UNSET;
 			res->start = 0;
 			res->end = sz64 - 1;
-			pci_info(dev, "reg 0x%x: can't handle BAR above 4GB (bus address %#010llx)\n",
-				 pos, (unsigned long long)l64);
+			pci_bus_info(bus, devfn,
+				     "reg 0x%x: can't handle BAR above 4GB (bus address %#010llx)\n",
+				     pos, (unsigned long long)l64);
 			goto out;
 		}
 	}
@@ -285,8 +289,8 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 	region.start = l64;
 	region.end = l64 + sz64 - 1;
 
-	pcibios_bus_to_resource(dev->bus, res, &region);
-	pcibios_resource_to_bus(dev->bus, &inverted_region, res);
+	pcibios_bus_to_resource(bus, res, &region);
+	pcibios_resource_to_bus(bus, &inverted_region, res);
 
 	/*
 	 * If "A" is a BAR value (a bus address), "bus_to_resource(A)" is
@@ -303,18 +307,17 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 		res->flags |= IORESOURCE_UNSET;
 		res->start = 0;
 		res->end = region.end - region.start;
-		pci_info(dev, "reg 0x%x: initial BAR value %#010llx invalid\n",
-			 pos, (unsigned long long)region.start);
+		pci_bus_info(bus, devfn, "reg 0x%x: initial BAR value %#010llx invalid\n",
+			     pos, (unsigned long long)region.start);
 	}
 
 	goto out;
 
-
 fail:
 	res->flags = 0;
 out:
 	if (res->flags)
-		pci_info(dev, "reg 0x%x: %pR\n", pos, res);
+		pci_bus_info(bus, devfn, "reg 0x%x: %pR\n", pos, res);
 
 	return (res->flags & IORESOURCE_MEM_64) ? 1 : 0;
 }
-- 
2.34.1

