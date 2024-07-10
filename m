Return-Path: <linux-i2c+bounces-4867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E293492DBEC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 00:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BDEA286D72
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 22:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AF014BF8F;
	Wed, 10 Jul 2024 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="QsCMnKEa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB53A83CD7;
	Wed, 10 Jul 2024 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720650749; cv=none; b=rDQ7YcWQOaO+e9b1EEjBDALu5LPGCxzCLzPbhDKlpzMObrEt5WPYIsm+/oAJ8OMdH7AN6/wd1r40LlQ1xJ6vmJIWBrdOW5eepaRt+FNlzmk0N5b8Cd+RhStGz1MGncVA3boBoMYciB4QbegJW3m+60eov6J+4kIFwtTyQJvPYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720650749; c=relaxed/simple;
	bh=zFh69USo+kU1qZ5P1JV35sDqvJ3F875vakShmx6VDhU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YnywbG31zmaIBvPphskXeXTxvj/R7CTFQYjo1wYsL9LMcR+RGJHvmnLt3XkEtckRuEVmARBvKqM9xOkBYKM0mkMZVufQNuT0+vjeYXb+58ma34bYoG/lcH8GplljxeO1LcRgU0FZ9EYKidr1Siqc7KDgtz2y014zEdsC7C/0kTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=QsCMnKEa; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0E38112000A;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0E38112000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720650742;
	bh=E8DoSITQiDGN2N6qCBfzM0o7rwHBN1Xbeo15NIHbPi4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=QsCMnKEagy+34hleDizogv35nVc74VaknBbAwL7Hv1z3wfhr4ZNfuTdv81QlLpMC1
	 tuwfsDwOMlMNUNqa40Wg1G1XSeLLv/LjdnMrSgBodQKxxqVblGS1u768LtExunw6tP
	 hykQi/6b3Q2EXWe7gDa3rVH+hq+S4Xz47BwU19psvUgR0MFawva6AKmFbTwIwoBKDZ
	 vshnoh2hXgtXtRjyON2/II+RayMCYgbc/6gdVFujxe2YVxKLeGgf7FgJOBA9EP7AMV
	 S3ekG9S+yaeNdEacAVqq7qBoC68wgDHwZiCPTs3/YNzbrtDNW7C3SMKx5l+mhPJhiK
	 DTly0hW6KOQhw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Jul 2024 01:32:21 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jul 2024 01:32:21 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<glaroque@baylibre.com>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<rui.zhang@intel.com>, <lukasz.luba@arm.com>, <b.galvani@gmail.com>,
	<mmkurbanov@sberdevices.ru>
CC: <linux-i2c@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v2 0/3] amlogic SoC's power-domains fixes
Date: Thu, 11 Jul 2024 01:32:11 +0300
Message-ID: <20240710223214.2348418-1-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Lua-Profiles: 186446 [Jul 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/10 21:30:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/10 21:30:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 21:42:00 #25942395
X-KSMG-AntiVirus-Status: Clean, skipped

Here's some fixes to the bindings and device tree related to Amlogic A1 SoC.
The SoC provides dedicated power domain for for almost all periphery.

Changes in v2:
  dt-bindings: spi: amlogic,a1-spifc: make power-domains required
    - drop the patch
  dt-bindings: thermal: amlogic,thermal: add optional power-domains
    - drop required conditional
    - rewrite commit message
  dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
    - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
    - add RvB: Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
  arm64: dts: meson: a1: bind power domain to temperature sensor
    - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
  previous version [1]

[1] https://lore.kernel.org/lkml/20240708194808.1819185-3-gnstark@salutedevices.com/T/#m398c283b369108c5c557e68b7a1ada9abf3e5cba

George Stark (3):
  dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
  dt-bindings: thermal: amlogic,thermal: add optional power-domains
  arm64: dts: meson: a1: bind power domain to temperature sensor

 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml  | 3 +++
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi                      | 1 +
 3 files changed, 7 insertions(+)

--
2.25.1


