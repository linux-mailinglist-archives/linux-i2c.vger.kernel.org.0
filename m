Return-Path: <linux-i2c+bounces-9719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA24A4E302
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 16:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D6A7420BB6
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 15:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226DB264619;
	Tue,  4 Mar 2025 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qy4Y32JG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255A7261578
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100954; cv=pass; b=IigU5BcjkkAjrTu4FXMViBTaBT+c51EZVWEhvrePABtZXx7a1rzapcTEPlXX1SJPdkzie4CJTVYER8CCZB6e+rLs6Hz1UZb29NIZLDSD3g0P/ZBAUAXzr0Z9PvCSLajT/Ra/lSBz8lbt7C4w1sucCwL4DQTlnpeUdiTZN7Bfesk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100954; c=relaxed/simple;
	bh=oqjzi/zAhOsterMeAfvhd2Lrly5BuIHrXEyDJXM1IIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lXBpHgJvHLxpDo8T+fPmVVnHp20RC/gz5qfGd11b2sKh9Mb0uGT8CsSMtxSB40RLBo60ci9OdNfoU+dqzwAIP1OYbc3ldnU3K6Me04wNWa5w3HM7cLiVzjsesj46X8c6aqwso35irtmosByQSYawlV0oWUKFmCo5DqT1kAOVdXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qy4Y32JG; arc=none smtp.client-ip=205.220.168.131; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 9978D40F1CED
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 18:09:11 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qy4Y32JG
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fDT2VmQzFyJV
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 18:07:21 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id B68DD4272F; Tue,  4 Mar 2025 18:07:04 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qy4Y32JG
X-Envelope-From: <linux-kernel+bounces-541733-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qy4Y32JG
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 52FE041AC2
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:48:13 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 9954E3063EFC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:48:12 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D07D87A6F1B
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD44211468;
	Mon,  3 Mar 2025 12:47:30 +0000 (UTC)
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
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fDT2VmQzFyJV
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741705658.06567@Fez7chdvt99tM3H+sn/CDg
X-ITU-MailScanner-SpamCheck: not spam



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


