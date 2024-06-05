Return-Path: <linux-i2c+bounces-3809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332938FCE60
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 15:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4581D1C2515C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21251BC07A;
	Wed,  5 Jun 2024 12:22:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C619A2AC;
	Wed,  5 Jun 2024 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590165; cv=none; b=BNCLUxjGR/A3prG7S0KDCqG0vpg8k11KhsW77YrzjUjtS+4BvZGb/JAYBNOmHus2+nPuq5Rwk2TrC6hjlHrM8yUHLUmPzKPnAwEX/j1tbc4wbAE12LbKt0KsFh8bTSyZ2yAYyzVVTbbDJJSu5yoC33KchvQPRQrw7HVWUpA4eXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590165; c=relaxed/simple;
	bh=hRjmhe9Ngf0wmEAJSQe3o0q7qinQYcgJZNR83dg0CPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVT3m58Bf/FK0HAQQZYSVSAJ/XfogoyvfMpW7E2HDjcpyLlIh/MwmShKivm01yhcDT//Q4yAm/T4Ems1+dhnnIBpny6dMwnPBDbbX1iLcE8amSk3M62Sb60T+31T0X4iu8VrSdmh8xgS7dUvBDZHSLSPs0i3MoUnhvpT1IY0KYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 91EE561E5FE05;
	Wed,  5 Jun 2024 14:21:51 +0200 (CEST)
Message-ID: <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
Date: Wed, 5 Jun 2024 14:21:50 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240604040237.1064024-6-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Guenter,


Thank you so much for taking this on.

Am 04.06.24 um 06:02 schrieb Guenter Roeck:
> Detect DDR5 memory and instantiate the SPD5118 driver automatically.
> 
> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v5: New patch
> 
>   drivers/i2c/i2c-smbus.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 97f338b123b1..8a0dab835761 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -382,6 +382,10 @@ void i2c_register_spd(struct i2c_adapter *adap)
>   	case 0x1E:	/* LPDDR4 */
>   		name = "ee1004";
>   		break;
> +	case 0x22:	/* DDR5 */
> +	case 0x23:	/* LPDDR5 */
> +		name = "spd5118";
> +		break;
>   	default:
>   		dev_info(&adap->dev,
>   			 "Memory type 0x%02x not supported yet, not instantiating SPD\n",

Testing this on top of 6.10-rc2+ on a Supermicro X13SAE, Linux logs:

     $ dmesg | grep -e "DMI:" -e "Linux version" -e i2c-0
     [    0.000000] Linux version 
6.10.0-rc2.mx64.461-00036-g151dfab265df 
(pmenzel@foreveralone.molgen.mpg.de) (gcc (GCC) 12.3.0, GNU ld (GNU 
Binutils) 2.41) #74 SMP PREEMPT_DYNAMIC Wed Jun  5 08:24:59 CEST 2024
     [    0.000000] DMI: Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022
     [    0.000000] DMI: Memory slots populated: 4/4
     [    5.434488] i2c i2c-0: Successfully instantiated SPD at 0x50
     [    5.443848] i2c i2c-0: Successfully instantiated SPD at 0x51
     [    5.450033] i2c i2c-0: Successfully instantiated SPD at 0x52
     [    5.459378] i2c i2c-0: Successfully instantiated SPD at 0x53

Then with `sudo modprobe at24` and `sudo modprobe ee1004`, 
`decode-dimms` shows:

     $ sudo ./eeprom/decode-dimms
     # decode-dimms version 4.3

     Memory Serial Presence Detect Decoder
     By Philip Edelbrock, Christian Zuckschwerdt, Burkart Lingner,
     Jean Delvare, Trent Piepho and others


     Number of SDRAM DIMMs detected and decoded: 0

This might be expected, and `decode-dimms` also needs to be updated.


Kind regards and thank you again for these patches,

Paul

