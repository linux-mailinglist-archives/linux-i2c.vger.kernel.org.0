Return-Path: <linux-i2c+bounces-4083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2890D72C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 17:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A7F1C22CAB
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 15:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391791E895;
	Tue, 18 Jun 2024 15:25:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380323759;
	Tue, 18 Jun 2024 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724358; cv=none; b=gn2Jh9BOjgalI3RpOEH9L5Fk+NAXeOVvH9sX8eH19Gn3y8keno2YXMCphaOU+lBKiLWmYgHRFhtTyuuOYGFR9kUg7P4JJjq+HXjqYBLjSbuZMmxVcVlOfhJas+l4iIxVQjpXCoTAt5o9dD7TlzphY0rXAOKfGyaTrI9zAyyc5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724358; c=relaxed/simple;
	bh=/jGyBaftRhGd7bK/ZcKOcC+QqJpdWcC7EYoVm/cOc60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9IkhJ2tSd97PJ6vpvW02u0KfDt2avZuWraX+/MRbwvJHE4dYPJV8zSpth8C/WIO8mkuAr4ChyQ08eN0Rhy4BIP2D4NaD5x8Ov0fUuW+3U5HAKxFqlmkQ1HzJsusu8qORlFVDKW4SrhRj1t4u32ApCVNh1erXUTea9WXfCLH8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id D32C161E5FE05;
	Tue, 18 Jun 2024 17:25:13 +0200 (CEST)
Message-ID: <5b9379f4-5ccd-402c-8502-8895acc0cdb8@molgen.mpg.de>
Date: Tue, 18 Jun 2024 17:25:13 +0200
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
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <dc73070a-d266-47ca-bb11-77c2d9d6dece@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Guenter,


Am 18.06.24 um 17:10 schrieb Guenter Roeck:
> On 6/18/24 07:59, Paul Menzel wrote:
> [ ... ]
> 
>> I did
>>
>>      $ tail -3 /etc/sensors3.conf
>>      chip "spd5118-*"
>>          set temp1_max 56000
>>          set temp1_crit 84000
>>
>> but it stays with the defaults:
>>
>> ```
>> $ sensors
>> spd5118-i2c-0-53
>> Adapter: SMBus I801 adapter at efa0
>> temp1:        +20.8°C  (low  =  +0.0°C, high = +55.0°C)
>>                         (crit low =  +0.0°C, crit = +85.0°C)
>>
> 
> You'd have to write directly into the attribute files.
> For example, if you have
> 
> $ grep . /sys/class/hwmon/*/name
> /sys/class/hwmon/hwmon0/name:nvme
> /sys/class/hwmon/hwmon1/name:nct6687
> /sys/class/hwmon/hwmon2/name:k10temp
> /sys/class/hwmon/hwmon3/name:spd5118
> /sys/class/hwmon/hwmon4/name:spd5118
> /sys/class/hwmon/hwmon5/name:spd5118
> /sys/class/hwmon/hwmon6/name:spd5118
> /sys/class/hwmon/hwmon7/name:mt7921_phy0
> /sys/class/hwmon/hwmon8/name:amdgpu
> 
> you could run
> 
> sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'

     $ sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
     bash: line 1: echo: write error: No such device or address


Kind regards,

Paul

