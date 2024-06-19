Return-Path: <linux-i2c+bounces-4106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC0F90E472
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 09:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A501C21DD9
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 07:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2595B13E037;
	Wed, 19 Jun 2024 07:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nTlVKfKK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A213AD12;
	Wed, 19 Jun 2024 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781814; cv=none; b=RFf3WvbnN6+E2bdbq1+utUVsz/8/mXjTI7JEl+8FCiSv9gvg3MuXj7z0Y0+sWbQYQIqQEWb4I1rDsLI4zwRosw3RMGGvMDGxSamDAiDmPwQm75BXwSc5t2SDYVOQlnCq1yep3LmzCaseSwD5/N3fmetSVpPio2bV6khoBDmzJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781814; c=relaxed/simple;
	bh=mJ8HIY8U2cLFLbqLZFrEvXfz1+lBDpS+ZmL57yB9ylc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JVDnkxjdwN1fAVGs8fHn1DGlvkN78C5HxEc/c2cuFOwN71b0ip4Nn/5tX+s+eOfQQrtcFnZIv6YQwCPFud+nk6ghI2iXTg00OFuQ54sNonX8IROdeedsKqFWtAUSRXnjeX0oDDpcUkivCBHt1VM5Vjhp0HDo9fXuDeoXi2UzXsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nTlVKfKK; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718781813; x=1750317813;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mJ8HIY8U2cLFLbqLZFrEvXfz1+lBDpS+ZmL57yB9ylc=;
  b=nTlVKfKKbCzUGUnHXkHQKK4pNpx8redXNqgXWxffAToqn1ysNnm/7KE+
   GoxdJJAkEHg+zIM1kiYw9t0tKNf5+kcUGxGHqVGB3nwHryx+qxw7lJdbr
   VM0AfhuE2ezC00wnz/OtViTNUHUMfa4oClqy0Bd5GnIEc4ZBSFkDVtm24
   A1T56ZOygGurIEU3u6TjOntSbl21N41Q+c+GiDr8TbrGfy548TeDaLXzK
   vhwScNZEAfbCahNd0g38OatDX7UdY7XUPIWDV9zdHblt8f9UKAEvRlcsn
   IORlXWUKgjGZcU7W1GSjSxjt87cPcQYS9JJhuoD5Kgz4xJA905cKMdODc
   Q==;
X-CSE-ConnectionGUID: wz26KGp1QTiPY/s2OVV85w==
X-CSE-MsgGUID: 3T4FFeIwTpqEMkGM19I4FA==
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="30691794"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2024 00:23:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 19 Jun 2024 00:22:58 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 19 Jun 2024 00:22:55 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 0/3] Read MAC address through NVMEM for sama7g5ek
Date: Wed, 19 Jun 2024 10:22:28 +0300
Message-ID: <20240619072231.6876-1-andrei.simion@microchip.com>
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

Andrei Simion (1):
  dt-bindings: eeprom: at24: Add at24,mac02e4 and at24,mac02e6

Claudiu Beznea (2):
  eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
  ARM: dts: at91: at91-sama7g5ek: add EEPROMs

 .../devicetree/bindings/eeprom/at24.yaml      | 10 ++-
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts | 44 +++++++++++
 drivers/misc/eeprom/at24.c                    | 73 +++++++++++--------
 3 files changed, 93 insertions(+), 34 deletions(-)


base-commit: 0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
-- 
2.34.1


