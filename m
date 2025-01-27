Return-Path: <linux-i2c+bounces-9214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A38A1D12E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 08:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD723A3BB1
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 07:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB511FC0E7;
	Mon, 27 Jan 2025 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvKSiHlK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9A15A86B;
	Mon, 27 Jan 2025 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737961591; cv=none; b=Mz5kwJl4QTRnkJYoU0dW6sWGjBPYJEDzrDrA8fHqrn8Cs3HfPyMax9aTUZ5nQNB8uhpJ6AQLdhtOpjdfnyvYdbT8VO0S8up6VsTwcw3bWLIf78UWvDhTGlVqwU70ySmpyrou8kDVZP4LWi3ogQt/60kC9jeLshvXQUrCCuTEpjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737961591; c=relaxed/simple;
	bh=1LCm8cd6mCgY5b/HBOzJAWvgVNcD5Ayq5tQncBGCQCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjdfwdxdjcLh/FLG5lMQ/EoFmvFmLRIgofoN/V5Qft+PhCYNa/sTJ1DWmzyXUjCFf58paKGkgAvlSQL7ihEqAOBAYuyzAf6LhkAMyUua1SUIEW21CcH+EYFPF9ZmKvElg3tlpWFpCWvUwfiHO6tZLpV67smnkylyMEu6Wp2CTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvKSiHlK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C570C4CED2;
	Mon, 27 Jan 2025 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737961591;
	bh=1LCm8cd6mCgY5b/HBOzJAWvgVNcD5Ayq5tQncBGCQCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LvKSiHlKJz7ZBfs3uagJN3R70q7hnMhDKOgPyQiZa0UScOKAZALuV3p2peM398lyV
	 jFV5YR9y+tcsXvOd38AfM4AwHRvf+iK3y/oLYaSXj56qnBGTZfl9jRpPORgjLA126g
	 4llStabesR2RGZ0TCfdeJMvZ9527WSQpKu3lZ33APA+H7SYqkgIukdCi/XASFkY4oF
	 18vvo9f0KDN43gOIrgdKSt0nGlOvVnL/DWvqiw2L1xYrr6eqOeQXeUF6Mk6DuHlgVw
	 4MxlJqGnAq07+kh8i5ML70vuJhDwjJI67JKw5VEwRxBGCcICCAKE1oos0GB9uoqluO
	 aHYqLHtuB22ag==
Message-ID: <af27ae90-99d7-497f-b8f5-b8ca0b039753@kernel.org>
Date: Mon, 27 Jan 2025 08:06:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
 andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
 dianders@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-6-quic_vdadhani@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250124105309.295769-6-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/01/2025 11:53, Viken Dadhaniya wrote:
