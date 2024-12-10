Return-Path: <linux-i2c+bounces-8398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 962419EAB7B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8AD188BDE1
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 09:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F6C232793;
	Tue, 10 Dec 2024 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcPQrI9Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8765D23278A;
	Tue, 10 Dec 2024 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821772; cv=none; b=tkyRY/peRUFUh4wv5LhIuJehtRu0YBNTedV6wByXwU31gU2UzFZ8REACFc697SK8EQSsq9hoYinFxSzyXD9QSkS2X74hWuVGQUN1k3gWnMPr+YEzbNuioKsbN0YWHpsMgqlcRMiJUXh07Xzxr1him8RPJq7Z0bU6vLWBVucMWqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821772; c=relaxed/simple;
	bh=t9akopN/8CcxympqsZJMEUtwOvzBBNC6M2+tKSYyGZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ishKuLSfHWbOETy+RtjXJXYGFf2DMBC1CAv1ui0HANAkcDEoskT9NtgcQWw7px6IQYNn6Z5UVQlm8K059ps9KtxWVnDPBhC1a/zRIZG8mDj4cDNaCHkG9rhdWhlV6KGUUaCJJkLDRx/mEZxF5wJPNraI5DTF79uGkBWA+hwSebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcPQrI9Z; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a766b475so51203745e9.1;
        Tue, 10 Dec 2024 01:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733821769; x=1734426569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mC0NjSKGjrTrd7NQ0m/973DfOJejXoQwaZ/u+SnPkBE=;
        b=kcPQrI9ZIU2shCDQKho5I4NpSv8+khqsx7jSTTx61kVECNqWvQmj51HpPZX5uvcbr9
         tx/QOiTKYKCDL/kW/HV4c6lMLy3MI2p20DVC60iHV7T+FguZjdYv6WdeCh0sWPpuPVhm
         1gcxkwmpq2jDO3Qw27nWe7FN3TTC5+X3h8iHZEdQ3wYNFuswRgq+73iwh7cPWmGfdXox
         s6lS47ydIRMzbzzYqCbCdfWcFzHLAMS9yZ+oZFwzJAQ/gy8ArJ7ULXGve+T8EulK6YG8
         gczL3lrq8l0049hLrX6WCpa9p7Mns5AcQUKIc2qltnFkxrbSsJFHSXZMtojeQN44fYYn
         ORnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821769; x=1734426569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC0NjSKGjrTrd7NQ0m/973DfOJejXoQwaZ/u+SnPkBE=;
        b=h6T2U2pS95Da1oXoPm4amJNqfE5vtoACGWzeunntWKmRRIdhxT2ilK3TR52Em/evH1
         /1/QU7irijPfFX4JKWnBZ7C84VAswcQbRHzXiw5cshCYf9qK9+4dJEsGflzIp7wk9tx0
         TY6ul1AV2DUMG6mnzlByYqz+KZ4qhwn9nF51IDERNbPHTNNUOL19OfaB7xh23xVpkiKN
         qBLAoi27M/fO+/S5pQR42pT8urcijSl7zuXMtpr9iDQu4LJu92zI4u2oM8xkwZBz6zoi
         JfN0hXaTsm2y5wltwY3Tm2HYYZhf6QHw7KDHq9UUNfp3z8pOdP3qPkTjMHlwYPcd0aRc
         S31g==
X-Forwarded-Encrypted: i=1; AJvYcCUTIaHyintQBfjktKwVqIf6sh9sJ/VQD5QMA+ATsgufOBhI0PC65tbuIWShDWCvGX+bJ81HgLWRL07f@vger.kernel.org, AJvYcCVX6/yyjCNEScXZ8YCw68agBIixNJeJiZiqYtv63UbrTE4UUYOMyamHserIPhNKzjPp32N1f57PLZzzuZAc@vger.kernel.org, AJvYcCWLVXt044oD/oQ98FuuYNNsu2hhhwekR99XQNzljROBoyGv8w5hw6Cdwg9Tg/XP6Nijg+GRXM0vKBQK@vger.kernel.org, AJvYcCX59XO7U+6Viirm0nHRJO+xmlQ27TxUNc/enVMGS5JmOOtRI4n3USTUlN+L3/CHXxPknInxLkhhgtPCS8rNug==@vger.kernel.org, AJvYcCXzFF5IDeIxJNl+2KFeJEShn1PNwAunYy8DLrAUGR6JMwFlc3hRG7zic2/U+xg0ZGPB8N7oCaOL4WQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YzNYCNw8Vj08IAoeJ1NXxrzBuyvx6S8p0gA+RxOnniJOY7Un6MZ
	9/6bVqTvvyfFPfPfTJg6QH2st9tPv9dfzj1Kkem8CVcstZxDJhEC
