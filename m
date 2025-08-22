Return-Path: <linux-i2c+bounces-12377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB40B310AD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2FF7604614
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1019F2E8880;
	Fri, 22 Aug 2025 07:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3sNsn+b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA52E88B5
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848620; cv=none; b=gd0WvvTmaJJc7l8lYWm6tWIQ7LuAocTlSz9ACz32PftSYGMtY6d57DOMvLTSGHgOjVTNMki0RZwkUF7A25KVr4Uwv+02xRsowwvx0eG3pwssKPNZqo4w0oZW15Bt1+wVY8Tc3CMn3B67hVGvpoKfGLoYgHEW6XWV4GAPR4134Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848620; c=relaxed/simple;
	bh=Ikwh/K19QoCjnCMMmxyLPcXDn5VqsTxkEdUWHnJ7+qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3PmigP7HiJsL6LL4aDNav5g08fCwX0qB1BQQA8xN8A+88cJnwJgbCn1C/vtFeSlVWiIF12uMRMswhpPpBl8j3+PC/By0QhYV2SY3Zp41fCteMB3olfxqXiLlBUatqHAZr0RLAdfhxbPi9uNOTpxpkx0JIXc/USDsfLVtqBxQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3sNsn+b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uP07021351
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQRqNZG2//DZ3wJyjNxPaUfJ1tg1vlmdck5Ls1pNlhw=; b=R3sNsn+bX2usV0xN
	mktwoxJ0C3iTiSIFrWH9+Ygc7NU+fbuTVqhZVsfSQ78oPE4zflWtX4KaUwYYVk6E
	2uQrdvVmmbY2CyUq6pNW1foMzYwMLVrDwDyCWVrbBg/ynYRMQykEzI0fSkgKdyEB
	4f1hHVV0iULwsK8XCNRo+1xVnas15cwJuwiF2nZRLNDfjCf4yY7qq6TZZTrT2Aej
	Q409SmVQ65qlvwRc3IjXpSb6JB4MRvtRv3L/+usdbDpaSXTs95T/wVNKRHoxsoVa
	mxsAAEsWJlni7Li7E4IUlA0UqQeoWb+Div9vvzfkr7MD2k829/Yg/S3X1PsE0O9+
	JUXuZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8bu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:43:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-246072fe091so23366485ad.2
        for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 00:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848616; x=1756453416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQRqNZG2//DZ3wJyjNxPaUfJ1tg1vlmdck5Ls1pNlhw=;
        b=VFzaaL6A1Eu3eA9udFtU8CEHIG/K8JRur/FYc3gb/frQETvlajQh/xROloWjgc5rLv
         UcljLBtZdawzQdM4tRjQUxbU5xwVxqZ64RzCuh3Zcp0013ZQ9DGeyOCVS/8CgKWtUvUh
         +y2Kzd8CvsV907Ap48Hv/fiwy1Yq3KjVwrV0pnrYUdNJQiRG6KaejhF0EIMLAv4qZeVb
         lORuH/QTdhoBluSyAvKinpBdqqzS03sBq5YONiNVr491GQlYJpP8MH+zLw6rM2QZAsnA
         DTv9+pyFkon7xz6h7jf42leF5R5FmDW0+Vzb70E1ixxQqvu4OzicLnKf1U6rXXm3xNia
         8Vfw==
X-Forwarded-Encrypted: i=1; AJvYcCUZpPxgH+Kks1+YnsrRR3j4lDsDe29eviPel1YhPFS91+pOmdtQHjj+Qi+nQFGhtpONggznj/evbYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjCHFyT4hG/twQ7kZIvOsfSWSy3jyAd8CHsnk+JBmQzXy3jaUw
	kDn0Uixn4wvhbaLKwVyi6UsQfKqF6hEKgZ63Kuy1k0PJWjTmvulk0CirDL3BueE1FlhNiar+pwI
	d20zfTOV/JFgVKtWoM7X6DHPHasaWmzYyw8jb0y/CfwjXEV8sMt9ybv+ZFYTLSaE=
X-Gm-Gg: ASbGncsQY+nuIcH/oUKSrOlld0APgKzxa++T5cZ2VnBZzGiWarR804LmenHidy/nxnK
	kgGc95Id1NzxTKS1Pu9XC00BXgw08ftsYjmoktpK4H6WtKijEYe+V7g7dXBVEsERplxFwVZycFd
	E4/9/ZgAS9K28Nt+ALyqSfghNIJZ0IdSvi4VY/m8Y3TTC21YYDOEVMhJdoOLIpnkPaY9GcJfXTW
	b14SMki+WP3KNxwroS1Bew0LKfo3hoT+Ro6uYq59A6t68pZr+Ay1WI/gecuWaTMjCp5+Hm+IgKJ
	u0vMKOilNMSoyyzBUASXaY6JWRZ0vQU+Yp7KiGUG9q6xHk8I2uK1h5myTAvsacX3gkTEswaTnDa
	X
X-Received: by 2002:a17:903:187:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2462eded8bbmr27447265ad.14.1755848615489;
        Fri, 22 Aug 2025 00:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE20e6UZA+wXJUvCPjYKw02691NqvNTrPfWOFo46crrppUBx58+9yfDjIfusZlXR55rnIHKyw==
X-Received: by 2002:a17:903:187:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2462eded8bbmr27446825ad.14.1755848614618;
        Fri, 22 Aug 2025 00:43:34 -0700 (PDT)
