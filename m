Return-Path: <linux-i2c+bounces-14284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589AC8AA92
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 16:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F1F3A4CA2
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 15:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4814B334C25;
	Wed, 26 Nov 2025 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9IdswPv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED55D307AE4;
	Wed, 26 Nov 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171198; cv=none; b=pFwwDSuKZXMNMlghzRCkIkRJHW6EnGS/KUiqYSe6zQ3n165X2juwluYfCNzmGnZgFS1MAzqHMCYA5vdEaKeoHWdKv121Jj6XJ14bcQFaj7izxPlb7f8hcJmIMpoUkpB2vjKqC9VPrKdGpYNV1R8Td5nl+Pyt3yQnlEuGGJD4oYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171198; c=relaxed/simple;
	bh=8N51mrlxRqFGyhsxXG7P5LFCzN4lqhO6tGuVXFb92Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUyKdu+GjYw4e7iNj4G8lJPwih57zoZuLvOCRmFBDWodJ+oWKBxxzSdSfp8etosi+qj3Uiiaw44c6OwgW1qxmvqsSRIgHNOdWqJQpv7NYSkx2aKrEbSAA2JlSvr2qjgqzqZR5E8tYdIVYbHlyqFKqyP18BXBqXEg5YCBEB5PwGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9IdswPv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395B6C4CEF7;
	Wed, 26 Nov 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764171197;
	bh=8N51mrlxRqFGyhsxXG7P5LFCzN4lqhO6tGuVXFb92Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9IdswPvcXaHI31Rd5cNdTDDpeSLfvnW3pzKQR057w7KdEMxZa93TVZxQklBc1frB
	 3Hv7Cc0mM20UCSIhL+65PoSfksVOXdAJEpnzuv0FQS1m1H8edgjvUlYeXVepMg3AXb
	 ALiAd3ZyCjpjs9He0a+AViZwQe3FTTSfBUKuYpQwPUuij6LGLgVyN85KoRDdjhOwaG
	 TXNuFf0JgtSAKuYC9k3sZU1d5JlIK6q4areDDbwWdnaQwDlu4sFLPYG1IrRrrsbe1c
	 NxjQBJL16uH5EzK5V6j8dggrfp0BcljShJXziLXHgETmDpCSxr63QAkdREZc0U8yiD
	 H6+TbYgv0F/Xw==
Date: Wed, 26 Nov 2025 09:38:47 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v1 10/12] i2c: qcom-geni: Use geni_se_resources_state()
 API in runtime PM functions
Message-ID: <gwdb27mtmqrt7rt3g5bzae4a3soquy7lwtw6zbjjhj42v3oyrq@qf22i7davz3o>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-11-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-11-praveen.talari@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 10:30:16AM +0530, Praveen Talari wrote:
> To manage GENI serial engine resources during runtime power management,
> drivers currently need to call functions for ICC, clock, and
> SE resource operations in both suspend and resume paths, resulting in
> code duplication across drivers.
> 
> The new geni_se_resources_state() helper API addresses this issue by
> providing a streamlined method to enable or disable all resources
> based on a boolean parameter, thereby eliminating redundancy across
> drivers.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)

Nice to see such stats, which I presume will also show up in the other
SE drivers later as well.

> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 790cbca2c22e..ea117a4667e0 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1166,18 +1166,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
>  	disable_irq(gi2c->irq);
> -	ret = geni_se_resources_off(&gi2c->se);
> +
> +	ret = geni_se_resources_state(&gi2c->se, false);

As I said in the previous patch, there's no reason to "set state to
false", it's clearer to just have an "on" and an "off" function.

Regards,
Bjorn

>  	if (ret) {
>  		enable_irq(gi2c->irq);
>  		return ret;
> -
> -	} else {
> -		gi2c->suspended = 1;
>  	}
>  
> -	clk_disable_unprepare(gi2c->core_clk);
> -
> -	return geni_icc_disable(&gi2c->se);
> +	gi2c->suspended = 1;
> +	return ret;
>  }
>  
>  static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
> @@ -1185,28 +1182,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> -	ret = geni_icc_enable(&gi2c->se);
> +	ret = geni_se_resources_state(&gi2c->se, true);
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(gi2c->core_clk);
> -	if (ret)
> -		goto out_icc_disable;
> -
> -	ret = geni_se_resources_on(&gi2c->se);
> -	if (ret)
> -		goto out_clk_disable;
> -
>  	enable_irq(gi2c->irq);
>  	gi2c->suspended = 0;
>  
> -	return 0;
> -
> -out_clk_disable:
> -	clk_disable_unprepare(gi2c->core_clk);
> -out_icc_disable:
> -	geni_icc_disable(&gi2c->se);
> -
>  	return ret;
>  }
>  
> -- 
> 2.34.1
> 

