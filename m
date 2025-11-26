Return-Path: <linux-i2c+bounces-14282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EEBC8A908
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 16:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CBDC2342E81
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 15:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E4C30BBB9;
	Wed, 26 Nov 2025 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLstSg5K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C1E1FF5E3;
	Wed, 26 Nov 2025 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170029; cv=none; b=UYpUhrIwS+0qMwymFZJip+qAnryf7/jPAGEQ6+NoOjtcVYcYnzByYPuBtvo6SodTU8t6UgMKyVZdTu0iTm68vRdafOtc81i72AvCbdVJ84ZFEts/z6YtENSXTWCBiHenv80xTrouBFnKZtBcsvGV1nZ1+Hmz6fO75ZULV4ASD3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170029; c=relaxed/simple;
	bh=0Xaj35a0XsF4DWHQ15pnFHbOeGKihDS2nj5AWRX4Bdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYAV7Afhk1GmBm6iRzKL+0DHDoOcraJWnPn2OQx2h5WlClntXDtMXGAt2//laTCTXQ4e0rklXkwTE8zPfuahHB1x5E+pamPVRcxJ0SECCT4BWqsW4xL2lSSYRGZXYwVGNyf1ww7p8SxaJr3N99NbPXfwEEs6Jer49Kc3GqbhaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLstSg5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B83DC4CEF8;
	Wed, 26 Nov 2025 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764170028;
	bh=0Xaj35a0XsF4DWHQ15pnFHbOeGKihDS2nj5AWRX4Bdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLstSg5KkdAcT5jXzFjShFZC1XPS8YQXEU2nZ3MLDt0aJQvb/oqXxhjFe6I5Bgj52
	 dQ6V9uS6iZx3NNvzWnQY7QQ3dAAkIGvXC4sjojBt3fsvgyZ03JfYQUSgDoKc870tEq
	 peMV20JhtSLVPahxD7qWeiXLpELProPG276ek6NGdKjGKD6mE5RumqXpteuSnsLIS9
	 TLBlPn513pCa3+UEXLPMzAZVhtpF44Wa45fkMixb0lMnJQJEbHj9AqT+NbYt99Mptn
	 pMlo6Wc9+6TGLjRkXc0+iRyh4jG0X7e81YimV/iAMFSdc0wvfQPX0E1L1V642tgQWC
	 Buk4+IJry+TsQ==
Date: Wed, 26 Nov 2025 09:19:18 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v1 04/12] soc: qcom: geni-se: Add
 geni_se_resource_state() helper
Message-ID: <bskhxahakxpc74rdoz54eqlplb4obaoleouh4pn6qdy6yjmggw@fojwzct2haxa>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-5-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-5-praveen.talari@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 10:30:10AM +0530, Praveen Talari wrote:
> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
> activation/deactivation sequences independently, leading to code
> duplication.
> 
> Introduce geni_se_resource_state() to control power state of GENI SE
> resources. This function provides a unified interface that calls either
> geni_se_resources_activate() to power on resources or
> geni_se_resources_deactivate() to power off resources based on the
> power_on parameter.
> 
> The activate function enables ICC, clocks, and TLMM with proper error
> handling and cleanup paths. The deactivate function disables resources
> in reverse order including OPP rate reset, clocks, ICC and TLMM.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 61 ++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/geni-se.h |  2 ++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 726b77650007..7aee7fd2e240 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1013,6 +1013,67 @@ int geni_icc_disable(struct geni_se *se)
>  }
>  EXPORT_SYMBOL_GPL(geni_icc_disable);
>  
> +static int geni_se_resources_deactivate(struct geni_se *se)
> +{
> +	int ret;
> +
> +	if (se->has_opp)
> +		dev_pm_opp_set_rate(se->dev, 0);
> +
> +	ret = geni_se_resources_off(se);

Why do we end this series with two different APIs for turning (on/) off
the GENI resources? Can't there be a single geni_se_resources_"off"()?

> +	if (ret)
> +		return ret;
> +
> +	if (se->core_clk)
> +		clk_disable_unprepare(se->core_clk);
> +
> +	return geni_icc_disable(se);
> +}
> +
> +static int geni_se_resources_activate(struct geni_se *se)
> +{
> +	int ret;
> +
> +	ret = geni_icc_enable(se);
> +	if (ret)
> +		return ret;
> +
> +	if (se->core_clk) {
> +		ret = clk_prepare_enable(se->core_clk);
> +		if (ret)
> +			goto out_icc_disable;
> +	}
> +
> +	ret = geni_se_resources_on(se);
> +	if (ret)
> +		goto out_clk_disable;
> +
> +	return 0;
> +
> +out_clk_disable:
> +	if (se->core_clk)
> +		clk_disable_unprepare(se->core_clk);
> +out_icc_disable:
> +	geni_icc_disable(se);
> +	return ret;
> +}
> +
> +/**
> + * geni_se_resources_state() - Control power state of GENI SE resources
> + * @se: Pointer to the geni_se structure
> + * @power_on: Boolean flag for desired power state (true = on, false = off)
> + *
> + * Controls GENI SE resource power state by calling activate or deactivate
> + * functions based on the power_on parameter.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int geni_se_resources_state(struct geni_se *se, bool power_on)

It seems the purpose of this "helper function" is to allow replacing
geni_se_resource_on() with geni_se_resources_state(true) and
geni_se_resource_off() with geni_se_resources_state(false) in patch 10.


Naming a function "on", "activate", or "enable" provides a clear
indication of what will happen when you call the function. Calling a
function to "set state to true" is not as clear.

Further, the code paths that needs to have resources turned on should be
separate from those who signal that those resources can be turned off.
So there should not be any gain from this function, unless the same
obfuscation happens further up the stack.

Just call the activate/deactivate in the respective code path.

Regards,
Bjorn

> +{
> +	return power_on ? geni_se_resources_activate(se) : geni_se_resources_deactivate(se);
> +}
> +EXPORT_SYMBOL_GPL(geni_se_resources_state);
> +
>  /**
>   * geni_se_resources_init() - Initialize resources for a GENI SE device.
>   * @se: Pointer to the geni_se structure representing the GENI SE device.
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
> index c182dd0f0bde..d1ca13a4e54c 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -541,6 +541,8 @@ int geni_icc_disable(struct geni_se *se);
>  
>  int geni_se_resources_init(struct geni_se *se);
>  
> +int geni_se_resources_state(struct geni_se *se, bool power_on);
> +
>  int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
>  #endif
>  #endif
> -- 
> 2.34.1
> 

