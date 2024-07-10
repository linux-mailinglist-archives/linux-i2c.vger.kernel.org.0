Return-Path: <linux-i2c+bounces-4868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4560892DBF0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 00:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DF91F26416
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 22:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B1C1527A7;
	Wed, 10 Jul 2024 22:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="JgDAXpSB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BB14C5A1;
	Wed, 10 Jul 2024 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720650752; cv=none; b=A65lUScfLemabl9koGPZ2eLp1SVIc7Oz7WfoDkI9uIDY5WgyIfPD+ScYBBe/vIwZdsrCBfq7/0Ru7p8Iz9jbvG3tW//5zQplAsOWP+TGeibYTQF8Akftm00othuH4dycO3Nq6RRo28xDcbQe86yEa2JXmfzlH94GMKolSBLlwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720650752; c=relaxed/simple;
	bh=3ogu7u5vZuj5p1AAc4tepTW7NlFeh95r6IAcIoRhSg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVm9xjEoaZlggHOe9uNxy0yS6wxgm8hwktICd/IRPqKbYckApvj3Nahy4v93haX1Ie285me/sTvjzpaty8sUT2JRaPJFlldCpNUe3oCthNonjDs9GOgQt2zxfYStd8ghzY1Fk1kZFBu4Johrk+DuLZFVUlPlz4Z17BfknmYHh8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=JgDAXpSB; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4D4F9100029;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4D4F9100029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720650742;
	bh=ln9wX7yvXW/OQnGFsQF3yqKcqupzlBpLXXCYFm54FjM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=JgDAXpSBIujl/6Aw050WAts4mHV0Gf+2ui43qNShClvUadvRY2SjY6D1pcV8+49mB
	 OZy1ee2CGkjOXY3ziGWdfJJFA7DJ7qDHfHFOJg40sVBFP66+m+leS1EuTvKj0cO9nO
	 DlB6OssLi7fI9Mae5+XON5aveVHs7yLIUs6ds5Fq29zrWOXkJojGzmTWBe7misIGbp
	 y8/62+cO3oCSK7kPl5KQL0Wu9nj+gAgJGiwyGsxciLSExaq1UP92icmKVWCijMVoVd
	 mERGvZfKEc4Jzo8WN+9XKzT1r9VUvrh+hMMxbSDSU6793sUJE9523skkVqpHX821mm
	 1B5QDcBaib8Ng==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
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
Subject: [PATCH v2 1/3] dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
Date: Thu, 11 Jul 2024 01:32:12 +0300
Message-ID: <20240710223214.2348418-2-gnstark@salutedevices.com>
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

On newer SoCs, the I2C hardware can require a power domain to operate.
Since the same compatible is used for older and newer SoCs make
power-domains property optional.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


