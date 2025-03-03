Return-Path: <linux-i2c+bounces-9696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D73A4C0F2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 13:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C59C1894524
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 12:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1D420FA8F;
	Mon,  3 Mar 2025 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qy4Y32JG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C137D07D;
	Mon,  3 Mar 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006046; cv=none; b=WKuB/fsPZwBN1FofX6EtmsLNjiiMu+2/BVH3T9txQGlsafNeUR3vYlqadnW63NkeKdidWzYR6RwGiEYbpyu7I2QAL3ynMijJ3ktFNG4Bboo+gOBOoE/FpI48GwlIB/8jMuaheCcy+szRSLwwjsNZsFuH3wiRofBAbPn6SQyISpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006046; c=relaxed/simple;
	bh=oqjzi/zAhOsterMeAfvhd2Lrly5BuIHrXEyDJXM1IIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NkO2DKa2XDcVRkNUMTHBOHrbW5b03u5VVXDOMwSJeoUiiPf3q9H8RGdI4dBf2+kP/z4s2la5ACAkNmsljcsPoTJ8ptBeUapn3eS3ZqXVItkT7qpNWJheIUg4DC4tWvAEls5vIa4dv2t74UlhKlJBFZBqC9CleL2LTzVMFud0jFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qy4Y32JG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523B8kNN025661;
	Mon, 3 Mar 2025 12:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rN2bGVg8ZzYNF7l4VQygrAQDDlBNhEOeiHkgxlotQ7E=; b=Qy4Y32JGSiSmCU/w
	RE3acnnO3HQsFwnkJGjzGvjL7RFItt6du1G+NBV0npjsxGKsXPVTL9Tre8fApAx2
	r3WB+xgmZIGaYkFOFymYCW5bu6o+/s74NAqo4WSLD41CAtBdSK7C/lekbDPd5SsD
	+zsIfx7d/q66yF/ncMI3yX+Rzq0nN4bW6tfhbJKvxZnoNB3gS7KwSDXp8a5FT2YZ
	66nrFf/b6T3q8HK7CJoBniL/H4wbCy1OcRGIMyoTrkF8EUkLI+Iy4ddXMQVaz1pH
	6yY8HKb3i9po4eU9IUVBesSvsuv0Ip4SX09ev/kbJLrWttHkH3T7Gs9cp5P0UaDu
	feAdyg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t6k4rft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 12:47:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523ClI1M030976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 12:47:18 GMT
Received: from [10.216.31.193] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Mar 2025
 04:47:12 -0800
Message-ID: <f20b98fb-1cbc-4211-b616-5421bf43301f@quicinc.com>
Date: Mon, 3 Mar 2025 18:17:09 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-6-quic_vdadhani@quicinc.com>
 <af27ae90-99d7-497f-b8f5-b8ca0b039753@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <af27ae90-99d7-497f-b8f5-b8ca0b039753@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M1Rln0lZesj2TR50AXa1YgGCXMKjmv9Q
X-Proofpoint-ORIG-GUID: M1Rln0lZesj2TR50AXa1YgGCXMKjmv9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030098



