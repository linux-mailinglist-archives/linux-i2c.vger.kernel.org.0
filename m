Return-Path: <linux-i2c+bounces-1816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F357F857772
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A941F21398
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 08:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F971B94B;
	Fri, 16 Feb 2024 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOdHpLou"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477718EB3
	for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708071093; cv=none; b=Pq6YAguTb2cmoCsjGUeiV+vpJ8FsshEcTK/ESdGPOCKb5iQf/iJtYDrwApa2a/A18cl9dBzNXroG6ZII7WY7hcXabGpYtqc5G0JGaYzsLaFrRK7sHccZNMg0NbQ+zMWK49+9GxZvj+STq9W8W6dHeUa1ySEx226kbtrW8eCUCJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708071093; c=relaxed/simple;
	bh=KDZmKU36NUtXZcL9fJXHV2Vh6u143fv1XXUJsWQbws4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQ08WOpVxrFBIu5naDucFY+7SALScAV3fFowD1t0cjgVbPVCK37+lT6bgnbx0lJu7ttsmRvpyrar5WdBNGwdBiXWm4SOKGCcMTfIbrHduQfPIMQebLsupQBro8EdTuF7fz59BRLMYy6EAn1ksRkZZ70LEbCA8Lg/9OrD4VD0F9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOdHpLou; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so2348706a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 00:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708071090; x=1708675890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10xWFeEadbzLEQb32PI22tz1cUwySXyLGYGfrCyh77o=;
        b=JOdHpLouhmE7bfMuq0tdbzW9lH/RiCqwYZCif7CTAlda94dnnNkk3LUf1dgk+vKxEx
         fkmwiWH981nhgB7lWwwqWhOFj7jVSvAkg8VIiqWZ277YpQHwMz+Gdp/csn94vUYcfBq/
         1h7EJ+hg2u7AZZeGPuiyp9YbJSv0cp96DWuVt5hrvlQ/Ix323RhFyGCmdAm0DWxmYMSj
         OeFJSZMoLTJE7XAhBL8UaABrzk7g+Rg3VGe9alA2yhyJJ6oPXfLxtko7Ka/M6conqPZj
         qviaDsfRlpwGCGc85oMw8jsS0jfWRTVSznbA5J+/IJJ4+2egyjy4B3YJuD1+Sa93Jq6k
         iIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708071090; x=1708675890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10xWFeEadbzLEQb32PI22tz1cUwySXyLGYGfrCyh77o=;
        b=mB2Z+t4zLRNmKnBa7PMZVmQ7Hf9u4qaujOBp2pO2oIunqajQ2oUOCj/j1mwCFtX8t9
         QWlTzhjSlHUmfj+muoWgSnpwwu55MoMQY9dDDOuw5jRKMf9mIbq2dgkYqotpMOpN2fch
         hlFcGzpyFw8iyPcuW7DyLE8rccGwLJyhv15/LFccWz/lzyP6fqesT/KL9ZC4etXt8vmw
         xNGUNtSPlXWjiTdvj9IShWSbj9QKufpivqu62lS061VUwqnxXhxqCo4gpwzFLInfIMRL
         e+BSLY5dxqCblsYoJxCY1Cd2E4uOKSoXLpwbcW+noDEkxladOQ7f6zW3m7u5BO5d8QaL
         22gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVowXEypMQgRnQDKK64UyWjPYdv17d4IVPuq+fi1RU9+tzgaCKzWUcULid7MO4YMktY8NdZ1F/4qP69ACO9kpeclNT8OblRfVZw
X-Gm-Message-State: AOJu0YxkKEUWC/4VaSLbhrL/f8ttt/OD2JzOOFbC9wQ7cPhqp7Cb8NR0
	CpBfmNbL618CZxjfylAC5qP/ylDwyU1CAPvwrJC/loFQXKHikFIks9SNeea2bNg=
X-Google-Smtp-Source: AGHT+IGe5UTf79Tnrcj3yEFlHjoP3ukJ1AS7IbgKPHyTFMeLuDp7EouHJZ91pfVFNVbRkt5KeqjgUw==
X-Received: by 2002:a17:906:5594:b0:a3d:37a4:a7e6 with SMTP id y20-20020a170906559400b00a3d37a4a7e6mr2610153ejp.21.1708071090298;
        Fri, 16 Feb 2024 00:11:30 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id vk5-20020a170907cbc500b00a3d60daaa72sm1318662ejc.41.2024.02.16.00.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 00:11:29 -0800 (PST)
Message-ID: <8f37e6c5-0834-442a-a974-6f9bae82f1cf@linaro.org>
Date: Fri, 16 Feb 2024 09:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/33] ARM: dts: aspeed: FSI interrupt support
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 andi.shyti@kernel.org, alistair@popple.id.au, joel@jms.id.au, jk@ozlabs.org,
 sboyd@kernel.org, mturquette@baylibre.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240215220759.976998-1-eajames@linux.ibm.com>
 <20240215220759.976998-27-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240215220759.976998-27-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2024 23:07, Eddie James wrote:
> Enable FSI interrupt controllers for AST2600 and P10BMC hub master.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi        | 4 ++++
>  arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi | 2 ++
>  2 files changed, 6 insertions(+)

Don't mix DTS with driver code.

Best regards,
Krzysztof


