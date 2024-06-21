Return-Path: <linux-i2c+bounces-4162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900B911AD8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 08:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7760283E02
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 06:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD8412EBCA;
	Fri, 21 Jun 2024 06:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMI56hph"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC915665D
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718949730; cv=none; b=Nz2rySIHwuIDnpyqLAHfrEgmyeB1bZcdr7iW/QNeSBJp26lOPB9xoTnTwuYe8qdvBzk3EVoR2Q23WXfJrpUhX/VTUi6uLVzlC4lCZ8GmW16h3lHKkelQa2ZHJWHYaWLgYvmmgOJmvXpX/t57iqHWDTF8HiYU52rVjQhX2oHsy4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718949730; c=relaxed/simple;
	bh=7xxygCZjacIDGyFbaYaTomUD8uB4ADx9SvmMPFcZpxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNrwIRXriRcZCHbO0YDfpSAvtc77NcyxXA5UIoZrgY4dVWLUvGpIS2Hy+s/w/F0uepthnYwWAMRRu1BwoYXm6ZkQo5okYc4HqriGySkYcvbIuCwrp9xUt5AniskwKP52OWSIal4U9K0I1B1O/DAKZ0upJa5SyYoRLGRQf3MJW/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMI56hph; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so16464815e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 23:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718949727; x=1719554527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g0Hfq3q6+Bq2sBAL3y5mfWY6pJX0OWp0a47XCpnciK0=;
        b=HMI56hphGXXYhzqa2suIfoIcI7B2ywPuduj2xzbTbCwlqBpuf6ighlhBzxooyqMW52
         FKQsiX5Sc/tjmBtYH0HBwiL+M7iaNlAJ1tch7ZMoy46/sQygu1jDOKzNEhXssCt1NqG0
         lZ7JetflXA9CnZN8kBDJkD2Dep17S7lhvnF71evAk276tJu3eLPQaBPYox4F7UJsw937
         TXstFJHqUSyE0lYDISELvpOU2UxMWE+oAsMhhMh97l000gLLCNeulEIYM8ZvyrPLQRTm
         xGRdiC4tSNRffOE2cNqvpK1GywIedE1i3S0mf+dax4CSeo7zsNp9e77yuLFXbCFX4FRW
         SHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718949727; x=1719554527;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0Hfq3q6+Bq2sBAL3y5mfWY6pJX0OWp0a47XCpnciK0=;
        b=fY+/YLM+L5UnIluNVZbXuLTMJAnsspc4U95EDowvUejBit3D9eYiWZyzTKkCXkwG4V
         xKmnf2yM+Kze3uEh0lIyP4AV7dEDhYcsvU0LcOpiD/cMiATinlBaDiPn0+cL4fxo0zKG
         hqd2LIHHPhqkyqPG56K5M36zmwvHsXNu6KsrX4htGVPvVZjaygCjEFCPcQ2WgqLXGj/7
         kbzPRy6T092lwQTT2LoGtF9JqMDiuB1vie2MGo70Expc5Xu6w6hwVOiEcX8m1nGAV/8U
         UWR50GNmOXQe0mzpomLAfS6utu4jY8xHI/dlmzSdTqVnVBCkxZGA3a1TI7MDTtyKKrYz
         7Nog==
X-Forwarded-Encrypted: i=1; AJvYcCVHuVqxoFbmI1Ax9r/Mz4IUirJgAdvnyz0r2xn82es95OhXspRgg8HANgv4YuYXFyt7zs1vhDdPDifrF5oB12mJEb6DhislAFYU
X-Gm-Message-State: AOJu0YwdoM1dTWO5a4wJ8Lp3ZsrrFR8eIoqq6/y5MVDcuor6+eMCKCtc
	pMF6L7RfY2SrJcQ5USyNjPvGKdRMPCdMlZUXzm6y8ux2qOLgUlD8DOsOy9YI4Hw=
X-Google-Smtp-Source: AGHT+IHuLT4dvAGw8hgAgzMvFAkauYtoD8jvXQ839+22x26JdT6wezqq6/7vvbhnIarTtr6Rq71dLw==
X-Received: by 2002:a05:600c:4c92:b0:423:2a9:19ce with SMTP id 5b1f17b1804b1-42475296becmr51344535e9.25.1718949727044;
        Thu, 20 Jun 2024 23:02:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f693fsm760617f8f.69.2024.06.20.23.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 23:02:06 -0700 (PDT)
Message-ID: <6bc864d6-11de-4762-b309-2e2a3bffaa24@linaro.org>
Date: Fri, 21 Jun 2024 08:02:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] dt-bindings: i2c: few fixes and cleanups
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
 <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/06/2024 01:05, Andi Shyti wrote:
> Cześć Krzysztof,
> 
> On Thu, Jun 20, 2024 at 01:34:48PM GMT, Krzysztof Kozlowski wrote:
>> Few fixes for I2C controller schemas. The third patch (atmel,at91sam)
>> depends on first, so I suggest not splitting this into fixes branch but
>> take as is via next branch.
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (7):
>>       dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
>>       dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
> 
> merged to i2c/i2c-host-fixes
> 
>>       dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-cells
>>       dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-cells
>>       dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-cells
>>       dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml schema
>>       dt-bindings: i2c: adjust indentation in DTS example to coding style
> 
> merged to i2c/i2c-host

So you broke the binding... Why openly ignoring my first sentence?

Best regards,
Krzysztof


