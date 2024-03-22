Return-Path: <linux-i2c+bounces-2553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3697886EBC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 15:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82D88B23595
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CA3481A5;
	Fri, 22 Mar 2024 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FA/SG+9T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26A47F6F;
	Fri, 22 Mar 2024 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711118141; cv=none; b=byc5hh7Socmj6KJSbyZBm+SGSwoza648+BgXsD80I73Zz+KT3A91y5GIJnG8VCmHPKIMTJcwG+BoPBmFplqQTGdi/DXifPiPdJX5dHGSuabGC93Ny1rf56TPqpb4DRTiVH32n/EaFaabf/M5A65NkNXQ7lPNKRxIoxlNK81OQyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711118141; c=relaxed/simple;
	bh=6BhaNQSGjOcHcLyTBknP2Sw28oEWlTrKGYjz+J67vF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikPezsKSp2h9gGAO2JMzegSRFr/Xi94ItAfbZB511yh7Oml3YyRoixRgTnN2b3Ym2+9S01H18zjyd/INKwDovnS5ZF704t/jCjaDLGOgQ58tJQqqSLVBjO/UmhpxJHFB1uriUPHhaskuV0TghMttNaXgMesUbbaUApYG19R4AbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FA/SG+9T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862D4C433C7;
	Fri, 22 Mar 2024 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711118141;
	bh=6BhaNQSGjOcHcLyTBknP2Sw28oEWlTrKGYjz+J67vF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA/SG+9TvmCkwewQwm+7kSt5pHQtrmCFmVCBg4whJckoitX2/LdAOiQzV6Hj2m4RS
	 wsRnQf3VK4HEixX1lOnPhjtOw5pwUoIiBHSmS355ZKAraRWCjp2g1/WadnZTRoQeGh
	 VXCoom3CuC6775gfF/4eY3VHk56ScK3J3LOgzLgMtpsR4q4OQZrcj00pz/39mXFxRi
	 EbOlRgNLs3k5zcOatjqkLCfHz/9JMoQxmAKw0p7926s1bzalPretXINSASHUzsbAr2
	 HHOP7A8IuZIwkWOCO/l9+Zhm9TOQDP/3vncebvZmWU2y8uCxSDkYAGl5JXD1DlG8BP
	 /X/C6arB90+xA==
Date: Fri, 22 Mar 2024 09:35:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 44/64] i2c: qup: reword according to newest specification
Message-ID: <zx7b7vfklkyirqdf7mabqcqtjv562k63v7cmoa5soqnfdkbmbh@werqq2a2k354>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-45-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-45-wsa+renesas@sang-engineering.com>

On Fri, Mar 22, 2024 at 02:25:37PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/i2c/busses/i2c-qup.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 598102d16677..2aeb5c33a711 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -380,7 +380,7 @@ static int qup_i2c_poll_state_mask(struct qup_i2c_dev *qup,
>  	u32 state;
>  
>  	/*
> -	 * State transition takes 3 AHB clocks cycles + 3 I2C master clock
> +	 * State transition takes 3 AHB clocks cycles + 3 I2C host clock
>  	 * cycles. So retry once after a 1uS delay.
>  	 */
>  	do {
> @@ -1607,12 +1607,12 @@ static u32 qup_i2c_func(struct i2c_adapter *adap)
>  }
>  
>  static const struct i2c_algorithm qup_i2c_algo = {
> -	.master_xfer	= qup_i2c_xfer,
> +	.xfer	= qup_i2c_xfer,
>  	.functionality	= qup_i2c_func,
>  };
>  
>  static const struct i2c_algorithm qup_i2c_algo_v2 = {
> -	.master_xfer	= qup_i2c_xfer_v2,
> +	.xfer	= qup_i2c_xfer_v2,
>  	.functionality	= qup_i2c_func,
>  };
>  
> -- 
> 2.43.0
> 

