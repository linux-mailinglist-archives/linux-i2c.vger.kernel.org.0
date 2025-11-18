Return-Path: <linux-i2c+bounces-14152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9748CC6AFCF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 18:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id E7D732CFC7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 17:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F978349B13;
	Tue, 18 Nov 2025 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nDVMW4jJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940833C198
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487175; cv=none; b=QMby+qoenAoWx4VVQSiw/WH1fN6i9rZYdAGitCQS7JomCSncZ5usRkQtixAwtgQ6Y1q/EI3xRXrxxbyFWVv+7yPZ7Oo2w2TYxIUGr4GXJK9u2KyjuNzNo97nM+sMijFQEQj9b/0Qh/GK+Fa+/vYvF/SXKEY9czS66MIH52DjRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487175; c=relaxed/simple;
	bh=qD0IQfQMQSr3tUmULm2hGqSPctE9/lbgVV0xWzp1kmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brxdoNgndMYtELdDXIvWi3oSa47R7hcV3E5npeMAJUVFhO4qWC9M6/aEbw4zygy7W0DFQhfhmcNhOSMqJZL3y9tM2O0DlJTTo+m8Yvk6OnSy/cyQdJD4pQaTGsTkJHnTlHne7MS1zUXM0T3erpmWnJ8cF/DmUF6CWdhYZsAhMtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nDVMW4jJ; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-4332ae0635fso34225395ab.2
        for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487173; x=1764091973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=nDVMW4jJ6i6gcJ/5Igf8ECwLtBIH610N71F19I02zr8NAa1eNPPeZyuZQA4phTMGHk
         tMvfbn8GqFpmBjYJUcqyY0e9l1hjOVOHdYIxGgleM7wt9rJDr1W6gE3Lcjb4wZOE9oa9
         Bh9ORVf0t03vh9KQmBC0Y0jqnxNe1BduULhC0sSPjDxoKje47rL9RbvIHBlUAGVpl5ja
         50Akzu/beXrOI48Ri2ZMfD0/PK1X8mmK5kPOEGa+ALz0Z0opXPK9XK3NySntV9TO78NN
         44hKtG8BuHG0bbeUil50QvQbX3LONZ8pLkaOBV9LqhIXM/0p+fN57YuF0H58h7K+2Bnc
         zxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487173; x=1764091973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=B1wmcLqq1MgyEZDL+fn8j2gaIME74PaMdhX88sejZFD4IV6nuBWdu4Wd2H2X9m562f
         WuYMDxFi8ccKkzP4SJ/8JjH0XveDMNu+G5grRHaeoT6U2oW6qk0znZf1UNcumZJn4r/O
         XRU6GoJLQSsKFYiRKlgjcX90kGMBYBKpsw/YedAScctnnmW+eObFXAAu7cIOh2ujOsau
         a7uEVcWEoIi3LoVC+hLBgCs+vJoP5hCcUa0gAUSM8B9uXQbW7xN4kYvw83VWy5R5gC9G
         uIGsYot9aImIIQ6HaqGGUbNRidesLFUcGVkLBIPL4e7GFtmUtAaD7ILbU6yMjpkwQBnk
         9gMA==
X-Forwarded-Encrypted: i=1; AJvYcCWb0ySUdIOC4XhBsHZ6meOQwDo01HQ1fGVEZk5yMqVEX4Srkf2ePxZrFf7R8JN7yUX88KDamp5rU74=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRjE9uds0JXf/WYNxfUKfhj8KRfPL2rlVTMO0UILKnFKpqKz68
	jZ5qeLRC6tff3EccflXi3WhmcqeoxvmPyAItkFRiTOFPquL9oL4Zj7tN9Iuwa9WWCLA=
X-Gm-Gg: ASbGncslr5dlf0egJqc3xa7jwLxI540VvrZEiYXehXmxIOigFnZj8GaQolyina3zJBs
	v7Pc+zCfAI6kzsDN+oYeFbhQxSlXEfDypIpdmKT8G/ti0p5qQ5iwsP6HAM1n+9U1By6teirbUYB
	97dTM1W67dRyOwNAbVTpNyYeBWEV1KvBeS74NPMkw/9uEYSdEM25eR7SIpvjebtfvoCwcXyxYcP
	eXHA7SqzohQe2EpSehREkOAQbie9kBsr2/cWoOiuFPFCDyKmuTfTG38oe0yEAKYYETg+nVdA7O6
	dnoqDqTJ5LWzzMAPC9K+x1qMgUFvqYJTZFPzeN62fxumD/aVEp++M8BygGC7R4mOaHQTY/AU22+
	CConGJ6i0KyX8De8VwAQwyETRLOsGaneIlSXId0I1Oc57Nyth7Z0mzAu9RujvAgt5hvYmZK1HRM
	wY31lhj7d18p3iBXc+K5XMdqHVnpCzkbIzyEtZ+yd0AL8UuYxkj1YmE09g30F0
X-Google-Smtp-Source: AGHT+IGahI9DGjaU2urpjYEZBPmSTbQQTgXyf3rdyDOFBmX83/b65vQYd/eGVMJz3IuDl90Wqglj7A==
X-Received: by 2002:a92:c262:0:b0:433:7a5f:9439 with SMTP id e9e14a558f8ab-4348c91de6fmr183399575ab.24.1763487173123;
        Tue, 18 Nov 2025 09:32:53 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:52 -0800 (PST)
Message-ID: <d33f6f1d-ce1d-4670-b7a2-1d086a16945c@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:51 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
> in REGULATOR_SPACEMIT_P1 is now redundant.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/regulator/Kconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d84f3d054c59d86d91d859808aa73a3b609d16d0..e2cbbb90500189a1c4282511b8d7141301cae1f0 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1455,9 +1455,8 @@ config REGULATOR_SLG51000
>   config REGULATOR_SPACEMIT_P1
>   	tristate "SpacemiT P1 regulators"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on I2C
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible:

	default m if MFD_SPACEMIT_P1

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for regulators implemented by the SpacemiT P1
>   	  power controller.  The P1 implements 6 high-efficiency buck
> 


