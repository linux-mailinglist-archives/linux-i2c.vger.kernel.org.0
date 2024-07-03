Return-Path: <linux-i2c+bounces-4597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117619255CC
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 10:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42C091C24BC9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 08:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7914313C66A;
	Wed,  3 Jul 2024 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CF72EWJZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972BA13BC0B;
	Wed,  3 Jul 2024 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996518; cv=none; b=hDuX4fTMZYnOJduvWr/60gEwOABbOTDvxOwkVE5HBHL6awRYRq4zZBzTMhM8iAfTKy9YHPJzwHgkisGGS09w1yoJgJXW3W2qumJ/PHplIy2aMPgyzBdUO4oI1VJBBMEmIxabWnFr4YgX2caW+jIg8yIjVcK5qmSSHvyLgsUTvLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996518; c=relaxed/simple;
	bh=z62RBtJdUWVJAzwa/Aeq8wYi4651I8agle+ZMpscrsI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hxXnKzWvQLhIWfNMASJDrCinj8kRWvf71iD8TPiWk2gWMRECTZ/NQNzIaTzokd8XoBcNeSXgb1pw1q0TC0DYpkmvqxqXEBMy6QsN0hvHxVtzmxYlG8smAerqqn6dfybM65rSnQOMyBMr+xrQJUNj8DDAzmveqmtLnU62It35oC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=fail smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CF72EWJZ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719996516; x=1751532516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z62RBtJdUWVJAzwa/Aeq8wYi4651I8agle+ZMpscrsI=;
  b=CF72EWJZf9GheIzvWVZWX7gWGjXMvR1/gn2V1LwWlryFc2jQ20n7UA9M
   aKzsL4tqPQq+gtNG83lN7o/4I7333b7tUCHAXH4azk0mpmst/J4WM92Xu
   gOGDApLTF2tHLIxhFPxFN0Cy01rW+03DLwNkJRs9J7tYedhGHOZHrghL0
   VJ/FS/z5Uou58K+IwiVNkUF/ak585gU6Lwo04HxMXvuYdwO1o+CtjWFjJ
   szylYEMsy3p86K8DbddAjyLZHuZbKzdXxk6A7SfHFHzLGw6Xj8PGOIQGn
   9NXxoV3CACyoxOrRR7KQHCMMLq0DMV02tzWy9JGNaWdJwwqXLquhoyQgE
   g==;
X-CSE-ConnectionGUID: s71X572eQVinIeDMsyDqRg==
X-CSE-MsgGUID: 9JW94tPrRUmMAdhDudLbuA==
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="196193650"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2024 01:48:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jul 2024 01:48:02 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jul 2024 01:47:59 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v4 1/3] eeprom: at24: Add support for Microchip 24AA025E48/24AA025E64 EEPROMs
Date: Wed, 3 Jul 2024 11:47:02 +0300
Message-ID: <20240703084704.197697-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703084704.197697-1-andrei.simion@microchip.com>
References: <20240703084704.197697-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add "microchip,24aa025e48", "microchip,24aa025e64" compatible for the
usage w/ 24AA025E{48, 64} type of EEPROMs where "24aa025e48" stands
for EUI-48 address and "24aa025e64" stands for EUI-64 address.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
[andrei.simion@microchip.com: Use AT24_DATA_CHIP with AT24_FLAG_READONLY for
24AA025E{48, 64} type of EEPROMs. Reword commit message.]
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v3 -> v4:
- Use AT24_CHIP_DATA with AT24_FLAG_READONLY
- drop AT24_CHIP_DATA_CB_AO
- drop AT24_CHIP_DATA_AO
- drop u8 adjoff
- change the commit title

v2 -> v3:
- add specific compatible name according with
https://ww1.microchip.com/downloads/en/DeviceDoc/24AA02E48-24AA025E48-24AA02E64-24AA025E64-Data-Sheet-20002124H.pdf
- add extended macros to init structure with explicit value for adjoff
- drop co-developed-by to maintain the commit history
 (chronological order of modifications)

v1 -> v2:
- no change
---
 drivers/misc/eeprom/at24.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4bd4f32bcdab..ca872e3465ed 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -174,6 +174,10 @@ AT24_CHIP_DATA(at24_data_24mac402, 48 / 8,
 	AT24_FLAG_MAC | AT24_FLAG_READONLY);
 AT24_CHIP_DATA(at24_data_24mac602, 64 / 8,
 	AT24_FLAG_MAC | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24aa025e48, 48 / 8,
+	AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24aa025e64, 64 / 8,
+	AT24_FLAG_READONLY);
 /* spd is a 24c02 in memory DIMMs */
 AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
 	AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
@@ -218,6 +222,8 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24cs02",	(kernel_ulong_t)&at24_data_24cs02 },
 	{ "24mac402",	(kernel_ulong_t)&at24_data_24mac402 },
 	{ "24mac602",	(kernel_ulong_t)&at24_data_24mac602 },
+	{ "24aa025e48",	(kernel_ulong_t)&at24_data_24aa025e48 },
+	{ "24aa025e64",	(kernel_ulong_t)&at24_data_24aa025e64 },
 	{ "spd",	(kernel_ulong_t)&at24_data_spd },
 	{ "24c02-vaio",	(kernel_ulong_t)&at24_data_24c02_vaio },
 	{ "24c04",	(kernel_ulong_t)&at24_data_24c04 },
@@ -270,6 +276,8 @@ static const struct of_device_id __maybe_unused at24_of_match[] = {
 	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
 	{ .compatible = "atmel,24c1025",	.data = &at24_data_24c1025 },
 	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
+	{ .compatible = "microchip,24aa025e48",	.data = &at24_data_24aa025e48 },
+	{ .compatible = "microchip,24aa025e64",	.data = &at24_data_24aa025e64 },
 	{ /* END OF LIST */ },
 };
 MODULE_DEVICE_TABLE(of, at24_of_match);
-- 
2.34.1


