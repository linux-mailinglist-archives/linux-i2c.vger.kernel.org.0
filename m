Return-Path: <linux-i2c+bounces-4196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5CF9124E3
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1F7286CEC
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73E014F9E0;
	Fri, 21 Jun 2024 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="azfX01yH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213528399;
	Fri, 21 Jun 2024 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972187; cv=none; b=fux/ZBxXa58iLYUrWvc0KIR3lrWqJpIoeQlQMGj6iadujQ4Sh+xeGUDFHSW4QkWRVngs+ibhwRvBZXHVITMLU7jrgNjSyg0vy8pubi8KYgqXmpby0NM45euDn35b+GqfStPM6WPtNlQETbfKE6WNPAQ2yzeiZ/98RePTLgLJb4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972187; c=relaxed/simple;
	bh=RrIkAfeF7Vo501++09i2l4ssWDTawSjUb/hFqT0/uEU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fibczHtTtOpxdihGsCPWBPkDAtF5LiqyYgwslK1ok40gflIZ+owBU/VIX0vKkaLizTbJqnOp+JMDToNgGDpPYaQdizruzlX0NLxKCgiwYDL5taNWIqge8lGusZuKnIvfsEmx7rLZfyjWA6xwL87S2b7ADzfrUXdRAaUqCdwC2Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=azfX01yH; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718972186; x=1750508186;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RrIkAfeF7Vo501++09i2l4ssWDTawSjUb/hFqT0/uEU=;
  b=azfX01yHOZvsK6ifAdoHH2/AZGRJSgWCt5wjePIlLYwf3B7+W/0jda8F
   IQiFYwQMcPhYXNTsONS9j37Dilvrz8feda3eBHRxeagETXprbQGo2z1FL
   Zus8SCLUsUgfjENie2n4QtCeJ19ZtgEOZP8bXxHUqp7Qdhpt2lD1AFili
   aqeS1Wwdb7WS0DY8Zk6OO4fqXuxjBGIcKgz5fgycK+XDm8e9149t3HJxT
   ueO6bRnz4Cz/29JNeQ7Grch+gt3moQs4tue4Kd0RclWntHFIRsV2fWMyq
   rh1hTw2B7DaBtiUnQNqMSHL6cEH9cYcDkQ+RsGaX6IaF+GrV05ljpHen/
   g==;
X-CSE-ConnectionGUID: gjF6r6nLSZ2qzzloD0+0Lw==
X-CSE-MsgGUID: fzsivhhzSAyAVZBnb0DqIA==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="28341527"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 05:16:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 05:16:01 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 21 Jun 2024 05:15:58 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH v2 0/3] Read MAC address through NVMEM for sama7g5ek
Date: Fri, 21 Jun 2024 15:13:37 +0300
Message-ID: <20240621121340.114486-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series proposes to add EEPROM support and reading MAC addresses through
NVMEM (via Devicetree) for sama7g5ek:
- Add in DT bindings document the EEPROM compatibles : "at24,mac02e4" and
"at24,mac02e6"
- Update to the driver to support "at24,mac02e4" and
"at24,mac02e6" and adjusting offset for those 24AA025E{48, 64}.
- Added the nodes in devicetree for eeproms where are stored eui48 MAC,
and update gmac nodes to read the MAC via devicetree through NVMEM.

------------------------------------------------------------------
v1 -> v2:
* dt-bindings: eeprom: at24: Add at24,mac02e4 and at24,mac02e6
  - change pattern into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep simpler

* eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
  - no change

* ARM: dts: at91: at91-sama7g5ek: add EEPROMs
  - remove unnecessary #address-cells #size-cells

------------------------------------------------------------------
Andrei Simion (1):
  dt-bindings: eeprom: at24: Add at24,mac02e4 and at24,mac02e6

Claudiu Beznea (2):
  eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
  ARM: dts: at91: at91-sama7g5ek: add EEPROMs

 .../devicetree/bindings/eeprom/at24.yaml      | 10 ++-
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts | 40 ++++++++++
 drivers/misc/eeprom/at24.c                    | 73 +++++++++++--------
 3 files changed, 89 insertions(+), 34 deletions(-)


base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
-- 
2.34.1


