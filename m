Return-Path: <linux-i2c+bounces-4771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFDE92AA24
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 21:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2A65B20DAA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 19:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC16A14F9D5;
	Mon,  8 Jul 2024 19:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="k/ZYvHij"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78E14B09E;
	Mon,  8 Jul 2024 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720468103; cv=none; b=X7dg8aHGEr+rGPyyOg1XmYkJJsALKzCqUHesxx8PX3Wnptm0Lo3mmj30NksEGyYhmj3DWTWBFMv1N70G8I42FSj4YC+8/r5ieiT3YN+thz+DXcp+bDKkx9oa1r1obkFGOrQCceKuEMIZqj8pciy3VAJcwq/wD03Cxrv6gboAk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720468103; c=relaxed/simple;
	bh=YHoCWP0idcg6l6M4oUDp8f+1XG7eHy48jeJFhTAAj8k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHlGYv5l2Y3WZlyKv65uVPthUit5hAYZLJIPTmL98gB1SYq984kd9kc/WpJoFN7s5t3PsYZynaWzAcExdR04So435HAiu++KTsBO/TGsWrm1jDZbYClH9c2pI7YJIpo8U5TZ7V61zGh55EIWsGFg/awGPUqcW5MVjaLAWv/pnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=k/ZYvHij; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 15264120009;
	Mon,  8 Jul 2024 22:48:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 15264120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720468097;
	bh=IoalWO5CwiNil7FYL/DMHEzj0S1zxI7MgZa/AXwCx+c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=k/ZYvHijSyaxjVd6FjyDk2b9Q+nrSpnhEQfYB2s9SVf5L6/Ksy319BkAuL9yEIcbE
	 cla0ec1AiC7uch8Tzv4gM5TlUbxJrD6eufVhFtQPwglv5Y2KoyN3WfLCVA+HuXl1up
	 +9clovB1wnQ+d6W0PzAEE6V3XsGP4sSYwqioEFDCSVh7c6bxt3vBfCQ0mFD60WlBF5
	 /PpBbfvcceyvitt/5f+62j9OFxU7sHnqqPBUTI032xIbgAVocgC7heF+LouzYt50gH
	 V+DYF85kYs+Y4GPZIpaMAbvIZ/4v92v+BNJxgwZ5NpbHUsf1vEo3JFxb3qQPzavC4/
	 ZnfRL0/uqUQ6A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 22:48:16 +0300
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
Subject: [PATCH 4/4] arm64: dts: meson: a1: bind power domain to temperature sensor
Date: Mon, 8 Jul 2024 22:48:08 +0300
Message-ID: <20240708194808.1819185-5-gnstark@salutedevices.com>
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

Meson A1 temperature sensor has dedicated power domain so bind it
to the device node.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index dd5695963caa..86d77f51c25c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -919,6 +919,7 @@ cpu_temp: temperature-sensor@4c00 {
 				assigned-clock-rates = <500000>;
 				#thermal-sensor-cells = <0>;
 				amlogic,ao-secure = <&sec_AO>;
+				power-domains = <&pwrc PWRC_I2C_ID>;
 			};
 
 			hwrng: rng@5118 {
-- 
2.25.1


