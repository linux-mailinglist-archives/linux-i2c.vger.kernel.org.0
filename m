Return-Path: <linux-i2c+bounces-13581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDABE2F5C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 12:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC6B3B9742
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 10:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792942BE7A1;
	Thu, 16 Oct 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riheAUHm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FA2E0934;
	Thu, 16 Oct 2025 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760612068; cv=none; b=sH3YosKnxTsEzP2fz7Rrq6n35j+gX7cfbqdbqzlbJVBAcckunYbUgeZgZb3pSdlYhKOG76G9zJCAcsjm74TYMdxqlsKnVZTrjfO9dv59CEZPH9olSPXDZx9eO7adQ8X55OahMXXMcsow0hzD28PLVHjZcPrLKfnaPqqRw2VffSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760612068; c=relaxed/simple;
	bh=MNQCEVD7t9irNK9SNNWAEb+eVUCg70XjNwcvI0uGKp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTVTzQgeduxhf4HzL3LiCYl14xmJIrmXrZjnsYs1u4OOns5dLEfkqpIquRZT1t1uA8FF42ZpeHaqGCkFciiguXcXTW0+KDs3KxD4NVifLbdqu6/gyYNK0/YA3TAYxNo8vSRoepjOYb92UoYBZEc7KCs+x1hDu+FkG7XZOe67GQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riheAUHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28ECEC4CEF9;
	Thu, 16 Oct 2025 10:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760612066;
	bh=MNQCEVD7t9irNK9SNNWAEb+eVUCg70XjNwcvI0uGKp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=riheAUHml/y4W6kqiKw/pLQ7BTTMesLHUX9EXFHhxbsRXaH72SRDyKa3q6aooHfLe
	 7xg+pU9jyIH0JPxwQGzDmiDyWerLHOxWwL5Ac177i7QL6+0CJem42DOdA7HF/NlcGW
	 Pg3Puhw9TU0FnnP4CKBldchVXFgcW09fislJ0uUZ6pIGocKWiSRwSXVV0s8abk7diX
	 uMOCYy9gnygbR1PGDoQS+f+mf4/udeyWsaIc8VOYKVz0DasnaPm53oM1GlrCNDjlWk
	 qg1QwDJ93rtIc6ae26r7JzMzSkGnzqZ1dX+nCyZWoeun6HrIlt4BLCRn2cJ6LhYtJ4
	 jlzlUpapYBMTg==
Message-ID: <f5df1c29-a1cd-4cc7-8ac4-b4aefc4225b0@kernel.org>
Date: Thu, 16 Oct 2025 11:54:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: qcom: camss: vfe: Add support for VFE 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-6-f5745ba2dff9@oss.qualcomm.com>
 <8d61f29b-ba02-4757-b8cd-5fb51b998acb@kernel.org>
 <FA4lDfkvC1Bdn7xJsoLXyWUEackUIfrSW4vn_6Q5YA5pDcNJ0QZ8EeU0CuEqKQuzdnYLC-AIvy9RhoY2ba5sbQ==@protonmail.internalid>
 <1aa133b9-2a99-47cb-8309-7e49b5dc4f85@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <1aa133b9-2a99-47cb-8309-7e49b5dc4f85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2025 11:33, Hangxiang Ma wrote:
>> But why ?
>>
>> ---
>> bod
> That a story. When testing the RDI path on Kaanapali, we found one image
> buffer starved at 19/20 stage. We want to capture 20 images but only 19
> received.
> 
> On Kaanapali, the AUP and RUP are split into two separate registers not
> a single one. Maybe this hardware change impacts something. Calling
> ops->reg_update() in vfe_enable_output_v2 function only applies one
> buffer address. The downstream code defers AUP and RUP to CSID
> configuration stage. We mimic that and find it can solve this issue.
> 
> ---
> Hangxiang

So this is the type of interesting detail that I'd go looking for in a 
commit log, a comment in the code or a footnote in the cover letter.

One or two sentences in the commit log will do.

---
bod

