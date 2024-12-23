Return-Path: <linux-i2c+bounces-8699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC449FB7C2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 00:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72581884C21
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 23:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4465A1B4120;
	Mon, 23 Dec 2024 23:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP8/Q4/8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F090718A6D7;
	Mon, 23 Dec 2024 23:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734995638; cv=none; b=cUFe7SVcNpXXsegG+eroLqxoterk8OeNky/uyq8vU7DYIszzt1x3X0R6fx8FoqR+gsGCpqr11y3sb+lTziLCdtCtBPxKp8/MM52kJZjjymW4KEKke+wP5jVJzGM9C4hosck6iS2Yn+YWtrP7tiAwO/qjS3h2IV1eA9VI+izqt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734995638; c=relaxed/simple;
	bh=TyP4QDcgBbaAubuB18SKIbFnVadU5zHJDCj3I5P7s6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDQZ4lNJVQKhoR/v4B0FQvpCQlQ6jJ88ARqV0OSUpFB3QzEbENN7udzXuCz/4dn0Rmr1/Up3tEhhybDZqHb1ILNggYqFuZtF8r6KpdCqcPXLFvRBCf87/rYOF3lNnGqp9XI+kLtw5uGvVyMeMWnu/lRmAQywDwURXDuPFR8ygcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP8/Q4/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6FBC4CED3;
	Mon, 23 Dec 2024 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734995637;
	bh=TyP4QDcgBbaAubuB18SKIbFnVadU5zHJDCj3I5P7s6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PP8/Q4/8w4MlzOjBBL3S6JzQe3Ynx+KYDgPpO7IzVsTucrULhWBfBjHdJSso4MzqB
	 1R43DiKvwXLo4b9FPzG5ivowUMogbK/4ciF/jjcM0rZzG3Ppgjm9PYjp1r7sulinTD
	 AYnfPBUaJz2Dcmsw1M+ZosQxsFOmsqTxGU0dR+H5VirpeGi6xnxp17cLpkVr9YuVii
	 l+vvCw3T/fmtYFVp6sM7XkRuBTW0mxXIMBBa9wStnPeW5Sg82jtMutgKm+Ctf0iAII
	 UXhp85GF9DUIWG4ZKS9w1PKixscwsZTlfbeYbCLGsYKBwDR3ndIa8v/yFyVynYG3xW
	 1iGQNbRmfdskA==
Date: Tue, 24 Dec 2024 00:13:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Message-ID: <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
References: <20241223034416.544022-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223034416.544022-1-carlos.song@nxp.com>

Hi Carlos,

...

> @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (ret == -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
>  
> +	/* As we can always fall back to PIO, let's ignore the error setting up DMA. */
> +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			goto clk_notifier_unregister;
> +		else if (ret == -ENODEV)
> +			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +		else
> +			dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
> +				ERR_PTR(ret));

My question here is not just about the use of dev_err vs
dev_err_probe, but why don't we exit the probe if we get an
error.

We should use PIO only in case of ENODEV, in all the other cases
I think we should just leave. E.g. why don't we exit if we meet
ret == -ENOMEM?

Andi

