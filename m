Return-Path: <linux-i2c+bounces-14683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4ACD699D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 16:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E676C30133FF
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 15:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A10149C6F;
	Mon, 22 Dec 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbo//aU3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399A31AAA3
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418322; cv=none; b=iFD+nN4XuTeFqk0GpOtH5cn+SLxRW/TMOTef9pvu7YfMC0Ewkzq5Ez6deqA/4J/gTLInazYWKUl++38nUBqWHmy5Rylij5EmCh8Ed98YlVKrrj2n20Q+Tj1ZgTv+5umXykGLPOnoMQWsx3a3GERzHtK16Udyj9zWqjPQgDSMe30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418322; c=relaxed/simple;
	bh=tGcJJtQIWOQL7kqmOQjdpBhyQjgqnzYpX8nXShFX66k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxJYMUGiVv2yVm/gPUsRhuwcSU//BfUoLaRKKrcfg1UNtD+JcwtqmF+gxwy1I/IHELqQ/g72eWNbdRer8qBQ1wLd9OkgbS9JFHy/vErlCbTXKHz1ich7t0vVmRjeU7RzW7S9vDarrj6N80raFjpAnZZVq/EhDdOtodPoTE9708Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbo//aU3; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a990ec4e5so4255441fa.3
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 07:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766418318; x=1767023118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMuqFt6V0IzeFc5cbPsgJJwBQ8b3x0/Nca76P9XgoyE=;
        b=lbo//aU3vEZOiIVVQLR1X/wUKhE/VPS+Mc+W+Pd5dOKlUb+qx/jj2GwjF9s/3X7I90
         owFtPyJimOqhA/Nkr13TKqw3fzfXtylp94DzB833WwCCxPjbxgeAsr8Az5smMWVhBzsK
         VvuJN/7pohCYKzik+a+x1zhYZyj9zitGmdG+MTUTMRzrADCBK6kByMiP45Iu4bblC0wV
         NnaQGzDeZ7NUHAP681PB60uvIYRkoFcv8E1gJjdAUZT7zQwwdxdBlnPPaa//Na5tIpnS
         gROLyzCL84oHIfdnPdCDVW8U5kgFH9Bsbs68Fqc+RFbr0lNi2TQeRdLBrRXvbT9FQs3+
         6Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418318; x=1767023118;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMuqFt6V0IzeFc5cbPsgJJwBQ8b3x0/Nca76P9XgoyE=;
        b=fZwee7lZlFISb4dSVZLdhlm3oh1u7GcqQJlX2FJtnKwVzyTCC8ZDyoFRXhnR1f1koJ
         rgautwvoyKJ6363RvJMySyBCQ2B1yWS53v21tcKSyM9qo4H26SrZjw9GoGbKUf0FHAbI
         C1TlvuJsd1hRXmoHLM2lS8ZL7ObN12voJmo/26WjTk11ODF5BIPuZOCQC1F87/zU5+7t
         H0FX42cVnIq+GIPrKRzhg2VR/qDAWwG37AZKNUtkQcCVG6mhr9TLrbw503hiMsvkljij
         eLl/9wvHbKlLQe15kaPxwVorKRaOZ1g+2l5sjBdxwphfdDiIj3UOXyKurTNN3u/N+KKy
         6iSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy7xZ7j3hRBLq/7UyfPc+6qDN7HkmZvPmoQ8kNCsnBfXhwyWqQi46NwhcVm7qqTxzARumqcZuAiYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ozjAmEl5vIeJ3FooybBfzX+lvU5G50acXSuBLVQdnOeaRNN4
	y+2ecjbbdPlAmWGf2v3O/vvefGm77ocBPKuJmZ9YnViT22uDPP+iZ77jsRakSxU8AO8=
X-Gm-Gg: AY/fxX6zR0pCRMFhYCyv1Ctfu4cVOPO5eXDaAl1TQG+TA4CaoBymSLShreApCnNd0VS
	eJnNw/Oo8IE0+pjnWlragx3bTK5duO0+Syjh6U4lC6HDTpBLc0Gz/py50Dt+qUHOQR9mPfpZ69A
	kKc+HY70FarO8p7xDgpkBN3+2TuX+/KWsRn2XqdNKQG/avwtgiJ5NYbv7Ajm7TTuI1JPi+dTofb
	2uqAZLR0EXZL7O3hpfJtdc0rKF97ga3aQp7IHG/KWVWFD9osRf5qMQ9qtKe9A8/YFYZsYp/kOwp
	ssWgcv90UmTHDDDRIwRoWve3BQcj8wTQYSozV0R1Gvfv60A4Mp8sh21LWxdUvTbwXePoalbLYbU
	VUYLtrLX0FRJ/lI4+6sjgByrD+llootfIFBcUUzEvTXH2VoJwSymN4GgqxSTKz7CwDn5M0e0IDU
	Q53lFsoeMpGhoPplZvRHGzICEvvv14mLSX+NTRv2ATqeK+CYiO4lRUlclYbWG05fA+hg==
