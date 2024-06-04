Return-Path: <linux-i2c+bounces-3792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9188FB4D9
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 16:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AED1B2B9EB
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 14:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A775171B0;
	Tue,  4 Jun 2024 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3ufaGA8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C363C171C9;
	Tue,  4 Jun 2024 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717509875; cv=none; b=KHTifE++eO5EoZIcgX9xPBt9ZWX31N0RnheBeSBGavJdmPB/bxcUirmJIaHSNr1xqo+SmOxSpKK8kqSfAH/81n6djWuz1S9jOp7GuzudVv+aRpPuN5cChRpc9qfsONJCCS47tLOLya9PBwM1bhHcr78qmeJtKwYPiCLviJPaH6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717509875; c=relaxed/simple;
	bh=mjutaOzze5lY2AtBZk1oTyUKwN4OV5sBT87lBeM6CPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FO6PZ0CzMY6uxXKHaU4Vr6DtfitaiTTLwg0G5/+8abBg5nnuLvZC88m6rgNu5309WGB28+yfm7OFHuMoxWHyhjua1jwxdo9GN96a8TvAiM+8Me+vqeIi9rFY0sHoEtKGHz67pIF6cr0Gbf73EwD45XCS0k3/zfJhPMG+IjBnIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3ufaGA8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7025ca8bebcso2371555b3a.3;
        Tue, 04 Jun 2024 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717509873; x=1718114673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5hP4Tx5hcLnY6PpYu1L/Xq54TOaF5HgpwKeDUZsJ184=;
        b=J3ufaGA81dmu994m7U9KXRsCwuVTtgTukVDUilhVWaDYchumzMp01GcTX+7bw9vtcm
         sUz4/pGIlIHuzt7vcudCIkQj1F5YErMOii514fSROj+5l/nocdk1DbEyGbDzGncxFdWJ
         RzeY4H8MxHnRu0TjgvpjUR/AGwD62KyNMYcphtcWUEh7MM6CgShLVF47EMlxd8Hirz6M
         eWVioLm2ZL+8/qMaJsCZjVGKlFCVBrwTpPSCChY80mvnjpRWEDB89/eSTc/y1KRxlFT4
         zFCvE/9qchod2Q8YFPbrhSKnhc4KBM80eYdWpV9NZd730wqBv84jeSQXToXo1U2kErC8
         Ppiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717509873; x=1718114673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hP4Tx5hcLnY6PpYu1L/Xq54TOaF5HgpwKeDUZsJ184=;
        b=dut48QBHFxywA54It7SEHwxUchfTdslo4qoTLEMoSTpH2SakfrkJRU/W9vLIy1jMP0
         qGScRCMV8C2mH1XtHFJN3DEDyECLGDYX/QRmv4alNL9Piylob4IR/uc0sg4Ktt57q0qx
         bjdAQmGhqhEQPHNHUx2VQjnx3hPXyJa4NO0bpUQ/pxC//nWOnzbMmJGRk5RivZVL3oF2
         n+/UcQpwFLW0DGa4MikXoGvmpS3ccd4Ii4FyTCl7Rcoc7eWU+iOHHfdCzJ7w0ayr1jrs
         Xf/BcwZgo/EWzZRgtFfPMK3mdrpN7ObNpwmcpG5MbJYJEEEjDJGTesVAitqBr6HTnvXH
         e7FA==
X-Forwarded-Encrypted: i=1; AJvYcCXnmQ7SkuvGv/AnWxBTjn7iAnQoDHARdulZ9j2mV6IzDw0CfNLe/Ndcho8wXcca5unIxQLxydGpeyev7auNZgRyV5BFigStnkd9GBf7XkIh5lgCbq+VymLFswUI6FUdp+UficPwhhmQKFn7PEB37N2P7i0HavntB7iyjfRP930dMGDx8V7aD53AcxqDVDs6dbvKN2cXAaxFiivVkbHCSmbV
X-Gm-Message-State: AOJu0YwbiOgCzhZZk8Tmg01u+HsaksJa9a7IWL/qUFxvdlR3rp6H1zjt
	FCT7eY2fZ0CEEYNylp3H+LPRB3s5nUhvh+MA/nTVzclRrP3d8xxn
X-Google-Smtp-Source: AGHT+IF0TPCnvCBJHI2zL/cQyx/pf1J3TDH9M/0QjxwELKtR+Mcviv2NAL4XikH5WqNM+n9KhYYGDw==
X-Received: by 2002:a05:6a00:2e05:b0:6eb:3d37:ce7a with SMTP id d2e1a72fcca58-702478a43admr12469496b3a.21.1717509872882;
        Tue, 04 Jun 2024 07:04:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b055dcsm7322968b3a.172.2024.06.04.07.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:04:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d482d210-87f2-46a5-901d-b3c0b68e1d95@roeck-us.net>
Date: Tue, 4 Jun 2024 07:04:31 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] hwmon: (spd5118) Add configuration option for
 auto-detection
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Ren=C3=A9_Rebe?=
 <rene@exactcode.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Armin Wolf <W_Armin@gmx.de>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-7-linux@roeck-us.net>
 <v5amgsab6fwz5sp3faci2ly6hbhyqfikcde6guszbjhssfxq64@lqawvnnin3sl>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <v5amgsab6fwz5sp3faci2ly6hbhyqfikcde6guszbjhssfxq64@lqawvnnin3sl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/24 00:44, Wolfram Sang wrote:
>> +#ifdef CONFIG_SENSORS_SPD5118_DETECT
>>   	.detect		= spd5118_detect,
>> +#endif
>>   	.address_list	= normal_i2c,
>>   };
> 
> So, I think we have too many Kconfig symbols already. What about using
> !DMI here?
> 

That would be nice, but i2c_register_spd() is only called from i2c-i801.c
and, with the recent patch, from i2c-piix4.c. DMI is also supported on
arm, arm64, loongarch, and mips. i2c_register_spd() will not be called
on those systems or, more generally, if the adapter used to connect to
the DIMMs is not one of those two.

On top of that, it may be desirable to disable it for a system with DMI
support if that system boots from devicetree. I don't know if such a
system exists, but I would not want to bet that it doesn't.

Thanks,
Guenter


