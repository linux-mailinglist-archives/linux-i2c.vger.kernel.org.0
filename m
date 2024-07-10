Return-Path: <linux-i2c+bounces-4866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4CE92DBE8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 00:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D7F2B216E8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 22:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1671494CE;
	Wed, 10 Jul 2024 22:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="UyHX3DyA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4ED848E;
	Wed, 10 Jul 2024 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720650748; cv=none; b=dAy8r59uyPrF/WWtNuRMleoTqmjRsTJVP/u7LvNFG3IRrXNsAS3YQ/tGo+lF8KdAgYzNPCt25py+RMJsyFq9mW4Phyn8p1t+QS0ZUuNjnpNNbPcP+6G47TxYoZ9j3tQxXEXPkQUyNQ0oMCkC+AdriROygQrUs9G/Vr7gi2QZeqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720650748; c=relaxed/simple;
	bh=cZUl+GtvEWTuWqjppQU7RkrzP/oZOCjWu25mrDrFpvg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNXs3lJ4yx8UZ4RIb0kOhXot5mEN2IirZwuwEJeVeCAxRDfQ26tJlLKJuhp+B8OMlL7WTexOn+1cBuRF+cmbjfHWOni1LNPF7g0t5MN1zgUcbB3Zz78zGGzIjPFeRBfXxztJxvtXmkSJAVheQXUjGCrl0e2k+8cDlNTpnpYzrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=UyHX3DyA; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 918F912000C;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 918F912000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720650742;
	bh=EZPnynPyf1zfhY1MLF9NL+wcInfJ/C1ansM7QDzzuyI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UyHX3DyAswn2Mqcywl07RPt684WapKbCtU9oTs7mGkRKMcDBmAbsz/J3JrYsIb57x
	 eu9OSJAZhdQBnL2IyVGSP31Jt3AbAj3hoU/jsbnGSeTjb+rqnZGxPo/yvUatr0Mj0n
	 RLR+Cx+2sJ1sqjsZ6D5ftvug4yJvkD6mt/+3V6O4Aq+oPfaa139cnXQ/DfvqgpGT77
	 wG+k5SAJpBdfXA1RIcrNR/42TTyr+W0s8Hs+mrrxPQzdcT0knChxrirmLRsZhM3Vru
	 auu9a/fN1QTBaJKi5FeaEnF9shHguViu5rGwiO/znZzv2x3TZkFkK9ZdqTfGlozbJC
	 5tC9QoIOLN5og==
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
Subject: [PATCH v2 2/3] dt-bindings: thermal: amlogic,thermal: add optional power-domains
Date: Thu, 11 Jul 2024 01:32:13 +0300
Message-ID: <20240710223214.2348418-3-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 21:42:00 #25942395
X-KSMG-AntiVirus-Status: Clean, skipped

On newer SoCs, the thermal hardware can require a power domain to
operate so add corresponding optional property.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..462bd7237bb7 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -30,6 +30,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   amlogic,ao-secure:
     description: phandle to the ao-secure syscon
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.25.1


