Return-Path: <linux-i2c+bounces-4441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923F91B93E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6CB1C22F4F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3B7143752;
	Fri, 28 Jun 2024 08:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Vi+aQqGe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0431547F59;
	Fri, 28 Jun 2024 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561736; cv=none; b=qt9WZ+DnyABxwHos+COioLIuhjfELtbP6s+TyLC+z9ZlK9XWB/ZyiwYnzajI6YqyCujEGzlnkO4LrEI9nzUWacWtdC0aQN2R6kbN7uFmJcWxr39SoUmNfyj9F9TjE5zmstVaYKgnZX1C9cDc+mpvflZZM/ft3Wndc1ISOh3VDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561736; c=relaxed/simple;
	bh=E+RwYhQWe3us4X5mYKbaGAu7IQpfutu+1BRbgFsfN+U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tpzOsJUnOG2Y+6PMQr8a0dOCRmIUGDyOAbVxiy1UglLgWSCWajOw+NLg8px2gxgHft3yYzAJYShpc75Yk9B0pOL3FrmIIXYwUtn4gDFzNtldtnKECLS0/J74owIB+5bPrToHrEkFEop/jTjl2WqawdNDObPRlfFQUozjO+luQfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Vi+aQqGe; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719561734; x=1751097734;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E+RwYhQWe3us4X5mYKbaGAu7IQpfutu+1BRbgFsfN+U=;
  b=Vi+aQqGeAvbmI833Wr24oj7fQ+fFVO4dVjqK67Oy9H+KYDdZu365imV1
   Tqg7jRDA/i7z++kQcsadrHDqif5CROtr9wCvhcG/hrjYQmfVf6jZWbF8H
   blRlJAsa34x3S6g7qUMoaWbuaFkw/eJqZT3Rp5aky2c9A+NudNs8JB9gf
   sKAlk/zWukl3LxfWYRjN0/ieB+8MCY/R5lUL7ufC0WTjRENgQkYrOkssk
   IcZbDPjNEcywe8qu74JVJby/x3EdXMg1ERgL5SQSO8kJHpMo+edKUi7xi
   uoDkZLOpxJWBZsYxFQnL6hNnsMNdre5MQQcW5qYc3nZnBtPtYYcX5+eXr
   g==;
X-CSE-ConnectionGUID: 13wLbFbFTQqpXPeqjmJlLw==
X-CSE-MsgGUID: eCuxYOU4R5SZ3O67sbsd5w==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="196011929"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 01:02:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 01:02:01 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 01:01:58 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH v3 0/3] Read MAC address through NVMEM for sama7g5ek
Date: Fri, 28 Jun 2024 11:01:43 +0300
Message-ID: <20240628080146.49545-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series proposes to add EEPROM support and reading MAC addresses
through NVMEM (via Devicetree) for sama7g5ek:
- Add in DT bindings document the EEPROM compatibles :
"microchip,24aa025e48" and "microchip,24aa025e64"
- Update to the driver to support "microchip,24aa025e48" and
"microchip,24aa025e64" and adjusting offset for those 24AA025E{48, 64}.
- Added the nodes in devicetree for eeproms where are stored EUI-48 MAC,
and update gmac nodes to read the MAC via devicetree through NVMEM.

------------------------------------------------------------------
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

------------------------------------------------------------------
Andrei Simion (1):
  dt-bindings: eeprom: at24: Add Microchip 24AA025E48/24AA025E64

Claudiu Beznea (2):
  eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
  ARM: dts: at91: at91-sama7g5ek: add EEPROMs

 .../devicetree/bindings/eeprom/at24.yaml      |  4 ++
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts | 40 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    | 28 ++++++++++---
 3 files changed, 67 insertions(+), 5 deletions(-)


base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
-- 
2.34.1


