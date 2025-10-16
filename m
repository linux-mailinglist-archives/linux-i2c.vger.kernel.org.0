Return-Path: <linux-i2c+bounces-13592-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB6BE4450
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 17:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F3FC3B3E4C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 15:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7F434DCCD;
	Thu, 16 Oct 2025 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYvWAMzc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12C34AB0A;
	Thu, 16 Oct 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760628695; cv=none; b=VBHeUj9Fas6aoXRGeHp9Ddond4E0NndKFvXsCTfyHzkQyPz89bWUwOvudow9Gu4TnRDGELhh7SipQAkkWEE8N5gSdFpMolFGV7zp6GHrOR9AksRPz97Co/Y19XhHi7P1Jeo322U8iRNRA1HZmMF1hNO8s04a2xux1h8wbstbaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760628695; c=relaxed/simple;
	bh=Qce3400gZekkF9rZ7Sx7daMfcQ3FsP9u8CUhUxXknVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQ2qw2R3eBIo79vMA/YGRq2gPYi6MknpfAnKZIWFpQlbm4XgKje1yssG3Ica264Y2AZFx5u5Vhq6Its/1xU89tx36paXcoK5A3jSE6QxBgo7VqTgg1GtdjoMGucQcnG8TlRwDaVyMHr5OMwRNfcxZ8D5RfXeHrrGOru1eSh7NPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYvWAMzc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72522C4CEFE;
	Thu, 16 Oct 2025 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760628694;
	bh=Qce3400gZekkF9rZ7Sx7daMfcQ3FsP9u8CUhUxXknVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mYvWAMzc3SRt0amHGvhycjblwqyjJ6zdnMVaKS5Vug3+gevsdIzHaZLXjsH/W+9ZF
	 YnWZ+0fNbLouN2ioX8xOA0rgLJG9lqT30DfZNiPNhucWWagL451Ii7Th3oA8o0iyOi
	 Dd7zd+m4hdcSJOCU/WndaJS0Xwmcx3J37qbODzL4lL47Fk9AJS8VfAsfAzcgjyPr1g
	 /UFuieoKW1bMC6Tp/AvmTH+Cr01y31pGfh2XnwXFXrXAD5eG1xCOdxY6kPeA2pDa7c
	 3cP27mjB5L+6vKqafZSlDxW6idRtqSC9QuX3KILRH7wh+jWyLcYxtp6VQFJBIzVZ1W
	 gc58BAIZlHfmw==
Message-ID: <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
Date: Thu, 16 Oct 2025 16:31:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
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
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2025 13:22, Loic Poulain wrote:
>> I'm - perhaps naively - assuming this clock really is required ... and
>> that both will be needed concurrently.
> AFAIU, the NRT clock is not in use for the capture part, and only
> required for the offline processing engine (IPE, OPE), which will
> likely be described as a separated node.

Maybe yeah though we already have bindings.

@Hangxiang I thought we had discussed this clock was required for your 
setup.

Can you confirm with a test and then

1. Repost with my RB - I assume you included this on purpose
2. Respond that you can live without it.

---
bod

