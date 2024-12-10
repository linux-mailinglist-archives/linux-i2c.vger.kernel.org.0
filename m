Return-Path: <linux-i2c+bounces-8424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF59EB4BC
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 16:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6319D18861F6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF74C1BBBFC;
	Tue, 10 Dec 2024 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lc4YDsw5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27921BAEDC;
	Tue, 10 Dec 2024 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844264; cv=none; b=qV3fjJRTK1xzuAzaCVtRjS0pdLrvm32xWDbzhtZy+GbgSi3JOErZ7meU7170ObOAq8dT3HKMRot4dYdLcmdCHOsrTKej+WSN7nAqco//0y2x/gZzBHuGw2gkCd2QXunwKfNH7RLCi9Rs2X6nmg4oGH5lmdYmkc0z0LuCwTIpvWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844264; c=relaxed/simple;
	bh=DCJJAhxraPMWeJQqQMdmgN91P3xzxgNO6pU1v2rqAKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHb7NyEb8BdOjdyr1xejnlhwsue0zFvOMoVmGUiMbX/oE24ERq9CrSO11dNrG/vHOOnmCCs8HoGb4VZR/vN5As1BPa41itGisYMCIFcAP//LDYrfs+XNzIoQ9JzUGR4sObFZ5qT+G1MUM1jkBXLnZUYcYcAHuuE5oUHtBYR5nw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lc4YDsw5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so2537225f8f.0;
        Tue, 10 Dec 2024 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844261; x=1734449061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=03GzMk02coPKaNJAtWZUYl4k0s2AMlv61xu1tyOz560=;
        b=lc4YDsw5DeYbSBVZPHTmx1E+P73215YfAuo5iJMDkztFq8GliCUEFR70GyMaA6Kge9
         AuTTwzJ65ql6kU2sISNHKnGgp1cBuysLLBmkkAo1QYSj+jH3ZGrBdlDdKY23V3AbG4ok
         bR24AziwS5FNTCHIQTi6YCCldht1+Q2Wz5dwRDEqx4jBzciQFI17xUxxwktL2BWyggbT
         wcw67YExjoxSM2BUySXHBfIFhVpePRrCO3S4jS7MizWml11sH2HzMSketGiV0I18XYm+
         37nEwSuH+hWeVBnYY48WICM3QB5ga4/kvIHbePTBQHVDdqC71vsJk/V0mdWEl3kcFeON
         uuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844261; x=1734449061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03GzMk02coPKaNJAtWZUYl4k0s2AMlv61xu1tyOz560=;
        b=QurAyLqgU0yRmKYNmpnpCnXUZXo4QJ8sne09cgBJ84uD6yn8tB3fOkUSiprjJMhPVu
         P1PuQ3Hg6od/KzU9htoSFr9SLGoYNKM2xgZJ8T43+fNt9rf5hF7H+qhiSp6bSZ1OuzjU
         TceUeDLECjs07qYcZzXkaJm7At2wS7mQv0Ke+lkSwGod8q8CiR5QFnxy3fKALTNiTBMq
         bJvZSDuA/Md/pP+iFQ0srdR8vxIeopc9KHlYC4P9PJJhkL5fOSHRxYHsdgE3WvYws/Gu
         4TRipUyNQ2KL77oKNgPXHDmsm7Ip92sryrVzKJou54low69/pT6uV+p76Q/pRSbWT9Ov
         sEAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZKW9YlUYbu4G7woQ5brho0+u0gTz8Pacpwn2K+sYFQLyOOKNZON8WY/XmL50Bz7x3medagv9pPxSz@vger.kernel.org, AJvYcCVsB+WZH8b9wxheb58pcUhnGsWE98nbhpOPniUjLcrkncYFxlu/a9Yk0fuhCmq+3Tx28ki29faFvBzA@vger.kernel.org, AJvYcCWVoVDTCIGWyOeBWrNJWx6yLugISROioJFKXjH0OfBFaRB+rMGjKvE9hdSvtcSQN+UnyCVtaUwfAClbQiuLjg==@vger.kernel.org, AJvYcCWnkQSgnFhqHh+lN/yzg2uj6B8/RJo762kNBBLap68SZ5O3IaqtZCfYF8easdEIOi1VJ+V/bNFKaEFQzxGU@vger.kernel.org, AJvYcCXnVuITuQmch98CrD66OcMXYB+1TL1dhkBuFZwYc1uzgnvv+CSAdozlBw7N9/fbC2QR8hmtfdm1SylG@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcCRVT6dG5fHDRs8rB+JL9BXSDRpO0cx6c5cJ5pMA8/s2sME2
	4zPOE37SCmXHWQEGxeckXCjgmlv/16h+r/uXOQ7EFQ0EJn01NcQV
