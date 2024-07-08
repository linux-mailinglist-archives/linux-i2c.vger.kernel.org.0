Return-Path: <linux-i2c+bounces-4770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AC92AA1F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 21:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1E39B21E3F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 19:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0B014F100;
	Mon,  8 Jul 2024 19:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="CQjlXO7n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC714A60C;
	Mon,  8 Jul 2024 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720468103; cv=none; b=cvsNDo+eKiLIW6lyw939PWImnuoasAx0qNhZeyLnt/mTbPmFp9+hLYVrPrPpVTZ29RfEFDmLf+S7PHCr6SwtC04jkHHKikyg0Nvg4Wqhxc3sHmu3KJASiw0/lu2/H+a385erwbSm8k4xTqUM+Bn6SOcy8vGsrDtTXB+BS0yuIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720468103; c=relaxed/simple;
	bh=0YvSrffggSKkTKLLmzLGfbPXG6CTOahbO/4DN9Qum1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqx46qYZTyL4SarMgFh48NGqFDyHgNGYTT/1iOVhYOtgkz4bPYnGV9I6wA+mkhp+M/Wy+0WUGZzd90FV/4/XHrgeIIwOjZbGweaN9Qv6YE5EToUzFN4KqFkbh5UROCBDn0z7skanTtae+cpy+74GLux9Aja4aUqRN0j6RWdLEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=CQjlXO7n; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 573F3100008;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 573F3100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720468096;
	bh=4pw3BIb7UkYmI26H52edi0SuBLQRphrtybtYpFnSD/I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=CQjlXO7nvTTKO2ZWZdTc0wDSsPXzv8AAv4RgHv5hfoEyWr2gQVvwsgLjpIMcnd/zO
	 NhrEUrZ1IBqTPA333iIjp1UCt1UBhzicESCV0x821YeWnlhx6b6wdZJ+3aw3CK129c
	 9B0xZCjP1pK7pEMqnHEwNH2/yJjaTeBGqLAHXS6BSCDJAPuOSw50TYdIClfUklaTVU
	 cNoN02KvrnlLxvsmAIVqxnhtoPGksKnkQGMdlpfq+jmuayoVqAjsECSVONgoUCkyqB
	 u8sLFOrZRNzG6JikG4M0sgIpJxpeWC14gshOhIuTRT/Kn/zd325Loik7geSZorh+6B
	 gYT5ou/cx280g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
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
Subject: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make power-domains required
Date: Mon, 8 Jul 2024 22:48:05 +0300
Message-ID: <20240708194808.1819185-2-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240708194808.1819185-1-gnstark@salutedevices.com>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 23 0.3.23 8881c50ebb08f9085352475be251cf18bb0fcfdd, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 19:07:00 #25919740
X-KSMG-AntiVirus-Status: Clean, skipped

SPI Flash Controller has dedicated power domain so make the
corresponding property required.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
index 043879b434ac..e704aff8a862 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
@@ -30,15 +30,19 @@ required:
   - compatible
   - reg
   - clocks
+  - power-domains
 
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/power/meson-a1-power.h>
+
     spi@fd000400 {
         compatible = "amlogic,a1-spifc";
         reg = <0xfd000400 0x290>;
         clocks = <&clkc_clkid_spifc>;
         #address-cells = <1>;
         #size-cells = <0>;
+        power-domains = <&pwrc PWRC_SPIFC_ID>;
     };
-- 
2.25.1


