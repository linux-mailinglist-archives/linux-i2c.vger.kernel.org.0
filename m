Return-Path: <linux-i2c+bounces-4869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0427792DBF4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 00:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4861286C4B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 22:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFFE15574D;
	Wed, 10 Jul 2024 22:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Rk3h/63J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209E14F9EB;
	Wed, 10 Jul 2024 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720650756; cv=none; b=R2zzFuacezoGq6N9pUGxM5jEjXPMz9aGGYxtrOPb++QuzJHF1IRGNkI2sicCVgK1VWe66+KjlsMy2vf8Ezf5UOjLywED0M6wkKZlu6dg4ZaqBuCrRtj2CDC+XGIfbSHkKe1aPaNkbHDO2rcXgj/Rw/uHIhvSFm+m6lZFo68m5DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720650756; c=relaxed/simple;
	bh=1TyNBh/3TdKVwXcfxotgwKE1mWxZRiJWxiKbkfBSuo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t6ZMhHDBuPE1jNjeEiGywyvXHN1OYsxtsXIRF/5WOOe/iZev/l6LrBejstOCYeNemLJhlGCzKDYgPqwLP/YaecCWClAB0PxdpFseKJr1lV5Z0zkSmJBBneCkEWemL4CaHkkURf0hCcI3kO43f0m0DlVto1tzwtTXWbfTO8SX304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=Rk3h/63J; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D91E110002F;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D91E110002F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720650742;
	bh=hfI/ofSEp+yYAlRKoLDJJ07qjeCsQBjJxdJc5MY1PJc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Rk3h/63JlkS9lq9+Ix0C2KPOAKT8iUx3ok3tdG1d06r0bER+7Jng3VRUuBwf+5vn8
	 R/xgm3Fr9F7lbzZFdgQ7t/T+mTngHHV90a9hm7af0z+8BMuUOuTrxJpT8qDTEZGDgV
	 PvVi69DcVitV2yPvdvJ2sk4Fhje47AL21Rp0jZL5/T7nt1WjmWgYsUuFhxkqpEt1XM
	 sB4u36oiQko56Oc5qPdjoXxoC48QSRk52PJro5mbccyYlhwHXkjeaCDH2A5NALrWRb
	 I3t3PQ5PhZXbOWohUvcYdmLVctwY0KvSY9lupbLoMvtkqraUEVaMO5G+2vVP55PhfN
	 7zGndYRTUfUXw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jul 2024 01:32:22 +0300
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
Subject: [PATCH v2 3/3] arm64: dts: meson: a1: bind power domain to temperature sensor
Date: Thu, 11 Jul 2024 01:32:14 +0300
Message-ID: <20240710223214.2348418-4-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710223214.2348418-1-gnstark@salutedevices.com>
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 21:42:00 #25942395
X-KSMG-AntiVirus-Status: Clean, skipped

Meson A1 temperature sensor has dedicated power domain so bind it
to the device node.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


