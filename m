Return-Path: <linux-i2c+bounces-3555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D998C86BE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133661C21700
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 12:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3230524A5;
	Fri, 17 May 2024 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="Io5jIG2G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAF4EB4A
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950731; cv=none; b=LJoSKVqUCVXwY4oF7xVoVTS8m2+aXrlALaCzo7jOvrpjFKKBevDwQZ6wBe6ZKj4pQiXta07MNk4xZe3rlcNQd4alV2FyifnFcYSxiz5tc8AlO8SsEoHSFahjdpv9FnCGb4r7BRyUD/o6XUSjGug++bVF2H8T42UBnFDTxFVT8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950731; c=relaxed/simple;
	bh=UUHB7B8cG+YTR4mWDwQBOaLx3bhWH/8bHKlhAHj0EnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDpSNSCii1fhyoVzTU5DlRED6dzFfmBNxxCQ9InxsKhavX9BhLQhnXIhHfdmVB+Ox2TakqhXHaKHE60zWyb1KAihwgIPwzK0kfp33MaKCKbI0u3y57WkQc1FFpunYj5x5iFemeotpKtkqOJpuIccIaHBeCC9KkdEJtwM5Zhemhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=Io5jIG2G; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: linux-i2c@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715950725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hXyIP+ectjrW+Q2/Fz/6tuBReM/7W8qGyezkWsRCUvQ=;
	b=Io5jIG2GLVZ42Nmsqp7bv0gBQct5zRcpH8+vjIwruO6yqRnGmD2HP9YRex2hMs8ykdkzvh
	EqkSjs2I9DowyY6w7/Nn2e/hfaUZW8L+6X00BBfEWZyxe91gL8OOUj4je2L5/jxPAiIITv
	D4dtz89pp0INbgW+EKHfbPXD+hm97IcTlG8ar50jMhv8bAbkUT7Kzu9IFanr3lwBoE4LiI
	mOP2Rn0MLQi+6EZONLe8W7T96nEmjuOTlvL4Il9eGPAjcfSzHvf/M4QslQIZ+7dGABXFrD
	H/SFr+PGyi4NlBMP4NWEeJ3RnMixjH6qhog256Cucw3BfRvmd2/CAjGq3waoHA==
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: perex@perex.cz
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: alsi@bang-olufsen.dk
X-Envelope-To: rafael@kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: tiwai@suse.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: brgl@bgdev.pl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 14:57:59 +0200
Subject: [PATCH 01/13] a2b: add A2B driver core
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Add the initial driver core for the Automotive Audio Bus (A2B) from
Analog Devices Inc.

The driver core introduces a new bus type which will allow A2B drivers
to be added. The drivers are either for A2B nodes (read: A2B transceiver
chips) or for functional blocks of A2B (GPIO, codec, etc.). The driver
core implements a discovery algorithm and manages bus errors and device
lifetime.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/Kconfig         |    2 +
 drivers/Makefile        |    1 +
 drivers/a2b/Kconfig     |   13 +
 drivers/a2b/Makefile    |    6 +
 drivers/a2b/a2b.c       | 1252 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/a2b/a2b.h |  444 +++++++++++++++++
 6 files changed, 1718 insertions(+)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7bdad836fc62..70b4d8156589 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -245,4 +245,6 @@ source "drivers/cdx/Kconfig"
 
 source "drivers/dpll/Kconfig"
 
+source "drivers/a2b/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index fe9ceb0d2288..83ce67a854bd 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -191,5 +191,6 @@ obj-$(CONFIG_HTE)		+= hte/
 obj-$(CONFIG_DRM_ACCEL)		+= accel/
 obj-$(CONFIG_CDX_BUS)		+= cdx/
 obj-$(CONFIG_DPLL)		+= dpll/
+obj-$(CONFIG_A2B)		+= a2b/
 
 obj-$(CONFIG_S390)		+= s390/
diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
new file mode 100644
index 000000000000..4aaef2ea4460
--- /dev/null
+++ b/drivers/a2b/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# A2B driver configuration
+#
+
+menuconfig A2B
+       tristate "A2B support"
+       select OF
+       help
+	 A2B (Automotive Audio Bus) is a digital audio and control bus from
+	 Analog Devices Inc.
+
+	 If unsure, say N.
diff --git a/drivers/a2b/Makefile b/drivers/a2b/Makefile
new file mode 100644
index 000000000000..40c9821f61ee
--- /dev/null
+++ b/drivers/a2b/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for A2B drivers
+#
+
+obj-$(CONFIG_A2B)			+= a2b.o
diff --git a/drivers/a2b/a2b.c b/drivers/a2b/a2b.c
new file mode 100644
index 000000000000..c0837edde903
--- /dev/null
+++ b/drivers/a2b/a2b.c
@@ -0,0 +1,1252 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A2B driver core
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ *
+ * Analog Devices Inc. documentation cited in some of the comments below:
+ *
+ * [1] AD2420(W)/6(W)/7(W)/8(W)/9(W) Automotive Audio Bus A2B Transceiver
+ *     Technical Reference, Revision 1.1, October 2019, Part Number 82-100138-01
+ *
+ * [2] Datasheet for AD2420(W)/AD2426(W)/AD2427(W)/AD2428(W)/AD2429(W) Rev. C,
+ *     July 2021
+ */
+
+#include <linux/of_device.h>
+#include <linux/delay.h>
+#include <linux/a2b/a2b.h>
+
+static bool is_registered;
+static DEFINE_IDA(a2b_ida);
+
+/*
+ * MISC
+ */
+
+static const char *a2b_error_to_string(enum a2b_error error)
+{
+	switch (error) {
+	case A2B_HDCNTERR:
+		return "HDCNTERR (header count error)";
+	case A2B_DDERR:
+		return "DDERR (data decoding error)";
+	case A2B_CRCERR:
+		return "CRCERR (CRC error)";
+	case A2B_DPERR:
+		return "DPERR (data parity error)";
+	case A2B_BECOVF:
+		return "BECOVF (bit error counter overflow)";
+	case A2B_SRFERR:
+		return "SRFERR (SRF miss error)";
+	case A2B_SRFCRCERR:
+		return "SRFCRCERR (SRF CRC error)";
+	case A2B_PWRERR_0:
+		return "PWRERR (positive terminal BP shorted to GND)";
+	case A2B_PWRERR_1:
+		return "PWRERR (negative terminal BN shorted to VBAT)";
+	case A2B_PWRERR_2:
+		return "PWRERR (BP shorted to BN)";
+	case A2B_PWRERR_3:
+		return "PWRERR (cable disconnected/open circuit/wrong port)";
+	case A2B_PWRERR_4:
+		return "PWRERR (cable is reverse connected/wrong port)";
+	case A2B_PWRERR_5:
+		return "PWRERR (undetermined fault)";
+	case A2B_I2CERR:
+		return "I2CERR (I2C error)";
+	case A2B_ICRCERR:
+		return "ICRCERR (interrupt CRC error)";
+	case A2B_PWRERR_6:
+		return "PWRERR (non-localized negative terminal BN short to GND)";
+	case A2B_PWRERR_7:
+		return "PWRERR (non-localized positive terminal BP short to VBAT)";
+	case A2B_IRQMSGERR:
+		return "IRQMSGERR (interrupt messaging error)";
+	case A2B_STARTUPERR:
+		return "STARTUPERR (startup error - return to factory)";
+	case A2B_SLVINTTYPERR:
+		return "SLVINTTYPERR (slave INTTYPE read error)";
+	default:
+		return "unknown error";
+	};
+}
+
+/*
+ * A2B BUS
+ */
+
+#define __a2b_bus_for_each_node(__bus, __node, __i) \
+	for (__i = 0; __i < A2B_MAX_NODES && (__node = __bus->nodes[__i]); i++)
+
+#define __a2b_bus_for_each_sub_node(__bus, __node, __i) \
+	for (__i = A2B_MAIN_ADDR + 1;                   \
+	     __i < A2B_MAX_NODES && (__node = __bus->nodes[__i]); i++)
+
+static struct a2b_node *__a2b_bus_main_node(struct a2b_bus *bus)
+{
+	return bus->nodes[A2B_MAIN_ADDR];
+}
+
+static struct a2b_node *__a2b_bus_next_node(struct a2b_node *node)
+{
+	struct a2b_bus *bus = node->bus;
+
+	if (node->addr == A2B_MAX_NODES - 1)
+		return NULL;
+
+	return bus->nodes[node->addr + 1];
+}
+
+static struct a2b_node *__a2b_bus_last_node(struct a2b_bus *bus)
+{
+	struct a2b_node *last = NULL;
+	struct a2b_node *node;
+	int i;
+
+	__a2b_bus_for_each_node(bus, node, i)
+		last = node;
+
+	return last;
+}
+
+/* From [1] Table 9-1: A2B Master Node Response Offset (RESPOFFS) */
+static const unsigned int a2b_respoffs[A2B_TDMMODE_END][A2B_TDMSS_END] = {
+	[A2B_TDMMODE_2] = { 245, 238 },
+	[A2B_TDMMODE_4] = { 248, 245 },
+	[A2B_TDMMODE_8] = { 248, 248 },
+	[A2B_TDMMODE_12] = { 248, 248 },
+	[A2B_TDMMODE_16] = { 248, 248 },
+	[A2B_TDMMODE_20] = { 248, 248 },
+	[A2B_TDMMODE_24] = { 248, 248 },
+	[A2B_TDMMODE_32] = { 248, 248 },
+};
+
+/* Look-up table: [FMT][SIZE] -> A2B bus bits, cf. [1] Table 3-2 */
+static const unsigned int a2b_slot_bits[2][8] = {
+	[0] = {
+		[0] =  9, /* 8-bit w/o compression; parity */
+		[1] = 13, /* 12-bit w/o compression; parity */
+		[2] = 17, /* 16-bit w/o compression; parity */
+		[3] = 21, /* 20-bit w/o compression; parity */
+		[4] = 25, /* 24-bit w/o compression; parity */
+		[5] = 29, /* 28-bit w/o compression; parity */
+		[6] = 33, /* 32-bit w/o compression; parity */
+		[7] =  0, /* reserved */
+	},
+	[1] = {
+		[0] =  0, /* reserved */
+		[1] = 13, /* 16-bit w/ floating-point compression; parity */
+		[2] = 17, /* 20-bit w/ floating-point compression; parity */
+		[3] = 21, /* 24-bit w/ floating-point compression; parity */
+		[4] = 30, /* 24-bit w/o compression; ECC protection */
+		[5] =  0, /* reserved */
+		[6] = 39, /* 32-bit w/o compression; ECC protection */
+		[7] =  0, /* reserved */
+	},
+};
+
+static void __a2b_bus_calc_min_max_respcycs(struct a2b_bus *bus,
+					    unsigned int *min_respcycs_up,
+					    unsigned int *max_respcycs_dn)
+{
+	struct a2b_node *main = __a2b_bus_main_node(bus);
+	struct a2b_node *node;
+	struct a2b_slot_config *slot_config = &main->slot_req.slot_config;
+	enum a2b_slot_format slot_format_dn = slot_config->format[A2B_DIR_DOWN];
+	enum a2b_slot_format slot_format_up = slot_config->format[A2B_DIR_UP];
+	enum a2b_slot_size slot_size_dn = slot_config->size[A2B_DIR_DOWN];
+	enum a2b_slot_size slot_size_up = slot_config->size[A2B_DIR_UP];
+	unsigned int dnslot_size = a2b_slot_bits[slot_format_dn][slot_size_dn];
+	unsigned int upslot_size = a2b_slot_bits[slot_format_up][slot_size_up];
+	unsigned int respoffs =
+		a2b_respoffs[main->tdm_mode][main->tdm_slot_size];
+	int i;
+
+	/*
+	 * More information about the RESPCYCS formula can be found in the
+	 * Technical Reference [1] Appendix B "Response Cycle Formula".
+	 */
+
+	*min_respcycs_up = 0xFF;
+	*max_respcycs_dn = 0;
+
+	__a2b_bus_for_each_sub_node(bus, node, i) {
+		unsigned int num_dnslots = node->slot_req.a_dnslots;
+		unsigned int num_upslots = node->slot_req.a_upslots;
+		unsigned int dnslot_activity = num_dnslots * dnslot_size;
+		unsigned int upslot_activity = num_upslots * upslot_size;
+		unsigned int respcycs_dn =
+			DIV_ROUND_UP(64 + dnslot_activity, 4) +
+			(4 * node->addr) + 2;
+		unsigned int respcycs_up =
+			respoffs - DIV_ROUND_UP(64 + upslot_activity, 4) + 1;
+
+		if (respcycs_dn > *max_respcycs_dn)
+			*max_respcycs_dn = respcycs_dn;
+
+		if (respcycs_up < *min_respcycs_up)
+			*min_respcycs_up = respcycs_up;
+	}
+}
+
+static unsigned int __a2b_bus_respcycs(struct a2b_bus *bus, int addr)
+{
+	unsigned int main_respcycs;
+	unsigned int min_respcycs_up;
+	unsigned int max_respcycs_dn;
+
+	__a2b_bus_calc_min_max_respcycs(bus, &min_respcycs_up,
+					&max_respcycs_dn);
+
+	main_respcycs = (max_respcycs_dn + min_respcycs_up) / 2;
+
+	if (addr == A2B_MAIN_ADDR)
+		return main_respcycs;
+
+	/*
+	 * This formula is taken from [1] section 9-4 "Configuring Slave Node
+	 * Response Cycles". Note that the driver indexes subordinate node
+	 * addresses starting from 1.
+	 */
+	return main_respcycs - (4 * (addr - 1));
+}
+
+static bool __a2b_bus_validate_structure(struct a2b_bus *bus)
+{
+	struct a2b_node *node;
+	unsigned int min_respcycs_up;
+	unsigned int max_respcycs_dn;
+	int i;
+
+	__a2b_bus_for_each_node(bus, node, i) {
+		struct a2b_node *next = __a2b_bus_next_node(node);
+		struct a2b_slot_req *req;
+		struct a2b_slot_req *nreq;
+
+		if (!next)
+			break;
+
+		req = &node->slot_req;
+		nreq = &next->slot_req;
+
+		if (req->b_dnslots != nreq->a_dnslots) {
+			dev_warn(&bus->dev,
+				 "structure validation failed: "
+				 "downstream slot mismatch: node %u(B) sends "
+				 "%u slots but node (A)%u receives %u slots\n",
+				 node->addr, req->b_dnslots, next->addr,
+				 nreq->a_dnslots);
+
+			return false;
+		}
+
+		if (req->b_upslots != nreq->a_upslots) {
+			dev_warn(&bus->dev,
+				 "structure validation failed: "
+				 "upstream slot mismatch: node %u(B) receives "
+				 "%u slots but node (A)%u sends %u slots\n",
+				 node->addr, req->b_upslots, next->addr,
+				 nreq->a_upslots);
+
+			return false;
+		}
+	}
+
+	__a2b_bus_calc_min_max_respcycs(bus, &min_respcycs_up,
+					&max_respcycs_dn);
+
+	if (max_respcycs_dn > min_respcycs_up) {
+		dev_warn(&bus->dev,
+			 "structure validation failed: "
+			 "insufficient bandwidth: "
+			 "max_respcycs_dn(%u) > min_respcycs_up(%u)\n",
+			 max_respcycs_dn, min_respcycs_up);
+
+		return false;
+	}
+
+	return true;
+}
+
+static bool __a2b_bus_new_structure_ready(struct a2b_bus *bus)
+{
+	struct a2b_node *node;
+	bool all = true;
+	bool none = true;
+	int i;
+
+	/*
+	 * This is a primitive synchronization mechanism for
+	 * a2b_node_request_slots(). The rule here is that a new structure is
+	 * ready to be applied if all nodes have requested slots, or if none of
+	 * them have requested slots.
+	 *
+	 * In the latter case, synchronous transmission of upstream and
+	 * downstream data will be disabled globally on the bus. This protects
+	 * against the scenario where the slot configuration written to the
+	 * register map of a node in the system is invalid when compared with
+	 * the configuration in other nodes.
+	 */
+	__a2b_bus_for_each_node(bus, node, i) {
+		none &= !node->slots_requested;
+		all &= node->slots_requested;
+	}
+
+	return all || none;
+}
+
+static int __a2b_bus_new_structure(struct a2b_bus *bus)
+{
+	struct a2b_node *main = __a2b_bus_main_node(bus);
+	struct a2b_node *node;
+	bool dn_enable = false;
+	bool up_enable = false;
+	int ret;
+	int i;
+
+	__a2b_bus_for_each_node(bus, node, i) {
+		unsigned int respcycs = __a2b_bus_respcycs(bus, node->addr);
+
+		ret = node->ops->set_respcycs(node, respcycs);
+		if (ret)
+			return ret;
+
+		if (is_a2b_main(node))
+			continue;
+
+		/*
+		 * Check for any downstream (resp. upstream) activity on the
+		 * A-side of each subordinate node. This informs whether or not
+		 * to enable synchronous transmission of data in each direction.
+		 */
+		if (node->slot_req.a_dnslots)
+			dn_enable = true;
+
+		if (node->slot_req.a_upslots)
+			up_enable = true;
+	}
+
+	ret = main->ops->new_structure(main, &main->slot_req.slot_config,
+				       dn_enable, up_enable);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int a2b_bus_new_structure(struct a2b_bus *bus)
+{
+	int ret;
+
+	mutex_lock(&bus->mutex);
+	ret = __a2b_bus_new_structure(bus);
+	mutex_unlock(&bus->mutex);
+
+	return ret;
+}
+
+unsigned long a2b_bus_status(struct a2b_bus *bus)
+{
+	unsigned long status;
+
+	mutex_lock(&bus->mutex);
+	status = bus->status;
+	mutex_unlock(&bus->mutex);
+
+	return status;
+}
+EXPORT_SYMBOL_GPL(a2b_bus_status);
+
+static unsigned int __a2b_bus_num_subs(struct a2b_bus *bus)
+{
+	struct a2b_node *node;
+	unsigned int num = 0;
+	int i;
+
+	__a2b_bus_for_each_sub_node(bus, node, i)
+		num++;
+
+	return num;
+}
+
+unsigned int a2b_bus_num_subs(struct a2b_bus *bus)
+{
+	unsigned int n;
+
+	mutex_lock(&bus->mutex);
+	n = __a2b_bus_num_subs(bus);
+	mutex_unlock(&bus->mutex);
+
+	return n;
+}
+EXPORT_SYMBOL_GPL(a2b_bus_num_subs);
+
+static unsigned int __a2b_bus_num_nodes(struct a2b_bus *bus)
+{
+	return __a2b_bus_num_subs(bus) + 1;
+}
+
+unsigned int a2b_bus_num_nodes(struct a2b_bus *bus)
+{
+	unsigned int n;
+
+	mutex_lock(&bus->mutex);
+	n = __a2b_bus_num_nodes(bus);
+	mutex_unlock(&bus->mutex);
+
+	return n;
+}
+EXPORT_SYMBOL_GPL(a2b_bus_num_nodes);
+
+struct a2b_bus_del_node_data {
+	unsigned int stop_addr;
+	unsigned int nodes_deleted;
+};
+
+static int a2b_bus_del_node(struct device *dev, void *d)
+{
+	struct a2b_bus_del_node_data *data = d;
+	struct a2b_node *node;
+
+	if (dev->type != &a2b_node_type)
+		return 0;
+
+	node = to_a2b_node(dev);
+
+	/* Break out early if this is the node to stop at */
+	if (node->addr < data->stop_addr)
+		return 1;
+
+	device_unregister(dev);
+	data->nodes_deleted++;
+
+	return 0;
+}
+
+static unsigned int a2b_bus_del_nodes_until(struct a2b_bus *bus,
+					    unsigned int stop_addr)
+{
+	struct a2b_bus_del_node_data data = {
+		.stop_addr = stop_addr,
+		.nodes_deleted = 0,
+	};
+
+	device_for_each_child_reverse(&bus->dev, &data, a2b_bus_del_node);
+
+	return data.nodes_deleted;
+}
+
+static void a2b_bus_del_nodes(struct a2b_bus *bus)
+{
+	a2b_bus_del_nodes_until(bus, A2B_MAIN_ADDR);
+}
+
+static int a2b_bus_of_add_node(struct a2b_bus *bus, struct device_node *np,
+			       unsigned int addr)
+{
+	struct a2b_node *node;
+	int ret = 0;
+
+	if (!bus || !np)
+		return -EINVAL;
+
+	if (addr >= A2B_MAX_NODES)
+		return -EINVAL;
+
+	if (!of_device_is_available(np))
+		return -ENODEV;
+
+	if (of_node_test_and_set_flag(np, OF_POPULATED))
+		return -EBUSY;
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (IS_ERR(node))
+		return -ENOMEM;
+
+	node->dev.bus = &a2b_bus;
+	node->dev.type = &a2b_node_type;
+	node->dev.parent = &bus->dev;
+	node->dev.of_node = np;
+	node->dev.fwnode = of_fwnode_handle(np);
+	dev_set_name(&node->dev, "a2b-%d.%d", bus->id, addr);
+
+	node->bus = bus;
+	node->addr = addr;
+
+	/*
+	 * Register the node device. Note that due to asynchronous probing,
+	 * there is no guarantee that the node driver's probe function has been
+	 * called just yet. The synchronization point is a2b_register_node(),
+	 * which should be called unconditionally by node drivers.
+	 */
+	ret = device_register(&node->dev);
+	if (ret)
+		goto err_put_device;
+
+	return 0;
+
+err_put_device:
+	put_device(&node->dev);
+
+	return ret;
+}
+
+static struct device_node *a2b_bus_of_get_node_of_node(struct a2b_bus *bus,
+						       unsigned int addr)
+{
+	struct device_node *np = NULL;
+	bool found = false;
+	u32 val;
+
+	for_each_available_child_of_node(bus->dev.of_node, np) {
+		if (of_property_read_u32(np, "reg", &val))
+			continue;
+
+		if (val == addr) {
+			found = true;
+			break;
+		}
+	}
+
+	return found ? np : NULL;
+}
+
+static void a2b_bus_event_discovery_done(struct a2b_bus *bus)
+{
+	bool done;
+
+	mutex_lock(&bus->mutex);
+	done = test_and_clear_bit(A2B_BUS_STATUS_DISCOVERY_ALGO, &bus->status);
+	mutex_unlock(&bus->mutex);
+
+	if (!done)
+		return;
+
+	dev_info(&bus->dev, "discovered %d subordinate nodes\n",
+		 a2b_bus_num_subs(bus));
+}
+
+static void a2b_bus_discovery_work(struct work_struct *work)
+{
+	struct delayed_work *discovery_work = to_delayed_work(work);
+	struct device_node *np = NULL;
+	struct a2b_bus *bus =
+		container_of(discovery_work, struct a2b_bus, discovery_work);
+	struct a2b_node *main;
+	struct a2b_node *last;
+	struct a2b_node *node;
+	unsigned int new_addr;
+	int ret = -ENODEV;
+	int i;
+
+	mutex_lock(&bus->mutex);
+
+	main = __a2b_bus_main_node(bus);
+	last = __a2b_bus_last_node(bus);
+	new_addr = last->addr + 1;
+
+	if (new_addr > main->chip_info->max_subs)
+		goto out;
+
+	if (!(last->chip_info->caps & A2B_CHIP_CAP_B_SIDE))
+		goto out;
+
+	np = a2b_bus_of_get_node_of_node(bus, new_addr);
+	if (!np)
+		goto out;
+
+	set_bit(A2B_BUS_STATUS_DISCOVERY_ALGO, &bus->status);
+	set_bit(A2B_BUS_STATUS_DISCOVERING, &bus->status);
+
+	/*
+	 * Enable switching on the last currently discovered node. All preceding
+	 * nodes continue switching and have their External Switch Mode set to 2
+	 * as prescribed in [1] Figure 8-3 "Advanced Discovery Flow".
+	 */
+	__a2b_bus_for_each_node(bus, node, i) {
+		ret = last->ops->set_switching(
+			node, true, node == last ? A2B_SWMODE_0 : A2B_SWMODE_2);
+		if (ret) {
+			dev_err(&last->dev, "failed to enable switching: %d\n",
+				ret);
+			goto out;
+		}
+	}
+
+	/*
+	 * Apply a new structure, which generally ensures that the RESPCYCS are
+	 * sane before the discovery process begins. Failure to do so may result
+	 * in bus errors.
+	 */
+	__a2b_bus_new_structure(bus);
+
+	/* Begin discovery with the expected RESPCYCS value for the new node */
+	ret = main->ops->discover(main, __a2b_bus_respcycs(bus, new_addr));
+	if (ret < 0) {
+		dev_err(&bus->dev, "discovery error: %d\n", ret);
+		goto out;
+	} else if (ret) {
+		/*
+		 * Discovery timed out, presumably meaning that there are no
+		 * nodes left to discover. Disable switching on the last node to
+		 * prevent spurious bus errors. All other nodes ought to revert
+		 * to a normal External Switching Mode, cf. [1] Figure 8-32.
+		 */
+		__a2b_bus_for_each_node(bus, node, i)
+		{
+			ret = last->ops->set_switching(node, node != last,
+						       A2B_SWMODE_0);
+			if (ret) {
+				dev_err(&last->dev,
+					"failed to disable switching: %d\n",
+					ret);
+				goto out;
+			}
+		}
+
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	ret = a2b_bus_of_add_node(bus, np, new_addr);
+	if (ret)
+		dev_err(&bus->dev, "failed to add new node %d: %d\n", i, ret);
+
+out:
+	clear_bit(A2B_BUS_STATUS_DISCOVERING, &bus->status);
+	mutex_unlock(&bus->mutex);
+
+	/*
+	 * If there is no new node after this discovery, then the discovery
+	 * process is finished. Signal the event.
+	 */
+	if (!np || ret)
+		a2b_bus_event_discovery_done(bus);
+
+	if (np)
+		of_node_put(np);
+}
+
+static void a2b_bus_discover(struct a2b_bus *bus)
+{
+	schedule_delayed_work(&bus->discovery_work, msecs_to_jiffies(100));
+}
+
+int a2b_register_bus(struct a2b_bus *bus)
+{
+	struct device_node *np;
+	int ret;
+
+	if (!bus->parent || !bus->ops)
+		return -EINVAL;
+
+	/* Initialize private bus data */
+	mutex_init(&bus->mutex);
+	INIT_DELAYED_WORK(&bus->discovery_work, a2b_bus_discovery_work);
+	set_bit(A2B_BUS_STATUS_DISCOVERY_ALGO, &bus->status);
+	bus->id = ida_alloc(&a2b_ida, GFP_KERNEL);
+	if (bus->id < 0)
+		return -ENOMEM;
+
+	/* Initialize bus device data and register it */
+	bus->dev.class = &a2b_bus_class;
+	bus->dev.parent = bus->parent;
+	device_set_of_node_from_dev(&bus->dev, bus->parent);
+	bus->dev.type = &a2b_bus_type;
+	dev_set_name(&bus->dev, "a2b-%d", bus->id);
+
+	ret = device_register(&bus->dev);
+	if (ret) {
+		put_device(&bus->dev);
+		return ret;
+	}
+
+	/* It is mandatory to specify an OF node for the main node */
+	np = a2b_bus_of_get_node_of_node(bus, A2B_MAIN_ADDR);
+	if (!np) {
+		ret = -EINVAL;
+		goto err_device_unregister;
+	}
+
+	ret = a2b_bus_of_add_node(bus, np, A2B_MAIN_ADDR);
+	of_node_put(np);
+	if (ret)
+		goto err_device_unregister;
+
+	return 0;
+
+err_device_unregister:
+	device_unregister(&bus->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(a2b_register_bus);
+
+void a2b_unregister_bus(struct a2b_bus *bus)
+{
+	cancel_delayed_work_sync(&bus->discovery_work);
+
+	a2b_bus_del_nodes(bus);
+
+	device_unregister(&bus->dev);
+}
+EXPORT_SYMBOL_GPL(a2b_unregister_bus);
+
+struct a2b_bus *a2b_find_bus_by_of_node(struct device_node *np)
+{
+	struct device *dev = class_find_device_by_of_node(&a2b_bus_class, np);
+
+	return dev ? to_a2b_bus(dev) : NULL;
+}
+EXPORT_SYMBOL_GPL(a2b_find_bus_by_of_node);
+
+void a2b_put_bus(struct a2b_bus *bus)
+{
+	put_device(&bus->dev);
+}
+EXPORT_SYMBOL_GPL(a2b_put_bus);
+
+/*
+ * A2B NODE
+ */
+
+int a2b_node_read(struct a2b_node *node, unsigned int reg, unsigned int *val)
+{
+	struct a2b_bus *bus = node->bus;
+
+	return bus->ops->read(bus, node, reg, val);
+}
+EXPORT_SYMBOL_GPL(a2b_node_read);
+
+int a2b_node_write(struct a2b_node *node, unsigned int reg, unsigned int val)
+{
+	struct a2b_bus *bus = node->bus;
+
+	return bus->ops->write(bus, node, reg, val);
+}
+EXPORT_SYMBOL_GPL(a2b_node_write);
+
+int a2b_node_i2c_xfer(struct a2b_node *node, struct i2c_msg *msgs, int num)
+{
+	struct a2b_bus *bus = node->bus;
+
+	return bus->ops->i2c_xfer(bus, node, msgs, num);
+}
+EXPORT_SYMBOL_GPL(a2b_node_i2c_xfer);
+
+int a2b_node_get_inttype(struct a2b_node *node, unsigned int *val)
+{
+	struct a2b_bus *bus = node->bus;
+
+	/*
+	 * Obviously, this function should only be used if the node in question
+	 * received an IRQ
+	 */
+
+	return bus->ops->get_inttype(bus, val);
+}
+EXPORT_SYMBOL_GPL(a2b_node_get_inttype);
+
+struct clk *a2b_node_get_sync_clk(struct a2b_node *node)
+{
+	struct a2b_bus *bus = node->bus;
+
+	return bus->ops->get_sync_clk(bus);
+}
+EXPORT_SYMBOL_GPL(a2b_node_get_sync_clk);
+
+static void a2b_node_bus_drop_work(struct work_struct *work)
+{
+	struct a2b_node *node =
+		container_of(work, struct a2b_node, bus_drop_work);
+	struct a2b_bus *bus = node->bus;
+	unsigned int nodes_deleted;
+	int ret;
+
+	ret = node->ops->set_switching(node, false, A2B_SWMODE_0);
+	if (ret)
+		dev_err_ratelimited(&node->dev,
+				    "failed to disable switching: %d\n", ret);
+
+	/* Delete the nodes that have left the bus */
+	nodes_deleted = a2b_bus_del_nodes_until(bus, node->addr + 1);
+
+	/* Schedule a rediscovery attempt of any lost nodes */
+	if (nodes_deleted)
+		schedule_delayed_work(&bus->discovery_work,
+				      msecs_to_jiffies(1000));
+}
+
+void a2b_node_report_error(struct a2b_node *node, enum a2b_error error)
+{
+	struct a2b_bus *bus = node->bus;
+
+	/*
+	 * According to [1] section 3-14 "Slave Node Response Cycles", the
+	 * following errors can be observed during discovery: CRCERR, SRFERR,
+	 * SRFCRCERR. Additionally a PWRERR_3 has been observed in practice when
+	 * enabling switching on a node whose B-Side is not connected. The
+	 * DISCOVERING status bit covers these cases - don't bother warning
+	 * about them.
+	 */
+	if (test_bit(A2B_BUS_STATUS_DISCOVERING, &bus->status)) {
+		switch (error) {
+		case A2B_CRCERR:
+		case A2B_SRFERR:
+		case A2B_SRFCRCERR:
+		case A2B_PWRERR_3:
+			dev_dbg_ratelimited(
+				&node->dev,
+				"A2B bus error %d during discovery: %s\n",
+				error, a2b_error_to_string(error));
+			return;
+		default:
+			break;
+		}
+	}
+
+	/*
+	 * An SRF miss error normally indicates that the next downstream node
+	 * has dropped off the bus. When a node detects this error in 32
+	 * consecutive superframes, it assumes a bus drop, signals an SRF miss
+	 * error, and asserts itself as the last node on the bus, cf. [1]
+	 * section 5-5 "Line Diagnostics After Discovery".
+	 */
+	if (error == A2B_SRFERR) {
+		int last = node->ops->is_last(node);
+
+		if (last < 0) {
+			dev_err_ratelimited(
+				&node->dev,
+				"failed to determine lastness of node: %d\n",
+				last);
+			return;
+		}
+
+		if (last)
+			schedule_work(&node->bus_drop_work);
+
+		return;
+	}
+
+	dev_warn_ratelimited(&node->dev, "A2B bus error %d: %s\n", error,
+			     a2b_error_to_string(error));
+}
+EXPORT_SYMBOL_GPL(a2b_node_report_error);
+
+int a2b_node_request_slots(struct a2b_node *node, struct a2b_slot_req *slot_req)
+{
+	struct a2b_bus *bus = node->bus;
+	int ret = 0;
+
+	mutex_lock(&bus->mutex);
+
+	if (node->slots_requested) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	node->slot_req = *slot_req;
+	node->slots_requested = true;
+
+	if (!__a2b_bus_new_structure_ready(bus))
+		goto out;
+
+	if (!__a2b_bus_validate_structure(bus)) {
+		ret = -EINVAL;
+		goto err_reset;
+	}
+
+	ret = __a2b_bus_new_structure(bus);
+	if (ret)
+		goto err_reset;
+
+	goto out;
+
+err_reset:
+	memset(&node->slot_req, 0, sizeof(node->slot_req));
+	node->slots_requested = false;
+
+out:
+	mutex_unlock(&bus->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(a2b_node_request_slots);
+
+int a2b_node_free_slots(struct a2b_node *node)
+{
+	struct a2b_bus *bus = node->bus;
+	int ret = 0;
+
+	mutex_lock(&bus->mutex);
+
+	if (!node->slots_requested)
+		goto out;
+
+	memset(&node->slot_req, 0, sizeof(node->slot_req));
+	node->slots_requested = false;
+
+	if (!__a2b_bus_new_structure_ready(bus))
+		goto out;
+
+	ret = __a2b_bus_new_structure(bus);
+	if (ret)
+		dev_err(&bus->dev,
+			"failed to apply new structure: %d\n", ret);
+
+out:
+	mutex_unlock(&bus->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(a2b_node_free_slots);
+
+int a2b_register_node(struct a2b_node *node)
+{
+	struct a2b_bus *bus = node->bus;
+	int ret;
+
+	/* Obligatory */
+	if (!node->chip_info || !node->ops || !node->ops->setup ||
+	    !node->ops->set_respcycs || !node->ops->set_switching ||
+	    !node->ops->is_last)
+		return -EINVAL;
+
+	/* Main obligatory */
+	if (is_a2b_main(node) &&
+	    (!node->ops->discover || !node->ops->new_structure))
+		return -EINVAL;
+
+	if (node->setup)
+		return 0;
+
+	ret = node->ops->setup(node);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	else if (ret) {
+		dev_err(&node->dev, "failed to setup node: %d\n", ret);
+		goto err_discovery_done;
+	}
+
+	node->setup = true;
+
+	INIT_WORK(&node->bus_drop_work, a2b_node_bus_drop_work);
+
+	/* The node is now ready and can be used by other parts of the core */
+	mutex_lock(&bus->mutex);
+	bus->nodes[node->addr] = node;
+	mutex_unlock(&bus->mutex);
+
+	dev_info(&node->dev,
+		 "registered %s node vendor 0x%02x prod 0x%02x ver 0x%02x\n",
+		 is_a2b_main(node) ? "main" : "subordinate", node->vendor,
+		 node->product, node->version);
+
+	/*
+	 * Before kicking off the discovery process, ensure that the default
+	 * RESPCYCS value is programmed into the main node. This isn't needed
+	 * for subordinate nodes because their default RESPCYCS value is
+	 * automatically programmed when they are discovered.
+	 */
+	if (is_a2b_main(node)) {
+		ret = a2b_bus_new_structure(bus);
+		if (ret)
+			dev_err(&bus->dev,
+				"failed to apply new structure: %d\n", ret);
+	}
+
+	a2b_bus_discover(node->bus);
+
+	return 0;
+
+err_discovery_done:
+	a2b_bus_event_discovery_done(bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(a2b_register_node);
+
+void a2b_unregister_node(struct a2b_node *node)
+{
+	struct a2b_bus *bus = node->bus;
+
+	if (!node->setup)
+		return;
+
+	/*
+	 * Only hold the mutex to remove the node from the bus node list. It is
+	 * safe to teardown the node once it is removed.
+	 */
+	mutex_lock(&bus->mutex);
+	bus->nodes[node->addr] = NULL;
+	mutex_unlock(&bus->mutex);
+
+	cancel_work_sync(&node->bus_drop_work);
+
+	if (node->ops->teardown)
+		node->ops->teardown(node);
+
+	node->priv = NULL;
+	node->setup = false;
+
+	dev_info(&node->dev, "unregistered node\n");
+}
+EXPORT_SYMBOL_GPL(a2b_unregister_node);
+
+/*
+ * A2B FUNC
+ */
+
+struct a2b_func *a2b_node_of_add_func(struct a2b_node *node,
+				      struct device_node *np)
+{
+	struct a2b_func *func;
+	int ret = 0;
+
+	if (!node || !np)
+		return ERR_PTR(-EINVAL);
+
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
+
+	if (of_node_test_and_set_flag(np, OF_POPULATED))
+		return ERR_PTR(-EBUSY);
+
+	func = kzalloc(sizeof(*func), GFP_KERNEL);
+	if (IS_ERR(func))
+		return ERR_PTR(-ENOMEM);
+
+	func->dev.bus = &a2b_bus;
+	func->dev.type = &a2b_func_type;
+	func->dev.parent = &node->dev;
+	func->dev.of_node = np;
+	func->dev.fwnode = of_fwnode_handle(np);
+	dev_set_name(&func->dev, "%s-%s", dev_name(&node->dev), np->name);
+
+	func->node = node;
+
+	ret = device_register(&func->dev);
+	if (ret)
+		goto err_put_device;
+
+	return func;
+
+err_put_device:
+	put_device(&func->dev);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(a2b_node_of_add_func);
+
+/*
+ * A2B BUS CLASS
+ */
+
+static void a2b_bus_class_dev_release(struct device *dev)
+{
+	struct a2b_bus *bus = to_a2b_bus(dev);
+
+	ida_free(&a2b_ida, bus->id);
+}
+
+const struct class a2b_bus_class = {
+	.name = "a2b",
+	.dev_release = a2b_bus_class_dev_release,
+};
+
+static ssize_t discover_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct a2b_bus *bus = to_a2b_bus(dev);
+
+	a2b_bus_discover(bus);
+
+	return count;
+}
+static DEVICE_ATTR_WO(discover);
+
+static struct attribute *a2b_bus_attrs[] = {
+	&dev_attr_discover.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(a2b_bus);
+
+const struct device_type a2b_bus_type = {
+	.name = "a2b-bus",
+	.groups = a2b_bus_groups,
+};
+
+/*
+ * BUS DRIVER
+ */
+
+static int a2b_node_uevent(const struct device *dev,
+			   struct kobj_uevent_env *env)
+{
+	const struct a2b_node *node = to_a2b_node(dev);
+
+	if (add_uevent_var(env, "A2B_NODE_ADDR=%u", node->addr))
+		return -ENOMEM;
+
+	if (node->setup) {
+		if (add_uevent_var(env, "A2B_NODE_VENDOR=%02x", node->vendor))
+			return -ENOMEM;
+
+		if (add_uevent_var(env, "A2B_NODE_PRODUCT=%02x", node->product))
+			return -ENOMEM;
+
+		if (add_uevent_var(env, "A2B_NODE_VERSION=%02x", node->version))
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void a2b_node_release(struct device *dev)
+{
+	struct a2b_node *node = to_a2b_node(dev);
+
+	of_node_clear_flag(dev->of_node, OF_POPULATED);
+	kfree(node);
+}
+
+const struct device_type a2b_node_type = {
+	.name = "a2b-node",
+	.uevent = a2b_node_uevent,
+	.release = a2b_node_release,
+};
+
+static void a2b_func_release(struct device *dev)
+{
+	struct a2b_func *func = to_a2b_func(dev);
+
+	of_node_clear_flag(dev->of_node, OF_POPULATED);
+	kfree(func);
+}
+
+const struct device_type a2b_func_type = {
+	.name = "a2b-func",
+	.release = a2b_func_release,
+};
+
+int __a2b_driver_register(struct a2b_driver *a2b_drv, struct module *owner)
+{
+	if (WARN_ON(!is_registered))
+		return -EAGAIN;
+
+	a2b_drv->driver.bus = &a2b_bus;
+	a2b_drv->driver.owner = owner;
+
+	return driver_register(&a2b_drv->driver);
+}
+EXPORT_SYMBOL_GPL(__a2b_driver_register);
+
+void a2b_driver_unregister(struct a2b_driver *a2b_drv)
+{
+	if (a2b_drv)
+		driver_unregister(&a2b_drv->driver);
+}
+EXPORT_SYMBOL_GPL(a2b_driver_unregister);
+
+static int a2b_bus_match(struct device *dev, struct device_driver *drv)
+{
+	if (of_driver_match_device(dev, drv))
+		return 1;
+
+	return 0;
+}
+
+static int a2b_bus_probe(struct device *dev)
+{
+	struct a2b_driver *a2b_drv = to_a2b_driver(dev->driver);
+
+	return a2b_drv->probe(dev);
+}
+
+static void a2b_bus_remove(struct device *dev)
+{
+	struct a2b_driver *a2b_drv = to_a2b_driver(dev->driver);
+
+	if (dev->type == &a2b_node_type) {
+		struct a2b_node *node = to_a2b_node(dev);
+
+		/*
+		 * Remove all nodes downstream from this one, because proper bus
+		 * functionality cannot be guaranteed if an upstream node is not
+		 * registered with the core.
+		 */
+		a2b_bus_del_nodes_until(node->bus, node->addr + 1);
+	}
+
+	if (a2b_drv->remove)
+		a2b_drv->remove(dev);
+}
+
+static void a2b_bus_shutdown(struct device *dev)
+{
+	struct a2b_driver *a2b_drv = to_a2b_driver(dev->driver);
+
+	if (!dev || !a2b_drv)
+		return;
+
+	if (a2b_drv->shutdown)
+		a2b_drv->shutdown(dev);
+}
+
+static int a2b_bus_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	int ret;
+
+	ret = of_device_uevent_modalias(dev, env);
+	if (ret != -ENODEV)
+		return ret;
+
+	return 0;
+}
+
+const struct bus_type a2b_bus = {
+	.name = "a2b",
+	.match = a2b_bus_match,
+	.probe = a2b_bus_probe,
+	.remove = a2b_bus_remove,
+	.shutdown = a2b_bus_shutdown,
+	.uevent = a2b_bus_uevent,
+};
+EXPORT_SYMBOL_GPL(a2b_bus);
+
+static int __init a2b_bus_init(void)
+{
+	int ret;
+
+	ret = bus_register(&a2b_bus);
+	if (ret)
+		return ret;
+
+	ret = class_register(&a2b_bus_class);
+	if (ret)
+		goto err_unregister_bus;
+
+	is_registered = true;
+
+	return 0;
+
+err_unregister_bus:
+	bus_unregister(&a2b_bus);
+
+	return ret;
+}
+
+static void __exit a2b_bus_exit(void)
+{
+	class_unregister(&a2b_bus_class);
+	bus_unregister(&a2b_bus);
+}
+
+subsys_initcall(a2b_bus_init);
+module_exit(a2b_bus_exit);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("A2B driver core");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/a2b/a2b.h b/include/linux/a2b/a2b.h
new file mode 100644
index 000000000000..2f4e013cb2ca
--- /dev/null
+++ b/include/linux/a2b/a2b.h
@@ -0,0 +1,444 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * A2B driver core
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ */
+#ifndef _A2B_H
+#define _A2B_H
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+struct clk;
+struct i2c_msg;
+
+/*
+ * MISC
+ */
+
+/**
+ * enum a2b_chip_caps - A2B chip capabilities
+ *
+ * @A2B_CHIP_CAP_MAIN: the chip can function in main mode
+ * @A2B_CHIP_CAP_A_SIDE: the chip has an A-side transceiver
+ * @A2B_CHIP_CAP_B_SIDE: the chip has a B-side transceiver
+ * @A2B_CHIP_CAP_I2S: the chip has an I2S/TDM interface
+ * @A2B_CHIP_CAP_PDM: the chip has a PDM interface
+ * @A2B_CHIP_CAP_REDUCED_RATE: the chip supports the reduced rate feature
+ * @A2B_CHIP_CAP_CLKOUT: the chip supports CLKOUT1/CLKOUT2
+ * @A2B_CHIP_CAP_BUS_MONITOR: the chip supports the bus monitor feature
+ * @A2B_CHIP_CAP_SUSTAIN: the chip supports the sustain feature
+ * @A2B_CHIP_CAP_DATA_RX_MASK: the chip supports specifying slot RX masks
+ * @A2B_CHIP_CAP_GPIO_DISTANCE: the chip supports the GPIO over distance feature
+ * @A2B_CHIP_CAP_MAILBOX: the chip supports the mailbox feature
+ */
+enum a2b_chip_caps {
+	A2B_CHIP_CAP_MAIN = BIT(0),
+	A2B_CHIP_CAP_A_SIDE = BIT(1),
+	A2B_CHIP_CAP_B_SIDE = BIT(2),
+	A2B_CHIP_CAP_I2S = BIT(3),
+	A2B_CHIP_CAP_PDM = BIT(4),
+	A2B_CHIP_CAP_REDUCED_RATE = BIT(5),
+	A2B_CHIP_CAP_CLKOUT = BIT(6),
+	A2B_CHIP_CAP_BUS_MONITOR = BIT(7),
+	A2B_CHIP_CAP_SUSTAIN = BIT(8),
+	A2B_CHIP_CAP_DATA_RX_MASK = BIT(9),
+	A2B_CHIP_CAP_GPIO_DISTANCE = BIT(10),
+	A2B_CHIP_CAP_MAILBOX = BIT(11),
+};
+
+/**
+ * struct a2b_chip_info - chip information
+ *
+ * @caps: chip capabilities
+ * @max_subs: maximum number of discoverable A2B nodes if this node is main
+ * @max_gpios: maximum number of available GPIOs
+ */
+struct a2b_chip_info {
+	unsigned int caps;
+	unsigned int max_subs;
+	unsigned int max_gpios;
+};
+
+enum a2b_superframe_freq {
+	A2B_SFF_48000,
+	A2B_SFF_44100,
+};
+
+enum a2b_tdm_mode {
+	A2B_TDMMODE_2,
+	A2B_TDMMODE_4,
+	A2B_TDMMODE_8,
+	A2B_TDMMODE_12,
+	A2B_TDMMODE_16,
+	A2B_TDMMODE_20,
+	A2B_TDMMODE_24,
+	A2B_TDMMODE_32,
+	A2B_TDMMODE_END,
+};
+
+enum a2b_tdm_slot_size {
+	A2B_TDMSS_32,
+	A2B_TDMSS_16,
+	A2B_TDMSS_END,
+};
+
+/**
+ * enum a2b_swmode - A2B transceiver External Switch Mode
+ *
+ * For more information about the meaning of these modes, see the Technical
+ * Reference [1] Table 7-8 A2B_SWCTL Register Fields.
+ */
+enum a2b_swmode {
+	A2B_SWMODE_0 = 0,
+	A2B_SWMODE_1 = 1,
+	A2B_SWMODE_2 = 2,
+};
+
+enum a2b_direction {
+	A2B_DIR_UP,
+	A2B_DIR_DOWN,
+};
+
+enum a2b_slot_size {
+	A2B_SLOT_SIZE_8 = 0,
+	A2B_SLOT_SIZE_12 = 1,
+	A2B_SLOT_SIZE_16 = 2,
+	A2B_SLOT_SIZE_20 = 3,
+	A2B_SLOT_SIZE_24 = 4,
+	A2B_SLOT_SIZE_28 = 5,
+	A2B_SLOT_SIZE_32 = 6,
+};
+
+enum a2b_slot_format {
+	A2B_SLOT_FORMAT_NORMAL = 0,
+	A2B_SLOT_FORMAT_ALT = 1,
+};
+
+struct a2b_slot_config {
+	enum a2b_slot_size size[2];
+	enum a2b_slot_format format[2];
+};
+
+struct a2b_slot_req {
+	unsigned int a_dnslots;
+	unsigned int a_upslots;
+	unsigned int b_dnslots;
+	unsigned int b_upslots;
+	struct a2b_slot_config slot_config;
+};
+
+/*
+ * A2B NODE
+ */
+
+/*
+ * Per the specification of the Interrupt Source Register in the reference
+ * manual, cf. [1] Figure 7-20, the maximum number of nodes is hard-coded to 17,
+ * because the register supports signalling of interrupts from up to 16
+ * subordinate nodes through the 4-bit INODE field.
+ *
+ *  A2B_INTSRC: Interrupt Source Register (Main Only)
+ *     _______________________________
+ *    | 7 | 6 |   |   | 3   2   1   0 |
+ *     -v---v-----------v-------------
+ *      |   |           |
+ *      |   |           `-> INODE (Interrupt Node ID)
+ *      |   |
+ *      |   `-------------> SLVINT (Slave/Subordinate Interrupt)
+ *      |
+ *      `-----------------> MSTINT (Master/Main Interrupt)
+ *
+ * In practice many A2B main mode transceivers support discovery of far fewer
+ * subordinate nodes.
+ *
+ * Note that unlike in this driver, the A2B hardware itself indexes subordinate
+ * nodes starting at zero, i.e. A2B_INTSRC.INODE=0 means that the first
+ * (nearest) subordinate node is signalling an interrupt. The reference manual
+ * also uses this convention. Here, the main node is zero and the first
+ * subordinate node is 1. The difference only needs to be accounted for in a few
+ * places such as interrupt handling and indirect register access to subordinate
+ * nodes.
+ */
+#define A2B_MAX_NODES 17
+#define A2B_MAIN_ADDR 0
+
+struct a2b_node;
+
+/**
+ * struct a2b_node_ops - node driver ops
+ *
+ * @set_respcycs: invoked by the core to configure the RESPCYCS register
+ * @set_switching: invoked by the core to configure the switch control register
+ * @discover: (main only) invoked by the core to initiate the discovery process;
+ *            the respcycs argument is automatically programmed into the newly
+ *            discovered node's RESPCYCS register on success; the node driver
+ *            must ensure that DISCVRY.DSCACT=0 before this function returns;
+ *            return 0 on success or non-zero on discovery timeout
+ * @new_structure: (main only) invoked by the core to program a new structure
+ * @is_last: invoked by the core to query whether the target node thinks it is
+ *           the last node on the bus
+ * @setup: the A2B core invokes this function when the node is registered by the
+ *         node driver; setup of any peripheral functions (cf. &struct a2b_func)
+ *         should happen here
+ * @teardown: (optional) invoked by the core when the node is unregistered; the
+ *            node driver should undo whatever it may have done in setup
+ */
+struct a2b_node_ops {
+	int (*set_respcycs)(struct a2b_node *node, unsigned int respcycs);
+	int (*set_switching)(struct a2b_node *node, bool enable, enum a2b_swmode mode);
+	int (*discover)(struct a2b_node *node, unsigned int respcycs);
+	int (*new_structure)(struct a2b_node *node,
+			     const struct a2b_slot_config *slot_config,
+			     bool dn_enable, bool up_enable);
+	int (*is_last)(struct a2b_node *node);
+	int (*setup)(struct a2b_node *node);
+	void (*teardown)(struct a2b_node *node);
+};
+
+struct a2b_node {
+	/* A2B node driver fills this in */
+	const struct a2b_node_ops *ops;
+	const struct a2b_chip_info *chip_info;
+	unsigned int vendor;
+	unsigned int product;
+	unsigned int version;
+	unsigned int invert_sync : 1;
+	unsigned int early_sync : 1;
+	unsigned int alternating_sync : 1;
+	unsigned int rx_on_dtx1 : 1;
+	unsigned int swmode_1: 1;
+	enum a2b_tdm_mode tdm_mode;
+	enum a2b_tdm_slot_size tdm_slot_size;
+	void *priv;
+
+	/* A2B core only */
+	struct device dev;
+	bool setup;
+	struct a2b_bus *bus;
+	struct work_struct bus_drop_work;
+	unsigned int addr;
+	struct a2b_slot_req slot_req;
+	bool slots_requested;
+};
+
+static inline bool is_a2b_main(const struct a2b_node *node)
+{
+	return node->addr == A2B_MAIN_ADDR;
+}
+
+static inline bool is_a2b_sub(const struct a2b_node *node)
+{
+	return !is_a2b_main(node);
+}
+
+enum a2b_inttype {
+	A2B_INTTYPE_HDCNTERR = 0,
+	A2B_INTTYPE_DDERR = 1,
+	A2B_INTTYPE_CRCERR = 2,
+	A2B_INTTYPE_DPERR = 3,
+	A2B_INTTYPE_BECOVF = 4,
+	A2B_INTTYPE_SRFERR = 5,
+	A2B_INTTYPE_SRFCRCERR = 6,
+	/* 7~8 reserved */
+	A2B_INTTYPE_PWRERR_0 = 9,
+	A2B_INTTYPE_PWRERR_1 = 10,
+	A2B_INTTYPE_PWRERR_2 = 11,
+	A2B_INTTYPE_PWRERR_3 = 12,
+	A2B_INTTYPE_PWRERR_4 = 13,
+	/* 14 reserved */
+	A2B_INTTYPE_PWRERR_5 = 15,
+	A2B_INTTYPE_IO0PND = 16,
+	A2B_INTTYPE_IO1PND = 17,
+	A2B_INTTYPE_IO2PND = 18,
+	A2B_INTTYPE_IO3PND = 19,
+	A2B_INTTYPE_IO4PND = 20,
+	A2B_INTTYPE_IO5PND = 21,
+	A2B_INTTYPE_IO6PND = 22,
+	A2B_INTTYPE_IO7PND = 23,
+	A2B_INTTYPE_DSCDONE = 24,
+	A2B_INTTYPE_I2CERR = 25,
+	A2B_INTTYPE_ICRCERR = 26,
+	/* 27~40 reserved */
+	A2B_INTTYPE_PWRERR_6 = 41,
+	A2B_INTTYPE_PWRERR_7 = 42,
+	/* 42~47 reserved */
+	A2B_INTTYPE_MBOX0FULL = 48,
+	A2B_INTTYPE_MBOX0EMPTY = 49,
+	A2B_INTTYPE_MBOX1FULL = 50,
+	A2B_INTTYPE_MBOX1EMPTY = 51,
+	/* 52~127 reserved */
+	A2B_INTTYPE_IRQMSGERR = 128,
+	/* 129~251 reserved */
+	A2B_INTTYPE_STARTUPERR = 252,
+	A2B_INTTYPE_SLVINTTYPERR = 253,
+	A2B_INTTYPE_STBYDONE = 254,
+	A2B_INTTYPE_MSTR_RUNNING = 255,
+};
+
+enum a2b_error {
+	A2B_HDCNTERR = 0,
+	A2B_DDERR = 1,
+	A2B_CRCERR = 2,
+	A2B_DPERR = 3,
+	A2B_BECOVF = 4,
+	A2B_SRFERR = 5,
+	A2B_SRFCRCERR = 6,
+	/* 7~8 reserved */
+	A2B_PWRERR_0 = 9,
+	A2B_PWRERR_1 = 10,
+	A2B_PWRERR_2 = 11,
+	A2B_PWRERR_3 = 12,
+	A2B_PWRERR_4 = 13,
+	/* 14 reserved */
+	A2B_PWRERR_5 = 15,
+	/* non-error interrupt type codes */
+	A2B_I2CERR = 25,
+	A2B_ICRCERR = 26,
+	/* 27~40 reserved */
+	A2B_PWRERR_6 = 41,
+	A2B_PWRERR_7 = 42,
+	/* 42~47 reserved */
+	/* non-error interrupt type codes */
+	/* 52~127 reserved */
+	A2B_IRQMSGERR = 128,
+	/* 129~251 reserved */
+	A2B_STARTUPERR = 252,
+	A2B_SLVINTTYPERR = 253,
+	/* non-error interrupt type codes */
+};
+
+int a2b_node_read(struct a2b_node *node, unsigned int reg, unsigned int *val);
+int a2b_node_write(struct a2b_node *node, unsigned int reg, unsigned int val);
+int a2b_node_i2c_xfer(struct a2b_node *node, struct i2c_msg *msgs, int num);
+int a2b_node_get_inttype(struct a2b_node *node, unsigned int *val);
+struct clk *a2b_node_get_sync_clk(struct a2b_node *node);
+
+void a2b_node_report_error(struct a2b_node *node, enum a2b_error error);
+
+int a2b_node_request_slots(struct a2b_node *node,
+			   struct a2b_slot_req *slot_req);
+int a2b_node_free_slots(struct a2b_node *node);
+
+int a2b_register_node(struct a2b_node *node);
+void a2b_unregister_node(struct a2b_node *node);
+
+/*
+ * A2B FUNC
+ */
+
+struct a2b_func {
+	struct device dev;
+	struct a2b_node *node;
+};
+
+struct a2b_func *a2b_node_of_add_func(struct a2b_node *node,
+				      struct device_node *np);
+
+/*
+ * A2B BUS
+ */
+
+struct a2b_bus_ops;
+
+/**
+ * enum a2b_bus_status - A2B bus status bits
+ *
+ * @A2B_BUS_STATUS_DISCOVERY_ALGO - the discovery (read: enumeration) algorithm
+ * is in progress and the number of available nodes it not yet determined
+ * @A2B_BUS_STATUS_DISCOVERING - the main node is currently in discovery mode,
+ * i.e. DISCSTAT.DSCACT=1; used internally to ignore spurious bus errors
+ */
+enum a2b_bus_status {
+	A2B_BUS_STATUS_DISCOVERY_ALGO,
+	A2B_BUS_STATUS_DISCOVERING,
+	A2B_BUS_STATUS_END,
+};
+
+struct a2b_bus {
+	/* A2B interface driver fills this in */
+	const struct a2b_bus_ops *ops;
+	enum a2b_superframe_freq sff;
+	struct device *parent;
+	void *priv;
+
+	/* A2B core only */
+	struct device dev;
+	int id;
+	struct mutex mutex;
+	struct a2b_node *nodes[A2B_MAX_NODES];
+	unsigned long status;
+	struct delayed_work discovery_work;
+};
+
+int a2b_register_bus(struct a2b_bus *bus);
+void a2b_unregister_bus(struct a2b_bus *bus);
+struct a2b_bus *a2b_find_bus_by_of_node(struct device_node *np);
+void a2b_put_bus(struct a2b_bus *bus);
+unsigned long a2b_bus_status(struct a2b_bus *bus);
+unsigned int a2b_bus_num_subs(struct a2b_bus *bus);
+unsigned int a2b_bus_num_nodes(struct a2b_bus *bus);
+
+/**
+ * a2b_bus_ops - A2B host bus operations
+ *
+ * @read: register read from the address on the target node
+ * @write: write with same semantics as @read
+ * @i2c_xfer: perform a raw I2C transfer from a subordinate node's I2C interface
+ * @get_inttype: in the event of an interrupt on a node, the node must use this
+ *               function to determine what type of interrupt it has received
+ * @get_sync_clk: return the &struct clk pointer associated with the SYNC clock
+ */
+struct a2b_bus_ops {
+	int (*read)(struct a2b_bus *bus, const struct a2b_node *node,
+		    unsigned int reg, unsigned int *val);
+	int (*write)(struct a2b_bus *bus, const struct a2b_node *node,
+		     unsigned int reg, unsigned int val);
+	int (*i2c_xfer)(struct a2b_bus *bus, const struct a2b_node *node,
+			struct i2c_msg *msgs, int num);
+	int (*get_inttype)(struct a2b_bus *bus, unsigned int *val);
+	struct clk *(*get_sync_clk)(struct a2b_bus *bus);
+};
+
+/*
+ * BUS DRIVER
+ */
+
+struct a2b_driver {
+	struct device_driver driver;
+	int (*probe)(struct device *dev);
+	void (*remove)(struct device *dev);
+	void (*shutdown)(struct device *dev);
+};
+
+#define to_a2b_driver(drv) container_of(drv, struct a2b_driver, driver)
+
+int __a2b_driver_register(struct a2b_driver *a2b_drv, struct module *owner);
+void a2b_driver_unregister(struct a2b_driver *a2b_drv);
+
+#define a2b_driver_register(a2b_drv) __a2b_driver_register(a2b_drv, THIS_MODULE)
+#define module_a2b_driver(__a2b_driver) \
+	module_driver(__a2b_driver, a2b_driver_register, a2b_driver_unregister)
+
+#define to_a2b_node(dev) container_of_const(dev, struct a2b_node, dev)
+#define to_a2b_func(dev) container_of_const(dev, struct a2b_func, dev)
+
+extern const struct device_type a2b_node_type;
+extern const struct device_type a2b_func_type;
+extern const struct bus_type a2b_bus;
+
+/*
+ * A2B BUS CLASS
+ */
+
+static inline struct a2b_bus *to_a2b_bus(struct device *dev)
+{
+	return container_of(dev, struct a2b_bus, dev);
+}
+
+extern const struct device_type a2b_bus_type;
+extern const struct class a2b_bus_class;
+
+#endif /* _A2B_H */

-- 
2.44.0


