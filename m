Return-Path: <linux-i2c+bounces-586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 974338023C1
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 13:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C93101C208EF
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 12:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AFFF505;
	Sun,  3 Dec 2023 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPu3hqDM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0BE57E
	for <linux-i2c@vger.kernel.org>; Sun,  3 Dec 2023 12:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AE7C433C7;
	Sun,  3 Dec 2023 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701606738;
	bh=PycW9pImrBxPDkpzjAXQLsgJs8sFKWW+LBXyqGYkdBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPu3hqDMmEDDKD3D1kWDjGnG9JdJpeeX1qQ9tcZ/9zvitW3wMbk5D3ato+AT30N32
	 17G13f8gj6BHIhrvAqszm539J1f2yZgz0MKdRWfMWw3i1ga/+1IXQT7c1KbjJfaRzD
	 kdAXJ0QPEL7Pp1c55rpzGpGhUl6fOHut0m3e22XrgZB6t+B944rLldrgg8FTJYuvqx
	 jMI0qmePKIC/FrwadjwLYVvaSep29WJxYa+cm4hhY25hOQSP5rpYr4aBPnzitnF5fn
	 ynbAHN0+kHngbUVQHNrRNgWgXtqRHYKMM+TC2EekgM8VgaMjf7f9NDkOWeQbku7jr7
	 DatTw5eKfRj7w==
Date: Sun, 3 Dec 2023 13:32:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Haoran Liu <liuhaoran14@163.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [i2c] viperboard: Add error handling in vprbrd_i2c_probe
Message-ID: <20231203123214.u5jrfayhh3zfjqey@zenone.zhora.eu>
References: <20231203091208.38360-1-liuhaoran14@163.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203091208.38360-1-liuhaoran14@163.com>

Hi Haoran,

the patch makes sense, but...

On Sun, Dec 03, 2023 at 01:12:08AM -0800, Haoran Liu wrote:
> This patch introduces improved error handling for the i2c_add_adapter.
> The necessity for this enhancement was identified through static analysis,
> revealing that the function previously did not properly manage potential
> failures of i2c_add_adapter. Prior to this patch, a failure in
> i2c_add_adapter could result in partial initialization of the I2C adapter,
> leading to unstable operation.

Please use the imperative form. Instead of starting with 'This
patch introduces...' you can write something like 'Check the
return value of i2c_add_adapter...'.

"Check" is in imperative form.

Using the imperative form is crucial for a clear understanding of
what the patch accomplishes.

> Although the error addressed by this patch may not occur in the current
> environment, I still suggest implementing these error handling routines
> if the function is not highly time-sensitive. As the environment evolves
> or the code gets reused in different contexts, there's a possibility that
> these errors might occur. In case you find this addition unnecessary, I
> completely understand and respect your perspective. My intention was to
> enhance the robustness of the code, but I acknowledge that practical
> considerations and current functionality might not warrant this change
> at this point.

The second paragraph does not describe anything functional
related to the patch; it's a message to the reviewers. Please add
it after the '---' section.

> Signed-off-by: Haoran Liu <liuhaoran14@163.com>
> ---
>  drivers/i2c/busses/i2c-viperboard.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
> index 9e153b5b0e8e..13a07290ecf6 100644
> --- a/drivers/i2c/busses/i2c-viperboard.c
> +++ b/drivers/i2c/busses/i2c-viperboard.c
> @@ -400,7 +400,11 @@ static int vprbrd_i2c_probe(struct platform_device *pdev)
>  	vb_i2c->i2c.dev.parent = &pdev->dev;
>  
>  	/* attach to i2c layer */
> -	i2c_add_adapter(&vb_i2c->i2c);
> +	ret = i2c_add_adapter(&vb_i2c->i2c);
> +	if (ret) {
> +		dev_err(&pdev->dev, "i2c_add_adapter failed: %d\n", ret);

Please use:

	return dev_err_probe(&pdev->dev, ret, "...");

Additionally, I suggest rewording the error message to something
that might be more meaningful for non-kernel developers, such as:
"Failed to register the i2c adapter"

Thanks,
Andi

> +		return ret;
> +	}
>  
>  	platform_set_drvdata(pdev, vb_i2c);
>  
> -- 
> 2.17.1
> 

