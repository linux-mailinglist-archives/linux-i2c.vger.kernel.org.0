Return-Path: <linux-i2c+bounces-5108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53194606D
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 17:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD04228788B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 15:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84CF166F0B;
	Fri,  2 Aug 2024 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LsOGgaJo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F5175D2E;
	Fri,  2 Aug 2024 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612197; cv=none; b=EwA82iAMORRxVjNa7U/5VOFPosMIA3Fc+a4nTtcpkTR/TvqwRjrXrD7yP8NALsjYxKVrcYcfSex3dlrXO74Um3dR4vfyUmC/vX0in/bWINkrnhRCZftNai15fvHh6B9RPu8edwoTtXw1LdriXx/D+YAJZKuz+bACXMtaxLjDdsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612197; c=relaxed/simple;
	bh=3+cI4zEsxShLyRjIyQN7jrcdsmNquGekhe7zScqsTFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vApolf9QWyCx4+5IoOvy/smWovaiRfTtfJWEwyOuaqPUnsJaLK1DBp5B1xbAkVDYnWm+P1rpvFwTrMsoSATlCl2YM2bApIHPhzQ/Gja4sZazM2qojYdbQPHR+R6T+a6DB2XGSPGLmcHN+Jqd51YVBQQC6q9kwE3ETqwafKQNCQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LsOGgaJo; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726i5rx032551;
	Fri, 2 Aug 2024 10:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JH+QR/iZT4O9MPac+AjmOS9MjiO1cA7yxULfOIhBzRU=; b=
	LsOGgaJo4QXIY3axnKqkTsK6AAKi0kc+9IlfTs94B+9RNIraEgVEKZvAPOePZue7
	IloszAJ483z8ZSQ04hD/k9nj6LuD08YYl2z3zIGhvjxRt+NoJiD+DnclrQsUVIig
	yD1EBkuq3mD/0o7ewT801RNrgpAaiUip4CmMvJD7gvMJHZq+Ec1gY0bnujqQUKXi
	h0ucXq2osc2IXvNSE9igiIATGvr7DoWyhSapbTvnNPaN+1omgOUNRif/4uyuVnjB
	/zGcq0y2lA69bUEZ6poVpi4/Cy1wDt5u+Vxl5hl5I7ErI5xR55ZE1KHw1ZlI8GUV
	+yhj+cGc1Pqn5KoGoqBr4g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdxruc0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 10:22:21 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 16:22:19 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 16:22:19 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C997C820247;
	Fri,  2 Aug 2024 15:22:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <wsa+renesas@sang-engineering.com>,
        <mika.westerberg@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v2 3/3] ALSA: hda/realtek: Add support for new HP G12 laptops
Date: Fri, 2 Aug 2024 16:22:15 +0100
Message-ID: <20240802152215.20831-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802152215.20831-1-rf@opensource.cirrus.com>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: P5VUMJOLetpMhJtLr1jG3N4tAHUBFwIP
X-Proofpoint-ORIG-GUID: P5VUMJOLetpMhJtLr1jG3N4tAHUBFwIP
X-Proofpoint-Spam-Reason: safe

From: Simon Trimmer <simont@opensource.cirrus.com>

Some of these laptop models have quirk IDs that are identical but have
different amplifier parts fitted, this difference is described in the
ACPI information.

The solution introduced for this product family can derive the required
component binding information from ACPI instead of hardcoding it,
supports the new variants of the CS35L56 being used and has generalized
naming that makes it applicable to other ALC+amp combinations.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

 sound/pci/hda/patch_realtek.c | 99 +++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1645d21d422f..1a05c647f08c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11,15 +11,18 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
+#include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/ctype.h>
+#include <linux/spi/spi.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/hda_codec.h>
@@ -6856,6 +6859,86 @@ static void comp_generic_fixup(struct hda_codec *cdc, int action, const char *bu
 	}
 }
 
