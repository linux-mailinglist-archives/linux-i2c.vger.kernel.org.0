Return-Path: <linux-i2c+bounces-13871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25BC16840
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 19:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C246C35405F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 18:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19ACF34EEE6;
	Tue, 28 Oct 2025 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAAdeZK3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FB919F115;
	Tue, 28 Oct 2025 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761676767; cv=none; b=cU/rWeg+TnIN7eKOi7wJnuDGop/urWraKTFv6J/j5191TnD/YOBjV+/9i3SD/A72gFwCBbmuLol2W6scEocM8ekm4H0Uu6E6TwKwjNMs4o6mr4l2ncy6NTKR+XXgsSDVUSjPNN1rj9doPIxs1DwZfMhRakWYadx7wT7zA+v4ABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761676767; c=relaxed/simple;
	bh=vAbZ834u8r2BTOo+5gC4v15rLlnSd6ggC4qhlRuryd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oz0HPxwP2Cy5KcLjS1/Jx30knumDmeHT0YxMILPwRKS8LKPcYxo84Ml8n7lqqgVeYe2YrTjU5erz9JTkDHnrH7T5uSw2xwXE5c9VMNQUVH/jm+9jC5z1YCQsNyzSHd+azXtmFLjxW5mhRMBXCxXUkSUdj56PhMGRYqsKsE4Wrm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAAdeZK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2147EC4CEE7;
	Tue, 28 Oct 2025 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761676767;
	bh=vAbZ834u8r2BTOo+5gC4v15rLlnSd6ggC4qhlRuryd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RAAdeZK3ICynb3uBtUdD3qSGSLNHvVsW5d+TmKLmS0cwy6PmPQk0xhjxhkIK3W4u+
	 rmWlDHdGpEmKMHrlkXhTfRMudnPt3UFtPFKxbKR7MJkS3q6LrGPL1tGxKcho58nmAd
	 ic02jG/o3z+q7M8SKYgZ1HhN3KSPvEgQcYen0Lt4UOzSQcubUc5ioXUNkukygRy5iC
	 EIlVdR07mUiu3L5HkSmRWdXsPwPKrly650HTerHADD4M9+nqnSgw8XJYGZ3LKqtTd1
	 KVTRZtWLrNbnGqlYfgHvivEdDsc7yR/T/QAllPDbZUjhYyTfCc/zPc6oW8V0ONIwN3
	 8v7ZvvkQrzhBA==
Message-ID: <0ddf3634-d9eb-425a-b35b-c0b4ee995a4b@kernel.org>
Date: Tue, 28 Oct 2025 19:39:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-2-02abc9a107bf@oss.qualcomm.com>
 <20251028-wonderful-olive-muskox-77f98d@kuoka>
 <ac126c63-f40c-4159-87c9-1b3d7a8dec63@oss.qualcomm.com>
 <7efc63ed-9c84-43c0-b524-f7e9e60b2846@kernel.org>
 <f0c05321-776c-40af-b379-b9336b618340@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <f0c05321-776c-40af-b379-b9336b618340@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2025 18:45, Vijay Kumar Tumati wrote:
>>>>> +      - const: tfe1
>>>>> +      - const: tfe2
>>>> Why not using the same names as before? It really does not matter that
>>>> it is thin or image, all of them are the same because only the
>>>> difference against top matters.
>>> Right, this is done to maintain the consistency with the clock driver on
>> Sorry, this makes no sense. This device has nothing to do with clock
>> driver. Don't ever use clock drivers as arguments for doing something in
>> completely different place.
>>
>> Not mentioning that drivers don't matter much for the bindings, so I
>> really do not get what you try to explain here.
> 
> Understood. I meant to say that it is consistent with the naming for the 
> TFE device that is available on Kaanapali. If our intention is to keep 
> the names in the bindings same as previous generations despite the 
> changing HW architectures, we could change these to IFEs, to be 
> consistent with previous  generations. Please advise. Appreciate your 
> inputs here.


You name these based on the provider, the clock controller or whatever
controller, and that's the mistake. Names are coming from this device
point of view, from the consumer. This device does not care whether this
is Thin or Image or Whatever GDSC.


Best regards,
Krzysztof

