Return-Path: <linux-i2c+bounces-596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC516802850
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 23:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95101280C4F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 22:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78B21A591;
	Sun,  3 Dec 2023 22:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNpLGXUD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A916438
	for <linux-i2c@vger.kernel.org>; Sun,  3 Dec 2023 22:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2543C433C7;
	Sun,  3 Dec 2023 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701641602;
	bh=GwGAwbW/XwkeyqhBlMisnN5P4pHQT6RuBPhlBWj9pEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNpLGXUDvKCRocEh2Lf2L4lrkn+rHRLbFzHSmDYSISSrBoSWlMPa14Eq9rn0p/TsW
	 lPn92EIi7y8C67eJSL8ek6lgLMnxWhsLQG4OeT+TtvDkr5YP9fEviCVTpwxTcpqNbE
	 GHiAG4Dhq5YHe3pKo0OPfyiuAylhxMWxl4zJx2k5hsHjQWYUJKQH6vJzlIR348GtZB
	 tMFr4o/BUG1pzfA0GktL65K4+FEaO93k3JK9aFGD0mj8RyJHCKKIqD8V+t7K5bimYc
	 3cBwW0ByHXZGMpDxgaWRgy4AiMvGf0RHHr3i1DURXHN8g/GI42uXpCZACKgIhS8EqV
	 la6+A/ns6O13A==
Date: Sun, 3 Dec 2023 23:13:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: linux-i2c@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, wsa@kernel.org, neil.armstrong@linaro.org,
	yangyingliang@huawei.com
Subject: Re: [PATCH] i2c: qcom-geni: fix missing clk_disable_unprepare() and
 geni_se_resources_off()
Message-ID: <20231203221317.b3yuwdhciymu2oer@zenone.zhora.eu>
References: <20231130014324.2483816-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130014324.2483816-1-yangyingliang@huaweicloud.com>

Hi Yang,

On Thu, Nov 30, 2023 at 09:43:24AM +0800, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> Add missing clk_disable_unprepare() and geni_se_resources_off() in the error
> path in geni_i2c_probe().
> 
> Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 6d829ed2f868..0d2e7171e3a6 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -858,6 +858,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	ret = geni_se_resources_on(&gi2c->se);
>  	if (ret) {
>  		dev_err(dev, "Error turning on resources %d\n", ret);
> +		clk_disable_unprepare(gi2c->core_clk);
>  		return ret;
>  	}
>  	proto = geni_se_read_proto(&gi2c->se);
> @@ -877,8 +878,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		/* FIFO is disabled, so we can only use GPI DMA */
>  		gi2c->gpi_mode = true;
>  		ret = setup_gpi_dma(gi2c);
> -		if (ret)
> +		if (ret) {
> +			geni_se_resources_off(&gi2c->se);
> +			clk_disable_unprepare(gi2c->core_clk);
>  			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
> +		}
>  
>  		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>  	} else {
> @@ -891,6 +895,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  
>  		if (!tx_depth) {
>  			dev_err(dev, "Invalid TX FIFO depth\n");
> +			geni_se_resources_off(&gi2c->se);
> +			clk_disable_unprepare(gi2c->core_clk);

The exit path of this probe is a complete mess... anyway, even
though I think there are better ways to deal with this, I
consider this patch as an improvement.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

>  			return -EINVAL;
>  		}
>  
> -- 
> 2.25.1
> 

