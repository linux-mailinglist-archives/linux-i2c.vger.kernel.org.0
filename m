Return-Path: <linux-i2c+bounces-7937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6DE9C4D9A
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 05:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53BAF1F237C0
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 04:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2812B208223;
	Tue, 12 Nov 2024 04:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nG+2Mm1O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768920494F;
	Tue, 12 Nov 2024 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731384572; cv=none; b=epIkVjrv6k7X3uf9qGXO5OYZREgIeeyfPxIHlm+R4mV96StauzM2ZYR8eYWz2sjZy1aehnKV/bMTp2cYMRyi0KDivzn0I3YmatulqnukQqPuezq1Rz2/sVI0Frz62NI4jYBZN9mR66N3pp5TPbXQp2pfso7nDgZxBNwcY9lNzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731384572; c=relaxed/simple;
	bh=MhV+41Cp3i9m4j99lu/WCXY/MLivraTlLiNGgddAmok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfuwnLJqr8qTcYGIbCQqWozXVPssJtYsnrYVYV7L8PSFUXW3E/XL+R51qFvdTHSiqGQicY1DGU1shSXtVjrr+03TrHCSb12yqfheXdDV34zaC/H5oyj5QHCHJzFFnfkOIOnwllzlHBKxm3t0lmrE/zTDQ5LaEUSEqOR56otWK7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nG+2Mm1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40975C4CECD;
	Tue, 12 Nov 2024 04:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731384572;
	bh=MhV+41Cp3i9m4j99lu/WCXY/MLivraTlLiNGgddAmok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nG+2Mm1Ok7247hKiGkUlNBLIvm7L0Y8WWZKof6UD2P7ncgXCeLiNU0B5X91JqD1oN
	 ZMybVpVEZ8Ep13s9W0AMvilXCWh+EoImzoqvdETjREQcsXBWusjwzW7RmTgx8tcLhz
	 PrLncDjHZCPRvRkWDa4QE4W2l9IjyNdsRL8o/uCpruMYQks7xMATRckKFntbuYiB4D
	 H95WCHX0X9FQax1l/9v+jPZNaVmDxRWXR9pBgZKS64KIptKMEwO6djWCTfGzNxd4Dq
	 yyexiS175fDpNRmOwDIT+lQ3VCcaGEBOPgcXuz/a3/UzAbc64oNwwxTs8yI9Mhsedx
	 yrRvan3rXLyQw==
Date: Mon, 11 Nov 2024 22:09:29 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v2 RESEND 2/3] i2c: qcom_geni: Update compile
 dependenices for qcom geni
Message-ID: <3fkfjeif3e4z3utcim5dou2obwjoagtr3z2bnwkywa2xlm4jrb@jon6mwtp4ahv>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-3-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140244.13474-3-quic_jseerapu@quicinc.com>

On Mon, Nov 11, 2024 at 07:32:43PM +0530, Jyothi Kumar Seerapu wrote:
> I2C_QCOM_GENI is having compile dependencies on QCOM_GPI_DMA and
> so update I2C_QCOM_GENI to depends on QCOM_GPI_DMA.
> 

Given that this is a separate patch, your wording can only be
interpreted as this being an existing problem.

> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v1 -> v2: 
> 	This patch is added in v2 to address the kernel test robot
> 	reported compilation error.
> 	ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined! 

But as far as I can tell you introduce this problem in patch 3. If so
this addition should be part of patch 3.



Also, you have different subject prefix for patch 2 and 3, yet they
relate to the same driver. Not pretty.

Regards,
Bjorn

> 
> drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 0aa948014008..87634a682855 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
>  	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on QCOM_GENI_SE
> +	depends on QCOM_GPI_DMA
>  	help
>  	  This driver supports GENI serial engine based I2C controller in
>  	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
> -- 
> 2.17.1
> 
> 

