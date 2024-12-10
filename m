Return-Path: <linux-i2c+bounces-8413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF909EB0FF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 13:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D9511886628
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 12:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE0E1A725A;
	Tue, 10 Dec 2024 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsYDYLxq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2563F1A3AB8;
	Tue, 10 Dec 2024 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834317; cv=none; b=eXmBTKYab/f50v9310L4y52jqsmMqjf3SbM7txgZrCZVE2rN1FX1jKHlVfnMpDXPG2DCujvBWSoiRgbWtlD6IEAngtmgHtY9vtDTyRNTDjkoTWswGUM2tqC8rWKZq31kMKSk94ilwXQG9BFAvioY3cb78Yd/4JvdP2ZWXS9uwFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834317; c=relaxed/simple;
	bh=6XCqSE4PX87UUcMXJwDzqbV0B9paAPJx9Z1elIYDjEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqYHAPh9Lr1rq+ew2TLZUjZoCg6Rfz4xaAQziEzFORHjhdYxtCAjaM7ZjIO7V2iuKZiH6bFggQACdNsCLeuFpvbF4KcAihksfBwm9g3ZdAb6G11UgeX+0tZhaiTFzFPDjBBWuqhZmV9NnrtgsxOFduT0Mj3braQwFot6KixZ07c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsYDYLxq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso3394535e9.2;
        Tue, 10 Dec 2024 04:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733834313; x=1734439113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/L26b1cngPFNrc6gaDUcEqCgyOcOzvpS/5bv/9HvOTs=;
        b=BsYDYLxq5mHnDzeNPU074l1YoBfG6lxfylzHAWdFqZb5KnqH27qkQLZZQfxYQcjRn3
         1KJGBa1HDXLDB+7zXM/8lT1N4ENpd9Oub9Tl1oynPY+qb+rfJCflGdHYb0Zc+ENi93vf
         Qw0qcQHyAWuifbT2m5w5gq17ReNubRyIVJ5DO7UiPgX6GsuLGSw0GvIukv6Hi+qrJ1r3
         cgSIQzQhRPBVaIg44pSDOuZBhbSLMFXHol6OiCNxoHu9zPlGvXZEznWPfzX7eMKvYJUW
         luXG2BnYD4/NiZB1rBwbA1cKdcHQulevfm8zD9tmKsqX56ARUY/Ck3yOG9dTdOPzGNE6
         Ck4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834313; x=1734439113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L26b1cngPFNrc6gaDUcEqCgyOcOzvpS/5bv/9HvOTs=;
        b=i45jcZoRsCyTNucnRdPCG8dnqI4bD/8QrUE/+DR1s9GV/DAuI8SQFw2aCAdKHS5A/p
         LVV2HzqezQmqeOXKGWnJ+36VQnVzDmIFXZrzK+9RoXpR6Wn4yCf3FiuvFThtiUelmoL8
         cg2kYZrMFdBmC4/Xxbj5PE52yTmG69/TtPmdoV5aFxOCtgRb/kSVFsQV7hsOjEaUfPXE
         WKltMcjc3qeXeUL83SEfPR/NxDDWDQHfLuDMrRp3RLGDN3HJoJJWjuT86xnOhy7LXXTK
         nlf1GvGQwJMDehQ6AvY3Pxxb3Vqr5bpZfMiWgVZ7jf9LAr1Y8JZX2lPmBhDW8JCYZ7jZ
         oc+g==
X-Forwarded-Encrypted: i=1; AJvYcCUCHfjjgejaNLX2Y+0f2ETx7xgC2gDoRmWIqrt2BLBIUKEZeiF+lDeZcrDokKqvBDC01wLJM6FkikY4C+zdHQ==@vger.kernel.org, AJvYcCUjEXHEprWBeqojTMY6VbDMfIa5gDz5ZQQwtMcMaB44ei+a6wI9+q3Df7aJ2clEg4sYskFgiXAditNa@vger.kernel.org, AJvYcCVDMmk7EYf4hOUX5Tf1VFqAUGi3DPc3OtKnTbUat7hD9i720ZjeC4Q8+q0FUEP9AnDWzhBpPsJ/Wy8D@vger.kernel.org, AJvYcCW+dBFwQoVwgLt6ece/1KhQu6eJPc7LEr+FnoXflfhbL06fcPE4+7c/w4xX9v0AadY1iMuZ1VyH2cvA@vger.kernel.org, AJvYcCWS+6op44NgS0ahlQJL5qIDsIXrNbzs8uRVO+0R+QDMVblMnZgteZ7t+MB7yvc6dMGN+ZyBXbvPAm8V7yAw@vger.kernel.org
X-Gm-Message-State: AOJu0YwWIHurIAbtLQV+2VT1p34dsOs/ZDYhwSqly/Bn19mstT3K7UqQ
	bs1ZsJZP6k6i6gZASyd0GAfky5x2+F9ak7E4HQggaZDD2IupeNRM