+static void cs35lxx_autodet_fixup(struct hda_codec *cdc,
+				  const struct hda_fixup *fix,
+				  int action)
+{
+	struct device *dev = hda_codec_dev(cdc);
+	struct acpi_device *adev;
+	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
+	const char *bus = NULL;
+	static const struct {
+		const char *hid;
+		const char *name;
+	} acpi_ids[] = {{ "CSC3554", "cs35l54-hda" },
+			{ "CSC3556", "cs35l56-hda" },
+			{ "CSC3557", "cs35l57-hda" }};
+	char *match;
+	int i, count = 0, count_devindex = 0;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		for (i = 0; i < ARRAY_SIZE(acpi_ids); ++i) {
+			adev = acpi_dev_get_first_match_dev(acpi_ids[i].hid, NULL, -1);
+			if (adev)
+				break;
+		}
+		if (!adev) {
+			dev_err(dev, "Failed to find ACPI entry for a Cirrus Amp\n");
+			return;
+		}
+
+		count = i2c_acpi_client_count(adev);
+		if (count > 0) {
+			bus = "i2c";
+		} else {
+			count = acpi_spi_count_resources(adev);
+			if (count > 0)
+				bus = "spi";
+		}
+
+		fwnode = fwnode_handle_get(acpi_fwnode_handle(adev));
+		acpi_dev_put(adev);
+
+		if (!bus) {
+			dev_err(dev, "Did not find any buses for %s\n", acpi_ids[i].hid);
+			return;
+		}
+
+		if (!fwnode) {
+			dev_err(dev, "Could not get fwnode for %s\n", acpi_ids[i].hid);
+			return;
+		}
+
+		/*
+		 * When available the cirrus,dev-index property is an accurate
+		 * count of the amps in a system and is used in preference to
+		 * the count of bus devices that can contain additional address
+		 * alias entries.
+		 */
+		count_devindex = fwnode_property_count_u32(fwnode, "cirrus,dev-index");
+		if (count_devindex > 0)
+			count = count_devindex;
+
+		match = devm_kasprintf(dev, GFP_KERNEL, "-%%s:00-%s.%%d", acpi_ids[i].name);
+		if (!match)
+			return;
+		dev_info(dev, "Found %d %s on %s (%s)\n", count, acpi_ids[i].hid, bus, match);
+		comp_generic_fixup(cdc, action, bus, acpi_ids[i].hid, match, count);
+
+		break;
+	case HDA_FIXUP_ACT_FREE:
+		/*
+		 * Pass the action on to comp_generic_fixup() so that
+		 * hda_component_manager functions can be called in just once
+		 * place. In this context the bus, hid, match_str or count
+		 * values do not need to be calculated.
+		 */
+		comp_generic_fixup(cdc, action, NULL, NULL, NULL, 0);
+		break;
+	}
+}
+
 static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
 	comp_generic_fixup(cdc, action, "i2c", "CSC3551", "-%s:00-cs35l41-hda.%d", 2);
@@ -7528,6 +7611,7 @@ enum {
 	ALC256_FIXUP_CHROME_BOOK,
 	ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7,
 	ALC287_FIXUP_LENOVO_SSID_17AA3820,
+	ALCXXX_FIXUP_CS35LXX,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9857,6 +9941,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_lenovo_ssid_17aa3820,
 	},
+	[ALCXXX_FIXUP_CS35LXX] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35lxx_autodet_fixup,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -10271,6 +10359,17 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8cdf, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ce0, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d01, "HP ZBook Power 14 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d08, "HP EliteBook 1045 14 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d85, "HP EliteBook 1040 14 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d86, "HP Elite x360 1040 14 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d8c, "HP EliteBook 830 13 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d8d, "HP Elite x360 830 13 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d8e, "HP EliteBook 840 14 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d8f, "HP EliteBook 840 14 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d90, "HP EliteBook 860 16 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d91, "HP ZBook Firefly 14 G12", ALCXXX_FIXUP_CS35LXX),
+	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALCXXX_FIXUP_CS35LXX),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.39.2