On 1/27/2025 12:36 PM, Krzysztof Kozlowski wrote:
> On 24/01/2025 11:53, Viken Dadhaniya wrote:
>>   /* Common SE registers */
>> @@ -891,6 +896,445 @@ int geni_icc_disable(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL_GPL(geni_icc_disable);
>>   
>> +/**
>> + * elf_phdr_valid: Function to validate elf header.
>> + * @phdr: A pointer to a elf header.
>> + *
>> + * This function validates elf header by comparing fields
> 
> Drop "This function" and use imperative. It's redundant and you keep
> using it everywherre here
>  

Updated in V3.

> ...
> 
>> +static int qup_fw_load(struct qup_se_rsc *rsc, const char *fw_name)
>> +{
>> +	int ret;
>> +	const struct firmware *fw;
>> +	struct device *dev = rsc->se->dev;
>> +
>> +	ret = request_firmware(&fw, fw_name, dev);
>> +	if (ret) {
>> +		dev_err(dev, "request_firmware failed for %d: %d\n", rsc->protocol, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = (rsc->protocol != GENI_SE_NONE) ? geni_load_se_fw(rsc, fw) : -EINVAL;
> 
> Drop ternary operator. Not easy to read
Updated in V3.

> 
>> +
>> +	release_firmware(fw);
>> +
>> +	return ret;
>> +}
> 
>> +
>> +/**
>> + * geni_load_se_firmware: Function to initiate firmware loading.
>> + * @se: Serial engine details.
>> + * @protocol: protocol from spi, i2c or uart for which firmware to
>> + * be loaded
>> + *
>> + * This function is called from the probe function of protocol driver.
>> + * if dtsi properties are configured to load QUP firmware and firmware
>> + * is already not loaded, it will start firmware loading. if dtsi
>> + * properties are not defined,it will skip loading firmware assuming
>> + * it is already loaded by TZ.
>> + *
>> + * return: Return 0 if no error, else return error value.
>> + */
>> +int geni_load_se_firmware(struct geni_se *se,
>> +			  enum geni_se_protocol_type protocol)
>> +{
>> +	struct qup_se_rsc rsc;
>> +	const char *fw_name;
>> +	int ret;
>> +
>> +	ret = device_property_read_string(se->wrapper->dev, "firmware-name", &fw_name);
>> +	if (ret)
>> +		return  -EINVAL;
>> +
>> +	rsc.se = se;
>> +	rsc.protocol = protocol;
>> +
>> +	/* Set default xfer mode to FIFO*/
>> +	rsc.mode = GENI_SE_FIFO;
>> +	of_property_read_u32(se->dev->of_node, "qcom,xfer-mode", &rsc.mode);
>> +	switch (rsc.mode) {
>> +	case GENI_SE_FIFO:
>> +	case GENI_SE_DMA:
> 
> How value of 2 is acceptable? Your bindings said it is not.

Corrected in V3.

> 
> 
>> +	case GENI_GPI_DMA:
>> +		break;
>> +	default:
>> +		dev_err(se->dev, "Invalid xfer mode specified: %d\n", rsc.mode);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = qup_fw_load(&rsc, fw_name);
>> +	if (ret) {
>> +		dev_err(se->dev,  "Firmware Loading failed for proto: %s Error: %d\n",
>> +			protocol_name[rsc.protocol], ret);
> 
> Aren't you printing same error multiple times?

Removed in V3.

> 
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(se->dev, "Firmware load for %s protocol is Success for xfer mode %d\n",
>> +		protocol_name[rsc.protocol], rsc.mode);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(geni_load_se_firmware);
>> +
>>   static int geni_se_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
>> index 2996a3c28ef3..289fa6675d2b 100644
>> --- a/include/linux/soc/qcom/geni-se.h
>> +++ b/include/linux/soc/qcom/geni-se.h
>> @@ -1,6 +1,7 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>>    * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #ifndef _LINUX_QCOM_GENI_SE
>> @@ -72,6 +73,19 @@ struct geni_se {
>>   	struct geni_icc_path icc_paths[3];
>>   };
>>   
>> +/**
>> + * struct qup_se_rsc - Structure containing se details protocol and xfer mode
>> + *
>> + * @mode: transfer mode se fifo, dma or gsi.
>> + * @protocol: Protocol spi or i2c or serial.
>> + * @se: Pointer to the concerned serial engine.
>> + */
>> +struct qup_se_rsc {
>> +	struct geni_se *se;
>> +	enum geni_se_xfer_mode mode;
>> +	enum geni_se_protocol_type protocol;
>> +};
>> +
>>   /* Common SE registers */
>>   #define GENI_FORCE_DEFAULT_REG		0x20
>>   #define GENI_OUTPUT_CTRL		0x24
>> @@ -531,5 +545,8 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
>>   int geni_icc_enable(struct geni_se *se);
>>   
>>   int geni_icc_disable(struct geni_se *se);
>> +
>> +int geni_load_se_firmware(struct geni_se *se,
>> +			  enum geni_se_protocol_type protocol);
>>   #endif
>>   #endif
>> diff --git a/include/linux/soc/qcom/qup-fw-load.h b/include/linux/soc/qcom/qup-fw-load.h
>> new file mode 100644
>> index 000000000000..b9b58e81f5cb
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/qup-fw-load.h
>> @@ -0,0 +1,179 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +#ifndef _LINUX_QCOM_QUP_FW_LOAD
>> +#define _LINUX_QCOM_QUP_FW_LOAD
>> +
>> +#include <linux/device.h>
>> +#include <linux/elf.h>
>> +#include <linux/firmware.h>
>> +#include <linux/kernel.h>
>> +
>> +/*Magic numbers*/
>> +#define MAGIC_NUM_SE			0x57464553
>> +
>> +/* Common SE registers*/
>> +#define GENI_INIT_CFG_REVISION		0x0
>> +#define GENI_S_INIT_CFG_REVISION	0x4
>> +#define GENI_FORCE_DEFAULT_REG		0x20
>> +#define GENI_CGC_CTRL			0x28
>> +#define GENI_CFG_REG0			0x100
>> +
>> +#define	QUPV3_SE_HW_PARAM_1		0xE28
> 
> Drop indentation after 'define'

Updated in V3.

> 
> 
> Best regards,
> Krzysztof