X-Gm-Gg: ASbGncv0tkezZJskbK0B2Q2MAG5IMOA6F3RGkiDQYHxxIyEpscLN05ngxScYoqaN+ab
	QXFUYg8CSx0NHqZBG0IE3tBA39quD2M1kh/swQrmi3zxIm7GvLpxUQ4GU3aCbLXs0k8OY6C6jg7
	gtIne2uwvYgWwbPfN+xlrjD9tUcKyOnqtDBPNocw/cSByWllfyiJ1qcFblHNmww8LkkIIU6tk2R
	v98D40M9MOUMbtZ25bqc6miIYfe6iYT/S+s7PcVD4xeB8CGz+wR9fHspuFIFSbSY2jlzAEwvEcu
	tOHMugFiSXXGIW42VP6wz0TDHQ==
X-Google-Smtp-Source: AGHT+IGker31etdhubmaX8W/x+4MUbOn5bJSDYHrfshAnDAtpYV5vqGrST/Sh3Lmoukaj9PN1Pm8Og==
X-Received: by 2002:a05:600c:5756:b0:434:a350:207c with SMTP id 5b1f17b1804b1-434dded76fdmr115871875e9.23.1733834312964;
        Tue, 10 Dec 2024 04:38:32 -0800 (PST)
Received: from ?IPV6:2a00:f41:c02:ff08:9aca:84ea:6a33:e5c8? ([2a00:f41:c02:ff08:9aca:84ea:6a33:e5c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da11935asm191728645e9.37.2024.12.10.04.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 04:38:31 -0800 (PST)
Message-ID: <422e6a1e-e76a-4ebc-a0a5-64c47ea57823@gmail.com>
Date: Tue, 10 Dec 2024 13:38:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <f1fa2bde-95ce-45e9-ad2d-f1d82ec6303c@kernel.org>
 <8b33f935-04a9-48df-8ea1-f6b98efecb9d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <8b33f935-04a9-48df-8ea1-f6b98efecb9d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/10/24 13:05, Krzysztof Kozlowski wrote:
> On 10/12/2024 12:53, Krzysztof Kozlowski wrote:
>>>>> I'm not sure a single property name+description can fit all possible
>>>>> cases here. The hardware being "shared" can mean a number of different
>>>>
>>>> Existing property does not explain anything more, either. To recap -
>>>> this block is SE and property is named "se-shared", so basically it is
>>>> equal to just "shared". "shared" is indeed quite vague, so I was
>>>> expecting some wider work here.
>>>>
>>>>
>>>>> things, with some blocks having hardware provisions for that, while
>>>>> others may have totally none and rely on external mechanisms (e.g.
>>>>> a shared memory buffer) to indicate whether an external entity
>>>>> manages power to them.
>>>>
>>>> We have properties for that too. Qualcomm SoCs need once per year for
>>>> such shared properties. BAM has two or three. IPA has two. There are
>>>> probably even more blocks which I don't remember now.
>>>
>>> So, the problem is "driver must not toggle GPIO states", because
>>> "the bus controller must not be muxed away from the endpoint".
>>> You can come up with a number of similar problems by swapping out
>>> the quoted text.
>>>
>>> We can either describe what the driver must do (A), or what the
>>> reason for it is (B).
>>>
>>>
>>> If we go with A, we could have a property like:
>>>
>>> &i2c1 {
>>> 	externally-handled-resources = <(EHR_PINCTRL_STATE | EHR_CLOCK_RATE)>
>>> };
>>>
>>> which would be a generic list of things that the OS would have to
>>> tiptoe around, fitting Linux's framework split quite well
>>>
>>>
>>>
>>> or if we go with B, we could add a property like:
>>>
>>> &i2c1 {
>>> 	qcom,shared-controller;
>>> };
>>>
>>> which would hide the implementation details into the driver
>>>
>>> I could see both approaches having their place, but in this specific
>>> instance I think A would be more fitting, as the problem is quite
>>> simple.
>>
>>
>> The second is fine with me, maybe missing information about "whom" do
>> you share it with. Or maybe we get to the point that all this is
>> specific to SoC, thus implied by compatible and we do not need
>> downstream approach (another discussion in USB pushed by Qcom: I want
>> one compatible and 1000 properties).
>>
>> I really wished Qualcomm start reworking their bindings before they are
>> being sent upstream to match standard DT guidelines, not downstream
>> approach. Somehow these hundreds reviews we give could result in new
>> patches doing things better, not just repeating the same issues.
> 
> This is BTW v5, with all the same concerns from v1 and still no answers
> in commit msg about these concerns. Nothing explained in commit msg
> which hardware needs it or why the same SoC have it once shared, once
> not (exclusive). Basically there is nothing here corresponding to any
> real product, so since five versions all this for me is just copy-paste
> from downstream approach.

So since this is a software contract and not a hardware
feature, this is not bound to any specific SoC or "firmware",
but rather to what runs on other cores (e.g. DSPs, MCUs spread
across the SoC or in a different software world, like TZ).

Specifying the specific intended use would be helpful though,
indeed.

Let's see if we can somehow make this saner.


Mukesh, do we have any spare registers that we could use to
indicate that a given SE is shared? Preferably within the
SE's register space itself. The bootloader or another entity
(DSP or what have you) would then set that bit before Linux
runs and we could skip the bindings story altogether.

It would need to be reserved on all SoCs though (future and
past), to make sure the contract is always held up, but I
think finding a persistent bit that has never been used
shouldn't be impossible.

Konrad

