Return-Path: <linux-i2c+bounces-4100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE690DC1D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 21:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FE08B22AFF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 19:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE62F15ECEF;
	Tue, 18 Jun 2024 19:00:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B11BF50;
	Tue, 18 Jun 2024 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737238; cv=none; b=DqZ1jiNJIGpskrFgpiV8hFMgm2Ck9W6VQ61KDCGPbqlm+RSSuXH2YAWStoNFRN5Rsqab1y8MwbeO7ZndfVIGOIcExQtwFUXf79JXQisiJX9jIprVTqUHQS61b2JdmDAJxcFKYmcQM9FD+2RM6ldCFVse4OGeCX3IigbbHW66gU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737238; c=relaxed/simple;
	bh=IwZ1eDfPuNfNDnk7397cPUG780kB1kbLU2g4cnIjPYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auhao0prb2/KIJfUzlMfzw8aCLlFY8QnMkRyae7EQ4mmevHf4GW1FL0bfPqx7F21aEfHQdjB+KcRJW4BVh04zSV5gSEBUs2Rjl0KtoV3m0BDYDNG/eNQwIe1taQkchuZWpjhZ3tp2eSkyybJC1vPaNYVmlf3fpLWmaGJmLHqX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af4b2.dynamic.kabel-deutschland.de [95.90.244.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2AE2961E5FE01;
	Tue, 18 Jun 2024 20:59:46 +0200 (CEST)
Message-ID: <0f18ac68-97b5-4834-987c-6d86ebb49e94@molgen.mpg.de>
Date: Tue, 18 Jun 2024 20:59:45 +0200
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
 <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
 <efb77b37-30e5-48a8-b4af-eb9995a2882b@roeck-us.net>
 <33f369c1-1098-458e-9398-30037bd8c5aa@molgen.mpg.de>
 <4e09b843-3d2d-46d7-a8e1-2eabc4382dc7@roeck-us.net>
 <f20ea816-5165-401e-948f-6e77682a2d1b@molgen.mpg.de>
 <975af7e5-b1b0-400e-a1c3-6d9140421f25@roeck-us.net>
 <8719fc64-2b51-4b79-ba52-0a3b9216f2db@molgen.mpg.de>
 <f76a4d07-887b-4efb-b20e-52979db31216@roeck-us.net>
 <fd8868ef-6179-45a7-8249-ee17994a8e78@molgen.mpg.de>
 <dc73070a-d266-47ca-bb11-77c2d9d6dece@roeck-us.net>
 <5b9379f4-5ccd-402c-8502-8895acc0cdb8@molgen.mpg.de>
 <b2fe83e6-8ebc-42f7-ba14-fbc1806a90f9@roeck-us.net>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <b2fe83e6-8ebc-42f7-ba14-fbc1806a90f9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Guenter,


Am 18.06.24 um 20:16 schrieb Guenter Roeck:
> On 6/18/24 08:25, Paul Menzel wrote:

>> Am 18.06.24 um 17:10 schrieb Guenter Roeck:
>>> On 6/18/24 07:59, Paul Menzel wrote:
>>> [ ... ]
>>>
>>>> I did
>>>>
>>>>      $ tail -3 /etc/sensors3.conf
>>>>      chip "spd5118-*"
>>>>          set temp1_max 56000
>>>>          set temp1_crit 84000
>>>>
>>>> but it stays with the defaults:
>>>>
>>>> ```
>>>> $ sensors
>>>> spd5118-i2c-0-53
>>>> Adapter: SMBus I801 adapter at efa0
>>>> temp1:        +20.8°C  (low  =  +0.0°C, high = +55.0°C)
>>>>                         (crit low =  +0.0°C, crit = +85.0°C)
>>>>
>>>
>>> You'd have to write directly into the attribute files.
>>> For example, if you have
>>>
>>> $ grep . /sys/class/hwmon/*/name
>>> /sys/class/hwmon/hwmon0/name:nvme
>>> /sys/class/hwmon/hwmon1/name:nct6687
>>> /sys/class/hwmon/hwmon2/name:k10temp
>>> /sys/class/hwmon/hwmon3/name:spd5118
>>> /sys/class/hwmon/hwmon4/name:spd5118
>>> /sys/class/hwmon/hwmon5/name:spd5118
>>> /sys/class/hwmon/hwmon6/name:spd5118
>>> /sys/class/hwmon/hwmon7/name:mt7921_phy0
>>> /sys/class/hwmon/hwmon8/name:amdgpu
>>>
>>> you could run
>>>
>>> sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
>>
>>      $ sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
>>      bash: line 1: echo: write error: No such device or address
>>
> 
> Please add
> 
>      .use_single_write = true,
> 
> to the regmap configuration (spd5118_regmap_config) to see if it helps.

Unfortunately, it does not:

     $ git log --no-decorate -p -1
     commit c27ae51b689d7bdb7baf10c434438d501bd384aa
     Author: Paul Menzel <pmenzel@molgen.mpg.de>
     Date:   Tue Jun 18 20:26:17 2024 +0200

         hwmon: spd5118: Use .use_single_write = true,

     diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
     index ac94a67793605..33a628840597e 100644
     --- a/drivers/hwmon/spd5118.c
     +++ b/drivers/hwmon/spd5118.c
     @@ -522,6 +522,7 @@ static const struct regmap_config 
spd5118_regmap_config = {
             .writeable_reg = spd5118_writeable_reg,
             .volatile_reg = spd5118_volatile_reg,
             .cache_type = REGCACHE_MAPLE,
     +       .use_single_write = true,
      };

      static int spd5118_probe(struct i2c_client *client)

     $ uname -r
     6.10.0-rc4.mx64.461-00048-gc27ae51b689d
     $ sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
     bash: line 1: echo: write error: No such device or address


Kind regards,

Paul

