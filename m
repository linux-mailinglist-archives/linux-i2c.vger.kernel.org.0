Return-Path: <linux-i2c+bounces-4596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC99255C9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 10:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7A72B20D57
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 08:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F3A136E1A;
	Wed,  3 Jul 2024 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pSsEFfbL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD90C182C3;
	Wed,  3 Jul 2024 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996513; cv=none; b=sJZKsZKIxKttslqJIwCyS65D8vdYRq1rsM0S2l2huxRvX7Z7IX3ih9gVyxDoC2+bU/DtU/w/KeKXpIuF4TK/oy9pAZja7j83m71WdjHOrsW2u6MHi0QlazqwIu+/SXMhO2MMRLsblvuEgU5luSmbEt74USjFWgmZ3VPFkd+cjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996513; c=relaxed/simple;
	bh=o8Vab3oK2e41iH2uJwl/mpjZ6PWChqVCRQGMvWU4P/s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QgzPYoczRu0vFpdyBrm2Qm4I4f5J419l8qloqV5t03R+1XP2c5dzMxnI+sVyZSgASHUy2iRpntgWGvgf5CNkp04/6brWmo7CFDfhQLnbz1COMW8KnKmYyzlZfdHCUakoG9aNxQo7NPOHJyvxFrLqOZge4ez/2Tyf4MkvGPFFz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=fail smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pSsEFfbL; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719996512; x=1751532512;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o8Vab3oK2e41iH2uJwl/mpjZ6PWChqVCRQGMvWU4P/s=;
  b=pSsEFfbLQje4vZIWZRHqgmFMpfiOwSHKzVOn9HjQZM8GP3bz2cnbHD8P
   Mh4GYxMxdpUyMLOUDzTv+uusb4fT1VS0KtjDPf84vLhlVBF21rKJCElYN
   G4wSLlpIxhEQUVFoG137+nDhGnMqaXLJI78Dy7UWsiTmSbaa88CYXp/pA
   zIbps9PB8NJIRRgvEleJ/kUFSkbAE3iJvQ8gcUXWeAt/xWHKcpzEcfl0G
   WmAaDWlXDGqi1BLRna1DlFcNgDeafTdAGhWG9xMZb3A8V1Ijp+7eQLN8E
   T2uZ/663II39u80EGYQBceRyPh5RJ75BxoZuzmwY2nzR6beHPsHgdljIW
   w==;
X-CSE-ConnectionGUID: saTZmC0lTLSxy+qNNP4X9w==
X-CSE-MsgGUID: AeHk27KuT0eHZHRbTgphfA==
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="28801127"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2024 01:48:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jul 2024 01:47:58 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jul 2024 01:47:55 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH v4 0/3] Read MAC address through NVMEM for sama7g5ek
Date: Wed, 3 Jul 2024 11:47:01 +0300
Message-ID: <20240703084704.197697-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Our main boot sequence :
(1) ROM BOOT -> AT91Bootstrap -> U-Boot -> Linux Kernel.
U-Boot is the stage where we set up the MAC address.
Also we can skip U-Boot and use the following boot sequence :
(2) ROM BOOT -> AT91Boostrap -> Linux Kernel.
Add EEPROMs and nvmem-layout to describe eui48 MAC address region
to be used for case (2).

This series proposes to add EEPROM support and reading MAC addresses
through NVMEM (via Devicetree) for sama7g5ek:
- Add in DT bindings document the EEPROM compatibles :
"microchip,24aa025e48" and "microchip,24aa025e64"
- Update to the driver to support "microchip,24aa025e48" and
"microchip,24aa025e64".
- Added the nodes in devicetree for eeproms where are stored EUI-48 MAC,
and update gmac nodes to read the MAC via devicetree through NVMEM.

-----------------------------------------------------------------------
v3 -> v4:
* dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64
  - update the rule to select compatible

* eeprom: at24: Add support for Microchip 24AA025E48/24AA025E64 EEPROMs
  - Use AT24_CHIP_DATA with AT24_FLAG_READONLY
  - drop AT24_CHIP_DATA_CB_AO
  - drop AT24_CHIP_DATA_AO
  - drop u8 adjoff
  - change commit message

* ARM: dts: microchip: at91-sama7g5ek: add EEPROMs
  - reword commit message

v2 -> v3:
* dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64
  - commit subject changed to reference Microchip 24AA025E48/24AA025E64
  - drop the pattern: mac02e4$ and mac02e6$ and a-z from regex
  - add these two devices down at the bottom
  - added Reviewed-by

* eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
  - add specific compatible names according with
https://ww1.microchip.com/downloads/en/DeviceDoc/24AA02E48-24AA025E48-24AA02E64-24AA025E64-Data-Sheet-20002124H.pdf
  - add extended macros to initialize the structure with explicit value for adjoff
  - drop co-developed-by to maintain the commit history
  (chronological order of modifications)

* ARM: dts: at91: at91-sama7g5ek: add EEPROMs
  - change from atmel,24mac02e4 to microchip,24aa025e48 to align with the datasheet
  - drop co-developed-by to maintain the chronological order of the changes

v1 -> v2:
* dt-bindings: eeprom: at24: Add at24,mac02e4 and at24,mac02e6
  - change pattern into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep simpler

* eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
  - no change

* ARM: dts: at91: at91-sama7g5ek: add EEPROMs
  - remove unnecessary #address-cells #size-cells
-----------------------------------------------------------------------
Andrei Simion (1):
  dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64

Claudiu Beznea (2):
  eeprom: at24: Add support for Microchip 24AA025E48/24AA025E64 EEPROMs
  ARM: dts: microchip: at91-sama7g5ek: add EEPROMs

 .../devicetree/bindings/eeprom/at24.yaml      |  8 +++-
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts | 40 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    |  8 ++++
 3 files changed, 55 insertions(+), 1 deletion(-)


base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
-- 
2.34.1


