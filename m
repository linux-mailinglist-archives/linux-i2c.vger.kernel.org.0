Return-Path: <linux-i2c+bounces-5307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DFA94EDFB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 15:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 691C1B22946
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 13:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F1617C210;
	Mon, 12 Aug 2024 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1HeSgrk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D817BB38;
	Mon, 12 Aug 2024 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723468880; cv=none; b=XwZkvSnFXC29i4XvsrH4PvUyn/nvrsIjkULWVhvxWY/Q6fepy5tUQ7WcCMke+reO2cAFgGImQnNRfeCI76a0KaseHVGuOn0B4nAlH9NpHvKnJbcuRXgRijRoZdWkLA2Lt5str+Wx3rjtmm3JW0Omzg4NoaBHPU3YRc7rjvRQNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723468880; c=relaxed/simple;
	bh=qeTCCR8EchJ36r9dzttNzJbzKMZxPzEe4KVSUDMaaEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnchZn/umFpx9NErZhcov1sikVJpmZWpYrEwU5gvEHB6eCDEpcvQFG8SxTtpyIPZOqkwy1Oue9VitV3/ZbBJ9waWzxTy6c0HqEsiFx/kepe7hOir6FIaI7PgyNOxqVCj+0IeOgHLFBuKECnHONJXVKHvpe7QplECLced2Iti/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1HeSgrk; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3dd16257b7bso306845b6e.1;
        Mon, 12 Aug 2024 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723468878; x=1724073678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tmhzkuw6qsmA7+63wGwSz8F//va2twzg7YBJsGrfeg=;
        b=Q1HeSgrkTXzfsWgzqw4KYmjB1uoPGnX1mecM/CCKh8xVCVRdFTpfbEr3ZclO64M+nv
         k11xUd4nuVEWx7LQfu37oTqtbHVAio3r9zhMpowdUBvhGWe0Mxzg9zzwGLFDkmd20rv4
         1oeW3AZTpwKbUI1+PJP2bJhdM0RZRYu8U9Mo3YQ/2JwNAR9cgNz/xF1aY01bWbXNwCi/
         Tok8dL+zHgUXgD6omuiM/EUP6dWPIm4P9DEsMLzOuwRmfsi0DA9GD7nQio32DoxZQ+3w
         v29SLaDZKREDX7/djL/h50TPKBkFiUE3CTk5AHvc9wBP87kr061yoqkisDFz4t1HzjKX
         WeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723468878; x=1724073678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Tmhzkuw6qsmA7+63wGwSz8F//va2twzg7YBJsGrfeg=;
        b=WD8lf1TGh2ZztfZlKT7iCohr9OzAiiira8Jb0lHds7vWhN4eSZxAoJT5MH0/qquSWU
         B0RgrPGEX7IFULCn+V0an8duITrPe47yEbaDg85zeEyVeKYQdGIQ/d36a+Ce21J6xFf8
         tj+6G1q/GEClddn8PvFQ63ebMrBwhL9CYvIdS3i9+VUWlUtBTE5sg7zcn/V5yIPWOSJm
         Xu2A8o2nEkJYekynsM8AUb74mWDne2K2FXDBLXgtInNHXCaT9H5uxF2xLvHb5DOlaY4x
         alGP6MXUa+nYcTCpeseebqx1PXz1WNigHcisObH0i8OWv2q+QS8pfqGklxal2n7xZWy8
         Y4aw==
X-Forwarded-Encrypted: i=1; AJvYcCUuQgJLVFqLtYKTUYuTLKeSzdKGucPOFeAKOom8ELWdFilqKV8AjtwwZpzdo2hab572pB2zNY2ztmzBFcNqGrToBn1MClr7Q2AB4LxYP05znyRzRmArpl760W0HSKIT6zdwKIZ7LblEfLGR9IsfjQLRIfpZKIQQlHHyWBE3fbU6kNJIIbCg/0FWfrJG+cea9xc+jHcZnKslpO8/tVW/od1X
X-Gm-Message-State: AOJu0YzxqwOaDED+ljRw45kHxFDfKpV/D/CPlX5b7b/VnPmMzO0vjpc4
	uV7qGgM3JfnUXkm8eKTl1hbkReBLNl0Zo/dRguI8MKO9BmuUB2jC
X-Google-Smtp-Source: AGHT+IFAiEJhBSmIMytQn74JGcURa9wm/PTkeCi62feFEMk+7DsJzoWvvr+8xT0TLzcOKMffZ5lD6A==
X-Received: by 2002:a05:6870:2195:b0:254:c512:88c6 with SMTP id 586e51a60fabf-26fcb8d0143mr56523fac.51.1723468877980;
        Mon, 12 Aug 2024 06:21:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe134a1sm3662525a12.31.2024.08.12.06.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 06:21:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <46493cf7-6885-4c30-965b-29c158599c58@roeck-us.net>
Date: Mon, 12 Aug 2024 06:21:14 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] hwmon: (amc6821) add support for tsd,mule
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-4-f9f6d7b60fb2@cherry.de>
 <5d5c44cd-6320-4fcd-9409-f3fc97bc5389@roeck-us.net>
 <40ff0c23-f037-454c-9d79-05dd72655052@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <40ff0c23-f037-454c-9d79-05dd72655052@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/24 04:38, Krzysztof Kozlowski wrote:
> On 31/07/2024 17:12, Guenter Roeck wrote:
>> On Thu, Jul 25, 2024 at 03:27:50PM +0200, Farouk Bouabid wrote:
>>> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
>>> among which is an amc6821 and other devices that are reachable through
>>> an I2C-mux.
>>>
>>> The devices on the mux can be selected by writing the appropriate device
>>> number to an I2C config register (amc6821: reg 0xff)
>>>
>>> Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
>>> when probing the amc6821.
>>>
>>> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Applied.
> 
> Eh, there is undocumented dependency on I2C here. Next has warning
> because of this.
> 
> Farouk, please *always mention* the dependencies between patches.
> 
> Best regards,
> Krzysztof
> 
> 
Sorry, I wasn't aware that all bindings have to be in the tree before I apply
patches, and I somehow had the apparently wrong impression that the bindings
were approved. I'll drop the two patches (this one and the DT patch for
amc6821). Someone may need to remind me to re-apply them after all
pre-dependencies are in the tree.

Guenter


