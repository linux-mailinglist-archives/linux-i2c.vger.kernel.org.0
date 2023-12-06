Return-Path: <linux-i2c+bounces-635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 385DF8076B3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 18:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE4741F211F3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 17:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A4F6A031;
	Wed,  6 Dec 2023 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erFTzDZr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DBDD40
	for <linux-i2c@vger.kernel.org>; Wed,  6 Dec 2023 09:35:57 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5482df11e73so78083a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 06 Dec 2023 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701884156; x=1702488956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5gdPFt8BdmSDXII3E32UP5ZmZMEA7jETxyKZk3XrFV8=;
        b=erFTzDZrb5EDYjHe5m5pIvj61XP9WqJqeumqMSpvIL9KKdbN2seBoNzxQ7/1nWLPR8
         5uwWknJSj3VGgF9QZbc4R7KyZCRRHuRepzLSAUha/efbAiHDDncKGUaZdlH287W6gEec
         Bzhscb0yTz418SNcaxFApeJJ+vTPIP0Yjs60HUAiy6AJN7JO0ecsLBml3gIjhG/wYOcG
         Nk+hc5jOWZdR2bzbwnpAGC2d2zBPyv2bh+TovKo+S5hJ7jGs7iTqutSn1jAgEDcuWCpP
         5XAwqf660xcD7ed2I37HDXCeFweUZeqth7N5Wi5hA5VnUwyC7cPK4Eyev4N+U2k8romR
         +0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701884156; x=1702488956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gdPFt8BdmSDXII3E32UP5ZmZMEA7jETxyKZk3XrFV8=;
        b=vlXWLf/e/q653kKvKWcobvHo1tukC+mn702/6E8yTxxH6SjdhLZ+ORop0DwCFJBwns
         PzMk0r+mlpKMnhpyoGBQSeRkP8r6IS8n5HpJmdnQpY3Lg6v5K0snUJ49J8PVut2so3Dj
         adMaP8NSPZ87CyTLCuNN/hhWV47OjjA6PtG4noYq6+5kw4M2+7TES9j9VSOrbKpnqPuo
         ggm/PfNvGccunbESOWBUEZMvDqSMUbHN64q2jrHlSE9tPNMsMGmdDBmhV/9wJV1gmqMx
         JhC7IuOXOu6tSuqdQhcrjjjxtKh85VUCempzxTDcovIakQg6J2uswTplDtaxaTWsMJzU
         gYcw==
X-Gm-Message-State: AOJu0Yy21ru8wbFakQWhaqI+aVEadx4dveULrZ6Q1RXYx3+KwRXgkE2g
	f8aXoEtxL7Z61O5TetV7hp8ekg==
X-Google-Smtp-Source: AGHT+IErqATdwEIlZ3NSGTprM7HJykavuFniKFr5YhXv0PkeVLHBLZ+4qOrkqp3q7goWYCRNBFUdPw==
X-Received: by 2002:a17:906:aac5:b0:a1c:6dfd:1480 with SMTP id kt5-20020a170906aac500b00a1c6dfd1480mr748849ejb.136.1701884156395;
        Wed, 06 Dec 2023 09:35:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id le14-20020a170907170e00b009fc42f37970sm203581ejc.171.2023.12.06.09.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 09:35:55 -0800 (PST)
Message-ID: <cfd9cbc6-5f66-4929-9afb-3a572e93e8ae@linaro.org>
Date: Wed, 6 Dec 2023 18:35:53 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: pwm: samsung: add specific compatible
 for Tesla FSD
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-fsd@tesla.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
 <20231205092229.19135-3-krzysztof.kozlowski@linaro.org>
 <ZXCeWmEO3PJiK0m5@orome.fritz.box>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZXCeWmEO3PJiK0m5@orome.fritz.box>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2023 17:16, Thierry Reding wrote:
> On Tue, Dec 05, 2023 at 10:22:25AM +0100, Krzysztof Kozlowski wrote:
>> Tesla FSD is a derivative of Samsung Exynos SoC, thus just like the
>> others it reuses several devices from older designs.  Historically we
>> kept the old (block's) compatible only.  This works fine and there is no
>> bug here, however guidelines expressed in
>> Documentation/devicetree/bindings/writing-bindings.rst state that:
>> 1. Compatibles should be specific.
>> 2. We should add new compatibles in case of bugs or features.
>>
>> Add Tesla FSD compatible specific to be used with an existing fallback.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> I propose to take the patch through Samsung SoC (me). See cover letter
>> for explanation.
>> ---
>>  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> You point to the guidelines that say we should have specific compatible> strings, but then the string that you add seems very generic. Now, I'm
> obviously not an expert on Tesla hardware, but just FSD seems to be
> quite generic according to the internet. It seems like the chip derived
> from Samsung used to be known as AP3/HW3, but there's now also AP4/HW4,
> so I wonder if those differ in some way and if these shouldn't include
> some sort of version/generation number.

That's the compatible chosen that time for entire platform, as a
consensus, for all SoC components. Thus the PWM compatible is as
specific as it can get.

Best regards,
Krzysztof


