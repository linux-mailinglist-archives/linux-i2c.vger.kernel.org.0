Return-Path: <linux-i2c+bounces-8054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A61619D295F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 16:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4791F21ED5
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 15:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9094D1D0E17;
	Tue, 19 Nov 2024 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTafX3XF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8C1D0147
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029263; cv=none; b=rt5Yx89rpXfIf/fmEoelMrckqaSrnfZ3OrcUjfOIk5bWoizEc/bkO5w+Fg7vApFcSqpFmx0sgXbOwVWZm6M6UqMV4yjRY9yjpNiqY6x5sJvm/eL3MGRqwPpHy2/R8a4dZ31VFqIN9QvgSaP7kpJUR30g9zuzdGqGx32IdqoEWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029263; c=relaxed/simple;
	bh=byCRkpmcjLYOiYuZ9sbi5crcjmK3Ichis8Fw/UWZ0gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgYxA94nbOENVKa5SB1SqBqgCL5D2RsIafv9ZHoJsg5rzb2psH/N0NNSwMsC17aUXld9fIpmzCTWVJPCu8bQSEkvO9M1ChbXbMLEe+p5+VG/Xr/pJhP29eEPI9kYYC7pC6rg8+nWtC/NirsuCakEcAMlDbTVqxjS36TS3+J3OI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTafX3XF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53b34ed38easo1175196e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732029259; x=1732634059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XApoDteQx8uwLmT1djRy37kdLKoweLorD9+kK8kGqhI=;
        b=fTafX3XFObAZyuMsqXEblfjYiF2gStJXvv6q7oXGfA5SSmVKJDd0t1nLfdobmoSuNZ
         Q+cYF3e6t+hclfhrSafgT0LtFtOv7FF9k7U0+F6mKMEbNpPipa8aQqBj1y8Ce/6Pq406
         gKWbdSiiYLCN5MY/D+J1ChAtCYxCLTuKZN76Y5qukjnydrNgc9WgLS1mn11Uj5iw3ccF
         N3XxzML01+2m9GvEJFX3T04XzZ7quAFWB4jYUNzGGrkBvutbonvTiNDFtWhE4RTu3Gn1
         U0vovqKSltYLi4fUegJs/Sst6BWWthxDCD+KzRrsL0BbX3r9BRg3AZeoUH3JHoat0MxU
         fWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029259; x=1732634059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XApoDteQx8uwLmT1djRy37kdLKoweLorD9+kK8kGqhI=;
        b=V+gvLPyEjKJA14V4tlb2JPf7EUqbFiRvk8vs8QfVHcYzj8mA3FuewvZOo7StMJ8y23
         mXXAB9zp0UTlYP/UoO6GKwmk+CnJYhbHyIssRJbG0jMLIewblcP08UhhryxEswaTRFGI
         PBOzLZXp5E9iW5NLwa8hIju/lOGu6lxanCga70TN28RLeue6CRleBCCcHPGSe37MJ8OS
         Ol4zMXSOfQsk7Xfe48DZc3TXDnuCVyAEYCN5WyC3vzxDcgWNGHWzHE/Zm616L7nq2YjZ
         OkNpFgy7hvDTUwQRj75fNrE/gJz1VW3T2Sn9jUpQkbD4CanmvjiDlSGuYb3Ofu2Anvf4
         IBfQ==
X-Gm-Message-State: AOJu0YyzJ5MGKwsoPVPeYVN1xSJfB1Cy9GtjuCvUozH28ogKaxd2b+lH
	LT3X4E5MEdECGNWIOxi8CaWBx+g37FOgt5mWosQDx5ru4OmHoJPzWS/Ubw0qtRc=
X-Google-Smtp-Source: AGHT+IEUE1NmZYZC2AMtwb4y1seGjwr4lW0GYMgyKEoTqI2PAHQa8nbgWJxlnLMXfbEliJM6t9Jb8A==
X-Received: by 2002:a05:6512:2389:b0:53b:1625:bcf8 with SMTP id 2adb3069b0e04-53dab2a71bcmr7430240e87.30.1732029258740;
        Tue, 19 Nov 2024 07:14:18 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da2946a3sm196687005e9.35.2024.11.19.07.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 07:14:18 -0800 (PST)
Message-ID: <1aa56690-1cd0-40e4-ab88-9445ad5b1877@linaro.org>
Date: Tue, 19 Nov 2024 15:14:17 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
 <b91972e9-5cae-4a8c-b672-5b8d96d442d5@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b91972e9-5cae-4a8c-b672-5b8d96d442d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/11/2024 14:44, Vladimir Zapolskiy wrote:
>> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> 
> I've forgot to mention that you need to correct the interrupt type
> to rising edge, that's been disucssed.

Ah yes, I forgot about that.

Thanks

---
bod

