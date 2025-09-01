Return-Path: <linux-i2c+bounces-12543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B37E1B3EAE8
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 17:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB68617F367
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 15:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD6D2E6CCB;
	Mon,  1 Sep 2025 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/oSawl/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD02E6CAE;
	Mon,  1 Sep 2025 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756740297; cv=none; b=OwbiL7dxgsVALKRbjq/EdMQEJczn2DF+mbgYXB7/G/RW8Ybh8RVb4WeU2/21UyRQghMP8vH0vrDqpfka3oBQXfXuQr3iUuGmo28/IMmA0jSO+BRb9PbIhMW2X2Fu25CoswBYFd87d0Bb1WdXZcjLP7daHWqwl1OaqfPVTqm6H1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756740297; c=relaxed/simple;
	bh=DRU8ygeTO1LipQMO9ZpufH0KjzzPhaUbNhaaLIF4uX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwvO7mo9rd4M7gdp5ASbEM+Cu0RIPCIPJXggeZRHPMynXewkVzmOWSTADf4v+6DUKzupJx4tX9dFWVyGiY/gLzP2hKBUnX4yiWPWgwD1InGinY4Q2D7xTO9HTIFND8SV/1aTMWk61oki3FQ/aEHrPxW1P2dp6yPapStjHyOPkWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/oSawl/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d4dcf3863dso975463f8f.1;
        Mon, 01 Sep 2025 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756740293; x=1757345093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pRhd0lrfXZ0Au0ju0lgUDZOFE95BU2h+YsyN9ySYew=;
        b=M/oSawl/SWweEkhay46AGL8uh1IyxuQTley1XzcCpUslB9n+OmulC3LaMq0oyd91cQ
         3ek7gypS8nQf68zGtxxIp7rvhazb78paxft8c8vp33YM91riedCT9/rjK8vczJNZ6r/i
         u0DG0vveZbk4BH98FBoySO5yoq2CHlj73PMf5AqmZCmVxtJKPWG5BLenFR5RvYsa+EnX
         1TSlI5yHMBPbmFliIMH2bmxAxdXLUKu4QRgnDwV43YilO3H59F2HcoY30YujY1CFPnty
         +bMgmUH+oyE12cVNIFTmZEVoHlU65GVsb/gQtDN4xjMX7HDVazNMufx1n7cfgG4OkCBC
         rszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756740293; x=1757345093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pRhd0lrfXZ0Au0ju0lgUDZOFE95BU2h+YsyN9ySYew=;
        b=G1ncOC8IWHEA4sxT4bw/0n+aoU0Cl8ibhw1zFzz+x2mnerP9cMIIO5Cys+1zvXuIiC
         NcPhyUXAXSDzT7TwXKcd4Eg2JwfkGCuzcWOc8d7sZc7yJHGEb0GUK+JUa/XvpiUvUB1Q
         Pri/AwqIU5S62J249IboCE0rPmlx9C2zzcWRuZ2A97Fk1ql9VZd7EEcQSRdIvNwyRavn
         RdBJfQwxZaz4mzwM3KccfmhqSxCqnV1+DX1V0bCLhm3MYDhjCEyF9ZFdxod6WekPGsSH
         cqXmKevLvYbA97zHMX7RSZ6lt3Gx1svhBkDq7rAViF8K1JTAKRxp114Ku1eMtZAkhjvG
         ADUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuxPZozYmj9FHuyjghczurDuLHhzqE2dRYV7Qn152S7ZgKsncVtgZSeijUw9qYL4j5O0e80QSiqIM=@vger.kernel.org, AJvYcCWahsLIFs4gsNVPraJkqLA/T/YTmxGtApPAHwoPzH5mW0cHExKZlXBdRl1Ay3uCC7RjR2TwtzgNHYYZccUk@vger.kernel.org, AJvYcCXk+Gi3Uhk+FRfwXz2MaADez5+vRlEP8Geg/AoS5PJFDq7CI15O8Exz8y/xOZhRDyllRDL15pl9@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMaXqZza5ToR4uklM+I5Gd0BpYAHLW175M6eDgSyHemDkIUoW
	6ZxpXesbPPzddsczmjR9qZpSDN8C42Dv5cnwNVtsnuCVdR0xBmtHWSb2
X-Gm-Gg: ASbGncvwx43hEm6NaefrLB56roZmH8NKOtfqI3s6KAR/Cg4NOwKEshOvRZXRdJlj4S7
	MUjkzlsSVSpf+oHf9inXEOe9/72oPPFd3nvUN6UJfDo2FJXl6/Xkb+R4ghbGtd228bYt3nkQ/BE
	OdIySPah9cUSQYvYzduzIqgON8iKBrlsduzkdsXqjqZ9Uy8Cpqf8rZONWabXJ0IavsoB+0K5A/p
	5wrDx0TgGvRNICRbhNyvk6QQGmkzlyN7741hdf+HIUReuu9c/kjVAFankBmaKODMd2eu4Teu973
	BgSRaRKm0RFYaOSW1OAtUO6jsbseZ6bIdYmgBCM1xWwxymlB+AWHgh3hfY6b6dJgKWQ6ojDhWbt
	B5ha/YfjzFl0JXPRu1+3BxmlfS+TGbdVFoHT0aDJoRTKwai5M9HsvbFG1PvVRcjE=
X-Google-Smtp-Source: AGHT+IG8L+Y1WLn5A24obkwlkF84y/HEF0FCpuQZuNbCTNlUmHOEZHatFeXSB2OOW/xfvasSPf+K0g==
X-Received: by 2002:a05:6000:4013:b0:3cb:2049:c743 with SMTP id ffacd0b85a97d-3d1df34f336mr5922864f8f.52.1756740292522;
        Mon, 01 Sep 2025 08:24:52 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9cebsm15711441f8f.46.2025.09.01.08.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:24:52 -0700 (PDT)
Message-ID: <3d3c9d5a-d3a4-4c94-8199-a5870474aa23@gmail.com>
Date: Mon, 1 Sep 2025 17:24:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Content-Language: hu
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 09. 01. 11:23 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
>> There is a long standing bug which causes I2C communication not to
>> work on the Armada 3700 based boards. The first patch in the series
>> fixes that regression. The second patch improves recovery to make it
>> more robust which helps to avoid communication problems with certain
>> SFP modules.
> 
> ...
> 
>>   - remove Imre's tag from the cover letter, and replace his SoB tag to
>>     Reviewed-by in the individual patches
> 
> Note, this can be automated with `b4`.
> 
> 	# Start a new branch of the same base
> 	git checkout -b v3 ...
> 	# Apply last version from the mailing list
> 	b4 am $MESSAGE_ID_OF_v2
> 	# Do actual development of v3
> 	...

As far as I know it can be used only to collect tags offered publicly on the
mailing lists. I can even use 'b4 trailers --update' for that on an existing b4
tracked branch.

However, the current case is a bit different. I have replaced Imre's tag
manually according to our previous discussion [1].

[1] https://lore.kernel.org/all/aJyM3N9T4xI4Xo1G@smile.fi.intel.com/

Regards,
Gabor

