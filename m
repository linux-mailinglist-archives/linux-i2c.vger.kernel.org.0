Return-Path: <linux-i2c+bounces-3956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E28902663
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 18:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97D7FB27E35
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386ED142E91;
	Mon, 10 Jun 2024 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTE9o6DI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A871422CA;
	Mon, 10 Jun 2024 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718035946; cv=none; b=U2VVxNRvqxAo6sVv0RcV/YbZfLQpwuCdW+dMypvzaiLlmiyg6RSCxr/qaqFTm8WHEK6qmK3LkoxoLlaS2PF+fQOsobhYmnmQkakwGBu3FYW1LkfqtS0hAIqhe/GB8RU0sgR2Mf9qPZ3d+5Zjr1HSJTPcVZFPkVJR3+l/FfO9T5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718035946; c=relaxed/simple;
	bh=lblZXeRWjDuToTH9KitVv58LFxavQEZoqNO3ZJ8rGVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljbmsSm4viJga4KAr1p4Fw4ow0O3WxNkg0y6U0wRw5x20P06PmAJqYu+XVACz2/yZVCn2sTQYCW1lhvWKb9igt1jS3bWIr7VOIXBnFJeQkjFLsOQFXWJ7Fs3z+EolWFQJKxu08zb72jRbNZqy7aiJInCpr+axi0BzR9NhCLNIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTE9o6DI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-702555eb23bso3595127b3a.1;
        Mon, 10 Jun 2024 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718035944; x=1718640744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VHssdS2Z1GPjcz1ZFtMToFtKH98jmrExattb+RM/d9Q=;
        b=JTE9o6DI/xWCLP3RwEJxKotgqXrQDAUHt/ht95sP7ht/H9vEP39ulrlz/W/uYfeowT
         jgQvr3B/UNeHisjG1k7M6wR9isXL9nBUCfWx17H998XKjxvx6gUUvpFt2G2yA5x5iyzn
         6PyXpCMe1aFO8uX2yS3KPBM5S7iKaheotCkHwqZ2BLqJ+30sG29n80BRahPmUGz3bqAm
         gnk5kNB1200DXTaDx8C6wHcGINx/fWFkejaCMBSeDwb91nMcF2umAhcH+XrUXxz7P6Og
         6O1Lj8KM4dQ1gGm5nJp5BFJKTwxf+mGPye7yZ1RziE/N95T4H38K1DFhQj3Hw5uOONFi
         I1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718035944; x=1718640744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHssdS2Z1GPjcz1ZFtMToFtKH98jmrExattb+RM/d9Q=;
        b=p4IUZjBiMCoyv9YNBWV25wwXDUKKTCx0XB77AvgnvMqK1CS9CNoUCuBQHTkLLtbUhZ
         R6SkLKavzEgGvuEeP/W225NwxB/pi7cpsmBE+DEYuWPt+MxBaCl18d3xMeca0VJvRiTX
         b+3PMZSKCSO/P2WilbdI340NPUCdW8Cc9J3tM3dIwT5gRJO80j0fSI7yz5caJ1TY1aKK
         XIo/R6Jh49SyfSm1nIimqkbf5Pp94k3AQkGXoHjPzt6QKFO7kNWet5U6cR4X0E2iJRb6
         OYVxpk7UydQreUZSiGwa0PYtSqZ8FcjLGplxjuNtZ/Bb0oC/waH63JX2mbzuDtSAx5IN
         x9PA==
X-Forwarded-Encrypted: i=1; AJvYcCVi2iBGjTxiT2X/MrMRRqptomV+d15ZrH3vPTozykSKBnrbmyGLL3PIAaIllfWztzBNadUELq74oSluVrm7Kszecxm4hh6wCepYTzdPUxAf7woBQp5jUbTduoXnc1vTkKEEk2QaW4nitDmO8J30TqZhiSCcjT+sLbVCfELAbyvSygRUQA==
X-Gm-Message-State: AOJu0Yx4qakll/cLX0s1QjYFgJ154dcd6S4EdCuuzdW6QgPdCsymtqAM
	Wgd841vcUXFm7FbdrE/A3rqr+xikuSU4QyZtlQAWEFc/hSjT358p
X-Google-Smtp-Source: AGHT+IHicvBtefeiX22cWZLBB3YLefIT/ZQUF5A/TrE+/yto8E4BO/P+114n+uwZPg21/kfGDcJLJA==
X-Received: by 2002:a05:6a20:8412:b0:1b2:b16f:3b35 with SMTP id adf61e73a8af0-1b2f96d7e5dmr10169936637.10.1718035943620;
        Mon, 10 Jun 2024 09:12:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd510cc9sm7122105b3a.200.2024.06.10.09.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 09:12:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4514c496-a809-45e0-95ee-4e9cc8d237e5@roeck-us.net>
Date: Mon, 10 Jun 2024 09:12:21 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] hwmon: Add support for SPD5118 compliant chips
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>, Armin Wolf <W_Armin@gmx.de>,
 Stephen Horvath <s.horvath@outlook.com.au>,
 Paul Menzel <pmenzel@molgen.mpg.de>
References: <20240610144103.1970359-1-linux@roeck-us.net>
 <12f2b0e5-5130-4e07-be1f-38402f677f0c@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <12f2b0e5-5130-4e07-be1f-38402f677f0c@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/24 08:27, Thomas Weißschuh wrote:
> On 2024-06-10 07:40:57+0000, Guenter Roeck wrote:
>> Add support for SPD5118 (Jedec JESD300) compliant chips supporting
>> a temperature sensor and SPD NVRAM. Such devices are typically found on
>> DDR5 memory modules.
> 
> <snip>
> 
>> ----------------------------------------------------------------
>> Guenter Roeck (6):
>>        dt-bindings: trivial-devices: Add jedec,spd5118
>>        hwmon: Add support for SPD5118 compliant temperature sensors
>>        hwmon: (spd5118) Add suspend/resume support
>>        hwmon: (spd5118) Add support for reading SPD data
>>        i2c: smbus: Support DDR5 and LPDDR5 SPD EEPROMs
>>        hwmon: (spd5118) Add configuration option for auto-detection
>>
>>   .../devicetree/bindings/trivial-devices.yaml       |   2 +
>>   Documentation/hwmon/index.rst                      |   1 +
>>   Documentation/hwmon/spd5118.rst                    |  63 ++
>>   drivers/hwmon/Kconfig                              |  31 +
>>   drivers/hwmon/Makefile                             |   1 +
>>   drivers/hwmon/spd5118.c                            | 658 +++++++++++++++++++++
>>   drivers/i2c/i2c-smbus.c                            |   6 +-
>>   7 files changed, 761 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/hwmon/spd5118.rst
>>   create mode 100644 drivers/hwmon/spd5118.c
> 
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks!

Guenter


