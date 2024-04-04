Return-Path: <linux-i2c+bounces-2763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 121FB898E15
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 20:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231421C20F3F
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 18:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB931130A58;
	Thu,  4 Apr 2024 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4UJn/4j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA0612C7FB
	for <linux-i2c@vger.kernel.org>; Thu,  4 Apr 2024 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712255992; cv=none; b=KpgHpSigJoGgzwlWawcbxCKs4s5re6wEP0QuVZIP8FayXTC8F4DXm6tlsOT9Ds4DCECnsKalwGZ8AKciz7m3gmEbY2t5Obpy6TFWJoo/C9xQlBWxG4qnjef4UtuDfRMVGJyc4soklVEMS/MOnYIYZxJpd+tGKDFW2oooY5KE7bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712255992; c=relaxed/simple;
	bh=oYv37zwkALp6jUGg6PdcvIParTyg4w6WMu3otwMktsQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZEBSqgYr/7AEZD08EPlGjb8K2q6P5Ed0ulKvIsqkL6vbTxCrP2EkPvq6qGNEGa4odS1Xmh9ZekBEbtNinms9sj+hGYwgGikLEkvvvUPyWUz+glssb4DKEbeXsnq77NEb40DMU3/J6Bg73WliePGdhGs0jmjRNYktHr1jpjxp8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4UJn/4j; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a45f257b81fso188695766b.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Apr 2024 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712255989; x=1712860789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/uBfgEzPnFgmCs9caM2jntvqWIQOCASTAU+3c+z+l1c=;
        b=Z4UJn/4juOkQWr2BusVbX2Rw8EGwjz4n0Ch6q6H6q+KP0bUPacklB7n/Iy+kqtRf0/
         SBHTE87E8N35VfAQAC/Fu2+R68GpkCohc3qw/bowJYFS5bX1O3hlh9uoKRW1hTHVPV7I
         5aQtijyn6yK1u4hYUFaMADCuSxIdlaJ2oyVu9pxrySGZhHCEFXCxCrtn3G1yGhfWDROA
         /mqk7OT4XZ6Mnp1zFRCOFScY5QgHOR95+F6sMnVxx0n8qBflxF3Oa8pbHF5R/VCIKIFR
         8xsZU3xDU4Rg4+ArlX83LHRwyNuLcODUq8xZ6TiNEYwI7r0MZM6B7rC0LsQ3ZBUi9y25
         tZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712255989; x=1712860789;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uBfgEzPnFgmCs9caM2jntvqWIQOCASTAU+3c+z+l1c=;
        b=llm9PK47ZJ+57Ila0EO31VjlTed9hM8UM+2jfi8QDg3ZRIGNAVLFFogbeKfHRLrZf7
         XQJaVJSRC5pTSm2f+b+5yw3e8dqgJX9SWci4KAJYLgJ5r3B82KjUurJhokfsE7IRTO3U
         mFkTAz/E8Mw1WOWqncmN2pUsUkERYIbNFQtSm6vmPqJ+umQQgLwaB4cUCn7aw8UREdaf
         uT1+7xsE7Fkly3/G7jbyxKFdmHmy+tPYzzCMQQDusHp1pEi6zxQUGX9zmA/N5G9dr45i
         5ub1ZP83Y7B2VZnvp4WxLf2XZ83NF0kQMP6BavCW/NE2qpPgkRJXtRm8Su9Br9w+4zig
         hEyw==
X-Gm-Message-State: AOJu0YxOmuod4Cdfjvl2D5AOb20n/ySE385gPg5fRswuuzhE5SnoLAhI
	ExrDNIln3ZDWlyJBHXeplpIO1s/bXSsfdVLN+XCidGy8sFiaKLoyKZojLRlK
X-Google-Smtp-Source: AGHT+IHNDaYwWS9TRfa/L8aPDNjjvqRwskt+wE6ZBY7eaHFkA3FJ4vgc+A6q4sEuycLWPrwwE+tJzA==
X-Received: by 2002:a17:906:5655:b0:a4e:2bd3:a060 with SMTP id v21-20020a170906565500b00a4e2bd3a060mr317233ejr.64.1712255989201;
        Thu, 04 Apr 2024 11:39:49 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b917:8300:853f:3a79:973b:a77f? (dynamic-2a01-0c23-b917-8300-853f-3a79-973b-a77f.c23.pool.telefonica.de. [2a01:c23:b917:8300:853f:3a79:973b:a77f])
        by smtp.googlemail.com with ESMTPSA id lo3-20020a170906fa0300b00a46a3ad035esm9490628ejb.179.2024.04.04.11.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 11:39:48 -0700 (PDT)
Message-ID: <53e1238c-0732-4e13-b713-e724e12691c7@gmail.com>
Date: Thu, 4 Apr 2024 20:39:48 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Fix missing Kconfig dependency
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c5eb2644-8c05-47a5-84ef-07f8ef750e1a@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c5eb2644-8c05-47a5-84ef-07f8ef750e1a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 17:21, Heiner Kallweit wrote:
> The original change adds usage of i2c_root_adapter(), which is
> implemented in i2c-mux.c. So we need I2C_MUX to avoid a linker error.
> 
> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 97989c914..201c5fc17 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -111,6 +111,7 @@ config I2C_I801
>  	select P2SB if X86
>  	select CHECK_SIGNATURE if X86 && DMI
>  	select I2C_SMBUS
> +	select I2C_MUX
>  	help
>  	  If you say yes to this option, support will be included for the Intel
>  	  801 family of mainboard I2C interfaces.  Specifically, the following

Please disregard, I'll send an improved version shortly.
Issue with this version is that I2C_MUX may be enabled even if I2C_MUX_GPIO is
unset and the mux part is disabled.

