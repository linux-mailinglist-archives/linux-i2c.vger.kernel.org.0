Return-Path: <linux-i2c+bounces-4845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736392D637
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 18:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2F21F22148
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 16:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C34194AF3;
	Wed, 10 Jul 2024 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Le+UP53V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D43194A66;
	Wed, 10 Jul 2024 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628601; cv=none; b=tmCCZkpBHO//4TSwhCmcYqlJzF5Tw07ejoqF9MzVPbyWRsW5DXncQOEMU6wNBTpPVlt0AYf3puTMFDNUBqKejKC1795cFD1a+MnH2Nzzzk1RE5B1zQJzmaPxqqJb6fJ11Nr/yl4ZvWJMGqO17OS3H9jXfbGCKOQ49CY5B+6XpgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628601; c=relaxed/simple;
	bh=w/I0E48novxq0cdVbKYVodF78Zwxb7daSCKMaJ04mAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HOKlSXhp/L07GD/ipI6n1d4nTD2d2WYDsNc0XuGivGSRENin0DRPDxZ+dAupQcieicMp+Z8jsRfirg7o6/AP94M187WfTNhGYeFBszrb1rbcivLKVUgEeEAIE+9F2+lWIBF9jS3UQIyQ05lq9OeSuAkzH4gAk5Dq+fH/flRkcrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=Le+UP53V; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DEEE8120007;
	Wed, 10 Jul 2024 19:23:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DEEE8120007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720628585;
	bh=UxMw2H1wG2rrssfdT9EsTgjW0YQUtwZBVo4IjBGhuDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Le+UP53VKWyjsNKvjJgUKyOymUoG36MmvHSPk7PRogpzaDrQZ43vsoGUjivZamoCQ
	 t20QV3BJ719mrKod+eijBV7UyKY2IzEDIgvYNapM48kA7OhT3TT+nyY0h2ug2GZ4Pk
	 vVXEtk1pH+EqgoPWyUYo/6PvYl5ArD73LPFqTbN8YkWnCtkRQM1BkS1tzN1QQf1PJ/
	 VFDzj948BE4228CQUmv/uSH27ePYiouFerz1TRrA7qc/gCGslu3DyDZxkxVoaOKFlC
	 rAGqkSE/uExLF2C7Gf/R/bOZpYRUCe0wVeNHKX144o+EhwHqUTnHgJIcw2L7R7ccUk
	 zbMW5tqCqvgFA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 10 Jul 2024 19:23:05 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jul 2024 19:23:05 +0300
Message-ID: <3667b7d5-2cca-458b-bdaf-a69cac0309ce@salutedevices.com>
Date: Wed, 10 Jul 2024 19:23:04 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make
 power-domains required
To: Krzysztof Kozlowski <krzk@kernel.org>, <robh@kernel.org>,
	<neil.armstrong@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<krzk+dt@kernel.org>, <hkallweit1@gmail.com>, <glaroque@baylibre.com>,
	<khilman@baylibre.com>, <broonie@kernel.org>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<lukasz.luba@arm.com>, <b.galvani@gmail.com>, <mmkurbanov@sberdevices.ru>,
	<rui.zhang@intel.com>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, <conor+dt@kernel.org>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-2-gnstark@salutedevices.com>
 <6add148f-efe7-4444-82b3-20b1198c6d07@kernel.org>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <6add148f-efe7-4444-82b3-20b1198c6d07@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186445 [Jul 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 14:21:00 #25942305
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Krzysztof, Neil, Rob

Thanks for your reviews.

I'd just like to clarify things a little on that matter. On A1 most of
periphery has either dedicated power domain (ir, spifc, spi, cpu etc) or
several peripheries share single PD e.g. pwm, temp sensor, i2c, adc
share PD 12. Appropriate PD must be turned on before the periphery is
touched and be on while periphery is used. Experiments confirm it. So
power-domains property in dts nodes is really required. It makes kernel
to control PDs when bound periphery is used.

If I understand bindings thing correctly we should make power-domains
property required in bindings too in that case, at least for those
peripheries which has *a1* compatibles (some peripheries use compatible
from older SoCs without PDs).

What you think?

On 7/8/24 22:51, Krzysztof Kozlowski wrote:
> On 08/07/2024 21:48, George Stark wrote:
>> SPI Flash Controller has dedicated power domain so make the
>> corresponding property required.
> 
> That's an ABI break. Being part of power domain does not necessarily
> mean it must be required, so your commit msg lacks rationale. Especially
> on the ABI part.
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards
George