X-Gm-Gg: ASbGnct0icYX1rTswf2Q2z3DRaMKf2Te/EyzF1duXPr/WQVoKxA5j2afdUoVfk6ZC6a
	pxeDRkkk0CR7w0veJy1a8ZMuSQ1cK+Le3GNBeZUGhljx9kFw4r3GZAE9A3xdlqiV8bGvEVwftCA
	stn7hUNCb6iqeXLPDrY6DtUd0iM4PQ2YK+G55yJ4UFpny1pCZkhiMAyh8QTUBFZy+qeXwMzN3+w
	ka2kET9O7qQPi6vec3hnVRxmxpfFL/8RKShXZkajEObsvovYaTwvHvo5+7HyO1KoPon
X-Google-Smtp-Source: AGHT+IH/LC/VPhxslf621w1BFDt8Fj/gULSnEYHyXB7ig8IW5h8xmq2mY4qXCGKteZHWEMppL6Gd/w==
X-Received: by 2002:a5d:6daa:0:b0:386:3672:73e7 with SMTP id ffacd0b85a97d-386469a4d02mr2935028f8f.9.1733844260961;
        Tue, 10 Dec 2024 07:24:20 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38637072adasm10389407f8f.81.2024.12.10.07.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:24:20 -0800 (PST)
Message-ID: <1035d5c0-7034-4797-8a89-d0d92811c0ef@gmail.com>
Date: Tue, 10 Dec 2024 16:24:07 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konrad.dybcio@linaro.org,
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
 <f1fa2bde-95ce-45e9-ad2d-f1d82ec6303c@kernel.org>
 <8b33f935-04a9-48df-8ea1-f6b98efecb9d@kernel.org>
 <422e6a1e-e76a-4ebc-a0a5-64c47ea57823@gmail.com>
 <aad3c217-a6f6-4415-8e08-8fc113504756@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <aad3c217-a6f6-4415-8e08-8fc113504756@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/10/24 16:17, Mukesh Kumar Savaliya wrote:
