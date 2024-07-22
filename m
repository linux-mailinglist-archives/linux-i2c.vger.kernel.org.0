Return-Path: <linux-i2c+bounces-5051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FA9392A6
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 18:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84D82282625
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 16:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F395E16EBE8;
	Mon, 22 Jul 2024 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="S6Av95GY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018316E89B;
	Mon, 22 Jul 2024 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721666379; cv=none; b=slhFB7W3kCDbrek8G8A3rIXeJCNTJM+KWR8weQUa9gI5xKOvBCQPyvv00lZrQpEGmQ07QxIyPRU1NboebILfh6k8yy/1HWOOk4oScrodZwKcobvBFJIfzTUC37r0K2xM+EfIBXUkkOOfys565ZcMfhu5JEOFqLXCVcT79yo2r1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721666379; c=relaxed/simple;
	bh=TL1jutkvv3YvQIjehoa241BkB0CICQzeJpkPUCpNBAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C5AkUV6vuLpk5ogKBHCanJMiyaOFC17p2n1imkdSidy+coy9LISgTPGn1AnaiIXP46qjlA408/ofCVR/cAHxxii4176Hq/sL2OspzTwLkhOUbdHpEfup6suSOOttckoP/J76hKDVtxv9PJeD61cX+j3GRbnv4rxzDM0bIvpk9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=S6Av95GY; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8A00E10000F;
	Mon, 22 Jul 2024 19:39:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8A00E10000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721666364;
	bh=G2Z3S8wIHcZug9iXb9QT6hPkXn+2qflVBxbNjjuuZaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=S6Av95GYVVv1S0DXP5uPsra8kLVYxNrahmHeu35SgM2s6ivKZQfiLPTmojbNYczu0
	 nge13K8kLu8L02xVnvuVCJmgl1mYCqZ2KbE+r057sNVv5DuLgQm53UBi9O2Blntat9
	 RAfwxoV5/HD0ZQSKliweF5fXh1t+L1GHOJS8YoxT+OLt5VLMR4KAm0VU5gQorysLX5
	 ztiu9z2VOKi9mQGyfz5u83ch9VZ6infPxKXz/kfSWbE9RP5aZvQwipOpf7Mne0x5Vc
	 E/IbS6IEyIYmDZ6Fg8f3TKdlS+vtIaIiW0iDnkZ+i/GvWs8pKXX8SiyqqolZZXXprm
	 Nn4xnkUUkpP+w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 22 Jul 2024 19:39:24 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 22 Jul 2024 19:39:23 +0300
Message-ID: <b78abab9-ad62-480a-8260-6a8aa76fe9dd@salutedevices.com>
Date: Mon, 22 Jul 2024 19:39:23 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] amlogic SoC's power-domains fixes
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>
CC: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <glaroque@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>,
	<mmkurbanov@sberdevices.ru>, <b.galvani@gmail.com>, <rui.zhang@intel.com>,
	<daniel.lezcano@linaro.org>, <rafael@kernel.org>, <lukasz.luba@arm.com>
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240710223214.2348418-1-gnstark@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186657 [Jul 22 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/22 13:53:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/22 15:57:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/22 07:11:00 #26122445
X-KSMG-AntiVirus-Status: Clean, skipped

Hello

 From this series i2c patch was applied.
Are the thermal sensor's dts and bindings patches ok? Should I do 
anything on it?


On 7/11/24 01:32, George Stark wrote:
> Here's some fixes to the bindings and device tree related to Amlogic A1 SoC.
> The SoC provides dedicated power domain for for almost all periphery.
> 
> Changes in v2:
>    dt-bindings: spi: amlogic,a1-spifc: make power-domains required
>      - drop the patch
>    dt-bindings: thermal: amlogic,thermal: add optional power-domains
>      - drop required conditional
>      - rewrite commit message
>    dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
>      - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
>      - add RvB: Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>    arm64: dts: meson: a1: bind power domain to temperature sensor
>      - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
>    previous version [1]
> 
> [1] https://lore.kernel.org/lkml/20240708194808.1819185-3-gnstark@salutedevices.com/T/#m398c283b369108c5c557e68b7a1ada9abf3e5cba
> 
> George Stark (3):
>    dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
>    dt-bindings: thermal: amlogic,thermal: add optional power-domains
>    arm64: dts: meson: a1: bind power domain to temperature sensor
> 
>   Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml  | 3 +++
>   Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi                      | 1 +
>   3 files changed, 7 insertions(+)
> 
> --
> 2.25.1
> 

-- 
Best regards
George

