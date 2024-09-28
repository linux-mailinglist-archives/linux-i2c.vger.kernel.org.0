Return-Path: <linux-i2c+bounces-7069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51561988F04
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 12:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BFAD282026
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEC717F4F7;
	Sat, 28 Sep 2024 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q2i/naNj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C1C185935
	for <linux-i2c@vger.kernel.org>; Sat, 28 Sep 2024 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727520404; cv=none; b=qV+CKK61EMb8NlQE46eq42htgHelk8zYOxjlNFchnUXkdiWz9dLWWGSaCwl3NAAYo/8CElsF923WkjBFOO6QU3OVk/Mlsh0WXej3/H+RPUEmqHKGJmr55B0whN4Jgas1XDsQbHJxaK5JOVRr1QA2m/mQxsr7dgfVjcD9T98bUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727520404; c=relaxed/simple;
	bh=Ei6/ccAdpO9+K8ToXprbjnDvfcVFhhzoN0+sWM3un3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCAMELJZXQpCaHIT3zkjWFq+4sETFi9hcAez3D9kOfJlTSwbGOimhPoQmbx7NMuZqvFlySvsPv9EkAok1dfSVZ3Q+onNlO+xohX5a+CqrL02cgkZHaLtMb1mOJM9qBHRJmatccD1nInMtrSqs96a8GP+48dQEGFVfkFMBLgMv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q2i/naNj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398f62723eso12710e87.2
        for <linux-i2c@vger.kernel.org>; Sat, 28 Sep 2024 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727520400; x=1728125200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXl4k8mZsxgHoI3VWw6PVnVAQPFUA35ZT1bf6htZGpw=;
        b=Q2i/naNjF5E89/ugKAV7A5ioLVfKbTsnt/K6+sbBksI6Kcp/4uFm3a4Mrxy0vR2UGO
         FCNexXdm1RCaPY2NZ0Sd0UlOGi6Br4xTKcq+45Om36KAJ8VHCox/HNPCt0zdL4x+N7hl
         4j41uORW0UzfYY6CJH+QOM4zmiVPDLJIZiiBnl8/7xQSogv9qdanValGxq1TJtqzzED+
         w4ROtf8l60IYA58P/22jU3DBkiSztZB0X0VWjnTEhY77NFX97aiy+OLpgEziehrEwZvP
         8kccJFFqU2MbdgpX4FrD9D090Gx8ogL3aqh07PvTVCPdVsxma55oDjx7Ewp2N6HZtFTD
         RZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727520400; x=1728125200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXl4k8mZsxgHoI3VWw6PVnVAQPFUA35ZT1bf6htZGpw=;
        b=Wb5eEU+ptoyQBBFCJEu2xkp4/jGC6QFuTxotsAk+ZYyQwsUD+5zg0hyetx1ur/NeTH
         BIkU+yQcdNrB2bkhCvEfcZ2UI5gBaaAd484nsl7ipHZ0WHC81iWOKzEk4q+l4usswsFY
         oKALbc+oLw9GtY52MOIVnxkDffQe92PO6gXHZPLMR0FZJAs1DM7kfAslXCkUHX0oKmjU
         3XrGZ+gvpi+JNd2KjFMWpgiuf/ay0+xx6NqAxziO8neEr3h/s3lVveMBb9yVECVIfqqW
         NI7XdB5ZVX0vU7So9m6/5ZVR+nEMXt6WoZZVDL2WcySCXaPwwGzNX8waKbf/IdhjtfCo
         J9/w==
X-Forwarded-Encrypted: i=1; AJvYcCUuKuYBambALS1/RrYd8GD3dctEyVFlI+bQsFvds39tN8AE9Iouxpxj8TjVTiv+B+Jg6LTe3ffVOS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8upjwAy4EcJY2iifLZGPNo0DfxJA1jGpUQ7+MpoIBil7ecRcS
	8nogeAat/NQqAXm9yGOS8qeESi1iVDtJfgn2ossNArBQblA3VdGaUvKJmDXkSu8=
X-Google-Smtp-Source: AGHT+IGsmYsnTJi0UA9gkkFBqJigGWkiZumRwMsuVRnPqYW+9Inz7cEUrpbiw3sVbiDeWsbzm89sxQ==
X-Received: by 2002:a05:6512:1396:b0:52c:def2:d8af with SMTP id 2adb3069b0e04-5389fc430a0mr1143476e87.4.1727520400331;
        Sat, 28 Sep 2024 03:46:40 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a0458ffesm610795e87.300.2024.09.28.03.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 03:46:38 -0700 (PDT)
Message-ID: <f8d1ef2d-3bf8-4c34-914c-7c3277264751@linaro.org>
Date: Sat, 28 Sep 2024 13:46:37 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
 <ZtpqrANbJurWNOzV@radian> <5c58b41a-7fc7-456d-979c-edb8dbe4305d@linaro.org>
 <a27adb94-5280-4213-a532-0dcc907f80b7@linaro.org> <ZvcwbCh97WKnvarS@radian>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ZvcwbCh97WKnvarS@radian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard.

