Return-Path: <linux-i2c+bounces-13609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 485D3BE8715
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 13:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 765383B6B86
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 11:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA791332ECB;
	Fri, 17 Oct 2025 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P97FLqP9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258D332EA1;
	Fri, 17 Oct 2025 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760701325; cv=none; b=UYjaqWWlioeDgMNPQwZ7CHszNAAD3CkdfyHZNKRcxRI4G7VISEbmwtZSB+hhI46ky7D5+nTQav3hUMiKn4NZGTCGKTvcDykKYTBvWm+vf7rptP6j8c7Bk3JEezEJVoz99x9ZLNwlXPQkAUmHq2hfNyt9O/bqFtag1K07YWA6zJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760701325; c=relaxed/simple;
	bh=mthe/fF4A22byCBSStC36YOCfUhCaOvhjMSwfA73/EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTugtVKWglc/pwscKlCjTnulhCty/sZ31XyYrfXvZ7zZmb4iEVcBztaMCrEhpN5wNUTism6yZzmxr0QyTEqZqM1f82kQSq2G33+ebNsuAFRZOI95siEg80RiAbxelXQtqD+AJmBNGKD5vKjDWa3Rz6wZvzET65LDBaF93JbxJ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P97FLqP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4BDC4CEE7;
	Fri, 17 Oct 2025 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760701324;
	bh=mthe/fF4A22byCBSStC36YOCfUhCaOvhjMSwfA73/EA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P97FLqP9G+N+fKUKy53p1Vg6dEouJyimIoskR4qIouCpT5SEnt1tXdRdSZz68f9u3
	 PJujblplMHVI/eEHv3tLM62AGr1covLYv3SeembHwiIfZuMiHjKkJdPQeSGJxz0EXd
	 gGXJnO2kKWW14PgJIXgx9v8dIKQW1/w8ToC6UXwSAJNxE00owIGYtanTwt/iPCutw6
	 I3Gd3az58N4QsWKg65SLqFcDyvHvZ1mCBwOOeUKVqsPzZtLuACEgJuKKKvdWTY2+l0
	 rj5k+dLE4e+ljxQSqBMGOy2XOMvi6Q4eR84nRrdKnnHDcht4qwCgwoOqcO6mblHQ0o
	 Fwgw0hf+O5JvA==
Message-ID: <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
Date: Fri, 17 Oct 2025 12:41:59 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
 <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2025 21:53, Vijay Kumar Tumati wrote:
> 
> On 10/16/2025 8:31 AM, Bryan O'Donoghue wrote:
>> On 16/10/2025 13:22, Loic Poulain wrote:
>>>> I'm - perhaps naively - assuming this clock really is required ... and
>>>> that both will be needed concurrently.
>>> AFAIU, the NRT clock is not in use for the capture part, and only
>>> required for the offline processing engine (IPE, OPE), which will
>>> likely be described as a separated node.
>>
>> Maybe yeah though we already have bindings.
>>
>> @Hangxiang I thought we had discussed this clock was required for your
>> setup.
>>
>> Can you confirm with a test and then
>>
>> 1. Repost with my RB - I assume you included this on purpose
>> 2. Respond that you can live without it.
>>
>> ---
>> bod
>>
> @Bryan and others, sorry, I am just trying to understand the exact ask
> here. Just to add a bit more detail here, On certain architectures,
> there is one CAMNOC module that connects all of the camera modules (RT
> and NRT) to MMNOC. In these, there is one 'camnoc_axi' clock that needs
> to be enabled for it's operation. However, on the newer architectures,
> this single CAMNOC is split into two, one for RT modules (TFEs and IFE
> Lites) and the other for NRT (IPE and OFE). So, on a given architecture,
> we either require 'camnoc_axi' or 'camnoc_rt_axi' for RT operation, not
> both. And yes, one of them is a must. As you know, adding the support
> for the newer clock in "vfe_match_clock_names" will only enable the
> newer chip sets to define this in it's resource information and set the
> rate to it based on the pixel clock. In kaanapali vfe resources, we do
> not give the 'camnoc_axi_clk'. Hopefully we are all on the same page
> now, is it the suggestion to use 'camnoc_axi_clk' name for
> CAM_CC_CAMNOC_RT_AXI_CLK ? We thought it would be clearer to use the
> name the matches the exact clock. Please advise and thank you.

The ask is to make sure this clock is needed @ the same time as the 
other camnoc clock.

If so then update the commit log on v2 to address the concerns given 
that it may not be necessary.

If not then just pining back to this patch "we checked and its not 
needed" will do.

---
bod

