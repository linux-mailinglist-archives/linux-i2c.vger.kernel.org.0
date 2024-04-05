Return-Path: <linux-i2c+bounces-2790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F989A4C6
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 21:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13737285E36
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 19:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CF6172BB1;
	Fri,  5 Apr 2024 19:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUCxLyvL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7F134C4;
	Fri,  5 Apr 2024 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712344722; cv=none; b=dT8z6Whv6/twU0XVJ6O1WI5Owmzc+8nlm9cNur4do2gUjhuPKvwFgbHwc4s/qY08AASKXF0PN2NwOzGN5yW6bJZyvvRjIcdeIge2KXNnk5hmk6GefPbf26sZ3i7TSLhCLznXxoHyglK8PeYVpj5N5Zi2K0iyjJCtA+pGn4mq4Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712344722; c=relaxed/simple;
	bh=+r1VE05dOtHhfpYm+if/zfx3U4RcR3zC5rPXBmWqICw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Li6QqqZRF5C3FJ3u+HR73jykhBea2upTEIjZY1IIrByK5EptxUucL7VfvDODT58IUwXPXnsM+kJm+PgbRdFY2seXtVcu02Yl2O4cMou5DTYbFqgkzb6aRjEYTJ9UQAbOUpAU/59T5cwfafxg6PNInD5C2nkN249RBzq8yxM85gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUCxLyvL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516cbf3fe68so2799898e87.0;
        Fri, 05 Apr 2024 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712344719; x=1712949519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HKBz1xZFQF6731Fo879v1cUTJJwr/6Wx2pDKi598pkc=;
        b=cUCxLyvL8mLPZ4lQ3U4GGbiqrAe8w1OWnKY99RBj2dmKdfBTUsxxs0lI1At46C4jji
         895JDZYtFxHgSfP4/5X6MGfdxcD3QwpWjLwlq89EIsv4hCN3coyKUtZqRZhCkRJuY0++
         3s9a5vcw54BMRPczpr1XzD2gkPggTsGCdaeU78jSLwMG8JaZRrYq4gRDkxH6Beg7M8qv
         SYC1QVQT64OfIYOddq0g4RznUWQAFIj8TkawTsksFD5oNUXFCL7a2v2zQujXkXbuiFo3
         momBo0PA8tcTHFwKkant7/jAk4vB2KARsZ8If2mGluskg9/GN5KHrW5o5zZPIj826/BU
         x/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712344719; x=1712949519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKBz1xZFQF6731Fo879v1cUTJJwr/6Wx2pDKi598pkc=;
        b=aQUTcGSevNEjHCJl7HA09GbPJStZPVab8f0NOdIX9b6gvGboX90Mh15/NagcURwPXe
         vXr1czqi+K7P9ysj52CoRukdQoRzUAhVFnHI8WkSOVRLWUUdVQKi0YQkBdVyXB/+CpHg
         gn1mxo5GdzLyh8ZyUSgtXzZ5GAG4Vy+xonRfCEHeJIFc65S0qfpT05bs0Roi1piwpqOe
         8wGmS9Tc2PpzcUGlGuYGaFIM6oAC2T5alvZ7HEx7ScRY8hQrUHbYL2s9GQnG0eXuvne9
         gnzehlhpNVdIrQlSllGj3Um1LAJpH/EgdHOZDIB9L6pXWAbNP5ia/xEKbix2hFgO7ciN
         Vqxg==
X-Forwarded-Encrypted: i=1; AJvYcCU+t7f/WAozFBDDWnW9hNkYDb8APBblQ5ypRqRQDL7kHLoRVKxPjuYJ8/Q81NtzcAGa5eyWcgp7a0d06V9HUqzAPJiHUSNgUY3zxvl3UNgjHZWDt/9SUOFvP1TwYEV8D2jptlVeOTdadlzz2kAe+KLMa0pTyby/nz2B1seTzhsMGkhD7wj+NZo=
X-Gm-Message-State: AOJu0Yxc2VBreGrPBfUHPmXNN8Av9pCL4zzUuAa4wN7tMw49DHisgV59
	vWj5k40wIHUwvMj0IyfTBc+gf52v+x5lK66T3ZR8Gnyj5cHgrNTh
X-Google-Smtp-Source: AGHT+IGQ1uY1jp5rs0lz0a5idmCVq3eyxEWgVwPTMzGMTKRVkKcuuvhHqQf+xIC8/DhOaLPmL60Vew==
X-Received: by 2002:ac2:46e9:0:b0:516:d63b:ff56 with SMTP id q9-20020ac246e9000000b00516d63bff56mr1437244lfo.56.1712344718496;
        Fri, 05 Apr 2024 12:18:38 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79? (dynamic-2a01-0c22-72bb-b200-e0e0-cd27-7a04-5c79.c22.pool.telefonica.de. [2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79])
        by smtp.googlemail.com with ESMTPSA id qy25-20020a170907689900b00a51b18a77b2sm261076ejc.180.2024.04.05.12.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 12:18:38 -0700 (PDT)
Message-ID: <35e0b5cf-f7d8-4329-8dba-1098ed9451dd@gmail.com>
Date: Fri, 5 Apr 2024 21:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: add I2C_MUX dependency
To: Arnd Bergmann <arnd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jean Delvare
 <jdelvare@suse.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20240405142823.615609-1-arnd@kernel.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240405142823.615609-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When I2C_MUX is a loadable module but I2C_I801 is built-in, the newly
> added notifier function causes a link error:
> 
> x86_64-linux-ld: drivers/i2c/busses/i2c-i801.o: in function `i801_notifier_call':
> i2c-i801.c:(.text+0x1f5): undefined reference to `i2c_root_adapter'
> 
> This code is only built if I2C_MUX_GPIO is also enabled, so add a
> conditional dependency that allows building the driver as before if the
> GPIO part is disabled, but otherwise require the linker dependency at
> Kconfig level.
> 
> With the added dependency, the driver cannot be selected by a builtin
> ITCO_WDT driver when I2C_MUX_GPIO is a loadable module, so remove
> the 'select' statement in that driver as well. This was apparently
> never needed at compile-time, and the watchdog driver just needs either
> the LPC or the I2C drivers, but never both.
> 
> Configurations that rely on the implied 'select' from the watchdog
> driver now need to enable all three.
> 

Question is whether we really want that I2C_MUX restricts the choice for
I2C_I801. Alternatively we can skip building the mux part in the problem case.
The mux part can be used on very few old Asus systems with > 8 memory slots only.
Proposal I sent:
https://lore.kernel.org/all/4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs/T/

Note also the CI bot tags, as the problem was reported by a CI bot before.

> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/i2c/busses/Kconfig | 1 +
>  drivers/watchdog/Kconfig   | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 1872f1995c77..2619018dd756 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -108,6 +108,7 @@ config I2C_HIX5HD2
>  config I2C_I801
>  	tristate "Intel 82801 (ICH/PCH)"
>  	depends on PCI
> +	depends on I2C_MUX || I2C_MUX_GPIO=n
>  	select P2SB if X86
>  	select CHECK_SIGNATURE if X86 && DMI
>  	select I2C_SMBUS
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0b0df3fe1efd..4dfb3773e6e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1301,8 +1301,6 @@ config ITCO_WDT
>  	select WATCHDOG_CORE
>  	depends on I2C || I2C=n
>  	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
> -	select LPC_ICH if !EXPERT
> -	select I2C_I801 if !EXPERT && I2C
>  	help
>  	  Hardware driver for the intel TCO timer based watchdog devices.
>  	  These drivers are included in the Intel 82801 I/O Controller


