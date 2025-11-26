Return-Path: <linux-i2c+bounces-14283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8992AC8A9F3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 16:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBCAF3AFD60
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311EF333725;
	Wed, 26 Nov 2025 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1sjs0Dp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB23321B4;
	Wed, 26 Nov 2025 15:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170677; cv=none; b=WUYaagk9ajZEiwKbZnQeayKvsLrs3EFAA5FvWrkbHFMl9mk1wj1HlOsx5OX9O07MHuDIy01oy33GkNRaiChm0NGDdfaRsgCUyenQ+o0pH7eolzjG154RT+LLRCW5KOT7cDu+bp0lYC2tkPf4glWDHISfRBqXOoWUOj1/n1yQqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170677; c=relaxed/simple;
	bh=/3lNvh1iN/Wal4FATU1Ude/FjWT+u4XGFcfHsN1NjkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTyNNqnom4toODAtaTDaky/K+Mi9qrgJ6hBOZdQUH1BZbbgUT9txgu1RpVSIRMXoDTerNDyhtvNTZm8pBxQGJnHJkvoO/1nLcjvqvsBJCLSzLjPJqOO7AW2xwA12OL/eSgg6GWVZTp56eQV6gwe8bRDs1lM0/yCVMqSjlpTCG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1sjs0Dp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8276CC4CEF7;
	Wed, 26 Nov 2025 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764170676;
	bh=/3lNvh1iN/Wal4FATU1Ude/FjWT+u4XGFcfHsN1NjkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1sjs0Dp5AxHQGy9v73u1LsRG352IMqZXkxUdYtPgfQnRF52rS+x6QIV/wkmvBKh+
	 mX9yaivjDYSPLmfI6Lqz2xcaKeWiqB/8TK/A5vS7fsI6bnqlHtuE0EqlgeuSgL77Kd
	 t1p8/8s02cE/Pr33A1yNASgzfvB6dgPlyHeFQSzJxrSLy0BYNS5oBgYeXltIq2cSjH
	 /N0IfVbMg3r8QjWI6aU4c8R4CJh5j+MWjxs37b6rbHjOuNSCsm4ToyMVcQ+cdADJt2
	 PygytYB+OLXCzvH563eTii2A56UiXgES9ixJlqZWMKJVlOe8ETjF64BQ8Se00FGb0j
	 tfS6irL4RcBKQ==
Date: Wed, 26 Nov 2025 09:30:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v1 08/12] i2c: qcom-geni: Isolate serial engine setup
Message-ID: <ar5t2wdmxzvog7smlwbg3skg6ga35au6uiahfe3rlnmumlmpyr@572sf6ru6424>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-9-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-9-praveen.talari@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 10:30:14AM +0530, Praveen Talari wrote:
> Move serial engine configuration from probe to geni_i2c_init().
> 
> Relocating the serial engine setup to a dedicated initialization function
> enhances code clarity and simplifies future modifications.

Please enhance commit message clarity. I don't think "code clarity" is
your most significant reason for this change, and "simplifies future
modification" is completely vague.

Be specific, the reader of this commit message hasn't implemented the
next set of commits, so they don't understand why this helps.

If the reason is that this simplifies the error handling around the
resource acquisition in the next patches, write that.

If my guess is wrong and the sole reason for you change is that you
don't like 179 lines long functions, then just say that.

Regards,
Bjorn

> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 148 ++++++++++++++---------------
>  1 file changed, 73 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 3a04016db2c3..4111afe2713e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -976,10 +976,75 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
>  	return ret;
>  }
>  
> +static int geni_i2c_init(struct geni_i2c_dev *gi2c)
> +{
> +	const struct geni_i2c_desc *desc = NULL;
> +	u32 proto, tx_depth;
> +	bool fifo_disable;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(gi2c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
> +		return ret;
> +	}
> +
> +	proto = geni_se_read_proto(&gi2c->se);
> +	if (proto == GENI_SE_INVALID_PROTO) {
> +		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
> +		if (ret) {
> +			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
> +			goto err;
> +		}
> +	} else if (proto != GENI_SE_I2C) {
> +		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
> +		goto err;
> +	}
> +
> +	desc = device_get_match_data(gi2c->se.dev);
> +	if (desc && desc->no_dma_support)
> +		fifo_disable = false;
> +	else
> +		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> +
> +	if (fifo_disable) {
> +		/* FIFO is disabled, so we can only use GPI DMA */
> +		gi2c->gpi_mode = true;
> +		ret = setup_gpi_dma(gi2c);
> +		if (ret)
> +			goto err;
> +
> +		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
> +	} else {
> +		gi2c->gpi_mode = false;
> +		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
> +
> +		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
> +		if (!tx_depth && desc)
> +			tx_depth = desc->tx_fifo_depth;
> +
> +		if (!tx_depth) {
> +			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
> +					    "Invalid TX FIFO depth\n");
> +			goto err;
> +		}
> +
> +		gi2c->tx_wm = tx_depth - 1;
> +		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
> +		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
> +				       PACKING_BYTES_PW, true, true, true);
> +
> +		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +	}
> +
> +err:
> +	pm_runtime_put(gi2c->se.dev);
> +	return ret;
> +}
> +
>  static int geni_i2c_probe(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c;
> -	u32 proto, tx_depth, fifo_disable;
>  	int ret;
>  	struct device *dev = &pdev->dev;
>  	const struct geni_i2c_desc *desc = NULL;
> @@ -1059,79 +1124,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(gi2c->core_clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = geni_se_resources_on(&gi2c->se);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Error turning on resources\n");
> -		goto err_clk;
> -	}
> -	proto = geni_se_read_proto(&gi2c->se);
> -	if (proto == GENI_SE_INVALID_PROTO) {
> -		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
> -		if (ret) {
> -			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
> -			goto err_resources;
> -		}
> -	} else if (proto != GENI_SE_I2C) {
> -		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> -		goto err_resources;
> -	}
> -
> -	if (desc && desc->no_dma_support)
> -		fifo_disable = false;
> -	else
> -		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> -
> -	if (fifo_disable) {
> -		/* FIFO is disabled, so we can only use GPI DMA */
> -		gi2c->gpi_mode = true;
> -		ret = setup_gpi_dma(gi2c);
> -		if (ret)
> -			goto err_resources;
> -
> -		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
> -	} else {
> -		gi2c->gpi_mode = false;
> -		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
> -
> -		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
> -		if (!tx_depth && desc)
> -			tx_depth = desc->tx_fifo_depth;
> -
> -		if (!tx_depth) {
> -			ret = dev_err_probe(dev, -EINVAL,
> -					    "Invalid TX FIFO depth\n");
> -			goto err_resources;
> -		}
> -
> -		gi2c->tx_wm = tx_depth - 1;
> -		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
> -		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
> -				       PACKING_BYTES_PW, true, true, true);
> -
> -		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> -	}
> -
> -	clk_disable_unprepare(gi2c->core_clk);
> -	ret = geni_se_resources_off(&gi2c->se);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Error turning off resources\n");
> -		goto err_dma;
> -	}
> -
> -	ret = geni_icc_disable(&gi2c->se);
> -	if (ret)
> -		goto err_dma;
> -
>  	gi2c->suspended = 1;
>  	pm_runtime_set_suspended(gi2c->se.dev);
>  	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
>  	pm_runtime_use_autosuspend(gi2c->se.dev);
>  	pm_runtime_enable(gi2c->se.dev);
>  
> +	ret =  geni_i2c_init(gi2c);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "I2C init failed :%d\n", ret);
> +		pm_runtime_disable(gi2c->se.dev);
> +		goto err_dma;
> +	}
> +
>  	ret = i2c_add_adapter(&gi2c->adap);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
> @@ -1143,13 +1148,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  
>  	return ret;
>  
> -err_resources:
> -	geni_se_resources_off(&gi2c->se);
> -err_clk:
> -	clk_disable_unprepare(gi2c->core_clk);
> -
> -	return ret;
> -
>  err_dma:
>  	release_gpi_dma(gi2c);
>  
> -- 
> 2.34.1
> 

