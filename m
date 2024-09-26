Return-Path: <linux-i2c+bounces-7014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 952AD986C4D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2105F1F22BD3
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3264118756D;
	Thu, 26 Sep 2024 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cDo5ZVQd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5831171C;
	Thu, 26 Sep 2024 06:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727331271; cv=none; b=BmENZ9SH+RtCAbAVvWAWrpQCn6EEl6OYrj7wZMstz//jJ3L1fBG2Fw9O56sZhQ3fFlWVMIaIOcY4RrctF0wo1BXGVk2r0avWFhJYvkE9omGpcZt/13usSxiDcCRDnMOkIn1RJ0hr54eZy/PBGZu3IZsx1GF9kIwiw594UPHs0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727331271; c=relaxed/simple;
	bh=HasklfQSottO4Xv0zSSTdIpsqVG+FNdJYzgNz8Dcn/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RaiWgcAUvn6zEBy/77ny1FHzd0Ct1GrmQKDm1qBwvMVIAzrFi6ulbGtIuaMs+fTnKJDQWLL4gh8isgQYI4JJxhuPy84KnLpzsNh2ZLNbTKrYlg6MhpXOJ5/aXaW+SlxIp6AL9ZefpkycDERxuDn6y6Vzf4aQj8sQSdouyAIgIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cDo5ZVQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5Ck2005925;
	Thu, 26 Sep 2024 06:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZygEXnaaKw8altOzhWYu/B7xNi6LaS0krxd35RZj8o=; b=cDo5ZVQdvUfdUhQm
	aV660xcV6TbxNDDlDFHVYwMzcBwdzfedSHNEBn8fBj3j8JqDv/OmBw8kt6J6DYzT
	YxEwu3meZLSfVUbfqcEpa/diC2CDkVUPlzRXMU12x/pWzHvyumItx9PL4r7hUwbx
	39/S7uNx82Kmqt295AdXi4f4jFOWpPi5niet+dEyloatR+Ou8AJt4i3puZMY0qXT
	4NTuHMVqi+D3J+wXptNAHirgZndTV84hzrrAHjeYN4+FcGic+BLPdLj18Tjl7OMd
	Fd+aC9X0L8LYOWA9im9cPaXpsMhEB2fsQDKAcz0A3R5c6nXmh9wzev4SGzWLb+r8
	RuQZ0Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9e80b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:14:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q6EP68021246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:14:25 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 23:14:23 -0700
Message-ID: <732bdb12-a52b-4abe-8edb-afed44406011@quicinc.com>
Date: Thu, 26 Sep 2024 11:44:20 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7zSXD4aCOa117VjYjWKgErTDL1HSFwrb
X-Proofpoint-GUID: 7zSXD4aCOa117VjYjWKgErTDL1HSFwrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260039

Hi Manikanta, My suggestion:

i2c: qcom-geni: Support systems with 32MHz serial engine clock
[Derive i2c clock from 32MHz Sourced clock]

On 9/26/2024 9:13 AM, Manikanta Mylavarapu wrote:
> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
> 
> The existing map table is based on 19.2MHz. This patch incorporate
incorporate/s/incorporates
> the clock map table to derive the SCL clock from the 32MHz source
> clock frequency.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in v2:
> 	- Dropped IPQ5424 from the commit title
> 	- Added else part to assign geni_i2c_clk_map_19p2mhz to itr
> 	- Dropped MHZ macro and used HZ_PER_MHZ macro
> 	- Expanded SE to serial engine
> 	- Added the reason for 32MHz clock in commit message
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 212336f724a6..22f2a0d83641 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -16,6 +16,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/soc/qcom/geni-se.h>
>   #include <linux/spinlock.h>
> +#include <linux/units.h>
>   
>   #define SE_I2C_TX_TRANS_LEN		0x26c
>   #define SE_I2C_RX_TRANS_LEN		0x270
> @@ -146,18 +147,30 @@ struct geni_i2c_clk_fld {
>    * clk_freq_out = t / t_cycle
>    * source_clock = 19.2 MHz
>    */
> -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>   	{KHZ(100), 7, 10, 11, 26},
>   	{KHZ(400), 2,  5, 12, 24},
>   	{KHZ(1000), 1, 3,  9, 18},
>   };
>   
> +/* source_clock = 32 MHz */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> +	{KHZ(100), 7, 14, 18, 40},
> +	{KHZ(400), 4,  3, 11, 20},
> +	{KHZ(1000), 4, 3,  6, 15},
> +};
> +
>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   {
>   	int i;
> -	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
> +	const struct geni_i2c_clk_fld *itr;
> +
> +	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
> +		itr = geni_i2c_clk_map_32mhz;
> +	else
> +		itr = geni_i2c_clk_map_19p2mhz;
>   
> -	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
> +	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map_19p2mhz); i++, itr++) {
>   		if (itr->clk_freq_out == gi2c->clk_freq_out) {
>   			gi2c->clk_fld = itr;
>   			return 0;

