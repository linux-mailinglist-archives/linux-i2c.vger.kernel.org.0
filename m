Return-Path: <linux-i2c+bounces-9960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BD7A6AFD4
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7A8F98492D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 21:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87FD226D14;
	Thu, 20 Mar 2025 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhSKAK5h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D6C20C477;
	Thu, 20 Mar 2025 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742506164; cv=none; b=qCP4sGMGZKHZNFUuX8L1MLFozfzC8UvfG/G/8LUo6M7Vx17f+BHl22R8zwIo1Qe02YOIDKOd4sA3QDelkJ36Igo/weQVxT4UqXaZ2Qx8VxSV2TKtug8I7RJqBY8bGgfjJc5Hs0zHAw9TKSdhrOyRqkdBVSAanqVlaQFJ9QW15ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742506164; c=relaxed/simple;
	bh=BfFbmidVd0ga1sTaDOR7P/pNui14jGTWt28A2TXGhGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyL0INRMiGR1OL5aw8NeE5E4ErTsnX/mcEk6S39qR2r+x9xdM1TZz8JFOhn5dCNd8SHKAEFHWPeJYjnEm3JpHh/sthRcgSQbN6UP5Tjw/T2dfqEPsJL74/kHfM9oGlcaPmAiP832KRSr26nWizUY5lUUvjCn5YCzbBYDP37aHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhSKAK5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4D8C4CEDD;
	Thu, 20 Mar 2025 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742506163;
	bh=BfFbmidVd0ga1sTaDOR7P/pNui14jGTWt28A2TXGhGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhSKAK5h8Q82LHf7Hlg04L+bPGwJDVi54Y44giplGZxoxQE9w11cuLNOoUCnkgfEk
	 vdcSP4uywjHrgTWuILvCl6+rHA5j58bzvHdlIh/PrliLUhGDw81yQipf5SctpAJNIx
	 PyxXoDFWxD76kfcOfKVYaDPrRbtVvPgJYHBp5AVV6/H5qwIdY2o5eQxtU5EA7un32A
	 IWlcR8oAWUw3m6dIanBa9A0E+Jirj8pub+fQkzffZmkKlK5kZ0lvie/0Rb90RdL7ie
	 l0Tx6h3PD1uPJ8i9yscOeY73gfSSYlqw5KKksbLRaEkD91HI9PgvCiW4wI7ScN7iqC
	 v9aMsqsLB804g==
Date: Thu, 20 Mar 2025 22:29:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: u.kleine-koenig@baylibre.com, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant
 error checks
Message-ID: <brmzhl77j2lk7bghy5iuzeifar2fdwa6nhhzfywm7xvlidxwjm@3x4cy4f6pxvf>
References: <20250121084818.2719-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121084818.2719-1-vulab@iscas.ac.cn>

Hi Wentao,

...

> @@ -1169,9 +1165,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
>  	 * Power domain could have been shut off completely in system deep
>  	 * sleep, so re-initialize the block here
>  	 */
> -	ret = bcm_iproc_i2c_init(iproc_i2c);
> -	if (ret)
> -		return ret;
> +	bcm_iproc_i2c_init(iproc_i2c);

This caused a:

   warning: unused variable ‘ret’

Please, make sure next time to compile properly before submitting
patches. For now I fixed the warning and merged your patch to
i2c/i2c-hist.

Thanks,
Andi

>  
>  	/* configure to the desired bus speed */
>  	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
> -- 
> 2.42.0.windows.2
> 

