Return-Path: <linux-i2c+bounces-1516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C278416B2
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C8D1C22D8C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5096D524AC;
	Mon, 29 Jan 2024 23:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFGx3Gz4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626D3DB9B;
	Mon, 29 Jan 2024 23:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706570664; cv=none; b=qWn9pZKtu6vuibyvnkULK9aXQOQTV/Fy9hTnQynyDhuAgWZODi8pzNFVZQEzSCeMn5asJ5jcE/dRPYhwlcRVLOrMxgKIYMvtVxBDLs0FxFLqDSI7eJUPzaJccCkf4HIw1b/wQ0g7iOwoOo8TcNOYXrx4rpju60rbf3FvA+e1ncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706570664; c=relaxed/simple;
	bh=mWUBJyBeMt6z7cjJB3+Z1M8avUCRugedRzkfc+fGegs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8g6rAy9jlcNrqA2W5LHv8DLUZl9KK6RH2vgu6js7SaEXiYEKLXqhbCMSoikdcRXC/Sm6+PNtbhByo7hDFH1AerRlOlcjMOuonW+GJBmFjbAH224DjaGQ72d4L5HaJO6abX1HlTAADbm/dvejSi6Kj/ptz9hzzkDCEradjMYC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFGx3Gz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A8C433C7;
	Mon, 29 Jan 2024 23:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706570663;
	bh=mWUBJyBeMt6z7cjJB3+Z1M8avUCRugedRzkfc+fGegs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFGx3Gz4PCFhvob49dUcmVxul8W3WHlmW9+lobeVGy3HBZpjUfoMc1aRNp85XYBF0
	 1+gfotfq8dfQEgOpqgCDcRpwCrLmKaJeYOmEAeS4gXuKZIwTTOiKzjkijavns98YOu
	 9Fd+JXT5zY9QpqMnEw79kYZ/wnghpIxIskNh23v2ZrssT19IOgkJO67j1Rnp75GdBk
	 eKul14sWvnKMW/Z3VvAw1m8LDtc2QfKHP6SQfzYoVKnoT2IiHH/mDaa9jYdRnG7fcx
	 +YlqUeWInh2j8WAF51pxLyToR0mT4SxfjvW5SqPGfnQh0+HJJgtSORsY2SiCEWYb8v
	 Hz69Tqfb3FQlA==
Date: Tue, 30 Jan 2024 00:24:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vkoul@kernel.org, quic_bjorande@quicinc.com, manivannan.sadhasivam@linaro.org, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [V2] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Message-ID: <lib6m2bty4uilvvu544sjlezeux7ne4cx5i25j6yndicx7miaw@tvxpuekiczwh>
References: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129061003.4085-1-quic_vdadhani@quicinc.com>

Hi Viken,

as Bryan has done some comments in version 1, please, Cc him to
this patch.

On Mon, Jan 29, 2024 at 11:40:03AM +0530, Viken Dadhaniya wrote:
> For i2c read operation, we are getting gsi mode timeout due
> to malformed TRE(Transfer Ring Element). Currently we are
> configuring incorrect TRE sequence in gpi driver
> (drivers/dma/qcom/gpi.c) as below
> 
> - Sets up CONFIG
> - Sets up DMA tre
> - Sets up GO tre
> 
> As per HPG(Hardware programming guide), We should configure TREs in below
> sequence for any i2c transfer
> 
> - Sets up CONFIG tre
> - Sets up GO tre
> - Sets up DMA tre
> 
> For only write operation or write followed by read operation,
> existing software sequence is correct.
> 
> for only read operation, TRE sequence need to be corrected.
> Hence, we have changed the sequence to submit GO tre before DMA tre.
> 
> Tested covering i2c read/write transfer on QCM6490 RB3 board.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Fixes: commit d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")

The format is:

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")

and goes above the SoB.

> ---
> v1 -> v2:
> - Remove redundant check.
> - update commit log.
> - add fix tag.
> ---
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0d2e7171e3a6..da94df466e83 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -613,20 +613,20 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  
>  		peripheral.addr = msgs[i].addr;
>  
> +		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> +		if (ret)
> +			goto err;
> +
>  		if (msgs[i].flags & I2C_M_RD) {
>  			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>  					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>  			if (ret)
>  				goto err;
> -		}
> -
> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> -				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> -		if (ret)
> -			goto err;
>  
> -		if (msgs[i].flags & I2C_M_RD)
>  			dma_async_issue_pending(gi2c->rx_c);
> +		}
> +

Bryan, could you please check here?

Thanks for your review!

Andi

