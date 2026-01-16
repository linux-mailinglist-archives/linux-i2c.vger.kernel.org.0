Return-Path: <linux-i2c+bounces-15219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E50D2EEAB
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D53A300E62E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53F6357A5C;
	Fri, 16 Jan 2026 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gp0zeZZY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABCE3587AF
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556577; cv=none; b=HqUSwyJMOj1RjvBxVC1RbVeYVIA+h8Lx++uBGRMLRuPhfYv4zILWon1ZZHTpRhvutAuNgNvkURmd5MOWNNbMcUGCrSAmBQjYD0ISygv2iZ0rNkxecMT91gKmCI8I4V/JmXbnLA0zIemDg72Jx707SI/bPfd/r8EYhy178GltL3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556577; c=relaxed/simple;
	bh=vP063z1xuHc0hC+vX2dzTXC8+KnCaJkWrtP6q+wirGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9jZMHaPMOrwtajioyCglqOI5jKS3O6uLCWxfPkG623dz+3BPytGdU03AJTBU4wnVKEybs/QxxAzDHf5PBfWeur9Cih+3UO1aBuerNlQZz+Wj48kdqG+F0yDndLni0BIwqT0yDzuGZ8HU8gRwZAdwLVrdTPq9W1C8jYDambxMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gp0zeZZY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b7321e7c3so143488e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768556573; x=1769161373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABv8OdJi32Gg0FcjWxhtSwfXTwcweC/Wx9N7YPA9N0A=;
        b=gp0zeZZYrj1/zYXHzJDDYiuBvXCoy9s8aD6w+TJDlc+tpRTXp34RSryHZZA6l2QDZK
         0NEPCb4vL478nPCv1vrxi8ZtO0DVwJ7Qp7gxHjDrmTGuV7g7+7OLuo3IUqhJFE6PuWnN
         TS7w1UxUV167cXJixdEwadjkugBCyvoAoeE0t9+1zfwaERcki3CTVhMpa4garcdwS6aM
         8ZWmcmBpURgjNaup+7Dw8jdoJ2C1RFqIT4icJKo3AxiUBEazxQl5/vMMW3b9//X8CNl5
         HpnrAIM5hVNxqSzy2a+Sxb/ZosECMdL8p/+fpJ1/EvTUrbjlhPDR1sYW9sgAj+3nU49p
         JdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556573; x=1769161373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABv8OdJi32Gg0FcjWxhtSwfXTwcweC/Wx9N7YPA9N0A=;
        b=ujWbhM/F/lmvEX9o59/sU0TJnDgEVIUq1aOGwtwRweFJJp5gG9Oj+gkcHx+pkKDHEb
         ilw3PeSDD4/3ew93Um8Ki8BJ0v5MLUyZ2Qfm/xs+/EP9rOhlhhz4YscgNrgL6M7RTfal
         z35B+7Za/OBboDy8en0/3yWa8msU8iL6KbByOwpvhVeaJ9fFGVO0gnn4tJJh9KYQuMhN
         AvA44SHtN9ZNXqO0sGafpXw+wWIEuph9JlqvW1kudk3G9X4XQQA7o4SQ0wUNwZdC8tYs
         CRLewC0mfozZcBes4PJa6sgSjOFzf86zEG9YFn0b/O5ycgZ0HKGv6AWmCfXgv/IQDb6o
         9ARg==
X-Gm-Message-State: AOJu0YzgfiBdSbz5sRxMb5JHaKezdWXzHep+5bty8tZj1PIaG7dhc1ue
	Ff39/T7vATsmzTUhb6j1u6MjaB8oPgXHuhEcHrJTmBP9C2Y9Fz/uYsDeHBOfbAWmzb0=
X-Gm-Gg: AY/fxX6w77HnOwcZQmt6Kxf2kwUDVXvQuqfC0jxttgFmAQD4iLkHDW1buhRhmlHmHCM
	CKtMtKjbDKjeXJ9Tkjn2V2RyrskomfMlHOfuF4VER0YI74YvoJVOxMr7fVf4Xla2GwvEYq7Pln+
	b+c+FkjQWsmiOA6Us7G4kqArXEQi9W1fJmFqwg3ImOtKFT1D3JDWe4llZT4XDplKzBxUWdMWcDj
	1Krp2zHYEhb/uvt4DnvnUuQyngCmv83GXtVBG3XFhFB4grBXv1mB34J+xY7j9B2Vldf3mjfx/s1
	wOdv6t+8c8Zr8472280VU/N0TRez1wddLUDJyjR5+eAdzGfDkqb70tcEytNtEVOVRguGJk1Qqb9
	3A2EYPHuGzhZ+HfOD5CRRu7aSbLar27UY1nrhzqdr/M1tNz4uAUSlX1/0Bzs/hqX9fv4EAw5uXQ
	EOkhGKc2mCAa5vAvKyP3Qg2bg9G5STkQJx6jApsi4lJ/pNKtQvcCvHNlokTlXyRsFLuQ==
X-Received: by 2002:a05:6512:1514:20b0:597:d790:a1a2 with SMTP id 2adb3069b0e04-59baef18155mr314794e87.8.1768556573145;
        Fri, 16 Jan 2026 01:42:53 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e82dsm618507e87.11.2026.01.16.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:42:52 -0800 (PST)
Message-ID: <e081fa74-9e0b-4e54-a51d-eee97ae6f4fa@linaro.org>
Date: Fri, 16 Jan 2026 11:42:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
 <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/16/26 11:32, Wenmeng Liu wrote:
> 
> 
> On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
>> On 1/15/26 12:12, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this DTSO has enabled the Arducam 12.3MP
>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>>    .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++
>>> ++++++++++
>>>    2 files changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>> qcom/Makefile
>>> index
>>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
>>
>> Please remind me, what does dtbo-y Makefile target serve for?
> Rob mentioned:
> https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/

It'd be better to ask Rob about it, I suppose that the concern may be about
a missing in the qcom/Makefile mechanism to build standalone .dtbo artefacts.

> I checked, dtbo- is not an upstream usage, it will be updated form

Right, that's why it attracted the attention.

> dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.
> 

But...

>>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera-
>>> imx577.dtbo
>>>    talos-evk-lvds-auo,g133han01-dtbs    := \
>>>        talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb

it's already here and it was here in the previous version.

-- 
Best wishes,
Vladimir