>  /* Common SE registers */
> @@ -891,6 +896,445 @@ int geni_icc_disable(struct geni_se *se)
>  }
>  EXPORT_SYMBOL_GPL(geni_icc_disable);
>  
> +/**
> + * elf_phdr_valid: Function to validate elf header.
> + * @phdr: A pointer to a elf header.
> + *
> + * This function validates elf header by comparing fields

Drop "This function" and use imperative. It's redundant and you keep
using it everywherre here


...

> +static int qup_fw_load(struct qup_se_rsc *rsc, const char *fw_name)
> +{
> +	int ret;
> +	const struct firmware *fw;
> +	struct device *dev = rsc->se->dev;
> +
> +	ret = request_firmware(&fw, fw_name, dev);
> +	if (ret) {
> +		dev_err(dev, "request_firmware failed for %d: %d\n", rsc->protocol, ret);
> +		return ret;
> +	}
> +
> +	ret = (rsc->protocol != GENI_SE_NONE) ? geni_load_se_fw(rsc, fw) : -EINVAL;

Drop ternary operator. Not easy to read.

> +
> +	release_firmware(fw);
> +
> +	return ret;
> +}

> +
> +/**
> + * geni_load_se_firmware: Function to initiate firmware loading.
> + * @se: Serial engine details.
> + * @protocol: protocol from spi, i2c or uart for which firmware to
> + * be loaded
> + *
> + * This function is called from the probe function of protocol driver.
> + * if dtsi properties are configured to load QUP firmware and firmware
> + * is already not loaded, it will start firmware loading. if dtsi
> + * properties are not defined,it will skip loading firmware assuming
> + * it is already loaded by TZ.
> + *
> + * return: Return 0 if no error, else return error value.
> + */
> +int geni_load_se_firmware(struct geni_se *se,
> +			  enum geni_se_protocol_type protocol)
> +{
> +	struct qup_se_rsc rsc;
> +	const char *fw_name;
> +	int ret;
> +
> +	ret = device_property_read_string(se->wrapper->dev, "firmware-name", &fw_name);
> +	if (ret)
> +		return  -EINVAL;
> +
> +	rsc.se = se;
> +	rsc.protocol = protocol;
> +
> +	/* Set default xfer mode to FIFO*/
> +	rsc.mode = GENI_SE_FIFO;
> +	of_property_read_u32(se->dev->of_node, "qcom,xfer-mode", &rsc.mode);
> +	switch (rsc.mode) {
> +	case GENI_SE_FIFO:
> +	case GENI_SE_DMA:

How value of 2 is acceptable? Your bindings said it is not.


> +	case GENI_GPI_DMA:
> +		break;
> +	default:
> +		dev_err(se->dev, "Invalid xfer mode specified: %d\n", rsc.mode);
> +		return -EINVAL;
> +	}
> +
> +	ret = qup_fw_load(&rsc, fw_name);
> +	if (ret) {
> +		dev_err(se->dev,  "Firmware Loading failed for proto: %s Error: %d\n",
> +			protocol_name[rsc.protocol], ret);

Aren't you printing same error multiple times?

> +		return ret;
> +	}
> +
> +	dev_dbg(se->dev, "Firmware load for %s protocol is Success for xfer mode %d\n",
> +		protocol_name[rsc.protocol], rsc.mode);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(geni_load_se_firmware);
> +
>  static int geni_se_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
> index 2996a3c28ef3..289fa6675d2b 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #ifndef _LINUX_QCOM_GENI_SE
> @@ -72,6 +73,19 @@ struct geni_se {
>  	struct geni_icc_path icc_paths[3];
>  };
>  
> +/**
> + * struct qup_se_rsc - Structure containing se details protocol and xfer mode
> + *
> + * @mode: transfer mode se fifo, dma or gsi.
> + * @protocol: Protocol spi or i2c or serial.
> + * @se: Pointer to the concerned serial engine.
> + */
> +struct qup_se_rsc {
> +	struct geni_se *se;
> +	enum geni_se_xfer_mode mode;
> +	enum geni_se_protocol_type protocol;
> +};
> +
>  /* Common SE registers */
>  #define GENI_FORCE_DEFAULT_REG		0x20
>  #define GENI_OUTPUT_CTRL		0x24
> @@ -531,5 +545,8 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
>  int geni_icc_enable(struct geni_se *se);
>  
>  int geni_icc_disable(struct geni_se *se);
> +
> +int geni_load_se_firmware(struct geni_se *se,
> +			  enum geni_se_protocol_type protocol);
>  #endif
>  #endif
> diff --git a/include/linux/soc/qcom/qup-fw-load.h b/include/linux/soc/qcom/qup-fw-load.h
> new file mode 100644
> index 000000000000..b9b58e81f5cb
> --- /dev/null
> +++ b/include/linux/soc/qcom/qup-fw-load.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#ifndef _LINUX_QCOM_QUP_FW_LOAD
> +#define _LINUX_QCOM_QUP_FW_LOAD
> +
> +#include <linux/device.h>
> +#include <linux/elf.h>
> +#include <linux/firmware.h>
> +#include <linux/kernel.h>
> +
> +/*Magic numbers*/
> +#define MAGIC_NUM_SE			0x57464553
> +
> +/* Common SE registers*/
> +#define GENI_INIT_CFG_REVISION		0x0
> +#define GENI_S_INIT_CFG_REVISION	0x4
> +#define GENI_FORCE_DEFAULT_REG		0x20
> +#define GENI_CGC_CTRL			0x28
> +#define GENI_CFG_REG0			0x100
> +
> +#define	QUPV3_SE_HW_PARAM_1		0xE28

Drop indentation after 'define'


Best regards,
Krzysztof