On 9/28/24 01:23, Richard Acayan wrote:
> On Fri, Sep 06, 2024 at 04:00:32PM +0300, Vladimir Zapolskiy wrote:
>> Hi Bryan, Richard,
>>
>> On 9/6/24 15:19, Bryan O'Donoghue wrote:
>>> On 06/09/2024 03:36, Richard Acayan wrote:
>>>> On Thu, Sep 05, 2024 at 10:09:34PM +0200, Andi Shyti wrote:
>>>>> Hi Richard,
>>>>>
>>>>> On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
>>>>>> This adds support for the camera subsystem on the Snapdragon 670.
>>>>>>
>>>>>> As of next-20240902, camss seems to be a bit broken, but the same series
>>>>>> works on stable (although it is much less reliable now that the CCI clock
>>>>>> frequency is not being assigned).
>>>>>
>>>>> I am not understanding this bit: is this series making it better
>>>>> or not? Can you please clarify what is broken, what is less
>>>>> reliable and what works?
>>>>
>>>> When applying this camss series and some camera sensor patches on
>>>> linux-next, the Pixel 3a seems to hang when camera capture starts.
>>>>
>>>> When applying the same patches on stable, the camera does not cause the
>>>> Pixel 3a to hang.
>>>
>>> Right so -next isn't stable that's not exactly a revelation.
>>>
>>>
>>>> When these device tree properties from the previous series were removed:
>>>>
>>>> 			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
>>>> 			assigned-clock-rates = <37500000>;
>>>>
>>>> the CCI would sometimes fail to probe with the error:
>>>
>>> Right, we don't have clk_set_rate in the cci driver.
>>>
>>> Maybe just leave the assigned clock for this submission and we can do a
>>> sweep of fixes to CCI at a later stage including setting the clock
>>> instead of having it be assigned.
>>
>> first of all it would be nice to confirm that the setting of a particular
>> clock frequency is actually needed.
>>
>> Fortunately it's pretty trivial to check it in runtime with a temporary
>> modification in the board dts file, namely disable CAMSS in board dts file,
>> but keep CCI enabled, then simply scan the bus with a regular "i2cdetect"
>> tool in runtime.
>>
>> If i2cdetect on the CCI bus works only for 37.5MHz clock frequency, then it
>> is needed, otherwise (and this is my expectation) it is not needed neither
>> in the dtsi files nor in the driver.
>>
>>>>
>>>> 	[   51.572732] i2c-qcom-cci ac4a000.cci: deferred probe timeout, ignoring dependency
>>>> 	[   51.572769] i2c-qcom-cci ac4a000.cci: probe with driver i2c-qcom-cci failed with error -110
>>>>
>>>> On further testing, the rate can be set to 19.2 MHz, and there would be
>>>> no failure (or rather, it wouldn't happen often enough for me to witness
>>>> it).
>>>
>>> That's expected 19.2 and 37.5 MHz are supported by CAMCC for your part.
>>>
>>
>> I read it as the setting of 37.5MHz clock frequency is not needed, please
>> correct me.
> 
> It is not. My test setup just needs specific EPROBE_DEFER behaviour
> (my setup being postmarketOS with a full-disk encryption password prompt
> and camcc-sdm845 loaded after mounting the root filesystem).

Good, let the assigned clock frequency be dropped from the dtsi file then.

> In drivers/base/platform.c, the platform_probe() function calls
> of_clk_set_defaults() then dev_pm_domain_attach() prior to probing the
> driver:
> 
> 	static int platform_probe(struct device *_dev)
> 	{
> 		...
> 		ret = of_clk_set_defaults(_dev->of_node, false);
> 		if (ret < 0)
> 			return ret;
> 	
> 		ret = dev_pm_domain_attach(_dev, true);
> 		if (ret)
> 			goto out;
> 	
> 		if (drv->probe) {
> 			ret = drv->probe(dev);
> 			if (ret)
> 				dev_pm_domain_detach(_dev, true);
> 		}
> 		...
> 	}
> 
> When handling the assigned-clock-rates property,
> of_clk_get_hw_from_clkspec() eventually returns ERR_PTR(-EPROBE_DEFER),
> being propagated all the way.
> 
> When handling the power-domains property (if not avoided by deferring
> with the assigned clock), __genpd_dev_pm_attach() returns a value
> returned by driver_deferred_probe_check_state(), which is immediately
> -ETIMEDOUT.

I grasp it from the problem description, thank you for the explanation.

For sake of simplicity please make camcc-sdm845 as a built-in driver while
testing, it will allow to progress with the platform CAMSS support.

The issue with the observed ETIMEDOUT is generic and it's kind of unrelated
to the CCI/CAMSS support on SDM670.

--
Best wishes,
Vladimir

