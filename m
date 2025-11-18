Return-Path: <linux-i2c+bounces-14153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DEC6B030
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 18:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2DAAA34E885
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 17:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AF933C1B5;
	Tue, 18 Nov 2025 17:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fuAv3bXD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625934F491
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487179; cv=none; b=g8lodvDlA45sCNw/Ah5XAevqZLFyc0XLOdhsLOpEticJGIo2Vtk/Mc7XXToDDI+D6webV8riy2CNx9KA0YaQ6fsPcC84tV7qDXO7dfG40MFhIK1mNfK/K2GbZVBTVdfsoq6WXLXGf89e3AieQBjW3/1SGgEX+R8RbHtKnDaclaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487179; c=relaxed/simple;
	bh=KKOBsYgKv97w/HfACS/VyWtNlPlmasWAsfEKqO5aXf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKeLO3O1+gJQM1Lmge9yvfvVetinm1LjCkEp8Rfxo4Eg9nbZGbbhg5DeJuBaIUG0/FFF/adbvh82YLVfqMiC4TNcdAJmcd7/6D+0VEvr1Ib/DgGbPzK21v/Eayz9JWkf5TRfAejDZKK9I3gKNkqyc8I2Yp8Ej6roE0bQG11c6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fuAv3bXD; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-4349044be0eso25549445ab.1
        for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 09:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487176; x=1764091976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec5izO6qQ1oFETz1h93VLus1xZ8qz7zlXuLKIwfS2RQ=;
        b=fuAv3bXDmO4MuqV0voLegMa+Bx+0NlJDk1lUO1uUnZi7JSBXjDbn7atT5ZZy4Io+8g
         Ook9ImfauapPIAiqdTU4Jv9GuEQoryssQc8k+7geaUQ1zIIFtVYqtzXtZo/dxV5kuqnS
         H3G9bp39w1UPwi29fw3HB2cc6xalm5crz10BEf8ECyfvnVIjHBfvydGiV9zYBT9ipw6Z
         E6huhdytjJii0wuM8xl6WpXpuD3eXCow54pMDXTYaOXvS+lX7H7ElxDC+9afzkTLHZ2D
         0J5f4Skl95kDYiWTBDiwuc9Po7uMv+ShKeVEDr9S+YShgCeLBwbYG6Fb4PaHPuPmNQ0b
         /qmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487176; x=1764091976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ec5izO6qQ1oFETz1h93VLus1xZ8qz7zlXuLKIwfS2RQ=;
        b=SnrwWw1gvAZgx1DlZEr8BXLyJ3HycTwd+5FWq0rsVKfU/NBbVWVv9sdl8BhDQGCHIQ
         BCqKoFfsq3B0Xn56QkXslLjJ1J7366fRkJ+g1GJZGOABdSxPaKMUFp757Ya53CbL+t8t
         j6tEA4a7RC5XkruE7iN98HHL4+wzCOnCXwY1L90rBWvik6UxtZWORVsdeOchP3r3O6Ou
         q4rA35xpoE3cUDDxANsNrA137FMbp7RhXJN5X6Biji1Qg6kjPgRADmeiwii1S/Y7XkHp
         uxtAbAmPCxQSFBsB9yAIsAuUjYdOK02kzHW6cTZw6hjPcz5naKdBRy9bVGd/dRlfuLIB
         yP0g==
X-Forwarded-Encrypted: i=1; AJvYcCUytOwMdtX06BwRv8Noz6EsC4ePO0AW6IRdv7z0yQRPG6dAGq7SRWJZeqb/6M5oQDVgCsq0HSbk+eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYvNNAVSHtL2MCpulaiSzpYxBAQb4TBDr+CNvX8IJiYfso9t17
	TyFKDaUIKVvw5yChi1SXfSx1jicCWWV6bVRlPR48fn/MfbMUPz1Eg8D1VursboSyR7Q=
X-Gm-Gg: ASbGnctNtMi2CuWiRMTCMZCua3p7ueoZrZwsE1CObahJxgJKRHzrjnG+fshskVeqO0v
	KVNiG3Hu4lIp5lPfasXCO7vHl7ECMSkTlhBfh4sB2innZmMZZe3S93FUd3j5s/1fUlLjUZYVq1m
	N5GRiJQP5UYDoRky4gP0W1sf+HXGverJWlcejbpKg+q1PEWDRA4yOBV6AR+rfIMy+YlsACi3gUV
	d8/btGRxksV60+RVrALMgKmDw7A7mlDsPSKGlT5/F8tvvQWSGPlPPhozoe/0b/kYX/MqQwsyQ5T
	T3m3BMlOjs4+gTfdEEEb+3IweCCVP7YO6cweqcTkP8BYdu9JUA5V9P448r1Rjy5mf8MXK4kPD1s
	1tNZcWdkXyONPrD3xlaC+vryiS26vwYW3TgbHiCpsucX/3JYGFCoSjIgxWirbGGWdnjtDoSM8HP
	Z3du+ce6CtFZzatCQIL1WMUXPCg7DC6AQwXOTneNwL1UezO91FZg==
X-Google-Smtp-Source: AGHT+IEZShSd2XdlTL6LQuL0eb9ZcN2CQs/Oju6iDycMXlqVGOaJYIbCBR4ngQaAmXBLuKdLttDx0g==
X-Received: by 2002:a92:c213:0:b0:434:a7c1:6b91 with SMTP id e9e14a558f8ab-434a7c16c2emr61797275ab.18.1763487176112;
        Tue, 18 Nov 2025 09:32:56 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:55 -0800 (PST)
Message-ID: <1c43aa3d-a5e6-4260-9079-fdc2e05c533c@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:54 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/mfd/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
>   	depends on I2C
>   	select I2C_K1
>   	select MFD_SIMPLE_MFD_I2C
> +	default ARCH_SPACEMIT
>   	help
>   	  This option supports the I2C-based SpacemiT P1 PMIC, which
>   	  contains regulators, a power switch, GPIOs, an RTC, and more.
> 

I agree with Emil on making this be default m if possible.

Acked-by: Alex Elder <elder@riscstar.com>

Thank you for these fixes.

