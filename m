Return-Path: <linux-i2c+bounces-12269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF89B24C6C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 16:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1728F3AF1C8
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 14:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930642EBDC6;
	Wed, 13 Aug 2025 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqDwJj0j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F767081C;
	Wed, 13 Aug 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096634; cv=none; b=jc0xJgj6RuL1/ch1tte6Z8wKQJiKQRYsGsTxfJghwRf9zuPUZSpkioMFcaf8VHAQF7UYUb5GvoPgsBQRUFQ1TPxErdWaAARUFjlCW8B0hrDJQf5Ctes1JBjpvlMe88dchHZih7p8Lp9kmyuBOyzaWgBnVgYyzYOhdkrRYgefvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096634; c=relaxed/simple;
	bh=Dy54GSulf0DSb1ED+cBI/WJDS1f23xzrkgDWmnFu4Rk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WrVP9LHQpiAzetRgadL1JQv3X//0l457ThPK0oZaV+3QKH54RHEVtRa/y62h9cV5TouZl4uk0Eb5F39cH0VmshPxme07fZnF5EnYae3qdZfTqhPom1ExkUnXKeKyEpYIfaeD75PiAYqSVd/6YAP7esfGON16/gcPHwFf0sVs8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqDwJj0j; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso44652945e9.3;
        Wed, 13 Aug 2025 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755096631; x=1755701431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ezPPApvQ2xGo1Tf2IGGI/q/jNbwVwsEJODPGA7ESnU=;
        b=mqDwJj0jbc1Q4MVcIeiINPYsPxQwJPai52HGGtZCjwiYlWaX7USZ1YeuwkDjDcedm7
         TMJSnYP85fumJFCOAMMUL2ZdbJ3MJ07VOxV+V3bGKI54pvLef+jHW1T1m9wUEs/XHKAw
         tBCTT8aXEcdD9tFn4ZsI9RdOfNZKd9RLE+mpQ6lFR/RiMjy+2of9UqjsN4EvBBEww9eh
         SoUNJDvytjDlBu0eXXra8CHiT6Wqvo1S0EA30+CPWafRr33KqHHUcjvPn+f1BWDWk8+U
         xqkT3+mXQq5orL3spQpdtJSUNNq1MtxvP2vk5cI9JpXRjWVIb3pV8hA+wwSpBk2MuJXU
         76+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755096631; x=1755701431;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ezPPApvQ2xGo1Tf2IGGI/q/jNbwVwsEJODPGA7ESnU=;
        b=A5MMplQh7CQBZTgqKHRlXJEA2hAjCO48G6n0yQur47+EF/5VmkYsRuncrlqiekf6vz
         UCh/vzQveVLkMM0yXsBx1W2/nKcz+FoxGQVCCSVjuuqdBEqvsoI2wGaHAUzo17AcY4r9
         a55kW1eHxJ99NqwJtkkGF06MtJsBxTFffVeksr76bGlnouOBoGxMNcfIm2zIYNokrTvn
         g3FdejpL5Ih3qWL/6EmLpA9PBkZPY94GhoKBMI9DGAEpXPnG7O2qzIvsUCmkentJ2KBW
         GJ3O5qHi48itbU/ObyYTofs/e+2hMHJzf6rp6Djvc/Cp17v5eKtM8+UKR4ybgaa0BEVW
         /Fdg==
X-Forwarded-Encrypted: i=1; AJvYcCVEEL6WLJO7zF7EHnyZ/Gh4NAFlkl5bjWP3CCWWAmkjUXVkwrATBWwLLWV8mPKIsYHCb2JSg8HybEkuD0vK@vger.kernel.org, AJvYcCWfs0sbvRKYv+KRw1/3NpN2f7ZZQnwIrb78AcQByVivbZT0sFYQwOa0vUs+A4VEoRJk/js7u0PV@vger.kernel.org, AJvYcCXQR1jr4NAJOP53psBwt66r9z8vJVBuR1owzqfDW0sahAXf1BrFLBYv5T6YHy/9zMP+PdK2gCIVufU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9oAjaGGly725hmubnK37grVWaV6Runkh8KoJQYBx1FR88knN
	wdkbJ5TVeNP/KRSQBPL4icO6MZ4BVSotO3asO1CgsDiRJGKa+YUMxLaa
X-Gm-Gg: ASbGnctxzfpwt+wZGe04ZIDAf82OPrg1HXWRf9LztIJfHQ82nCZfgxbMZkq+GYpu6Cb
	crViP1mqxScCSmbhbW/hLz725uc61wF27hSCle6twfvQ9vMwiHRkgNQAO/kqDdlCU62FFCXZ/i3
	vQg8WCyH95b6Cygw1UT0PD2FlqY26IsaaPcaUNuklQy/zkXS1jlfYGRMm41L+qyE/K8Ym+fXwIH
	58HgAM4sRvLD95uJihQclrMOnGifP/FisD781QB0cRgKDsdYANlF5giABNYSbIhvqtmoVr/Rv6p
	QoB1PoAV87cIxRplC7clZ8/OCwRI9PH9xwboUm1BSmXv+GjO+oSVxVXvZ9/XGu0PhuLO3GOTX/k
	4AfspXF/N7XrV1AaqATUM1EJim4GwEibHtGKy6mRGMzgzjIyjpC7OSssWS/qf3L064sVEDceFSA
	==
X-Google-Smtp-Source: AGHT+IFJSSZ94OtT4ZHv+bwsJzRMHFPjwQlds7MccjDC0e78z0RxSH+Y9lq/9TY/OBkJJzrfnQpY0g==
X-Received: by 2002:a05:600c:a41:b0:456:191b:9e8d with SMTP id 5b1f17b1804b1-45a1aa66e72mr980515e9.11.1755096630808;
        Wed, 13 Aug 2025 07:50:30 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50b9e6sm6265605e9.6.2025.08.13.07.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 07:50:30 -0700 (PDT)
Message-ID: <2b106715-de6f-4455-a558-42eb3a95982b@gmail.com>
Date: Wed, 13 Aug 2025 16:50:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
 <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
 <aJyM3N9T4xI4Xo1G@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJyM3N9T4xI4Xo1G@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 13. 15:02 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:13:26PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:12 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:
> 
> ...
> 
>>>> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
>>>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>>>
>>> I didn't get this SoB chain. Who is Imre here and what is his role in all this?
>>
>> Imre reviewed the patches before publishing those, but we were unsure about that
>> the Reviewed-by tag can be used when it is offered privately before the
>> publicaton, so we decided to use the SoB tag instead.
> 
> It's exactly what should have been done. As a such the SoB chain is confusing
> (taking into account the authorship of the patches).

Thanks for confirming!

> 
>> It can be changed to the Rewieved-by tag if that is applicable in this case.
> 
> Please do so.

Ok.

Regards,
Gabor

