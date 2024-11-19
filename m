Return-Path: <linux-i2c+bounces-8033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBCE9D2242
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 10:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A351F24B47
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 09:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B54A1B4F10;
	Tue, 19 Nov 2024 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXqjVkof"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DD19D07A;
	Tue, 19 Nov 2024 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732007639; cv=none; b=ctJKWtOmEbpPK5xMDgBFyFo4n9JARnlt9ZiZIODCZYTDlMVJCuCVSJlesAmial4doAmSiSiInhY7hNrkE6CFmSnRKanlIsNUaTlBaS2kvDeII4EpacUJnev02a2bD1z+qCvIhUIlZNaIKEKD0Aac/lE0lWBBVGwr0hWK6oL139Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732007639; c=relaxed/simple;
	bh=2VZx2V9CVxqf2nW+fj+4T81hvTJdFCbYTV71NmDqQeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzOjjvtxR3JkeRTfyviMbUzgeLanQo88KriJztcmRkq5WwTqppmNNNdzmx6llKlMh8q1xR6V2YtsaYgzwuL2x/gbm26bIvRMDigMEP4lR/BmYziy3dA5bJ+AI3nVbPfd1MDedPx+qGrzjoIwZuhzQ7yexr2oCabowgDFPsKwx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXqjVkof; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E438C4CECF;
	Tue, 19 Nov 2024 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732007638;
	bh=2VZx2V9CVxqf2nW+fj+4T81hvTJdFCbYTV71NmDqQeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CXqjVkofP/0q91qDo3Ommx4z8COey/ZCvwj/8e6JY14iGyYrPHZ2PSFQREUT02yJa
	 rJajENc59J2Vbx3+4VgQZMoUKdL1xDjVDdkOM7tLgUFa4rLgji3BMGAan30Tx2mABY
	 pW1L1aeuB4QHCA9QR+x1NuukkKDCpzjNTVrGore/0Pj+UgFIYYYgudZhjXKiTLw94Y
	 uQGuN99ig4d1/EBV3ZaA0RvGBaOoSg0AmB/K0m1BGoK221mhtLTrnE4Lv67pweIj9/
	 PMjclUbrMePquPrs1Uv5BsedP9egllo/Rg4sNqUeKNMyWlL/07RdCbjc3huwC336Gf
	 BdjN2M4Kq6IVA==
Message-ID: <9f347e95-7ce1-4339-9ccb-6bf2962d09d0@kernel.org>
Date: Tue, 19 Nov 2024 10:13:50 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
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
 <6d81d8e7-ecd1-46f0-8ca3-617b5ee96990@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <6d81d8e7-ecd1-46f0-8ca3-617b5ee96990@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2024 17:08, Mukesh Kumar Savaliya wrote:
> 
> 
> On 9/27/2024 2:54 PM, Krzysztof Kozlowski wrote:
>> On Fri, Sep 27, 2024 at 12:01:05PM +0530, Mukesh Kumar Savaliya wrote:
>>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>>> controller needs to be shared between two subsystems.
>>>
>>> SE = Serial Engine, meant for I2C controller here.
>>> TRE = Transfer Ring Element, refers to Queued Descriptor.
>>> SS = Subsystems (APPS processor, Modem, TZ, ADSP etc).
>>>
>>> Example :
>>> Two clients from different SS can share an I2C SE for same slave device
>>> OR their owned slave devices.
>>> Assume I2C Slave EEPROM device connected with I2C controller.
>>> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
>>> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> index 9f66a3bb1f80..3b9b20a0edff 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> @@ -60,6 +60,10 @@ properties:
>>>     power-domains:
>>>       maxItems: 1
>>>   
>>> +  qcom,shared-se:
>>> +    description: True if I2C needs to be shared between two or more subsystems(SS).
>>
>> The "SS" and subsystem should be explained in the binding. Please do not
>> use some qcom-specific abbreviations here, but explain exactly, e.g.
>> processors like application processor and DSP.
>>
>> "se" is also not explained in the binding - please open it and look for
>> such explanation.
> Sure, i thought cover letter explanation is good enough. I will add it 
> per patch as cover letter will not be visible and go away after merge.
>>
>> This all should be rephrased to make it clear... We talked about this
>> and I do not see much of improvements except commit msg, so we are
>> making circles. I don't know, get someone internally to help you in
>> upstreaming this.
> Let me retry to make it better.
> Will make SS (subsystem) to system processor (can be APPS or DSP OR any 
> other).
>>
>> Is sharing of IP blocks going to be also for other devices? If yes, then
>> this should be one property for all Qualcomm devices. If not, then be
>> sure that this is the case because I will bring it up if you come with
>> one more solution for something else.
>>
> IP blocks like SE can be shared. Here we are talking about I2C sharing.
> In future it can be SPI sharing. But design wise it fits better to add 
> flag per SE node. Same we shall be adding for SPI too in future.
> 
> Please let me know your further suggestions.

You responded 1.5 months after my message.

I will provide you suggestions also 1.5 months, when I dig the context.
Oh wait, all previous emails are long gone from my inbox...

Anyway, my above comment stands for all Qualcomm reviews: stop coming up
every month with twenty different "shared IP" properties.

Best regards,
Krzysztof


