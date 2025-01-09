Return-Path: <linux-i2c+bounces-8986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332C1A06D3B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 05:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA0571888DBA
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 04:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF3D213E85;
	Thu,  9 Jan 2025 04:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PGBSGW6E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FA2F2F;
	Thu,  9 Jan 2025 04:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397843; cv=none; b=Z7juLMkupqrwBNOpR36MTivyT5ozjx9I7XybkH7zLZXYRODt/VSLYqmhZ3d2OlmYkJLXIz277Z4qkEHf5Poi/ML3XvenASKd8kFZaGdJfhBk4Ih6El0MF4s4FsO5CXW+OVVWb049dymkUuU5aRGfDy6tJPRs/eeRy9Iwv3/l6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397843; c=relaxed/simple;
	bh=ydz09o9V7x3nsaLliyty2ABuRQdbqwxdgXTZ5Il9UpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tPqRup40BeQUiye851FEQC7Q3b3/oDTYGJQ9STRwkZmMLwBEBjxM8i2jrGHoZ/4Mv1/G7GoKeDA1H/lbHR+GH99vcLQKGwu/sebEvDwnNWNYvW9uFPjN5Mj0r8hvzS8Rv/Hr4gIhMOGFIlrRPS9kTCjPuBtAe2Jta6ZJExyogb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PGBSGW6E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508JsZNl012283;
	Thu, 9 Jan 2025 04:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEtdu6QkdcZZBwwoPjH+dmoZjpYJxR0K9af/9H7wCF8=; b=PGBSGW6E8ZlBWdLW
	ZPJP407kMJ8rNYjHWUAGxNscyi+KA74/mSzDIVbe7+dvzAF723pHS71CLDjUf2Vk
	KLOljTmKscBpFyCdVw5Mef0cmajvssaorE12WxgU8N1tAaP6U1Oe0Co7oeacU5MJ
	xrxoO2EGKCz73Ln9MTdvGCkuYz4oBdjBYBM4I/BXzJD7fb3FQ4KAlcCF3/f5udgx
	HIXlXFIfR6MPpJ4pR0dlb/3Vf2Xj9TwGsABfIChVr51rxAjpf+zDryBV4d184XOc
	OlWVhs6qqurs9YUgV7B3+K35zmGajPRjTnyLJUb6PqSYSZXklLbt4iWrspRPlQuY
	jOafEg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441yxbs13q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:43:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094hvLg029980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:43:57 GMT
Received: from [10.216.26.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 20:43:52 -0800
Message-ID: <fc239699-d3ea-441a-ab48-0191fcda09d2@quicinc.com>
Date: Thu, 9 Jan 2025 10:13:48 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: tegra: Add Tegra264 support
To: Kartik Rajput <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>,
        <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-4-kkartik@nvidia.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250108110620.86900-4-kkartik@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1Tyv2Y10k8JIkFWtJkQMUh-7tFLQc5K5
X-Proofpoint-ORIG-GUID: 1Tyv2Y10k8JIkFWtJkQMUh-7tFLQc5K5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090035

Hi Kartik,

On 1/8/2025 4:36 PM, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
> 
> Add support for Tegra264 SoC which supports 17 generic I2C controllers,
> two of which are in the AON (always-on) partition of the SoC. Tegra264
> I2C supports all the features supported by Tegra194 I2C controllers.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 7b97c6d347ee..cf05937cb826 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1646,7 +1646,35 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.has_hs_mode_support = true,
>   };
>   
> +static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
I could see 7 controllers have been already added. And this may keep 
growing.
Can we make either default set which is common for most of and change 
only sepcific fields ?

Second option - read these fields from DT and overwrite default if it's 
mentioned in DTSI.

Please review and see if this makes sense. what others say ?
> +	.has_continue_xfer_support = true,
> +	.has_per_pkt_xfer_complete_irq = true,
> +	.clk_divisor_hs_mode = 1,
> +	.clk_divisor_std_mode = 0x1d,
> +	.clk_divisor_fast_mode = 0x15,
> +	.clk_divisor_fast_plus_mode = 0x8,
> +	.has_config_load_reg = true,
> +	.has_multi_master_mode = true,
> +	.has_slcg_override_reg = true,
> +	.has_mst_fifo = true,
> +	.quirks = &tegra194_i2c_quirks,
> +	.supports_bus_clear = true,
> +	.has_apb_dma = false,
> +	.tlow_std_mode = 0x8,
> +	.thigh_std_mode = 0x7,
> +	.tlow_fast_fastplus_mode = 0x2,
> +	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_hs_mode = 0x4,
> +	.thigh_hs_mode = 0x2,
> +	.setup_hold_time_std_mode = 0x08080808,
> +	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
> +	.setup_hold_time_hs_mode = 0x090909,
> +	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = true,
> +};
> +
>   static const struct of_device_id tegra_i2c_of_match[] = {
> +	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
>   	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
>   	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
>   #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)


