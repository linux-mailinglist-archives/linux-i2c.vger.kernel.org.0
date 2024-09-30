Return-Path: <linux-i2c+bounces-7085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AF989978
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 05:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED6B6B2242A
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 03:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B027558BC;
	Mon, 30 Sep 2024 03:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU0fej81"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227282D05D;
	Mon, 30 Sep 2024 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727666876; cv=none; b=jaZeMzLyi4GxHb4OPcvDxs1xEUnGRAti6xKBB19M2vMyuoV+gjMWbVRymQaSU2NS0rPXmS4dUNST6JqyMpJEWtqxNgZjINnVFiIvpLWA3+INT8onkINXtbGM5IaKuoIG5yq9ZBzq0290mvF8trCfW1g/a6Y7u5JtUv2U3+DVqWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727666876; c=relaxed/simple;
	bh=knzdApybWNkXs/EWy4A0OK+7trxRVW4r3IepuHUyAVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tF2U3651PFvzKCeZkTjLQV+JsDiuBtilP5xlyba3tUxywindP2TZPs5RpN28N1G29rSVskicHe+RMq9Z7WgKzVvYx56H4dGOJv+NAjO4lzeT6ALtTygBSSc1I1mPwoVzdG0lJwEcctCoOk+U/JxQHN+fqcEW7/TX5+ttGcFO16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU0fej81; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0C9C4CEC6;
	Mon, 30 Sep 2024 03:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727666875;
	bh=knzdApybWNkXs/EWy4A0OK+7trxRVW4r3IepuHUyAVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eU0fej81ykmly+dr+iIyfrVNyMjShf1QYYO2qbG+fQ8FqXW4LiuVhZL2h8x48GNvq
	 7quqEz6ttd6B+wyqy1z7zwBLPYBifM+xMuc624lV+QdWpslBgqi/8ML6aAQYM3N7W0
	 6wnD81A/EXtVoQam5PUgqTN82bGh6Mp9OTqY8aAYHmiO4RASOMCSZb3S5MQoY4oKP+
	 RkqVNy5BI/d94cRnQwpCX/yjX3Op4a6Hg/IRTiNhCQXu9HQJOKnjwSTJW32uUS5fhO
	 5subcCx26GaPrXbdX0mzFZeKfQb2Mr/EHJAkxHBydMfRJvQ/Gy/yIpw1dAC0KQ2kDm
	 Rp2qDR74aUnpA==
Date: Sun, 29 Sep 2024 22:27:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org, 
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 3/4] soc: qcom: geni-se: Do not keep GPIOs to sleep
 state for shared SE usecase
Message-ID: <vnpl6a5accygarfowtiixbba6guxvgsyipdcte3tzf2vrvyve7@zjw4bnuckvmi>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-4-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927063108.2773304-4-quic_msavaliy@quicinc.com>

On Fri, Sep 27, 2024 at 12:01:07PM GMT, Mukesh Kumar Savaliya wrote:
> Currently the driver provides a function called geni_serial_resources_off()
> to turn off resources like clocks and  pinctrl.
> 
> For shared SE between two SS, we don't need to keep pinctrl to sleep state
> as other SS may be actively transferring data over SE.

"don't need to" sounds like an optimization. Is this really the case?
The comment in the code below seems to indicate no.

As with the other commit message, expand your abbreviations.

> Hence,bypass keeping
> pinctrl to sleep state conditionally using shared_geni_se flag.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 14 ++++++++++----
>  include/linux/soc/qcom/geni-se.h |  3 +++
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 2e8f24d5da80..89cf18699336 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>  
>  /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>  #define __DISABLE_TRACE_MMIO__
> @@ -503,10 +504,15 @@ int geni_se_resources_off(struct geni_se *se)
>  
>  	if (has_acpi_companion(se->dev))
>  		return 0;
> -
> -	ret = pinctrl_pm_select_sleep_state(se->dev);
> -	if (ret)
> -		return ret;
> +	/* Keep pinctrl to sleep state only for regular usecase.
> +	 * Do not sleep pinctrl for shared SE because other SS(subsystems)
> +	 * may continueto perform transfer.
> +	 */
> +	if (se->shared_geni_se == false) {
> +		ret = pinctrl_pm_select_sleep_state(se->dev);

I'm a bit rusty on the pinctrl API, but wouldn't you achieve the same
result by just not specifying a "sleep" pinctrl state?

> +		if (ret)
> +			return ret;
> +	}
>  
>  	geni_se_clks_off(se);
>  	return 0;
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
> index c3bca9c0bf2c..359041c64ad8 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #ifndef _LINUX_QCOM_GENI_SE
> @@ -61,6 +62,7 @@ struct geni_icc_path {
>   * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>   * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
>   * @icc_paths:		Array of ICC paths for SE
> + * @shared_geni_se:	Tells if SE is used by two SS in shared environment.

Please avoid the abbreviations. Be succinct, e.g. does it matter that
it's two SS - what if it's 3?
"Tell" is not the correct verb here, struct members don't speak.

Regards,
Bjorn

>   */
>  struct geni_se {
>  	void __iomem *base;
> @@ -70,6 +72,7 @@ struct geni_se {
>  	unsigned int num_clk_levels;
>  	unsigned long *clk_perf_tbl;
>  	struct geni_icc_path icc_paths[3];
> +	bool shared_geni_se;
>  };
>  
>  /* Common SE registers */
> -- 
> 2.25.1
> 