X-Google-Smtp-Source: AGHT+IHEreMefgVZs02UZwhZN/8T0ly29BM+V8xxSKTeK3gzyXwjk92eE8YSbX1LnQ/PYAR4eL/7Kw==
X-Received: by 2002:a05:651c:1542:b0:37e:6e31:c9bc with SMTP id 38308e7fff4ca-3812173480amr20316101fa.8.1766418317548;
        Mon, 22 Dec 2025 07:45:17 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f85dsm3255925e87.73.2025.12.22.07.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:45:17 -0800 (PST)
Message-ID: <091b863b-fa0a-4d3c-8461-60cdc4970992@linaro.org>
Date: Mon, 22 Dec 2025 17:45:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
 <cfb8f192-b327-4bb9-993e-a28184571712@linaro.org>
 <703a502c-883d-434a-8bcf-f785080f5102@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <703a502c-883d-434a-8bcf-f785080f5102@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/22/25 13:41, Wenmeng Liu wrote:
> 
> 
> On 12/22/2025 7:19 PM, Vladimir Zapolskiy wrote:
>> On 12/22/25 10:44, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this overlay reflects the possibility of
>>> attaching an optional camera sensor.
>>> For this reason, the camera sensor configuration is
>>> placed in talos-evk-camera.dtso, rather than
>>> modifying the base talos-evk.dts.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>    arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 64 ++++++++++++++++
>>> ++++++++++
>>>    arch/arm64/boot/dts/qcom/talos.dtsi            | 21 +++++++++
>>
>> Please split QCS615 MCLK definitions change into a separate commit.
> ACK.>
>>>    3 files changed, 87 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>> qcom/Makefile
>>> index
>>> 60121f133078b2754f98e6f45a3db4031b478cc8..b1d85b1f4a94714f2a5c976d162482d70ae920f2 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>> +talos-evk-camera-dtbs        := talos-evk.dtb talos-evk-camera.dtbo
>>>    talos-evk-lvds-auo,g133han01-dtbs    := talos-evk.dtb talos-evk-
>>> lvds-auo,g133han01.dtbo
>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>>    x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>>    dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-
>>> el2.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/
>>> arm64/boot/dts/qcom/talos-evk-camera.dtso
>>> new file mode 100644
>>> index
>>> 0000000000000000000000000000000000000000..ae1a02295b4dc48212aad40980a329ff458fe69a
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
>>> @@ -0,0 +1,64 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>
>> Please add a missing year of the change.
> Now our requirement is a yearless copyright.>

Ack. It's a lawyers' domain anyway.

>>> + */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +&camss {
>>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>>> +
>>> +    status = "okay";
>>> +
>>> +    ports {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        port@1 {
>>> +            reg = <1>;
>>> +
>>> +            csiphy1_ep: endpoint {
>>> +                clock-lanes = <7>;
>>
>> Please remove 'clock-lanes' property.
> ACK.>
>>> +                data-lanes = <0 1 2 3>;
>>> +                remote-endpoint = <&imx577_ep1>;
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&cci {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&cci_i2c1 {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +
>>> +    camera@1a {
>>> +        compatible = "sony,imx577";
>>> +        reg = <0x1a>;
>>> +
>>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>>> +        pinctrl-0 = <&cam2_default>;
>>> +        pinctrl-names = "default";
>>> +
>>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>> +        assigned-clock-rates = <24000000>;
>>> +
>>> +        avdd-supply = <&vreg_s4a>;
>>
>> Just one voltage supply?
> yes, 22pin camera module only have one pin for power.>

It's common that mezzanine boards are supplied with power from S4A or VBAT,
I've never seen a camera module supplied with just one voltage regulator,
that's why it attracts attention.

What is a camera module here, is it on an attachable vision mezzanine like
on RBx series or a part of Talos EVK PCB like on QRD series?

If it is a mezzanine, the support of mezzanine boards should be done as
a DT overlay.

-- 
Best wishes,
Vladimir

