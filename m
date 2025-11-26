Return-Path: <linux-i2c+bounces-14281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 460E2C8A830
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 16:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4655357905
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 15:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC293064A1;
	Wed, 26 Nov 2025 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSnGmT1m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4949305969;
	Wed, 26 Nov 2025 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169293; cv=none; b=qwZGzOrUVSNIUoNumgw725UUy0IB/thXOjVzKjPSOaa2F0YnD2n3DOs3BiYHcrEu4akSeYfqwrrPcipCTSXOWeNKsbGDWAb7OQSIBmFDcB5SxExXnHe5HqYeT84sp9h45tB2gG31bLaAXsPg0FGDeAOA6NezREBexmqBbnkgrX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169293; c=relaxed/simple;
	bh=6zhLnYcBNO7oE7VrqoJCi8J+9W+4pP7HaFmoXrIQEk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WT8Kl9oK1x6HMTvsNa1vL5NX85s+wM6tPha4JzJ/ATN+YiP3IYeODnw9iSo1KyHE7GRZkuf6GgXRnQC+yt8/QTtatoG9lduDE1Mmru+b9OSOAzzrHI4Mgq8x0V7Kx1d3F76m5Qa7VXCP7lu1VEh+NUHUkudyOgoPHr9gVMiBJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSnGmT1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50307C4CEF7;
	Wed, 26 Nov 2025 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764169292;
	bh=6zhLnYcBNO7oE7VrqoJCi8J+9W+4pP7HaFmoXrIQEk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSnGmT1mGiutRvEa6ss3zMDXzIM/lQGRd5WDJaIuzEIsolfytzyiHLYu2KY4b/Vpp
	 8mS+gas/fnAWTP3nEnoX8KPlVm7XFQXlKZwx5AvgNKHDdszrU8u/XNFDgv9gE+kGzo
	 0aMHo1yGql+vdfzvCkpjoxCmLA4L9v1jNy/Tgo4iznekwE5m0Ub0PNj+yP8XfTnrkF
	 xZyMHOypi2faUgWGlHuUXgJfEY5sdiaBXGj+NQWfXMxjWS4gcSfiu63hfFFvP+vdeD
	 fSCs2CiV/ceTXK8fh2UCgBajWfWqFVS9xrohzcu6LwMcCVj3wJgZe7MQ2BxC0hYN6j
	 eilZXrfqiP+RQ==
Date: Wed, 26 Nov 2025 09:07:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v1 01/12] soc: qcom: geni-se: Refactor geni_icc_get() and
 make qup-memory ICC path optional
Message-ID: <c4qgjg3npsi6dkvqyj2z5drd7mfg2w2o4cjjcgepxdsrgiyiic@qdpkcic56iwv>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-2-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-2-praveen.talari@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 10:30:07AM +0530, Praveen Talari wrote:
> Refactor the geni_icc_get() function to replace the loop-based ICC path
> initialization with explicit handling of each interconnect path. This
> improves code readability and allows for different error handling per
> path type.

I don't think this "improves code readability", IMO you're turning a
clean loop into a unrolled mess.


But then comes the least significant portion of your "problem
description" (i.e. the last words of it), where you indicate that this
would allow you to have different error handling for "qup-memory".

This is actually a valid reason to make this change, so say that!


> 
> The "qup-core" and "qup-config" paths remain mandatory, while "qup-memory"
> is now optional and skipped if not defined in DT.
> 

Please rewrite this message to _start_ with the problem description.
Make it clear on the first line/sentence why the change should be done.

E.g. compare with something like this:

"""
"qup-memory" is an optional interconnect path, unroll the geni_icc_get()
loop in order to allow specific error handling for this path.
"""

You only need to read 4 words to understand exactly why this patch
exists.

> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index cd1779b6a91a..b6167b968ef6 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
>  
>  int geni_icc_get(struct geni_se *se, const char *icc_ddr)
>  {
> -	int i, err;
> -	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
> +	struct geni_icc_path *icc_paths = se->icc_paths;
>  
>  	if (has_acpi_companion(se->dev))
>  		return 0;
>  
> -	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> -		if (!icc_names[i])
> -			continue;
> -
> -		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
> -		if (IS_ERR(se->icc_paths[i].path))
> -			goto err;
> +	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
> +	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
> +		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
> +				     "Failed to get 'qup-core' ICC path\n");

To taste, but I think a local variable would be helpful to make this
less dense.

	path = devm_of_icc_get(se->dev, "qup-core");
	if (IS_ERR(path))
		return dev_err_probe(se->dev, PTR_ERR(path), "Failed to get 'qup-core' ICC path\n");
	icc_paths[GENI_TO_CORE].path = path;

Regards,
Bjorn

> +
> +	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
> +	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
> +		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
> +				     "Failed to get 'qup-config' ICC path\n");
> +
> +	/* The DDR path is optional, depending on protocol and hw capabilities */
> +	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
> +	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
> +		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
> +			icc_paths[GENI_TO_DDR].path = NULL;
> +		else
> +			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
> +					     "Failed to get 'qup-memory' ICC path\n");
>  	}
>  
>  	return 0;
> -
> -err:
> -	err = PTR_ERR(se->icc_paths[i].path);
> -	if (err != -EPROBE_DEFER)
> -		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
> -					icc_names[i], err);
> -	return err;
> -
>  }
>  EXPORT_SYMBOL_GPL(geni_icc_get);
>  
> -- 
> 2.34.1
> 

