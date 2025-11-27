Return-Path: <linux-i2c+bounces-14308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40861C8D4CC
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 189254E2561
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B3732144A;
	Thu, 27 Nov 2025 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0DXdRQf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F2F1EFF8D;
	Thu, 27 Nov 2025 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231295; cv=none; b=diw2PMeljYnJMAskMOT1pNXr2Iexa7st3g5/wMSytoWtnB+eMTVih7f5Lk6fB/ELBC6YL0h4aUP1+/jYLEHg7+BDgCLpkMnMcc4PXI/HlGXoAEpVTm4ewqvY/qL/1wCDGCq8lCxE3WX4FbObOg3/XzgygmbzjmXPUPUjh0cYpdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231295; c=relaxed/simple;
	bh=JaaoIvkBV1cOTAYwJfakFViPnNNVHZkwiOsm+EHJ7LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkiGJedREmV3nFZOwSfA4kE0lVSa1GS9KvnUztyBzmnJXv+4Lekt/jcVPdWpR0e4y9SIcy/QcIx8dwZ6DNxgqN3JLfqpW5ZQBNwKwGjywf1a48ZoDEYujSrvGCpyWYw3gsDyq78lzYArPTtc4X3azx5IOTjN1bwKSJVMrhJ/GlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0DXdRQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E804C113D0;
	Thu, 27 Nov 2025 08:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764231294;
	bh=JaaoIvkBV1cOTAYwJfakFViPnNNVHZkwiOsm+EHJ7LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0DXdRQfGqf1xCggIQ9R0o1m6jguioABT+/KFFipP6sLMYo80XFaugxV8oHbuRE3R
	 7yOd0oLCAN7mvlmYkToKZ0D9DrNjH4cKqQG2ZuPpbIXMX/rtWcgowNw7gpNA3LSa7s
	 5aYYHNa03AXueOB9Cdp3hd86cvZp6Wazzpf6tnPbyoXy7aH1ISAH0ma8lvfoPhtUoO
	 8da8Hl13ihYU7AtRwFAbXllAbYCiycFg3bDUYsfhx3Fpn2pqxU1k3OTwhdoOC3scrF
	 z5oSqs/xHfr2pzJpmfLTm+aWXrHZ3JyHGWmcRlyvEMyrVbqgYBeN6nYN5jpcQq/enx
	 JRu4zUXSMVtvQ==
Date: Thu, 27 Nov 2025 09:14:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH 4/7] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Message-ID: <20251127-terrestrial-arboreal-bird-5a6d9b@kuoka>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-4-646fee2eb720@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-4-646fee2eb720@oss.qualcomm.com>

On Wed, Nov 26, 2025 at 01:38:37AM -0800, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Additionally, generalize the struct name for the lane configuration that
> had been added for Kaanapali and use it for SM8750 as well as they share
> the settings.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  11 ++-
>  drivers/media/platform/qcom/camss/camss.c          | 107 +++++++++++++++++++++
>  2 files changed, 114 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f9db7e195dfe..157e946f67db 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -684,9 +684,9 @@ csiphy_lane_regs lane_regs_sm8650[] = {
>  	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
>  
> -/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
> +/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
>  static const struct
> -csiphy_lane_regs lane_regs_kaanapali[] = {

There is no such line in next. Your cover letter does not explain
dependencies.

> +csiphy_lane_regs lane_regs_v_2_3[] = {

Best regards,
Krzysztof


