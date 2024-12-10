Return-Path: <linux-i2c+bounces-8411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B59EB03B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 12:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA0E18871CB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 11:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AF119F130;
	Tue, 10 Dec 2024 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFUM+C+Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAAE19CC3E;
	Tue, 10 Dec 2024 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733831633; cv=none; b=Nmk1D1Lg7hxAyBncnduC9Di9zT9Y+2FR0+4HZd2QtA4pOUQXYLg9mStPuyCQvXUC8MzlFDY54pqsC0pYBwgv3qJOyWhBlvvsiNxx3Z+nDBAzN5TiDfYdlr/cBMt7Iz2bTFWT6v5Y1z7p465vaafOo00gOB1QAe+J9ZHDFcvTmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733831633; c=relaxed/simple;
	bh=kKMugwoj+LY16aSGWK/2tQQCmAZ5WDFr5c3LH6IO5QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eX1cWBDps1BDifYrvaUhWn1K+VtL2s5yklteCchDLnIL+mb6S8OEXzON20Ti6KjMsMm7zDz3YNEycgrqzwISPN83k2jGxjz5ValIYbYFmDp2cKdD7/Cy1t2Y/l+UNFaMNZ1etQ/UJ4H9DZnKTmLMWZfaIHMuEellFGqxYWTeUWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFUM+C+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36290C4CED6;
	Tue, 10 Dec 2024 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733831633;
	bh=kKMugwoj+LY16aSGWK/2tQQCmAZ5WDFr5c3LH6IO5QE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VFUM+C+YzXsy3tbsR6OodE2idxFxVv/QJ5jzxDTpt+89NqqmmmhDhzTY9KrJFYA8r
	 iGwOnra9JdjMNYpkDYt1DGdeT/Q/ylJPI60/wYvOiwVJ2kCfTZ5djrlsFHM1P3uJqI
	 CdR2vPwKdR6QLtmcdDWAPYO5z8toeDbHggGCxDtJzE4lH3HQkJfkaaGWPsdrd0CzIO
	 JS8D9xNMM9KOBmE9oH6eBWbRb7hIbC1ch/DHBliC3+97Ys6wRAxvHc8L/xc3AQzlXm
	 xlPV1FZqLToWWJt1h5WW3BoSE8C9dYHMDhfd+DWSDbimr8us6rjUglriM8QUJzxx7R
	 eRcbWVzN1l9AQ==
Message-ID: <f1fa2bde-95ce-45e9-ad2d-f1d82ec6303c@kernel.org>
Date: Tue, 10 Dec 2024 12:53:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Konrad Dybcio <konradybcio@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, konrad.dybcio@linaro.org,
 andersson@kernel.org, andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org,
 devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org,
 dan.carpenter@linaro.org, Frank.Li@nxp.com, konradybcio@kernel.org,
 bryan.odonoghue@linaro.org, krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
 <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
 <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
 <75f2cc08-e3ab-41fb-aa94-22963c4ffd82@quicinc.com>
 <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
 <da2ba3df-eb47-4b55-a0c9-e038a3b9da30@quicinc.com>
 <a7186553-d8f6-46d4-88da-d042a4a340e2@oss.qualcomm.com>
 <e9fb294b-b6b8-4034-84c9-a25b83321399@kernel.org>
 <835ac8c6-3fbb-4a0d-aa07-716d1c8aad7c@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <835ac8c6-3fbb-4a0d-aa07-716d1c8aad7c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/12/2024 10:09, Konrad Dybcio wrote:
> 
> 
> On 12/10/24 08:28, Krzysztof Kozlowski wrote:
>> On 02/12/2024 15:04, Konrad Dybcio wrote:
>>>>>>    >
>>>>>> IP blocks like SE can be shared. Here we are talking about I2C sharing.
>>>>>> In future it can be SPI sharing. But design wise it fits better to add
>>>>>> flag per SE node. Same we shall be adding for SPI too in future.
>>>>>
>>>>>
>>>>> How flag per SE node is relevant? I did not ask to move the property.
>>>>>
>>>>>>
>>>>>> Please let me know your further suggestions.
>>>>> We do not talk about I2C or SPI here only. We talk about entire SoC.
>>>>> Since beginning. Find other patch proposals and align with rest of
>>>>> Qualcomm developers so that you come with only one definition for this
>>>>> feature/characteristic. Or do you want to say that I am free to NAK all
>>>>> further properties duplicating this one?
>>>
>>> I'm not sure a single property name+description can fit all possible
>>> cases here. The hardware being "shared" can mean a number of different
>>
>> Existing property does not explain anything more, either. To recap -
>> this block is SE and property is named "se-shared", so basically it is
>> equal to just "shared". "shared" is indeed quite vague, so I was
>> expecting some wider work here.
>>
>>
>>> things, with some blocks having hardware provisions for that, while
>>> others may have totally none and rely on external mechanisms (e.g.
>>> a shared memory buffer) to indicate whether an external entity
>>> manages power to them.
>>
>> We have properties for that too. Qualcomm SoCs need once per year for
>> such shared properties. BAM has two or three. IPA has two. There are
>> probably even more blocks which I don't remember now.
> 
> So, the problem is "driver must not toggle GPIO states", because
> "the bus controller must not be muxed away from the endpoint".
> You can come up with a number of similar problems by swapping out
> the quoted text.
> 
> We can either describe what the driver must do (A), or what the
> reason for it is (B).
> 
> 
> If we go with A, we could have a property like:
> 
> &i2c1 {
> 	externally-handled-resources = <(EHR_PINCTRL_STATE | EHR_CLOCK_RATE)>
> };
> 
> which would be a generic list of things that the OS would have to
> tiptoe around, fitting Linux's framework split quite well
> 
> 
> 
> or if we go with B, we could add a property like:
> 
> &i2c1 {
> 	qcom,shared-controller;
> };
> 
> which would hide the implementation details into the driver
> 
> I could see both approaches having their place, but in this specific
> instance I think A would be more fitting, as the problem is quite
> simple.


The second is fine with me, maybe missing information about "whom" do
you share it with. Or maybe we get to the point that all this is
specific to SoC, thus implied by compatible and we do not need
downstream approach (another discussion in USB pushed by Qcom: I want
one compatible and 1000 properties).

I really wished Qualcomm start reworking their bindings before they are
being sent upstream to match standard DT guidelines, not downstream
approach. Somehow these hundreds reviews we give could result in new
patches doing things better, not just repeating the same issues.

Best regards,
Krzysztof

