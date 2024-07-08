Return-Path: <linux-i2c+bounces-4767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E892AA14
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 21:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2F16B22311
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 19:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5C114D6FF;
	Mon,  8 Jul 2024 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="LbZNkTBp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377641D52D;
	Mon,  8 Jul 2024 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720468102; cv=none; b=bCAdHC1M9OecgiARcQY5kzNGxn+mBqrdCtNjGxOd58bIQtQwb6cmaMkGPyDjLvAGL3AF451+uh/0AN6hQpy4X4OSVtvkCdoSF502atnBKDltHO81ksXzz6BqOJmDFfXsXDlxUe1Y+OUlgfRcPc1ER9pAtXl6W/Ixu9VeGJoH9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720468102; c=relaxed/simple;
	bh=xUZY/g9NH9hWrJ5MTIb/Ij2QXJdJdb9amn0iqhwDow4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FMW9yI7l0yafrCpKHyQx9nJQxYvOlA3tiLWbtxamS1YYLdCkOO6uc2RwrhF/o3vbYHXaADSpeVXmpbD0VCYVCyeha5+KMGcl0Pk/WuNV8gbQmE3ix50NUH/0M5lReGErDuvcE9k6smsELhuqXbuv+i3pNBIBLiL9K4/z+NBK9tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=LbZNkTBp; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 054BE120005;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 054BE120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720468096;
	bh=b6lWsM0Po6dUCUZmlJfrJE/GhXqZ9octg7GqBGyGm3M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LbZNkTBpkHeqONTCklpSMKnFlKM+Pzn1G27nbN9Q81h21xTOv6+KL+KJ+zGanNKOd
	 f+8p7a8QPJpt6sLVZNWDpge6amOYqdiW6QKH3xi417EWZNj9ik4lTExc9v6jgD+lRa
	 lZi/tpvwuV148JVHQ+f6SiduZXBeuPgX9ylk5iavrEeB+A368ZKWH+vDwEdKG6Hkmp
	 tl0rz43QGnbacN1Ko3VAY9aUPz5jzFDYUo+EGjcSPGzvEmw11fRc+fvRKUn6CznzVG
	 bqdfXvA1dk1si5YT/rssT6qieTr/XnPTejTdLS9R2y1fEx+NVUeX0v/o0JH/SjUy+6
	 ODLRR//vZdXAQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 22:48:15 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 22:48:15 +0300
From: George Stark <gnstark@salutedevices.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>,
	<broonie@kernel.org>, <glaroque@baylibre.com>, <rafael@kernel.org>,
	<daniel.lezcano@linaro.org>, <rui.zhang@intel.com>, <lukasz.luba@arm.com>,
	<b.galvani@gmail.com>, <mmkurbanov@sberdevices.ru>
CC: <linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH 0/4] amlogic SoC's power-domains fixes
Date: Mon, 8 Jul 2024 22:48:04 +0300
Message-ID: <20240708194808.1819185-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186376 [Jul 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 23 0.3.23 8881c50ebb08f9085352475be251cf18bb0fcfdd, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 16:01:00 #25918429
X-KSMG-AntiVirus-Status: Clean, skipped

Here's some fixes to the bindings and device tree related to Amlogic A1 SoC.
The SoC provides dedicated power domain for for almost all periphery.

George Stark (4):
  dt-bindings: spi: amlogic,a1-spifc: make power-domains required
  dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
  dt-bindings: thermal: amlogic,thermal: add power-domains
  arm64: dts: meson: a1: bind power domain to temperature sensor

 .../bindings/i2c/amlogic,meson6-i2c.yaml           |  3 +++
 .../devicetree/bindings/spi/amlogic,a1-spifc.yaml  |  4 ++++
 .../bindings/thermal/amlogic,thermal.yaml          | 14 ++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  1 +
 4 files changed, 22 insertions(+)

--
2.25.1


