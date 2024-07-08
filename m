Return-Path: <linux-i2c+bounces-4769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741892AA18
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 21:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 681C21C21911
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 19:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C957614EC42;
	Mon,  8 Jul 2024 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="ZMHqgFrA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377A11DA5F;
	Mon,  8 Jul 2024 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720468102; cv=none; b=q9Ns0dR+A3sfZ69fvv76hRHGDcif/LeylONaMsTnOmyDKVjwi6AodCUlwJdGvl48IVedpW8cPUya6IrUil/7VCPa28QZTPe8S/zxCRJGIsJqvxGNhrCscPMwusA7TpO6d7TwTyzWQUS/Dc20ePnZ0cfoEP3AjC1bWasWby2CmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720468102; c=relaxed/simple;
	bh=vY7qWycpcpAoDIjy1i/UiTUFWRFwtNf0rhr1y51nNuQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aN0dpxQyXhrFF/Dssm526KuFf1QNdw6o9ptsN/qxIu2lXUD7Ybs5BlFmrEr6XeQ8X1C+TEj+bKOlMZS8zg8VTrN8hxNm5AG3VAoPNisjxUrAp6sebsDDSthcXShEUmhCf2YT0z3bqHTDGdChifb1eLNAriqsamv/UWuprljMYoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=ZMHqgFrA; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8D5F1120008;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8D5F1120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720468096;
	bh=eYYjDzOe3nYpG5HmNbnsVn4oH2wx26XOb/Mak2E95m8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ZMHqgFrA5GFPtPF/Td8d7r4FodzDXFsxN/3QvscNO7gMtyX8yPtUgx8oDUKiO5fie
	 fppAx22Hz+DvFpUpf/fOIk6L6tAYDWfwrfyX8bgAUbhJPtkJZqpCb0XJhD6/QszYd3
	 28VCriXjRC71aIAYru6PZLJX1xPOyxLDN6vsZU1NYSgJWH4joAbUiNWw7365WNmNm2
	 MOR/LUtBEacaD4cxaabeXUefySbHUxEnvJWbdduc1o9Y1/GLDCKxFBdIa3LkJnQDkM
	 tynldDGnemxss5+jx6Dbd75Lb0408J53ceG1a8FCahmMNcgA8JwOuC01g0MQbg05+f
	 HnSmnsPKGiTqg==
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
Subject: [PATCH 2/4] dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
Date: Mon, 8 Jul 2024 22:48:06 +0300
Message-ID: <20240708194808.1819185-3-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 23 0.3.23 8881c50ebb08f9085352475be251cf18bb0fcfdd, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 16:01:00 #25918429
X-KSMG-AntiVirus-Status: Clean, skipped

On newer SoCs, the I2C hardware can require a power domain to operate.
Since the same compatible is used for older and newer SoCs make
power-domains property optional.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index 26bed558c6b8..c4cc8af18280 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -30,6 +30,9 @@ properties:
   clocks:
     minItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.25.1


