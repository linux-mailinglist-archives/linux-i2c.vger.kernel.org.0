Return-Path: <linux-i2c+bounces-12272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F439B24D40
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6540583712
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 15:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DFF219303;
	Wed, 13 Aug 2025 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2RJ0f4L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BA11F8BD6;
	Wed, 13 Aug 2025 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098365; cv=none; b=EGzlBJlXoQlpb2w2Uo8mLUP5MapfBinpyDBGACCEY2jaMEzMCamnip9nnmNwrVLjkk4AYTLyKGBK5FPiaf52W8E80PJhVDbusXFXY4bCjfwd9DKIJxNyoMgSs3x0fL6zWTj+i0IQOQ4AYOXs9Z7sbJXCUtGWgyaxuoWgyr9xOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098365; c=relaxed/simple;
	bh=DQIKfCV7qhGOcLzNuplEtGMcxE2yoLWltZyc3B5rEgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyVpKJye16Kx8xhXUl4GG1FnuY0K7na/TgDfBvxXYlb+lTwM1QiW6qOjXzpmWnbc+nQwALIK7bTBEOP8tGYDU8gTppYVxhKUeGJ4GoxfhBiZ44TzPBNIdLlGoJXiqjQnnl0P6ggYfelF+guUulAvE3yFIuAqfi/btLY2kddqhc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2RJ0f4L; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so65108905e9.3;
        Wed, 13 Aug 2025 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098362; x=1755703162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htAap5fw/dg8+xLfXOlfECPNRc9i+jW0+owdWC0r+RQ=;
        b=A2RJ0f4LUY1nM0UWIYJxvZpCsRyhGoISgkpjIymGZvNV30DR5yX9E575BrS3NdZOKP
         3a8+7rWjALh2VXkxcVDDcTKUq8CdsWs8W7Urw3tdOpDBYteXRpsQ410WUgGVSASIVpnG
         Sc6rY4c3JxAXmSP+dk5bIdHB5bSXkUs0xje5ZSxlb0OyHGz/5y+I8gWyDetmZ22fC1AJ
         k1A7OKxKb3CtrgmrntlAo7T2uqlzjCXXos3lC8IPryNDWfHuNjtMHRdvMGcv4J3qMiAH
         UljHNqdGpT+cNcc+CzosSloqtwT3Qd8kbcTGDLN3uVww3ZMLuVSDFrqjuHK9Q/bMoKeg
         sLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098362; x=1755703162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htAap5fw/dg8+xLfXOlfECPNRc9i+jW0+owdWC0r+RQ=;
        b=nP8DA1NlSOqJSQSJ4/kHPJvnIscI21Wi+3Up3oWwPXK1DaJJIdVokgWaX0i20FZ1+o
         9Ku+v2HMrNBN6e6Q7tlmUygXuE1fW6Lvjh8fbIsqssieeNUo7gRxkPjs5pmdV4qk9fDd
         uLLq+tdiZEGwGwtuecOGB+/6sZOl5O4jdKni7fwWf18c1yC1fpkDZ9B1bHfejSnrlZNa
         Kg1rnjc7KofBowszC0fKjLG3/JA2TOnIh58vM7btZ6hSTt0qfOw2eBIcl4WQOtbmWxDc
         lNsp5WoGzpaezijPuS3jkVAduE6DaElmdhXwHM92ebxnDYN5Bo0sIrY2r7FqNrUWAZoW
         P/+A==
X-Forwarded-Encrypted: i=1; AJvYcCVfhMiuM0+DCeoGAYzaEU25PuN9NRgFM2JaLo9XaoIQ/YInS9Te3LQqRAo49icaQPxKGOw6YrhW@vger.kernel.org, AJvYcCVncCcy8I8zQiWZaIVR99I60S6AUknd4E4Fm82CpVB78PKmXP2Dx2PokuMjIIHh1MTBSQoyH9sF3HQ=@vger.kernel.org, AJvYcCX+Y9ayPzGx/iwsg9lJXYlF0YZ6gf+jxrUKwfKJYFJ1yAF7eY2xjVvxLNo6D2Bo8emI7QhbCCNEhd/c0dVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+CA7nucarbCqp5jKfg2t1KrcQU2CZ7nKmP2tUQ/X6+N2opzd/
	1jF9yS8OoCiFD2Yflwp/g84/2eSX5ixVin2/0G/Cv0vADs/iEuwSnowY
X-Gm-Gg: ASbGncvovjuC055yUgxYIT/A63uaR2BLSdyZi40jKErJ43ldMk3nQVs9OniH+MiBDMj
	5aCKOTGeVnLYxSg3DB0IM5qGK11QiH8WFt+asF1pO08pIiJMXjbRgeNYNusCGdk846pdQRvWpsk
	hdtVI1OJV2w19ea6XRs76Tiv36fFJGJ2vxeKQwLduR/0VNvIw8hvrd6BloyozjSk9V96kzOpCKP
	xsO6DCfzQN5OK+vhrv6UZvvXU6mzoZkTheeFAf4ut1ojI3fAXoc2SMyzHmTk0+m3bjdPPud8xe9
	h1I+SOREtliqMIUVH7+bJF/GNaZEnzB4NuA+OAIVXYBbFHWaUN6nFCZroOsyLTiHNSQadMcZwQT
	pqcUet+MszuScVK945sddU5nyzizCPmgssL3BhxggVQt1Idh9kDpx5OFTT8eL/foS3WlQ5mi/8w
	==
X-Google-Smtp-Source: AGHT+IGfIPb5dRAaA2WhedQJ3CbdENNLW9wcz91G+NNxprPgCPyCfh5MRUpcNjjB57ZCH9jlboc6ZQ==
X-Received: by 2002:a05:600c:4750:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-45a165b7b22mr36901465e9.4.1755098361733;
        Wed, 13 Aug 2025 08:19:21 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50b99bsm6409455e9.5.2025.08.13.08.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 08:19:21 -0700 (PDT)
Message-ID: <0cddf626-5215-42d6-bd31-672e32ae293e@gmail.com>
Date: Wed, 13 Aug 2025 17:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
Content-Language: hu
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
 <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
 <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
 <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
 <aJyO-5k29AAAnHdz@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aJyO-5k29AAAnHdz@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 13. 15:11 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:50:35PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:31 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:57PM +0200, Gabor Juhos wrote:
> 

...

>>>
>>> Sounds to me like this one should be applied first independently on the
>>> discussion / conclusion on the patch 1.
>>
>> Yes. At least the users would have a working although not optimal solution in
>> the meantime.
> 
> Then please reorder in the next version.

Ok.

Regards,
Gabor

