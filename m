Return-Path: <linux-i2c+bounces-1814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B01AF857763
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45311C21B3E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 08:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC782031A;
	Fri, 16 Feb 2024 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzacaa6S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87479200CC
	for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708070929; cv=none; b=blyptbIIvTCRPvIPKus+wyWl493HS1PCKTsauYRvXlgsfvs9WZGpXp+jWfJ+SehEp2VWIx3XMeWWgNiBklqapB8SlJKgCN/uQg02B06FC0CfoTpNTsHol0V6eVMj/i4QtzukkPh4aUyIaP9pcOlzF00EGEXr7qMa5t0UiRqrrsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708070929; c=relaxed/simple;
	bh=et7DH+1sqEpwvZZL/f2ZhF9RBoUtd92IEeYl4D859eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2uDrlbyPako87i4SebqL8VnJOC0hZ3uYwv4fH3+qSb+Tfd5U5KfQRY0GNBus1O5QN9j35rk/kp40O7+GJiGZPVT+v198iDfhKORzDFwgMIA2sa09vUUF/fJ2Y2ltS361YKVXGvvdkVjUVZRmqixtEfj0zIxBEkV4lbUSDRTfKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzacaa6S; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-563bb51c36eso1539567a12.2
        for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 00:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708070925; x=1708675725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2V6I6OpSex3cs1V6XXm3q9EZRuSLwGlRUlqdJr7y/ZY=;
        b=hzacaa6SqY8bGmLgWHgH9hpC5J0abEastEerYMWu4CS6VjmZC1/sjNWzI9bN3qr5q9
         QvXWv8Qh5d4Le7yMJyr76zqBXyyjwnKfYQCy97f+cI+iu1TKaCH/BLy/oociUL+zQJ0u
         NobpE4PqBRjJysQiZ/U54ya9sOvJpaY0nn9BwMA3hGJHON5l1AJ/4gzEVBAo0N+O0BkY
         AjnB0J12ye4yqObPm6bSxA4oZDLHX3RQ7bZ73RJK3DiENp4FJPRHL4lqKHWSwZYov/+S
         /b1cO0iVxIYMYveEdEhDDyHPXgPoBRCzBUJ6g09KkSAO/Lz/d7VfHLUieoF1sZqAiNcV
         2oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708070925; x=1708675725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2V6I6OpSex3cs1V6XXm3q9EZRuSLwGlRUlqdJr7y/ZY=;
        b=s5+YI8fm4LGbAwI0m5MHSDmTaRcnfcj0Yw2mGZsw+bMB9939BjVFxOspWRKSPtGGPH
         Mxhj9+caFZ5wnSIuDJU2vNijr6OKiRx1vbCgZVOFFTupWXQuxj8umugEikuWzzxnD8yW
         k+d8JxrMhlBFVMVBWvZBz0IK7ZKWe5zH5z0ym0apdqbumsCi6KH2k14DFhg8n3PYEnMz
         s6kztCKBCr66acjiaYI5P9AFswe891bqfFXLfgvU1NOBYWd39MiLc9sVRFwOxkcH/65l
         sBxIC34/3Hmcg1x9gyp1Yv4b2EZrE3MLWCFKcvsbFOhNcLipk4E0+yT/ID14qNGiUKy/
         RGAw==
X-Forwarded-Encrypted: i=1; AJvYcCVhianEFiALjcAhP0tpMlWn9HOxzghqNX5hYW7y3QtR4FhVcGKZa9U3F6ZSLXBbqRR1G5oaMFgO1Rs1egMUhCniC0dTMDCtIhWC
X-Gm-Message-State: AOJu0YzowvyVZ1IIAQuiyDdO3lJ6aKOEQXRsX2Gyvt8p6usYpyPWU9tB
	EQikWp+z9CxJwLq3OAw0ob+3XKXp2ZPH64bIHk55yA1M1OWpVaQy9tP8cOGJkN8=
X-Google-Smtp-Source: AGHT+IG9/wj2lqb9G6jGJ08OjouVPaMfGVcj8DuU0PHMhrDZXCmGYoHKF/xCqwIk5puInxBvhEPxlg==
X-Received: by 2002:a17:906:249b:b0:a3d:9f30:58b0 with SMTP id e27-20020a170906249b00b00a3d9f3058b0mr2768866ejb.10.1708070924813;
        Fri, 16 Feb 2024 00:08:44 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id s15-20020a17090699cf00b00a3bd8a34b1bsm1319130ejn.164.2024.02.16.00.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 00:08:44 -0800 (PST)
Message-ID: <67ea1daa-72a5-4dc0-b766-34a99052dabb@linaro.org>
Date: Fri, 16 Feb 2024 09:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] ARM: dts: aspeed: p10 and tacoma: Set FSI clock
 frequency
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 andi.shyti@kernel.org, alistair@popple.id.au, joel@jms.id.au, jk@ozlabs.org,
 sboyd@kernel.org, mturquette@baylibre.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240215220759.976998-1-eajames@linux.ibm.com>
 <20240215220759.976998-8-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240215220759.976998-8-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2024 23:07, Eddie James wrote:
> Now that the driver doesn't hardcode the clock divider, set it
> in the device tree.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts | 1 +
>  arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     | 1 +
>  2 files changed, 2 insertions(+)

Please do not mix DTS patches with driver code. DTS goes to the end
because driver code CANNOT depend on it (there are exceptions but it was
not explained here).

Best regards,
Krzysztof


