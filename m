Return-Path: <linux-i2c+bounces-2746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31A896A40
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 11:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF1D21F22A62
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 09:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8136FE23;
	Wed,  3 Apr 2024 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBnCiwl+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF456471;
	Wed,  3 Apr 2024 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135692; cv=none; b=ieO5EeWH5zxgzUnuybMvo61qfyMhiVw/ml1OBS14ihk9UvELlko1I2wr/4zhcqjszvSez2HfoZqhjtdu8dzjT+9Ma4W3VIcid3vxyn/D4xrOJX6AArJp82tm6kp5yHQ8xELaD987dv26GvJ0Ybb7dx13SHLWYp6aPuOlHMBaQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135692; c=relaxed/simple;
	bh=tdYqN9JNU3y7bUqfHA7MIqAfZHQZ3nL90gh9cpYdd6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNgCP2lEC6AXkPoM6slKp5o3377GtiWXFsgXABSn/hu7WBNs0uwW6V5aHY3yXBrCfqEikeBiLEizHOEZWAnpMm9usWKrna8tWJD5KXcrElJQMfVzjNBZHtqS0DlcSW0aWwTOmtlZejAN3QKJRLfgPW9O0bAHAy31FjBeBCsCfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBnCiwl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6342C433F1;
	Wed,  3 Apr 2024 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712135691;
	bh=tdYqN9JNU3y7bUqfHA7MIqAfZHQZ3nL90gh9cpYdd6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rBnCiwl+gwZRpZOrE+4NAJvne0HuzXzvlPlbkckwn1gjNGshzT+uI89ZQxSGRK5ok
	 DvuTaNrqVupWhMOaDaqhO5X6drqfyU4RtHDSnsm6tntn8vPS6YXc28lTEkJdcKBxBB
	 hviFdnJ7EY21aOoNX/k4fikOM/n5+ayAjqW7FBl+1SvPD6DjvDm5u8zXgJZTA8fpxI
	 3AJryGcEcIkX7gYzb7yfGLF7p/CINw7UIqkXlSGSsQcsajfTy45TrL59jMBqhgBOhK
	 tZc41eCqQr2fhMp+LtBkRNcxaX9pf2+gD2QOo/7muZhyu3AREf7+bj5WxrXCL/6bHd
	 Zg9Eu23Q5cu0w==
Message-ID: <3dad8ee4-7d9d-4602-bb5e-f148d51d1fcf@kernel.org>
Date: Wed, 3 Apr 2024 11:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, wsa@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 quic_vdadhani@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya> <c805ff2a-8056-49a8-90b7-814c7a973d72@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <c805ff2a-8056-49a8-90b7-814c7a973d72@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2024 08:46, Mukesh Kumar Savaliya wrote:
> Hi Vinod,
> 
> On 3/29/2024 10:15 PM, Vinod Koul wrote:
>> On 28-03-24, 08:36, Andi Shyti wrote:
>>> Hi
>>>
>>> On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
>>>> I2C driver currently reports "DMA txn failed" error even though it's
>>>> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
>>>> on the bus instead of generic transfer failure which doesn't give any
>>>> specific clue.
>>>>
>>>> Make Changes inside i2c driver callback handler function
>>>> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
>>>> stores the error status during error interrupt.
>>>>
>>>> [...]
>>>
>>> Applied to i2c/i2c-host-next on
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/local tree
>>
>> You applied changes to dmaengine driver without my ack! I dont agree to
>> the approach here, we could do better
>>
> Could you please suggest changes OR approach related comments ? So i can 
> make a new change which can clean the merged code ?  Hope that can 
> address the concerns.

Can you address original comments?

Best regards,
Krzysztof


