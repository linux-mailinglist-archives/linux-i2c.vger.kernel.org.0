Return-Path: <linux-i2c+bounces-6473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D2972FC3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F021C2474C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554AD18EFE4;
	Tue, 10 Sep 2024 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6vvpYv6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4418C914;
	Tue, 10 Sep 2024 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962051; cv=none; b=hSCjQl+yPa7vzuA9EVJcbEmB5wENa71MUeLIj3XogKaFDpkFhOO0ASefcw4Nrlk4+HKlXolP2BwyKFQSUQig5+V9klHQyCEwcJLxPSn3aeyOs+zusTzjb+YrEaEz9CtIGVdTdUEy7aGf7x8rIcblOYwJb404MXsEZa7JghCdZ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962051; c=relaxed/simple;
	bh=o+cNj60wCCmzXHOvj60mxWGaujKjMQ2WA9gXXGiMS+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbeQb2b9FlIEMeGaDCykssmKykt8sGbPSFkDAbr/taG83DPZVDqp/iVZ55BwsCE4MPCMEiArdV8cvqRvI+qG0eqtU5npj4NMAT/N9kWq4grPLLrD3cZZ4PsCx4mol63yxllDAlcyxQJOiuxq10DfGG4Lpqnu5uWMvt0lu++2hMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6vvpYv6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73577C4CEC3;
	Tue, 10 Sep 2024 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725962050;
	bh=o+cNj60wCCmzXHOvj60mxWGaujKjMQ2WA9gXXGiMS+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i6vvpYv63/nCh3R/WgxCyMoFhuQAK9/EE7ZzzcWwlsc0wK1qK24QRfcMl9dVez1iB
	 SwoTNuMo+nEQ94cdBGulT7RM5diKd4pWH9rdqwMGiHOGJ3QbtYx/AY5l/93zRhMG5y
	 KR93IVgUz3mDRRFfL5q2uV/nk7S0kxNUx5OSYcgSr5snlSN4YK9jbdc7yEw3Pear0+
	 aFgiJD5zknWKI+EMj25nakIMvlwGyBIRv0iqvGPvDVLtMMajnkuc6uuhbMcDJb61bZ
	 zPudzFWX91qFcXlC0udLKRfshdRJHvg0kP7n6KZzDTRYJUmo8bg93GdVoBpMTPMg2d
	 ADFJTM1Udt4Fw==
Message-ID: <bb9e6ba2-4aeb-40ee-b123-9c59a0efa098@kernel.org>
Date: Tue, 10 Sep 2024 11:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
 Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-2-quic_msavaliy@quicinc.com>
 <6a6fc102-a18c-4ae3-9104-59eb3172f407@kernel.org>
 <9cc7d427-34c6-45c2-a747-f71112833773@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9cc7d427-34c6-45c2-a747-f71112833773@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2024 11:09, Mukesh Kumar Savaliya wrote:
> Thanks Krzysztof.
> 
> On 9/7/2024 2:34 PM, Krzysztof Kozlowski wrote:
>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>>> controller needs to be shared between two subsystems.
>>
>> <form letter>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC (and consider --no-git-fallback argument). It might
>> happen, that command when run on an older kernel, gives you outdated
>> entries. Therefore please be sure you base your patches on recent Linux
>> kernel.
>>
>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>> people, so fix your workflow. Tools might also fail if you work on some
>> ancient tree (don't, instead use mainline) or work on fork of kernel
>> (don't, instead use mainline). Just use b4 and everything should be
>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>> patches to the patchset.
>> </form letter>
>>
>> You already got this comment, so how many times it has to be repeated?
>> Your process is just wrong if you do not use the tools for this.
>>
> Sorry, I was already using scripts/get_maintainer.pl but i kept everyone 
> into To list (That's my mistake here). I shall keep maintainers in TO 
> list and rest in CC list.

No, To or Cc does not matter. Your list is just incomplete.

> 
> Question: With <Form Letter> , are you asking to add letter in this 
> first patch ? I have cover letter, but it will get removed when patch 
> gets merged. Please help suggest and clarify.

No, it's just template. Form letter... I am just bored to repeat the
same comment.

>>
>>>
>>> SE = Serial Engine, meant for I2C controller here.
>>> TRE = Transfer Ring Element, refers to Queued Descriptor.
>>>
>>> Example :
>>> Two clients from different SS can share an I2C SE for same slave device
>>
>> What is SS?
>>
> SS = Subsystem (EE - Execution Environment, can be Apps 
> processor/TZ/Modem/ADSP etc). Let me add this too in next patch.

Yes, please explain in the binding itself.

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
>>> index 9f66a3bb1f80..ae423127f736 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>> @@ -60,6 +60,10 @@ properties:
>>>     power-domains:
>>>       maxItems: 1
>>>   
>>> +  qcom,shared-se:
>>> +    description: True if I2C needs to be shared between two or more subsystems.
>>
>> What is a subsystem? With commit msg I still do not understand this.
> SS = Subsystem (EE - Execution Environment, can be Apps 
> processor/TZ/Modem/ADSP etc). Let me add EE too with full form.
>> Maybe presence of hwlock defines it anyway, so this is redundant?
> No, this flag is required. As hwlock comes into picture if this flag is 

Flag is required? By what? Sorry, you push your downstream solution to us.

> defined. So flag is acting as a condition to take hwlock TRE 
> descriptor(transfer ring element). Hope i could answer your query.

Hm, not sure, maybe indeed hwlock would not be enough. However I think
existing binding misses hwlock property.

Best regards,
Krzysztof


