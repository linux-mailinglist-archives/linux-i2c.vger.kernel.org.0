Return-Path: <linux-i2c+bounces-2214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA08873A7A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 16:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF8001F2C570
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 15:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B301353FC;
	Wed,  6 Mar 2024 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8qfUBx2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4958134CE3
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709738075; cv=none; b=F8i4NQcEXK9ON/eP8WTEoHun5Kbr6fRKhrUqX79WDWphb4RxPbhoxKdScQr0Fo0QQUEEZnPnXUry9TEIbuT3MpHjoyd8hw5mgbq8uG/xx69fxvkjbCCEWPcyUt9oaAmhSV+YPM/kzAOuIcDJHYMcGzbWGNrwHCZakUTepacUGGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709738075; c=relaxed/simple;
	bh=498Y9ymh+coaRsc0UwtEibekqfR4HmcFKGvErVyy7Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dobf99QHiGDmSZUJ1EkBq3rBrzsCCZgzlwxW8V05PBrh2eKVTfVFTXm6/ruamhsxwokhawSKSrxtdi2+gE+sgn5o/WdrT20nOscQ3uwia8i/HEfxAXxIE0H8a8eH+hsksSWeilnhmImknB6kKBzWHNdw+NBgYoynDnBts9vdg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8qfUBx2; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so8494904a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 06 Mar 2024 07:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709738072; x=1710342872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScU8g41b99uUCVC94m13tIOHm36xzvD3q/9uJfKIfW4=;
        b=t8qfUBx25/gD1EoXJGOxtArEVEICxjXQJZy+ljQFLesN+MrZOldAGi9rqSWQB+DOt/
         GN/sUR5xudGfocSDRoga9z7Op55fgYSx/Kh/pKV0r6O2YSQZyizpw66QhqrmUDzm7uJ/
         3W2774X1/s5mqNui8WSmbrGWSmBmXQBkJibkcxIsanvXOAEetXZy9EafYHqfgP5wxd4F
         1dnsDt4Bu1JncVzw54nz9HVHvIc9oKud8hV1TtIFcukcA3YH/la9ym5cSlBNQjdm17fL
         8fzwixkXVA8ud6Yri2HTWZP6aaScD8Auth6UazfzoN1TrAi6zFBnvi859rF/PRBahAwK
         qu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709738072; x=1710342872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ScU8g41b99uUCVC94m13tIOHm36xzvD3q/9uJfKIfW4=;
        b=ohn7JLLBNN8ngw/h2stE9pjg0iNQepg/Im/OZPTeyuoc5nTwtAyaQ54x+ASq1/HtLU
         OZWtfxjdhACDIOVyccRB/BJ4JM29evLjrxgPRJAaGh68kRWh+lQYjbMM4hAXWd2a2VZz
         tmy7Wvdq+nhPfMx/9WmZBFWXr3oATmW5orOYYUeVxemzcohR0mjb6fE+anPzQ6tB6SbK
         p5oH5soxPw3W9plLSol7IZcBqW01lHw0ueegyiQPznJksdPg1V4vhfe5oAElPqMINiam
         QDFTh0rdritkaGyfXA01H96uTMavR2OIniWwEKW3ng26KwsDMvMMScfeq6fQb39Lyk9Q
         w9XA==
X-Forwarded-Encrypted: i=1; AJvYcCUvfcR1Q0DCYtFwCfOasXygF9M9k8SPCjCRjPqAQXU1fsS6E2F1qoGhrByu8CMF6HEmnjfVeH0qFZBo4WGVj1DtVJNY5S87q2lR
X-Gm-Message-State: AOJu0YyAw+2+/8gXK6dmYx9qNsMTdTORbxlxScmgsZd//cA6aV5fzf3w
	CScZCEZcH0RnRUE9nt1mZ20z/D35eYCArf1D5IpALIgy+BHP0/kvVXLyixAiFXY=
X-Google-Smtp-Source: AGHT+IEeXnyLgUokL3t8f+HZ12gGWq2MrpfouoTA1W+V7tb1XV3gKZxX+SqkmHd6PHUlO4Xr3JzxJQ==
X-Received: by 2002:a17:906:d0d6:b0:a45:ad59:cbc6 with SMTP id bq22-20020a170906d0d600b00a45ad59cbc6mr3072774ejb.26.1709738072221;
        Wed, 06 Mar 2024 07:14:32 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906b18800b00a43fe2d3062sm7270376ejy.158.2024.03.06.07.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 07:14:31 -0800 (PST)
Message-ID: <5a2d1071-5410-4c91-adfd-3d6384c74f94@linaro.org>
Date: Wed, 6 Mar 2024 16:14:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: exynos5: Init data before registering interrupt
 handler
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Naveen Krishna Ch <ch.naveen@samsung.com>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@axis.com
References: <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
 <170972613133.1712532.6066452137196640811.b4-ty@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <170972613133.1712532.6066452137196640811.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2024 12:55, Andi Shyti wrote:
> Hi
> 
> On Tue, 05 Mar 2024 11:50:00 +0100, Jesper Nilsson wrote:
>> devm_request_irq() is called before we initialize the "variant"
>> member variable from of_device_get_match_data(), so if an interrupt
>> is triggered inbetween, we can end up following a NULL pointer
>> in the interrupt handler.
>>
>> This problem was exposed when the I2C controller in question was
>> (mis)configured to be used in both secure world and Linux.
>>
>> [...]
> 
> Applied to i2c/i2c-host-fixes on
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

If for any reason this is going to fixes, which marks its importance as
fix, then it should go to stable as well. Please always cc-stable for
such cases.

Best regards,
Krzysztof


