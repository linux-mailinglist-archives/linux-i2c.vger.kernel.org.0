Return-Path: <linux-i2c+bounces-5957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB4965D5D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 11:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF94528249F
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 09:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBB417A918;
	Fri, 30 Aug 2024 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jICfdczX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE91531CD;
	Fri, 30 Aug 2024 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725011500; cv=none; b=kqgj/fmkmyCMtMA7fvjxPFD9NwpF42GYq0692v6/VicGceMPphlzJfXkSNDkgBOlnCJ/wmXk1FfNfrwMGCWO/9NqSDQWxg5EswDNaEy9fUHphF/l9uXXK1evBOgB+5duMr1HyOWYZmFa6StplkwKzDh8Tto+B0XPNGxk++1USR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725011500; c=relaxed/simple;
	bh=NDukMRi0OurMDQvb5Qn4QuwFUZUeJJQIQoFalgKICzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1pm6g9KKFmLKPAK422LO1MB6gKcsUfBgnzNfoWgcj0zJnSsIbqgb+/QZcEYkgjRTfEU8biR2OxwxU4DZxlw8k4ElzKDekExeCQ06SmGHC8EiuhO4e1UtKfTbiffVbBEOchyEKIS9pTnURVyq8zpCZBElR4caWqWfrAQuKH1djM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jICfdczX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981B9C4CEC2;
	Fri, 30 Aug 2024 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725011499;
	bh=NDukMRi0OurMDQvb5Qn4QuwFUZUeJJQIQoFalgKICzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jICfdczXbXRdkEcM9Xcn4s8UALWsaTcW+IxWBMT057MQ09wJVZduiDaJVbGZoks9I
	 S5Iw6ni1FK8QoyFwfn2TarwefKowsrASoq1u2Gz5Dmf4AVVtMfF3u/1QYP7mMiWDyG
	 FvSNza0qF9lYEVEsk9Um162KDVu2Zzue5dp1rqws5KLWyj1w+d63Bbg88CGdSnJr8T
	 r2pmxgVPrAOxoSSzJOsodyUEp4psJVqEW2PPPTRiYwuPRjhu9uqqvU63u81uN7NIzD
	 8ViVemtWP21Zqmcw0IkAmjyF+GeGqXNasiXqm6oQFCr+yPTvXUmTNuaZKvy3exh10e
	 WPLYsJFx+M3lQ==
Message-ID: <095f5048-5c39-438d-b5a9-7519199a8e9f@kernel.org>
Date: Fri, 30 Aug 2024 11:51:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] arm64: dts: qcom: Add reduced functional DT for
 SA8255p Ride platform
To: Nikunj Kela <quic_nkela@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com,
 andi.shyti@kernel.org, tglx@linutronix.de, will@kernel.org, joro@8bytes.org,
 jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net
Cc: robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com,
 lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com,
 agross@kernel.org, bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com,
 robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com, quic_tsoni@quicinc.com,
 quic_shazhuss@quicinc.com
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-23-quic_nkela@quicinc.com>
 <746be896-8798-44b0-aa86-e77cf34655e1@kernel.org>
 <57eee144-cdc4-48e7-838b-103cda6ec1dd@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <57eee144-cdc4-48e7-838b-103cda6ec1dd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2024 21:06, Nikunj Kela wrote:
> 
> On 8/29/2024 12:49 AM, Krzysztof Kozlowski wrote:
>> On 28/08/2024 22:37, Nikunj Kela wrote:
>>> SA8255p Ride platform is an automotive virtual platform. This platform
>>> abstracts resources such as clocks, regulators etc. in the firmware VM.
>>> The device drivers request resources operations over SCMI using power,
>>> performance, reset and sensor protocols.
>>>
>>> Multiple virtual SCMI instances are being employed for greater parallelism.
>>> These instances are tied to devices such that devices can have dedicated
>>> SCMI channel. Firmware VM (runs SCMI platform stack) is SMP enabled and
>>> can process requests from agents in parallel. Qualcomm smc transport is
>>> used for communication between SCMI agent and platform.
>>>
>>> Let's add the reduced functional support for SA8255p Ride board.
>>> Subsequently, the support for PCIe, USB, UFS, Ethernet will be added.
>>>
>>> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>>> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile           |    1 +
>>>  arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
>>>  arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |  149 ++
>>>  arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi  | 2312 ++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 2405 +++++++++++++++++++
>>>  5 files changed, 4947 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi
>>>
>> ...
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>> new file mode 100644
>>> index 000000000000..1dc03051ad92
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>> @@ -0,0 +1,149 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +#include "sa8255p.dtsi"
>>> +#include "sa8255p-pmics.dtsi"
>>> +#include "sa8255p-scmi.dtsi"
>>> +
>>> +/ {
>>> +	model = "Qualcomm Technologies, Inc. SA8255P Ride";
>>> +	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
>>> +
>>> +	aliases {
>>> +		i2c11 = &i2c11;
>>> +		i2c18 = &i2c18;
>>> +		serial0 = &uart10;
>>> +		serial1 = &uart4;
>>> +		spi16 = &spi16;
>>> +		scmichannels = &scmichannels;
>> Nothing parses this.
>>
> We are using this alias in bootloader to speed up the parsing. Since we

Then please provide link to the bindings in this open-source upstream
bootloader.

Otherwise it is a clear no-go for me. We don't add properties because
some downstream wants them. Imagine what would happen if we opened that
can of worms...

> are using 64 SCMI instances and SCMI smc transport driver for
> Qualcomm(drivers/firmware/arm_scmi/transports/smc.c) expects
> cap-id(created by hypervisor at boot time), our bootloader gets those
> cap-id for each channel and populate them. This alias is an optimization
> to save boottime as in automotive, boot KPIs are critical.

I will refrain about commenting on KPIs...



Best regards,
Krzysztof


