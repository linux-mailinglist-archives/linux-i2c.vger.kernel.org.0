Return-Path: <linux-i2c+bounces-4081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8E90D6B1
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 17:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89EEF1F23121
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 15:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBD946453;
	Tue, 18 Jun 2024 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7PyaHIT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6B39AEC;
	Tue, 18 Jun 2024 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723431; cv=none; b=f7tTW2ByJStVklPbONzAtPmsdkcyPV99nSQTCm/MXbz+QQjV6t7wjyNFgRpuBYLGZOxBtLPeXEwukXO1duUGYbxSjPXgGP05JTjxuhHeJzKtY2vJ8RVBZ8snMfIzGVXPReFbIV25KUS1axg1LPDNzjHUB+usc+3Ad1hB5ZbGWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723431; c=relaxed/simple;
	bh=xN2mfAnka7AHk12FmpCy3OOhbQwpVNUdiE+wZmLKRbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsCNf8u9dpT1RImcaII5Ve7TC1avvAbskWZ4WB3/nBjVn+iFFhANlDxJdJ5pd0y1Q9Q1o0IVMpK/JM5bWe+9UQttVbe0YMbm03DC0zlHWdk22fR6Gp06H0g0qcaTOYLDyNk8dH/RG5lgdfR/+V3JWPoywyTlmXSUyfruoGvpDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7PyaHIT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f99fe4dc5aso4838145ad.0;
        Tue, 18 Jun 2024 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718723430; x=1719328230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=llk5mM/CDBgeWUrb9/FImMBVCQSPWj3msI7bOeQH2Cw=;
        b=G7PyaHITyzky5j/zsGPvn5PvIO2mgdsCl2/RNWlTKPv8blHEb+BLsyfn37ykITfuK1
         AM5i+4K1JOzvJXCFXd1q449uNGMf3gz6POrU5cNAILmhCjTiCyIv6DsDpOylWBNrKfTh
         O5DKsuFOjUZZTlr85XUSGnFp3dPwdETijK3KkaC0ifdqxpt5otNoNVOgxjpoau/w4fsC
         lzjjX+BlIlXftn80g0flRPZCVe+v/FnjnGyYJE4uMgmAQosEe1KE+zxMn2ZABOrbzryx
         h67wNmJdqBKs5hARWplHV7VDSHHRoOQPRjwWAod91x1ZJ7Dx9tAroFlwy81ZI+eVJIBW
         VfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718723430; x=1719328230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llk5mM/CDBgeWUrb9/FImMBVCQSPWj3msI7bOeQH2Cw=;
        b=jIPWR74+6B6+b5x9tAfg2+ejo4WwoSrN+KDwt3hSNUgqUCqA1q12T/vdFuIB76AqKy
         bPHmeUmgmoLGm1BJa8V0njcr3UTW2g3ILa1aBUYglasaJZ+c+NchYgo6x6xMEklx6S+v
         OJjibHvXO/opKptD520jyC1hPFCcAzyNVxwz7TMhXFNDnEtU1H9CAYrPUfk1+cTqSjPU
         KdfA3vTMqFFiIK+lIiMXYkx+xLJNE0aAYDZON3boQRQhfhEdN+P5wxuytkUviiR1dR8k
         6voUHR5Gsvptqtm21kGbv1ipATr8XyEAdr5G4/0YanUklCRWeZ+oKJDac8j0ceT7n5Yp
         yRlA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuTByluc2/eVb9ZuBWgzbgpURmvwp54kXCGcmuT7HgtmzyQb7Se0cawgjEJkSxZ0+b9kLzPdb6R0Xvtv3m4vhsumtgi4o+ZuxKC0mxaHkSQOZRIS6DZnL1dAD3Vpw+I/LuIQgX9O8u95Vq1MYQh0wTEKFPCzt6vU8+mwDGZ6k/NMoaA==
X-Gm-Message-State: AOJu0Yxm8m8yER7sbigQw6VI7Q5GEXRxGK40J1JFC/pjCMbez0oR8p3S
	/2T9guCwv+dlSYqupHG0lFE5I/Zv5RYsGr2jLi/54A9Aj+26/xJ5
X-Google-Smtp-Source: AGHT+IFz6s5oX3YKEyc4Fb2D5XO4b2N50oTkL7KFpITtcviobZGEeb53QbOSpCe2+dx1TS/hwVWRlg==
X-Received: by 2002:a17:902:f552:b0:1f7:3379:1c71 with SMTP id d9443c01a7336-1f8625d96acmr140855505ad.27.1718723429519;
        Tue, 18 Jun 2024 08:10:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9a24a3510sm7309415ad.65.2024.06.18.08.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 08:10:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dc73070a-d266-47ca-bb11-77c2d9d6dece@roeck-us.net>
Date: Tue, 18 Jun 2024 08:10:26 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fd8868ef-6179-45a7-8249-ee17994a8e78@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 6/18/24 07:59, Paul Menzel wrote:
[ ... ]

> I did
> 
>      $ tail -3 /etc/sensors3.conf
>      chip "spd5118-*"
>          set temp1_max 56000
>          set temp1_crit 84000
> 
> but it stays with the defaults:
> 
> ```
> $ sensors
> spd5118-i2c-0-53
> Adapter: SMBus I801 adapter at efa0
> temp1:        +20.8°C  (low  =  +0.0°C, high = +55.0°C)
>                         (crit low =  +0.0°C, crit = +85.0°C)
> 

You'd have to write directly into the attribute files.
For example, if you have

$ grep . /sys/class/hwmon/*/name
/sys/class/hwmon/hwmon0/name:nvme
/sys/class/hwmon/hwmon1/name:nct6687
/sys/class/hwmon/hwmon2/name:k10temp
/sys/class/hwmon/hwmon3/name:spd5118
/sys/class/hwmon/hwmon4/name:spd5118
/sys/class/hwmon/hwmon5/name:spd5118
/sys/class/hwmon/hwmon6/name:spd5118
/sys/class/hwmon/hwmon7/name:mt7921_phy0
/sys/class/hwmon/hwmon8/name:amdgpu

you could run

sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'

Thanks,
Guenter