X-Gm-Gg: ASbGncsZsbNhxj54ZUnSaSujaV4tFSxUVN3J6fYq37GD11ZgTrkZzfslsL1JpSz5az8
	glasepxERq6vk1DXUK5Boyd1LpoiF2lMtscrDlo1SIAT7GpB44Lx4FTAue4jCd6bjbhz+HyA7e+
	37beiZiDy3j9ve+iutm7rArBmEM9M1SALx7410OmPzqrrs6fHU+IVr7Z3PdD5Dg/UuMk94Vjurg
	7n8yCLi+cuplrFTm/Dzp1ySE1dfWAFoM6qaxCecGMqU/rO3f9n2jFPajEPNxHNwvs6+Dk3dQj5w
	83xV8JBRcqb+LMMXNTvxzI1i0Q==
X-Google-Smtp-Source: AGHT+IFdi3j370R3tRRDj1B8O4pv6f4Xg/VIGX8Z65Vq7nAB2nmuHctS+SQ12CYIZbpfIGf9aiw6zQ==
X-Received: by 2002:a05:600c:1d0f:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-434fff30698mr33827915e9.2.1733821768375;
        Tue, 10 Dec 2024 01:09:28 -0800 (PST)
Received: from ?IPV6:2a00:f41:c02:ff08:cb6b:1254:75f7:f63d? ([2a00:f41:c02:ff08:cb6b:1254:75f7:f63d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d69dfsm182153545e9.14.2024.12.10.01.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 01:09:27 -0800 (PST)
Message-ID: <835ac8c6-3fbb-4a0d-aa07-716d1c8aad7c@gmail.com>
Date: Tue, 10 Dec 2024 10:09:22 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <e9fb294b-b6b8-4034-84c9-a25b83321399@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/10/24 08:28, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:04, Konrad Dybcio wrote:
>>>>>    >
>>>>> IP blocks like SE can be shared. Here we are talking about I2C sharing.
>>>>> In future it can be SPI sharing. But design wise it fits better to add
>>>>> flag per SE node. Same we shall be adding for SPI too in future.
>>>>
>>>>
>>>> How flag per SE node is relevant? I did not ask to move the property.
>>>>
>>>>>
>>>>> Please let me know your further suggestions.
>>>> We do not talk about I2C or SPI here only. We talk about entire SoC.
>>>> Since beginning. Find other patch proposals and align with rest of
>>>> Qualcomm developers so that you come with only one definition for this
>>>> feature/characteristic. Or do you want to say that I am free to NAK all
>>>> further properties duplicating this one?
>>
>> I'm not sure a single property name+description can fit all possible
>> cases here. The hardware being "shared" can mean a number of different
> 
> Existing property does not explain anything more, either. To recap -
> this block is SE and property is named "se-shared", so basically it is
> equal to just "shared". "shared" is indeed quite vague, so I was
> expecting some wider work here.
> 
> 
>> things, with some blocks having hardware provisions for that, while
>> others may have totally none and rely on external mechanisms (e.g.
>> a shared memory buffer) to indicate whether an external entity
>> manages power to them.
> 
> We have properties for that too. Qualcomm SoCs need once per year for
> such shared properties. BAM has two or three. IPA has two. There are
> probably even more blocks which I don't remember now.

So, the problem is "driver must not toggle GPIO states", because
"the bus controller must not be muxed away from the endpoint".
You can come up with a number of similar problems by swapping out
the quoted text.

We can either describe what the driver must do (A), or what the
reason for it is (B).


If we go with A, we could have a property like:

&i2c1 {
	externally-handled-resources = <(EHR_PINCTRL_STATE | EHR_CLOCK_RATE)>
};

which would be a generic list of things that the OS would have to
tiptoe around, fitting Linux's framework split quite well



or if we go with B, we could add a property like:

&i2c1 {
	qcom,shared-controller;
};

which would hide the implementation details into the driver

I could see both approaches having their place, but in this specific
instance I think A would be more fitting, as the problem is quite
simple.

Krzysztof, thoughts?

Konrad