Received: from [192.168.0.107] ([49.205.250.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33c5d7sm75718195ad.10.2025.08.22.00.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 00:43:34 -0700 (PDT)
Message-ID: <cc84140e-744f-dc45-6911-3cd949e8af36@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 13:13:27 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/5] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Bjorn Andersson <andersson@kernel.org>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        konradybcio@kernel.org, johan+linaro@kernel.org, dianders@chromium.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
        quic_anupkulk@quicinc.com
References: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
 <20250624095102.1587580-3-viken.dadhaniya@oss.qualcomm.com>
 <urxfw4jpbj6vp2rkem5iz6bweckwengtpgnndc7manqn4r6ant@md757inw7j6w>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <urxfw4jpbj6vp2rkem5iz6bweckwengtpgnndc7manqn4r6ant@md757inw7j6w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a81fa9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=KwJHXYY1KWTUxMs9SQcMCA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=D9LgZbeUODRVa_6OM3sA:9 a=Qd2liiofRktpUZN0:21
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZB5xE1ViqwXKJN1lx3IQST0tOo7gRRQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzIJK+PDIyfje
 4yjrobJu8uzlIcsxHgRsjwWRrT6uWx+G7ibhg+OGm0mCfSp14vwBfXL3BVTf+bqXbM3BM4EVdVc
 FdokB6oTX2hNOWTwgFJBYoqZq4nWLvbdwkrNpYvR/daMUWkKtG+8RTdcPDMFr3f/USPSSvv7TvH
 PapqaHcQ3PerYFTIsmXXIwZqY3KNbLl8VsLJ8qtBgXT3PUk57+dQqKrlc/QwVRcBX64Dq2YVPQG
 UqV6XD8fPa/KpXZqVesyDZc+cpU9eqm2e6uSt0fir46P337FmRYu5z86/drYTnFoIRfqAZ3iqZp
 QIeoIrsoZoMa1dJZtV9+pq7iF3G6PAlNKr60hzEj/PCoIu7Sk2pibcoYzFXfNuTZtkRsrOTqdTH
 EYOwW6OXvcn/jFeixLEnSkDK9MeGFg==
X-Proofpoint-GUID: ZB5xE1ViqwXKJN1lx3IQST0tOo7gRRQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 7/17/2025 4:57 AM, Bjorn Andersson wrote:
> On Tue, Jun 24, 2025 at 03:20:59PM +0530, Viken Dadhaniya wrote:
>> In Qualcomm SoCs, firmware loading for Serial Engines (SE) within the QUP
>> hardware has traditionally been managed by TrustZone (TZ). This restriction
>> poses a significant challenge for developers, as it limits their ability to
>> enable various protocols on any of the SEs from the Linux side, reducing
>> flexibility.
>>
>> Load the firmware to QUP SE based on the 'firmware-name' property specified
>> in devicetree at bootup time.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>> v4 -> v5:
>>
>> - Resolved kernel test robot error by including the missing bitfield header file.
>> - Updated the SE firmware ELF structure name for consistency.
>> - Specified _leb4 format for the magic number definition.
>> - Updated the email domain from 'quic' to 'oss'.
>>
>> v4 Link: https://lore.kernel.org/all/20250503111029.3583807-3-quic_vdadhani@quicinc.com/
>>
>> v3 -> v4:
>>
>> - Update the commit message.
>> - Resolve kernel test robot warnings.
>> - Add a multiline comment in the Copyright section.
>> - Remove valid_seg_size and geni_config_common_control functions, and add the code inline.
>> - Rename read_elf function to geni_read_elf.
>> - Add a firmware size check.
>> - Assign *pelfseg after finding a match.
>> - Break one large condition check into multiple checks to improve code readability.
>> - Remove return type documentation for void functions.
>> - Update error messages to be more descriptive.
>> - Correct indentation.
>> - Rename geni_flash_fw_revision function to geni_write_fw_revision.
>> - Remove __func__ from all print statements.
>> - Move resource_on to the appropriate section after parsing the firmware file.
>> - Update variable names and function arguments as suggested.
>> - Use FIELD_GET, FIELD_PREP, and GENMASK.
>> - Use memcpy_toio() instead of memcpy.
>> - Remove duplicate registers and bitmask macros.
>> - Remove rsc struct and add required variables in geni_se struct.
>>
>> v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-7-quic_vdadhani@quicinc.com/
>>
>> v2 -> v3:
>>
>> - Remove code related to the 'qcom,xfer-mode' property.
>> - Add logic to read the boolean property 'qcom,gsi-dma-allowed' and select the transfer mode.
>> - Hardcode FIFO mode for the serial driver as GSI mode is currently not supported.
>> - Update function descriptions as suggested.
>> - Enhance error handling and remove redundant if conditions.
>> - Drop the ternary operator.
>>
>> v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-6-quic_vdadhani@quicinc.com/
>>
>> v1 -> v2:
>>
>> - Remove the fixed firmware path and add logic to read the path from the device tree.
>> - Remove code related to the 'qcom,load-firmware' property.
>> - Resolve kernel test robot warnings.
>> - Update the commit message.
>> - Update Copyright year.
>>
>> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-5-quic_vdadhani@quicinc.com/
>> ---
>> ---
>>  drivers/soc/qcom/qcom-geni-se.c      | 407 +++++++++++++++++++++++++--
>>  include/linux/soc/qcom/geni-se.h     |  32 ++-
>>  include/linux/soc/qcom/qup-fw-load.h |  93 ++++++
>>  3 files changed, 510 insertions(+), 22 deletions(-)
>>  create mode 100644 include/linux/soc/qcom/qup-fw-load.h
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 4cb959106efa..ef4997a5fd63 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1,11 +1,15 @@
>>  // SPDX-License-Identifier: GPL-2.0
>> -// Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +/*
>> + *  Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> + *  Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> Please use our updated Copyright header.

Updated in v6.

> 
>> + */
>>  
>>  /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>>  #define __DISABLE_TRACE_MMIO__
>>  
>>  #include <linux/acpi.h>
>>  #include <linux/clk.h>
>> +#include <linux/firmware.h>
>>  #include <linux/slab.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/io.h>
>> @@ -15,6 +19,7 @@
>>  #include <linux/pinctrl/consumer.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/soc/qcom/geni-se.h>
>> +#include <linux/soc/qcom/qup-fw-load.h>
>>  
>>  /**
>>   * DOC: Overview
>> @@ -80,9 +85,9 @@
>>   * common to all the serial engines and are independent of serial interfaces.
>>   */
>>  
>> -#define MAX_CLK_PERF_LEVEL 32
>> -#define MAX_CLKS 2
>> -
>> +#define MAX_CLK_PERF_LEVEL	32
>> +#define MAX_CLKS		2
>> +#define MAX_PROTOCOL		6
>>  /**
>>   * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
>>   * @dev:		Device pointer of the QUP wrapper core
>> @@ -110,28 +115,23 @@ struct geni_se_desc {
>>  static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>  						"qup-memory"};
>>  
>> +static const char * const protocol_name[MAX_PROTOCOL] = { "None", "SPI", "UART",
>> +							  "I2C", "I3C", "SPI SLAVE"};
>> +
>>  #define QUP_HW_VER_REG			0x4
>>  
>>  /* Common SE registers */
>> -#define GENI_INIT_CFG_REVISION		0x0
>> -#define GENI_S_INIT_CFG_REVISION	0x4
>> -#define GENI_OUTPUT_CTRL		0x24
> 
> It would be nice if you did the rename and register cleanup in one
> "dumb" patch and then introduced the new functionality in a second
> patch.
> 

Created a separate patch and posted v6.

>> -#define GENI_CGC_CTRL			0x28
>>  #define GENI_CLK_CTRL_RO		0x60
>> -#define GENI_FW_S_REVISION_RO		0x6c
>>  #define SE_GENI_BYTE_GRAN		0x254
>>  #define SE_GENI_TX_PACKING_CFG0		0x260
>>  #define SE_GENI_TX_PACKING_CFG1		0x264
>>  #define SE_GENI_RX_PACKING_CFG0		0x284
>>  #define SE_GENI_RX_PACKING_CFG1		0x288
>> -#define SE_GENI_M_GP_LENGTH		0x910
>> -#define SE_GENI_S_GP_LENGTH		0x914
>>  #define SE_DMA_TX_PTR_L			0xc30
>>  #define SE_DMA_TX_PTR_H			0xc34
>>  #define SE_DMA_TX_ATTR			0xc38
>>  #define SE_DMA_TX_LEN			0xc3c
>>  #define SE_DMA_TX_IRQ_EN		0xc48
>> -#define SE_DMA_TX_IRQ_EN_SET		0xc4c
>>  #define SE_DMA_TX_IRQ_EN_CLR		0xc50
>>  #define SE_DMA_TX_LEN_IN		0xc54
>>  #define SE_DMA_TX_MAX_BURST		0xc5c
>> @@ -140,9 +140,7 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>  #define SE_DMA_RX_ATTR			0xd38
>>  #define SE_DMA_RX_LEN			0xd3c
>>  #define SE_DMA_RX_IRQ_EN		0xd48
>> -#define SE_DMA_RX_IRQ_EN_SET		0xd4c
>>  #define SE_DMA_RX_IRQ_EN_CLR		0xd50
>> -#define SE_DMA_RX_LEN_IN		0xd54
>>  #define SE_DMA_RX_MAX_BURST		0xd5c
>>  #define SE_DMA_RX_FLUSH			0xd60
>>  #define SE_GSI_EVENT_EN			0xe18
>> @@ -179,7 +177,7 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>  /* SE_DMA_GENERAL_CFG */
>>  #define DMA_RX_CLK_CGC_ON		BIT(0)
>>  #define DMA_TX_CLK_CGC_ON		BIT(1)
>> -#define DMA_AHB_SLV_CFG_ON		BIT(2)
>> +#define DMA_AHB_SLV_CLK_CGC_ON		BIT(2)
>>  #define AHB_SEC_SLV_CLK_CGC_ON		BIT(3)
>>  #define DUMMY_RX_NON_BUFFERABLE		BIT(4)
>>  #define RX_DMA_ZERO_PADDING_EN		BIT(5)
>> @@ -220,12 +218,12 @@ static void geni_se_io_init(void __iomem *base)
>>  {
>>  	u32 val;
>>  
>> -	val = readl_relaxed(base + GENI_CGC_CTRL);
>> +	val = readl_relaxed(base + SE_GENI_CGC_CTRL);
> 
> Per above comment, this change has nothing to do with firmware loading.

Created a separate patch and posted v6.

> 
>>  	val |= DEFAULT_CGC_EN;
>> -	writel_relaxed(val, base + GENI_CGC_CTRL);
>> +	writel_relaxed(val, base + SE_GENI_CGC_CTRL);
>>  
>>  	val = readl_relaxed(base + SE_DMA_GENERAL_CFG);
>> -	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CFG_ON;
>> +	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON;
>>  	val |= DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
>>  	writel_relaxed(val, base + SE_DMA_GENERAL_CFG);
>>  
>> @@ -891,6 +889,379 @@ int geni_icc_disable(struct geni_se *se)
>>  }
>>  EXPORT_SYMBOL_GPL(geni_icc_disable);
>>  
>> +/**
>> + * geni_read_elf() - Read an ELF file.
> 
> Not only does it "read an ELF"...

Updated in v6.

> 
>> + * @se: Pointer to the SE resources structure.
>> + * @fw: Pointer to the firmware buffer.
>> + * @pelfseg: Pointer to the SE-specific ELF header.
>> + *
>> + * Read the ELF file and output a pointer to the header data, which
>> + * contains the firmware data and any other details.
> 
> ...and not only does it output a pointer to _the_ header data. But it
> actually finds the SE firmware for the protocol that has been requested
> by the caller^4.
> 
> I think this function should be:
> 
>   static const struct se_fw_hdr *geni_find_protocol_fw(fw, protocol)
> 
> Which from just the prototype looks like a function that takes a
> firmware pointer, and somehow find the relevant SE firmware header for
> the requested protocol.
>

 
Updated in v6.

>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int geni_read_elf(struct geni_se *se, const struct firmware *fw, struct se_fw_hdr **pelfseg)
>> +{
>> +	const struct elf32_hdr *ehdr;
>> +	struct elf32_phdr *phdrs, *phdr;
>> +	const struct se_fw_hdr *elfseg;
> 
> This doesn't represent any ELF segment, but rather the SE firmware in an
> ELF segment. So, I think it would be better if this was named sefw;
> 
> Same thing, you don't really return an "ELF segment", but rather a
> pointer to the SE firmware.
> 

Updated in v6.

>> +	const u8 *addr;
>> +	int i;
>> +
>> +	if (!fw || fw->size < sizeof(struct elf32_hdr))
>> +		return -EINVAL;
>> +
>> +	ehdr = (struct elf32_hdr *)fw->data;
>> +	phdrs = (struct elf32_phdr *)(ehdr + 1);
> 
> Sorry for being sloppy when I wrote the code that you copied this
> from... This should be:
> 
> phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
> 
>> +
>> +	if (ehdr->e_phnum < 2)
> 
> Why?

The firmware is expected to have at least two program headers (segments),
One for metadata and the other for the actual protocol-specific firmware.

Added comment in v6.

> 
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < ehdr->e_phnum; i++) {
>> +		phdr = &phdrs[i];
>> +
>> +		if (fw->size < phdr->p_offset + phdr->p_filesz)
>> +			return -EINVAL;
>> +
>> +		if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
>> +			continue;
>> +
>> +		if (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) != MI_PBT_NON_PAGED_SEGMENT ||
>> +		    MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) == MI_PBT_HASH_SEGMENT ||
>> +		    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_NOTUSED_SEGMENT ||
>> +		    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_SHARED_SEGMENT)
>> +			continue;
>> +
>> +		if (phdr->p_filesz < sizeof(struct se_fw_hdr))
>> +			continue;
>> +
>> +		addr = fw->data + phdr->p_offset;
>> +		elfseg = (const struct se_fw_hdr *)addr;
> 
> 		elfseg = (const struct se_fw_hdr *)(fw->data + phdr->p_offset);
> 
> And then you can drop addr.

Updated in v6.

> 
>> +
>> +		if (cpu_to_le32(elfseg->magic) != MAGIC_NUM_SE || elfseg->version != 1)
> 
> As LKP pointed out you're converting this __le32 in the wrong direction
> (i.e. use le32_to_cpu()).
> 
>> +			continue;
>> +
>> +		if (phdr->p_filesz < elfseg->fw_offset +
>> +				     elfseg->fw_size_in_items * sizeof(u32) ||
>> +		    phdr->p_filesz < elfseg->cfg_idx_offset +
>> +				     elfseg->cfg_size_in_items * sizeof(u8) ||
>> +		    phdr->p_filesz < elfseg->cfg_val_offset +
>> +				     elfseg->cfg_size_in_items * sizeof(u32))
>> +			continue;
> 
> Even if this isn't the firmware for the protocol you're looking for, I'd
> say that if you have determined that you've found a valid SE FW segment
> and any of these checks doesn't pass, you have a truncated/corrupt
> firmware file. I think a error print is warranted here.
> 
> 
> Looks like you can squeeze these lines in under 100 characters if you
> remove the line wrap - that will make this chunk easier to read, so
> please unwrap them.
> 
> 
> Stylistic, I prefer the variable to be on the left of the comparator and
> the constant to the right; i.e. "elfseg->fw_offset + ... > phdr->p_filesz"
> 
>> +
>> +		if (elfseg->serial_protocol != se->protocol)
>> +			continue;
> 
> The key part of this loop is that you're looking for a SE firmware or
> the right protocol.
> 
> The fact that the segment must be big enough etc is a secondary sanity
> check to ensure you're not consuming bad firmware.
> 
>> +
>> +		*pelfseg = (struct se_fw_hdr *)addr;
> 
> *pelfseg = elfseg;
> 
> Although, this function only has two "return paths", either it return
> -EINVAL or it return 0 with *pelfseg assigned.
> 
> So, rather than using a pointer argument to return the result, make the
> return value const struct *se_fw_hdr and return elfseg here.

Updated in v6.

> 
>> +		return 0;
>> +	}
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * geni_configure_xfer_mode() - Set the transfer mode.
>> + * @se: Pointer to a structure representing SE-related resources.
>> + *
>> + * Set the transfer mode to either FIFO or DMA according to the mode specified by the protocol
>> + * driver.
> 
> This can be wrapped to 80 characters without loss of readability.

Updated in v6.

> 
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int geni_configure_xfer_mode(struct geni_se *se)
>> +{
>> +	/* Configure SE FIFO, DMA or GSI mode. */
>> +	switch (se->mode) {
>> +	case GENI_GPI_DMA:
>> +		geni_setbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
>> +		writel_relaxed(0x0, se->base + SE_IRQ_EN);
>> +		writel_relaxed(DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
>> +			       GENI_M_EVENT_EN | GENI_S_EVENT_EN,
>> +			       se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	case GENI_SE_FIFO:
>> +		geni_clrbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
>> +		writel_relaxed(DMA_RX_IRQ_EN | DMA_TX_IRQ_EN | GENI_M_IRQ_EN | GENI_S_IRQ_EN,
>> +			       se->base + SE_IRQ_EN);
>> +		writel_relaxed(0x0, se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	case GENI_SE_DMA:
>> +		geni_setbits32(se->base + SE_GENI_DMA_MODE_EN, GENI_DMA_MODE_EN);
>> +		writel_relaxed(DMA_RX_IRQ_EN | DMA_TX_IRQ_EN | GENI_M_IRQ_EN | GENI_S_IRQ_EN,
>> +			       se->base + SE_IRQ_EN);
>> +		writel_relaxed(0x0, se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	default:
>> +		dev_err(se->dev, "Invalid geni-se transfer mode: %d\n", se->mode);
>> +		return -EINVAL;
>> +	}
>> +	return 0;
>> +}
>> +
>> +/**
>> + * geni_enable_interrupts() - Enable interrupts.
>> + * @se: Pointer to a structure representing SE-related resources.
>> + *
>> + * Enable the required interrupts during the firmware load process.
>> + *
>> + */
>> +static void geni_enable_interrupts(struct geni_se *se)
>> +{
>> +	u32 reg_value;
> 
> "val" has the same amount of information, but is shorter and easier to
> read...

Updated in v6.

> 
>> +
>> +	/* Enable required interrupts. */
>> +	writel_relaxed(M_COMMON_GENI_M_IRQ_EN, se->base + SE_GENI_M_IRQ_EN);
> 
> Don't you need/want a wmb() before this (or use one writel()), to ensure
> previous programming is performed before you enable IRQs?

Updated in v6.

> 
>> +
>> +	reg_value = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN |
>> +		    S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
>> +		    S_GP_IRQ_0_EN | S_GP_IRQ_1_EN |
>> +		    S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
>> +		    S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;
>> +	writel_relaxed(reg_value, se->base + SE_GENI_S_IRQ_ENABLE);
>> +
>> +	/* DMA mode configuration. */
>> +	reg_value = RESET_DONE_EN | SBE_EN | DMA_DONE_EN;
>> +	writel_relaxed(reg_value, se->base + SE_DMA_TX_IRQ_EN_SET);
>> +	reg_value = FLUSH_DONE_EN | RESET_DONE_EN | SBE_EN | DMA_DONE_EN;
>> +	writel_relaxed(reg_value, se->base + SE_DMA_RX_IRQ_EN_SET);
>> +}
>> +
>> +/**
>> + * geni_write_fw_revision() - Write the firmware revision.
>> + * @se: Pointer to a structure representing SE-related resources.
>> + * @serial_protocol: serial protocol type.
>> + * @fw_version: QUP firmware version.
>> + *
>> + * Write the firmware revision and protocol into the respective register.
>> + *
>> + * Return: None.
>> + */
>> +static void geni_write_fw_revision(struct geni_se *se, u16 serial_protocol, u16 fw_version)
>> +{
>> +	u32 reg_value;
>> +
>> +	reg_value = FIELD_PREP(FW_REV_PROTOCOL_MSK, serial_protocol);
>> +	reg_value |= FIELD_PREP(FW_REV_VERSION_MSK, fw_version);
>> +
>> +	writel_relaxed(reg_value, se->base + SE_GENI_FW_REVISION);
>> +	writel_relaxed(reg_value, se->base + SE_S_FW_REVISION);
>> +}
>> +
>> +/**
>> + * geni_load_se_fw() - Load Serial Engine specific firmware.
>> + * @se: Pointer to a structure representing SE-related resources.
>> + * @fw: Pointer to the firmware structure.
>> + *
>> + * Load the protocol firmware into the IRAM of the Serial Engine.
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw)
>> +{
>> +	const u32 *fw_data, *cfg_val_arr;
>> +	const u8 *cfg_idx_arr;
>> +	u32 i, reg_value, ramn_cnt;
>> +	int ret;
>> +	struct se_fw_hdr *hdr;
>> +
>> +	ret = geni_read_elf(se, fw, &hdr);
>> +	if (ret) {
>> +		dev_err(se->dev, "ELF parsing failed ret: %d\n", ret);
> 
> If you move this error print to geni_read_elf() you can make it more
> useful - i.e. you can distinguish between not finding a sefw or the file
> being truncated etc.

Updated in v6.

> 
>> +		return ret;
>> +	}
>> +
>> +	ramn_cnt = hdr->fw_size_in_items;
>> +	if (hdr->fw_size_in_items % 2 != 0)
>> +		ramn_cnt++;
>> +
>> +	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
> 
> I presume it's unlikely that there will be an odd number of
> fw_size_in_items, that is less than MAX_GENI_CFG_RAMn_CNT, but the
> validation in geni_read_elf() only accounted for that you will access
> fw_size_in_items number of items from fw->data; not the rounded up
> value.
> 
> Also, it would probably be helpful to the user if you provided an error
> message about corrupt firmware here.

Updated in v6.

> 
>> +		return -EINVAL;
>> +
>> +	ret = geni_icc_set_bw(se);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = geni_icc_enable(se);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = geni_se_resources_on(se);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ramn_cnt = hdr->fw_size_in_items;
> 
> These adjustments and checks was performed 19 lines above as well, but
> before the hardware was spun up.

Removed duplicate check and updated in v6.

> 
>> +	if (hdr->fw_size_in_items % 2 != 0)
>> +		ramn_cnt++;
>> +
>> +	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
>> +		goto err_resource;
>> +
>> +	fw_data = (const u32 *)((u8 *)hdr + hdr->fw_offset);
>> +	cfg_idx_arr = (const u8 *)hdr + hdr->cfg_idx_offset;
>> +	cfg_val_arr = (const u32 *)((u8 *)hdr + hdr->cfg_val_offset);
>> +
>> +	/* Disable high priority interrupt until current low priority interrupts are handled. */
>> +	geni_setbits32(se->wrapper->base + QUPV3_COMMON_CFG, FAST_SWITCH_TO_HIGH_DISABLE);
>> +
>> +	/* Set AHB_M_CLK_CGC_ON to indicate hardware controls se-wrapper cgc clock. */
>> +	geni_setbits32(se->wrapper->base + QUPV3_SE_AHB_M_CFG, AHB_M_CLK_CGC_ON);
>> +
>> +	/* Let hardware to control common cgc. */
>> +	geni_setbits32(se->wrapper->base + QUPV3_COMMON_CGC_CTRL, COMMON_CSR_SLV_CLK_CGC_ON);
>> +
>> +	/* Allows to drive corresponding data according to hardware value. */
> 
> What does this sentence mean?

Enhanced comment and updated in v6.

> 
>> +	writel_relaxed(0x0, se->base + GENI_OUTPUT_CTRL);
>> +
>> +	/* Set SCLK and HCLK to program RAM */
>> +	geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
>> +	writel_relaxed(0x0, se->base + SE_GENI_CLK_CTRL);
>> +	geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
>> +
>> +	/* Enable required clocks for DMA CSR, TX and RX. */
>> +	reg_value = AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON |
>> +		    DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
>> +	geni_setbits32(se->base + SE_DMA_GENERAL_CFG, reg_value);
>> +
>> +	/* Let hardware control CGC by default. */
>> +	writel_relaxed(DEFAULT_CGC_EN, se->base + SE_GENI_CGC_CTRL);
>> +
>> +	/* Set version of the configuration register part of firmware. */
>> +	writel_relaxed(hdr->cfg_version, se->base + SE_GENI_INIT_CFG_REVISION);
>> +	writel_relaxed(hdr->cfg_version, se->base + SE_GENI_S_INIT_CFG_REVISION);
>> +
>> +	/* Configure GENI primitive table. */
>> +	for (i = 0; i < hdr->cfg_size_in_items; i++)
>> +		writel_relaxed(cfg_val_arr[i],
>> +			       se->base + SE_GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
>> +
>> +	/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
>> +	reg_value = geni_se_get_rx_fifo_depth(se);
>> +	writel_relaxed(reg_value - 2, se->base + SE_GENI_RX_RFR_WATERMARK_REG);
>> +
>> +	/* Let hardware control CGC */
>> +	geni_setbits32(se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
>> +
>> +	ret = geni_configure_xfer_mode(se);
>> +	if (ret)
>> +		goto err_resource;
>> +
>> +	geni_enable_interrupts(se);
>> +
>> +	geni_write_fw_revision(se, hdr->serial_protocol, hdr->fw_version);
>> +
>> +	ramn_cnt = hdr->fw_size_in_items;
> 
> hdr-.fw_size_in_items shouldn't have changed since you validated it 60
> and 79 lines above, right?

Removed duplicate check and updated in v6.

> 
>> +	if (hdr->fw_size_in_items % 2 != 0)
>> +		ramn_cnt++;
>> +
>> +	if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
>> +		goto err_resource;
> 
> I suspect that you're going to remove this check and return, but at this
> point you have enabled a bunch of hardware and you're exiting without
> cleaning up...

Moved this check to geni_find_protocol_fw and updated in v6.

> 
>> +
>> +	/* Program RAM address space. */
>> +	memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data, ramn_cnt * sizeof(u32));
>> +
>> +	/* Put default values on GENI's output pads. */
>> +	writel_relaxed(0x1, se->base + GENI_FORCE_DEFAULT_REG);
>> +
>> +	/* High to low SCLK and HCLK to finish RAM. */
> 
> "finish RAM <what>"?

Enhanced comment and updated in v6.

> 
>> +	geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
>> +	geni_setbits32(se->base + SE_GENI_CLK_CTRL, SER_CLK_SEL);
>> +	geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
> 
> All these IO accesses are relaxed, allowing the compiler and the CPU to
> reorder them. Isn't there a point here where the QUP will start running
> the newly loaded firmware - and you want to make sure that all the setup
> (and the firmware loading) isn't reordered past that point?
> 
> Or is the ordering of access to all these registers govern by something
> else?

Replaced writel_relaxed with writel in v6.

> 
>> +
>> +	/* Serial engine DMA interface is enabled. */
>> +	geni_setbits32(se->base + SE_DMA_IF_EN, DMA_IF_EN);
>> +
>> +	/* Enable or disable FIFO interface of the serial engine. */
>> +	if (se->mode == GENI_SE_FIFO)
>> +		geni_clrbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
>> +	else
>> +		geni_setbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
>> +
>> +err_resource:
> 
> Rename this out_resources_off

updated in v6.

> 
>> +	geni_se_resources_off(se);
>> +err:
> 
> And this out_icc_disable
> 
> That way one can understand how the exit will look like without jumping
> here
updated in v6.

> 
>> +	geni_icc_disable(se);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qup_fw_load() - Initiate firmware load.
>> + * @se: Pointer to a structure representing SE-related resources.
>> + * @fw_name: Name of the firmware.
>> + *
>> + * Load the firmware into a specific SE. Read the associated ELF file,
>> + * copy the data into a buffer in kernel space using the request_firmware API, write the
>> + * data into the SE's IRAM register, and then free the buffers. Handle firmware loading
>> + * and parsing for a specific protocol.
>> + *
> 
> Wrap all your kernel-doc bodies to 80 characters, please.

updated in v6.

> 
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +static int qup_fw_load(struct geni_se *se, const char *fw_name)
> 
> All other functions in this driver are prefixed "geni_". Please keep the
> naming consistent.
> 
> That said, moving the content of this function into
> geni_load_se_firmware() wouldn't worsen that function much and you
> remove a dummy intermediate function. So, please inline this.

updated in v6.

> 
>> +{
>> +	int ret;
>> +	const struct firmware *fw;
>> +	struct device *dev = se->dev;
>> +
>> +	ret = request_firmware(&fw, fw_name, dev);
>> +	if (ret) {
>> +		dev_err(dev, "request_firmware failed for %d: %d\n", se->protocol, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = geni_load_se_fw(se, fw);
>> +
>> +	release_firmware(fw);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * geni_load_se_firmware() - Initiate firmware loading.
> 
> Is this really "initiate firmware loading"? Isn't it actually completing
> the firmware loading? I.e. this comment should be "Load SE firmware" or
> such?

updated in v6.

> 
>> + * @se: Serial engine details.
>> + * @protocol: Protocol (SPI, I2C, or UART) for which the firmware is to be loaded.
>> + *
>> + * If the device tree properties are configured to load QUP firmware and the firmware
>> + * is not already loaded, start the firmware loading process. If the device tree properties
>> + * are not defined, skip loading the firmware, assuming it is already loaded by TZ.
> 
> This too talks about start firmware loading, but I don't see any code
> that would "finish" it.
> 
> The short form comment for qup_fw_load() above also says "Initiate", but
> the longer description indicates that it concludes the load.
> 
>> + *
>> + * Return: 0 if successful, otherwise return an error value.
>> + */
>> +int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol)
>> +{
>> +	const char *fw_name;
>> +	int ret;
>> +
>> +	if (protocol >= MAX_PROTOCOL) {
> 
> The only place I can see where this is important is in below dev_dbg()
> print, to avoid reading outside protocol_name[]. You can make that
> clearer by comparing with ARRAY_SIZE(protocol_name) instead.

updated in v6.

> 
>> +		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
>> +		return  -EINVAL;
> 
> There are two spaces between return and -EINVAL.

updated in v6.

> 
>> +	}
>> +
>> +	ret = device_property_read_string(se->wrapper->dev, "firmware-name", &fw_name);
>> +	if (ret)
>> +		return  -EINVAL;
> 
> Two more spaces

updated in v6.

> 
>> +
>> +	se->protocol = protocol;
> 
> You assign se->protocol here, and it's read in geni_read_elf()...

updated in v6.

> 
>> +
>> +	if (of_property_read_bool(se->dev->of_node, "qcom,enable-gsi-dma"))
>> +		se->mode = GENI_GPI_DMA;
>> +	else
>> +		se->mode = GENI_SE_FIFO;
> 
> ...and you assign se->mode here and it's read in geni_configure_xfer_mode()
> and geni_load_se_fw().
> 
> But the callstack looks like:
>   geni_load_se_firmware()
>     qup_fw_load()
>       geni_load_se_fw()
>         geni_read_elf()
>         geni_configure_xfer_mode()
> 
> So, both protocol and mode are only used in the scope of this function.
> Passing them around using struct geni_se only obfuscates this fact.
> 
> Please pass them as arguments instead to make this clear.

updated in v6.

> 
>> +
>> +	/* GSI mode is not supported by the UART driver; therefore, setting FIFO mode */
>> +	if (protocol == GENI_SE_UART)
>> +		se->mode = GENI_SE_FIFO;
>> +
>> +	ret = qup_fw_load(se, fw_name);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(se->dev, "Firmware load for %s protocol is successful for xfer mode %d\n",
>> +		protocol_name[se->protocol], se->mode);
> 
> Use the protocol and mode from the stack.

updated in v6.

> 
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(geni_load_se_firmware);
>> +
>>  static int geni_se_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
>> index 2996a3c28ef3..6b75171d65ec 100644
>> --- a/include/linux/soc/qcom/geni-se.h
>> +++ b/include/linux/soc/qcom/geni-se.h
>> @@ -1,11 +1,13 @@
>>  /* SPDX-License-Identifier: GPL-2.0 */
>>  /*
>>   * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  #ifndef _LINUX_QCOM_GENI_SE
>>  #define _LINUX_QCOM_GENI_SE
>>  
>> +#include <linux/bitfield.h>
>>  #include <linux/interconnect.h>
>>  
>>  /**
>> @@ -36,6 +38,7 @@ enum geni_se_protocol_type {
>>  	GENI_SE_I2C,
>>  	GENI_SE_I3C,
>>  	GENI_SE_SPI_SLAVE,
>> +	GENI_SE_INVALID_PROTO = 255,
>>  };
>>  
>>  struct geni_wrapper;
>> @@ -61,6 +64,8 @@ struct geni_icc_path {
>>   * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>>   * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
>>   * @icc_paths:		Array of ICC paths for SE
>> + * @mode:		Transfer mode se fifo, dma or gsi.
>> + * @protocol:		Protocol spi or i2c or serial.
>>   */
>>  struct geni_se {
>>  	void __iomem *base;
>> @@ -70,24 +75,32 @@ struct geni_se {
>>  	unsigned int num_clk_levels;
>>  	unsigned long *clk_perf_tbl;
>>  	struct geni_icc_path icc_paths[3];
>> +	enum geni_se_xfer_mode mode;
>> +	enum geni_se_protocol_type protocol;
>>  };
>>  
>>  /* Common SE registers */
>> +#define SE_GENI_INIT_CFG_REVISION	0x0
>> +#define SE_GENI_S_INIT_CFG_REVISION	0x4
>>  #define GENI_FORCE_DEFAULT_REG		0x20
>>  #define GENI_OUTPUT_CTRL		0x24
>> +#define SE_GENI_CGC_CTRL		0x28
>>  #define SE_GENI_STATUS			0x40
>>  #define GENI_SER_M_CLK_CFG		0x48
>>  #define GENI_SER_S_CLK_CFG		0x4c
>>  #define GENI_IF_DISABLE_RO		0x64
>> -#define GENI_FW_REVISION_RO		0x68
>> +#define SE_GENI_FW_REVISION_RO		0x68
>> +#define SE_GENI_S_FW_REVISION_RO	0x6c
>>  #define SE_GENI_CLK_SEL			0x7c
>>  #define SE_GENI_CFG_SEQ_START		0x84
>> +#define SE_GENI_CFG_REG0		0x100
>>  #define SE_GENI_DMA_MODE_EN		0x258
>>  #define SE_GENI_M_CMD0			0x600
>>  #define SE_GENI_M_CMD_CTRL_REG		0x604
>>  #define SE_GENI_M_IRQ_STATUS		0x610
>>  #define SE_GENI_M_IRQ_EN		0x614
>>  #define SE_GENI_M_IRQ_CLEAR		0x618
>> +#define SE_GENI_S_IRQ_ENABLE		0x644
>>  #define SE_GENI_M_IRQ_EN_SET		0x61c
>>  #define SE_GENI_M_IRQ_EN_CLEAR		0x620
>>  #define SE_GENI_S_CMD0			0x630
>> @@ -109,13 +122,22 @@ struct geni_se {
>>  #define SE_GENI_S_GP_LENGTH		0x914
>>  #define SE_DMA_TX_IRQ_STAT		0xc40
>>  #define SE_DMA_TX_IRQ_CLR		0xc44
>> +#define SE_DMA_TX_IRQ_EN_SET		0xc4c
>>  #define SE_DMA_TX_FSM_RST		0xc58
>>  #define SE_DMA_RX_IRQ_STAT		0xd40
>>  #define SE_DMA_RX_IRQ_CLR		0xd44
>> +#define SE_DMA_RX_IRQ_EN_SET		0xd4c
>>  #define SE_DMA_RX_LEN_IN		0xd54
>>  #define SE_DMA_RX_FSM_RST		0xd58
>>  #define SE_HW_PARAM_0			0xe24
>>  #define SE_HW_PARAM_1			0xe28
>> +#define SE_DMA_GENERAL_CFG		0xe30
>> +#define SE_GENI_FW_REVISION		0x1000
>> +#define SE_S_FW_REVISION		0x1004
>> +#define SE_GENI_CFG_RAMN		0x1010
>> +#define SE_GENI_CLK_CTRL		0x2000
>> +#define SE_DMA_IF_EN			0x2004
>> +#define SE_FIFO_IF_DISABLE		0x2008
>>  
>>  /* GENI_FORCE_DEFAULT_REG fields */
>>  #define FORCE_DEFAULT	BIT(0)
>> @@ -137,7 +159,7 @@ struct geni_se {
>>  
>>  /* GENI_FW_REVISION_RO fields */
>>  #define FW_REV_PROTOCOL_MSK		GENMASK(15, 8)
>> -#define FW_REV_PROTOCOL_SHFT		8
>> +#define FW_REV_VERSION_MSK		GENMASK(7, 0)
>>  
>>  /* GENI_CLK_SEL fields */
>>  #define CLK_SEL_MSK			GENMASK(2, 0)
>> @@ -325,9 +347,9 @@ static inline u32 geni_se_read_proto(struct geni_se *se)
> 
> It is assumed that this function will return an enum
> geni_se_protocol_type.
> 
> I think you should follow up with a patch to not throw this around as a
> u32.
> 
>>  {
>>  	u32 val;
>>  
>> -	val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
>> +	val = readl_relaxed(se->base + SE_GENI_FW_REVISION_RO);
>>  
>> -	return (val & FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT;
>> +	return FIELD_GET(FW_REV_PROTOCOL_MSK, val);
> 
> Nice, but unrelated to firmware loading.

updated in v6.

> 
>>  }
>>  
>>  /**
>> @@ -531,5 +553,7 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
>>  int geni_icc_enable(struct geni_se *se);
>>  
>>  int geni_icc_disable(struct geni_se *se);
>> +
>> +int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
>>  #endif
>>  #endif
>> diff --git a/include/linux/soc/qcom/qup-fw-load.h b/include/linux/soc/qcom/qup-fw-load.h
> 
> As this is only going to be used from qcom-geni-se.c, I think you should
> just put this content in that file directly.

updated in v6.

> 
>> new file mode 100644
>> index 000000000000..94a6c4c10bcf
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/qup-fw-load.h
>> @@ -0,0 +1,93 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +#ifndef _LINUX_QCOM_QUP_FW_LOAD
>> +#define _LINUX_QCOM_QUP_FW_LOAD
>> +
>> +#include <linux/kernel.h>
>> +
>> +/*Magic numbers*/
>> +#define MAGIC_NUM_SE			0x57464553
> 
> Please make "SE" the prefix, rather than suffix.

updated in v6.

> 
>> +
>> +#define MAX_GENI_CFG_RAMn_CNT		455
>> +
>> +#define MI_PBT_NON_PAGED_SEGMENT	0x0
>> +#define MI_PBT_HASH_SEGMENT		0x2
>> +#define MI_PBT_NOTUSED_SEGMENT		0x3
>> +#define MI_PBT_SHARED_SEGMENT		0x4
>> +
>> +#define MI_PBT_FLAG_PAGE_MODE		BIT(20)
>> +#define MI_PBT_FLAG_SEGMENT_TYPE	GENMASK(26, 24)
>> +#define MI_PBT_FLAG_ACCESS_TYPE		GENMASK(23, 21)
>> +
>> +#define MI_PBT_PAGE_MODE_VALUE(x) FIELD_GET(MI_PBT_FLAG_PAGE_MODE, x)
>> +
>> +#define MI_PBT_SEGMENT_TYPE_VALUE(x) FIELD_GET(MI_PBT_FLAG_SEGMENT_TYPE, x)
>> +
>> +#define MI_PBT_ACCESS_TYPE_VALUE(x) FIELD_GET(MI_PBT_FLAG_ACCESS_TYPE, x)
>> +
>> +#define M_COMMON_GENI_M_IRQ_EN	(GENMASK(6, 1) | \
>> +				M_IO_DATA_DEASSERT_EN | \
> 
> These constants are defined in geni-se.h, so if someone includes this
> file before that one, this won't compile.

updated in v6.

> 
>> +				M_IO_DATA_ASSERT_EN | M_RX_FIFO_RD_ERR_EN | \
>> +				M_RX_FIFO_WR_ERR_EN | M_TX_FIFO_RD_ERR_EN | \
>> +				M_TX_FIFO_WR_ERR_EN)
>> +
>> +/* DMA_TX/RX_IRQ_EN fields */
>> +#define DMA_DONE_EN		BIT(0)
> 
> There's already a GENI_SE_DMA_DONE_EN define in qcom-geni-se.c, used for
> the SE_DMA_TX_IRQ_EN_SET register.

updated in v6.

> 
>> +#define SBE_EN			BIT(2)
> 
> And this bit is today called GENI_SE_DMA_AHB_ERR_EN. Did the name
> change, does different hardware have different functionality for this
> one bit? If so, how would one know that geni_se_tx_init_dma() and
> geni_enable_interrupts() uses incompatible bit definitions?
> 
> This shows why it's important that you don't mix renames and functional
> additions!

updated in v6.

> 
>> +#define RESET_DONE_EN		BIT(3)
>> +#define FLUSH_DONE_EN		BIT(4)
>> +
>> +/* GENI_CLK_CTRL fields */
>> +#define SER_CLK_SEL		BIT(0)
>> +
>> +/* GENI_DMA_IF_EN fields */
>> +#define DMA_IF_EN		BIT(0)
>> +
>> +#define QUPV3_COMMON_CFG		0x120
> 
> Group this with QUP_HW_VER_REG, to indicate that it belongs to that
> register space and not the SE space.

updated in v6.

> 
>> +#define FAST_SWITCH_TO_HIGH_DISABLE	BIT(0)
>> +
>> +#define QUPV3_SE_AHB_M_CFG		0x118
>> +#define AHB_M_CLK_CGC_ON		BIT(0)
>> +
>> +#define QUPV3_COMMON_CGC_CTRL		0x21C
>> +#define COMMON_CSR_SLV_CLK_CGC_ON	BIT(0)
>> +
>> +/* access ports */
> 
> There are no "ports"...

updated in v6.

> 
>> +#define geni_setbits32(_addr, _v) writel_relaxed(readl_relaxed(_addr) |  (_v), _addr)
>> +#define geni_clrbits32(_addr, _v) writel_relaxed(readl_relaxed(_addr) & ~(_v), _addr)
>> +
>> +/**
>> + * struct se_fw_hdr - Serial Engine firmware configuration header
>> + *
>> + * This structure defines metadata for the Serial Engine (SE) firmware
>> + * configuration. Although it is embedded within an ELF segment, it is
>> + * not part of the ELF format itself.
> 
> Perhaps:
> 
> """
> This structure defines the SE firmware header, which together with the
> firmware payload is stored in individual ELF segments.

updated in v6.

> """
> 
>> + *
>> + * @magic: Set to 'SEFW'
>> + * @version: Structure version number
>> + * @core_version: QUPV3 hardware version
>> + * @serial_protocol: Encoded in GENI_FW_REVISION
>> + * @fw_version: Firmware version, from GENI_FW_REVISION
>> + * @cfg_version: Configuration version, from GENI_INIT_CFG_REVISION
>> + * @fw_size_in_items: Number of 32-bit words in GENI_FW_RAM
>> + * @fw_offset: Byte offset to GENI_FW_RAM array
>> + * @cfg_size_in_items: Number of GENI_FW_CFG index/value pairs
>> + * @cfg_idx_offset: Byte offset to GENI_FW_CFG index array
>> + * @cfg_val_offset: Byte offset to GENI_FW_CFG values array
>> + */
>> +struct se_fw_hdr {
>> +	__le32 magic;
> 
> Kudos for specifying the endianess of this member, but what about the
> rest? How come magic is little endian but the other members are
> magically native endian?
> 
> Preferable you define them all with proper endian annotation.

updated in v6.

> 
> Regards,
> Bjorn
> 
>> +	u32 version;
>> +	u32 core_version;
>> +	u16 serial_protocol;
>> +	u16 fw_version;
>> +	u16 cfg_version;
>> +	u16 fw_size_in_items;
>> +	u16 fw_offset;
>> +	u16 cfg_size_in_items;
>> +	u16 cfg_idx_offset;
>> +	u16 cfg_val_offset;
>> +};
>> +#endif /* _LINUX_QCOM_QUP_FW_LOAD */
>> -- 
>> 2.34.1
>>

