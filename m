Return-Path: <linux-i2c+bounces-9591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B9A4602A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 14:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD9318811AC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 13:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A7F2206AB;
	Wed, 26 Feb 2025 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idw5Ulc0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D621C19B;
	Wed, 26 Feb 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575019; cv=none; b=J8oBuKO5Vb7mPGZuKNoEYZuk+/8vBy5c2aGlzjW+XVrGHuMnJRB/m3oLP4naV4J7cwm8lsxurnCL0I3JYDtbSrsiv0epnrazBQiRhGG6l8+nHQrqVnzdMDkimdB1CfjWyi0bYygO/BIyDqOxhBOm4fkcWKHLYZ6QpvHfC8VD6Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575019; c=relaxed/simple;
	bh=8T6tXmiYYvrkr4KlwtHpcA8a60dsrFrQaaLCFu7UZ70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sfh30mAQ2wJFxyb1pONCp1P8BuOpODczb5l0bsqB8xTwA8HAaGi/mPay+qqE3Pn7f7uqY8OQu2BLB5+gOS2bPBZ5gKmGccXPErblpCyelT6xKVO9eyF7eFMdvYIxX6XiLjBhqH8l42o4sxHQUR6RMFuuPMD4oArPuePw2uQg8Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idw5Ulc0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fcc99efe9bso10403942a91.2;
        Wed, 26 Feb 2025 05:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740575017; x=1741179817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IPeycN86f1xgOWk4uKeGQv6tEJQSGR7VL8YmCabJzZE=;
        b=idw5Ulc0PvMikk3g0b0NTEwHqVgOO5yA35MmIvQ7tE+rkKpnqVX51Tj7mE/knCNsTj
         fb6V9PRcsrj3o4YqTCFw8bUCGjVwE/SN10tqejzg/x34KFQaacIv27B3Tf+xBl8YltUJ
         41WzRzwr366LHypYtPWUcoviY3TkE014AsrowFqqRBzhKWyrPuJ0MWelB42LGDEAV9Tn
         iUUl6VlaYczB7VPEVVKIrAC9JG+eBuJHCNVhMU35jJWXscmdLVnAjL20NtdOPVUC8bU4
         c89Y4Nj5PIH4NPoiPizVKJFIBJh44lmc+3enaUHTofkMcAK99VSCLqQCpuSX13Zq3de2
         FrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575017; x=1741179817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPeycN86f1xgOWk4uKeGQv6tEJQSGR7VL8YmCabJzZE=;
        b=qCGg0R/KY1MoXqCqhKrWhP0E06/KG6+xDXKmK84lAuXxa/+Nk9+4aGLRlF82ewB6fh
         7CPVB2gbgD3H1qo8pu+6O/du8QRRuEfXT+w58gUutc6PXBoyInB1lxvUZLF4gQX5CqlB
         Hxdfv01Decu/NTqmJovQ6oAtpVkui4W3u3ZRJzN1PFNzm0SJkihyg0QGxYmPT4stvLDe
         6f9N8JufNKfUoF94ZAhFHI4f90VHtS8f3R+iQZq0ZgTYIiM/sH9Ly8mf0gbP5sTgJKxU
         EluXwUnqI4s41h9xEpd1rHWsuJwhCwurFXHwogiLvT4mtDumKELAEm4IbhQnwaWq1W1a
         U9tg==
X-Forwarded-Encrypted: i=1; AJvYcCVbQEQFEl7EWm9lm7YeJCWPiPenXIQbTZtODpn8Tfix6FPpmGIUlaz55u703uDqMG+HCSpg3R6NRhC4@vger.kernel.org, AJvYcCW6Rb7KUrirNEG0F+qlMzBQMPNdZrI5D443lXrO3J5IrX8Te5uHWT8B7JcVI1SY0InkLQu877107QrQPp4=@vger.kernel.org, AJvYcCWE0ziU2DN10Mve8LiMp+JO9p+GhMqnVghUxXSFgOyyBp8vBlHOtrruiZbk2MjYHTPx4WXsSY674WQ=@vger.kernel.org, AJvYcCXr9b4wObLD8TbARkYqOx4zAgwG7pKASfGDlTFN+lzQe6gDCfnfynke/HuFvyASK5OGnONADTSyBNrpVT5j@vger.kernel.org
X-Gm-Message-State: AOJu0YzQLcIavxR5rrAcCClIrtwjO23THope957d/JWWt4igGm9D2fiF
	s4eBBQFXeAWo9PwRfkdel+hPuA+neW273od1RYMFWfE+twdQg/kRA61zrQ==
X-Gm-Gg: ASbGncvLGDbguAJiQ96WtyauEesw8UvrLVvHe3r5Z1GWd9eMwkciqOFjbMHx9zMpACl
	hZkhjtN9mVZeg5STBUESODktqVe+3itufOtkGp/EkVP1+LAcsiBhnms5YE4qtiK2koYLBgFAlvP
	r/6gSigilwPFHWolIOiDk1oAIMjWKCweIu5F0/2dO7LWQsYvFFz42jcyQ5hmi1GVINwidEHbET8
	Nuv+AaGQSUUr+zvQfpBOmzpwtQYmw7xC0g05U6GqWyLOBZiEOUo4vNGq18mO+hsXeC6qf+tJE86
	veWmxZX/iligbyKgknsXn9C+spfVFrTS+mVgvSHSYluAusxuKeLh/gfxPs4yh/4DsTSNGLk0vVw
	=
X-Google-Smtp-Source: AGHT+IGgYhj5gsQpPyttqAS3GexKHR9IIhHogREyZHF8AOZjqXjmabp+xGynlia3rdtJXq/nZtHbKQ==
X-Received: by 2002:a17:90a:e710:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-2fe8902a396mr2253619a91.1.1740575016767;
        Wed, 26 Feb 2025 05:03:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825a98e7sm1414288a91.4.2025.02.26.05.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 05:03:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7f72629e-50d1-40bc-bf7e-2c54ee62323d@roeck-us.net>
Date: Wed, 26 Feb 2025 05:03:34 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/lt3074): add support for lt3074
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-2-18ad10ba542e@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250225-upstream-lt3074-v2-2-18ad10ba542e@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/25 05:01, Cedric Encarnacion wrote:
> Add hardware monitoring and regulator support for LT3074. The LT3074 is an
> ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
> serial interface allows telemetry for input/output voltage, bias voltage,
> output current, and die temperature.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

The core looks good to me. I don't know what Krzysztof means with "hwmon
code might need some changes" in the feedback to the dt patch, or what those
changes might be. I'll wait for that to be sorted out.

Guenter