> Thanks Konrad !
> 
> On 12/10/2024 6:08 PM, Konrad Dybcio wrote:
>>
>>
>> On 12/10/24 13:05, Krzysztof Kozlowski wrote:
>>> On 10/12/2024 12:53, Krzysztof Kozlowski wrote:
>>>>>>> I'm not sure a single property name+description can fit all possible
>>>>>>> cases here. The hardware being "shared" can mean a number of different
>>>>>>
>>>>>> Existing property does not explain anything more, either. To recap -
>>>>>> this block is SE and property is named "se-shared", so basically it is
>>>>>> equal to just "shared". "shared" is indeed quite vague, so I was
>>>>>> expecting some wider work here.
>>>>>>
>>>>>>
>>>>>>> things, with some blocks having hardware provisions for that, while
>>>>>>> others may have totally none and rely on external mechanisms (e.g.
>>>>>>> a shared memory buffer) to indicate whether an external entity
>>>>>>> manages power to them.
>>>>>>
>>>>>> We have properties for that too. Qualcomm SoCs need once per year for
>>>>>> such shared properties. BAM has two or three. IPA has two. There are
>>>>>> probably even more blocks which I don't remember now.
>>>>>
>>>>> So, the problem is "driver must not toggle GPIO states", because
>>>>> "the bus controller must not be muxed away from the endpoint".
>>>>> You can come up with a number of similar problems by swapping out
>>>>> the quoted text.
>>>>>
>>>>> We can either describe what the driver must do (A), or what the
>>>>> reason for it is (B).
>>>>>
>>>>>
>>>>> If we go with A, we could have a property like:
>>>>>
>>>>> &i2c1 {
>>>>>     externally-handled-resources = <(EHR_PINCTRL_STATE | EHR_CLOCK_RATE)>
>>>>> };
>>>>>
>>>>> which would be a generic list of things that the OS would have to
>>>>> tiptoe around, fitting Linux's framework split quite well
>>>>>
>>>>>
>>>>>
>>>>> or if we go with B, we could add a property like:
>>>>>
>>>>> &i2c1 {
>>>>>     qcom,shared-controller;
>>>>> };
>>>>>
>>>>> which would hide the implementation details into the driver
>>>>>
>>>>> I could see both approaches having their place, but in this specific
>>>>> instance I think A would be more fitting, as the problem is quite
>>>>> simple.
>>>>
>>>>
>>>> The second is fine with me, maybe missing information about "whom" do
>>>> you share it with. Or maybe we get to the point that all this is
>>>> specific to SoC, thus implied by compatible and we do not need
>>>> downstream approach (another discussion in USB pushed by Qcom: I want
>>>> one compatible and 1000 properties).
>>>>
>>>> I really wished Qualcomm start reworking their bindings before they are
>>>> being sent upstream to match standard DT guidelines, not downstream
>>>> approach. Somehow these hundreds reviews we give could result in new
>>>> patches doing things better, not just repeating the same issues.
>>>
>>> This is BTW v5, with all the same concerns from v1 and still no answers
>>> in commit msg about these concerns. Nothing explained in commit msg
>>> which hardware needs it or why the same SoC have it once shared, once
>>> not (exclusive). Basically there is nothing here corresponding to any
>>> real product, so since five versions all this for me is just copy-paste
>>> from downstream approach.
>>
>> So since this is a software contract and not a hardware
>> feature, this is not bound to any specific SoC or "firmware",
>> but rather to what runs on other cores (e.g. DSPs, MCUs spread
>> across the SoC or in a different software world, like TZ).
>>
>> Specifying the specific intended use would be helpful though,
>> indeed.
>>
>> Let's see if we can somehow make this saner.
>>
>>
>> Mukesh, do we have any spare registers that we could use to
>> indicate that a given SE is shared? Preferably within the
>> SE's register space itself. The bootloader or another entity
>> (DSP or what have you) would then set that bit before Linux
>> runs and we could skip the bindings story altogether.
>>
> There would be spare register but i think it should be in sync with hardware team. let me check with them and update back if any bit can be repurposed for this feature. I agree, if any register is available, it can programmed prior to kernel.
>> It would need to be reserved on all SoCs though (future and
>> past), to make sure the contract is always held up, but I
>> think finding a persistent bit that has never been used
>> shouldn't be impossible.
>>
> Yes, let me check it with hardware and firmware team and update back. Does this mean, there can't be a such software sharing mechanism (purely software decision) based on DTSI flag ?

I suppose that depends on our needs. If we can set that bit
before Linux starts (i.e. in UEFI), we can avoid touching
the pinctrl state regardless of whether the other entities
have started up yet to avoid overcomplicating it.

If we need Linux to set that bit, we would still need some
mechanism like a dt property. But I really think that the
bootloader should be burdened with this instead, given it
has a better understanding of the hardware due to it being
well, the bootloader).

Krzysztof, I'm assuming that sounds sane from your
perspective too?

Konrad

