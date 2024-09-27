Return-Path: <linux-i2c+bounces-7055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FAC98832A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 13:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AE4DB25681
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 11:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76825189904;
	Fri, 27 Sep 2024 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eM7PUCIE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F211184545;
	Fri, 27 Sep 2024 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727436048; cv=none; b=aJKNHfkv4Jfcv5dKpM34Ty1Pr6WLy9TKFdJrOvPyYrGP5n3VsNhM1m6rSXKzUGe/5+Id+yLvpo8xXE/G6q0mwNhAJQ1L7FfNZZSieNwbvC3GEWGFTkt2/RtOFv0DaCwkjN3P3u6MNjjrmoToKmGC31i7iTpRZQBYeZQw6wc/I6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727436048; c=relaxed/simple;
	bh=sgKeHbNcpyAKUI1elNkL0fBx61mN0MG6AdCqqDPHUhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkXOnDmVWVW9jo03m6X082Rxdg/9nFzl/w0Vca5qxoKBM1ZPtJV44tr3yJq3XPi4h3ChWRz33cGh5iAQ7edBbBe7AQekJb4v7gY+aKbkc5gWrQbBC5lJxv+jOnTBDUyytwlLFfN9AtFbHi1JjSAVwq3VxI2b9rF7P86uKNzRGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eM7PUCIE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41B0C4CEC6;
	Fri, 27 Sep 2024 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727436047;
	bh=sgKeHbNcpyAKUI1elNkL0fBx61mN0MG6AdCqqDPHUhg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eM7PUCIE0o5jmZ6JFjW6Os52mWUpc6DYgeYMS5Pm9RplNaYH/El31hmeme+uzkmc7
	 dO2OinJr0fV3ZS3iFwrjFoNg/CagSlMqVNU8sHUUe2FS9eBjZCkXM87wmR+gWTm9Ua
	 zf+tZI2VrfqQQA16ivNttQa8RFmIjSvbFxGuAgJkfH05m7t+BAS7Rdb8gO4EiFontC
	 UTcN0o4uBXOzqz0oTLAB+Qu9Tzwr6VEGNfeSqcNs5h3+dGYBG3hhG0np0ftQhrobAB
	 YiXvPUZj+Fe0eWaG5wPd2gAUCO/hvjDRXjcMTyqMrMFK1cmNvZleD4gELJj9FW+rrY
	 WCAo3a5ecYwow==
Message-ID: <320e0685-3dae-42a7-a387-75f6f52f4090@kernel.org>
Date: Fri, 27 Sep 2024 13:20:40 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
 Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
 krzk+dt@kernel.org, robh@kernel.org
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-2-quic_msavaliy@quicinc.com>
 <we3wmw6e25y6e4443ndrduurwvkkpvuw7ozrizuys6pwxppwfy@2uq7uda4evhd>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <we3wmw6e25y6e4443ndrduurwvkkpvuw7ozrizuys6pwxppwfy@2uq7uda4evhd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 11:24 AM, Krzysztof Kozlowski wrote:
> On Fri, Sep 27, 2024 at 12:01:05PM +0530, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
>> SE = Serial Engine, meant for I2C controller here.
>> TRE = Transfer Ring Element, refers to Queued Descriptor.
>> SS = Subsystems (APPS processor, Modem, TZ, ADSP etc).
>>
>> Example :
>> Two clients from different SS can share an I2C SE for same slave device
>> OR their owned slave devices.
>> Assume I2C Slave EEPROM device connected with I2C controller.
>> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
>> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..3b9b20a0edff 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,10 @@ properties:
>>    power-domains:
>>      maxItems: 1
>>  
>> +  qcom,shared-se:
>> +    description: True if I2C needs to be shared between two or more subsystems(SS).
> 
> The "SS" and subsystem should be explained in the binding. Please do not
> use some qcom-specific abbreviations here, but explain exactly, e.g.
> processors like application processor and DSP.
> 
> "se" is also not explained in the binding - please open it and look for
> such explanation.
> 
> This all should be rephrased to make it clear... We talked about this
> and I do not see much of improvements except commit msg, so we are
> making circles. I don't know, get someone internally to help you in
> upstreaming this.
> 
> Is sharing of IP blocks going to be also for other devices? If yes, then
> this should be one property for all Qualcomm devices. If not, then be
> sure that this is the case because I will bring it up if you come with
> one more solution for something else.

As far as I understand, everything that's not protocol-specific (in
this case it would be I2C tunables etc.) is common across all
protocols supported by the serial engine.

Konrad

