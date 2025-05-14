Return-Path: <linux-i2c+bounces-10990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A8AB6FEA
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 17:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C151B1709AD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 15:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E452040B0;
	Wed, 14 May 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSJidpoG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2961F4163;
	Wed, 14 May 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236869; cv=none; b=IuhtVqysDHb0lPzJe46XxNUOEjkqTzOzX9BjXq1zcKiFiBIM7pO8JykUi0I0NZ3cG1rSWWlQrnNhHq149b3os5kVxAUOn9JGG4KiXzd3AxNO6q/2Xzn7v8gv6pTNQ8qP5qXAlWzU+O4yPjASMj83/q5CHoydOZh/k7aRguM6H34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236869; c=relaxed/simple;
	bh=gT7/qin/8QVRyNnG+FPJVCymwo4TtwAtUyS0MFg/SXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQFrZ8PzLaaeuNIIVxByvsIDqEA2g4djVhnVDT0xXRWcMjEO8e9pa7uAv3Tflyx1vqX7hQF1MXIe2sboRIgBpcMWfb9bBo4btxSW+Lr4CsRlHRkgqfDa+0ydswoZWb6lGkEdLDFyxFE7QC3iEe17kDc05sBeenQh/S728/GuhDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSJidpoG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E560C4CEE3;
	Wed, 14 May 2025 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747236869;
	bh=gT7/qin/8QVRyNnG+FPJVCymwo4TtwAtUyS0MFg/SXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSJidpoGa7sfPzzcRl2IuIK7G0QII6YBQLAmM6cldjSbTl1guIYDe8aiweh/1vrtQ
	 IlRkwcrsxNHd9rvJLYGQ6MRIE3oZlaQv5E072PpaEmXJ2RvGqf2aeXrTakBVlamn16
	 c6emMBDPw1lZyGbBTAlA2ggQNeurnOsIcy893p4CFKjHGd/RPexdhWfKcXW1chs6ux
	 W17aR35YUr62YZbRLlOMG3LKBVt9CUMdBPRa3g9Hv6YbXcRpMs5ojiNXs6exWgL1oM
	 2yk4b8pElyHq/wxDanvrXUdqP+9jczcXvD80mQIdL/SxNYSCKHDTMZ+NGNvkH+buSX
	 fBaAn1z0unUvA==
Date: Wed, 14 May 2025 17:34:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	Viken Dadhaniya <quic_vdadhani@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
Message-ID: <y4t3xshxsbrx6xqkxroai3vixjacskco5baaoip2apzjkehjxx@ah6wxu2gy24g>
References: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>

Hi,

On Tue, May 13, 2025 at 04:38:33PM +0530, Kathiravan Thirumoorthy wrote:
> Update the I2C frequency table to match the recommended values
> specified in the I2C hardware programming guide. In the current IPQ5424
> configuration where 32MHz is the source clock, the I2C bus frequencies do
> not meet expectations—for instance, 363KHz is achieved instead of the
> expected 400KHz.
> 
> Cc: stable@kernel.org
> Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index ccea575fb7838db864ca4a2b21ebb3835b2567b2..2fec7b44bfc1baec68e321a9f57de4156120919b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -155,9 +155,9 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>  
>  /* source_clock = 32 MHz */
>  static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> -	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
> -	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
> -	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
> +	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
> +	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
> +	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },

argh!

Can someone from Qualcomm look at this fix? Mukesh, Viken?

Thanks,
Andi

>  	{}
>  };
>  
> 
> ---
> base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
> change-id: 20250513-i2c-bus-freq-ac46343869a4
> 
> Best regards,
> -- 
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 

