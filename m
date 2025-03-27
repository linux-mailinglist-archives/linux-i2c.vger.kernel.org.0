Return-Path: <linux-i2c+bounces-10046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11639A729D6
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 06:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9A13B12E0
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 05:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB831B5EA4;
	Thu, 27 Mar 2025 05:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xj4Py5i9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B61547C9;
	Thu, 27 Mar 2025 05:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743053268; cv=none; b=NIwqh7yVvytNP0zoD9H38vd+7p21CzuEkE3FB6JAsjCCORUX7avQ7PCaglVGhh1cReaUPbo5q4ekKs0LLiVGJowL5X6O6YnjZH11lz6917SGamAT6lL3kmIHoFSP7KWN2/o9vxUHuWUcmelJ3Oho7mSEXDzCw8jwNUoMkQmCmRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743053268; c=relaxed/simple;
	bh=tpgb5oyvr981xsJ6BClPWQTEC3M2egOGLynvUm6LgC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UBsDqZ2vefPgeTP4sqPBGXdSeJmrjAsxXdAfBYfTOXpDXE0Cma2lNS6FxH4Q1fo8f0dhC2zI16BCVLdqPOppfX5PlAsjl3p4FpEStGyF2G7OaLimDDlfsJQPyta5hVvj59x5HMHmOdihjlvyt5Ach835OGBxzlpfN8eRpUYaOS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xj4Py5i9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R3mahx006138;
	Thu, 27 Mar 2025 05:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnArCRvQP7qZOrcigjEhnlKt1WGcj0RSP3AVU9Xt1Rw=; b=Xj4Py5i9Q0TzIzzi
	my+ADEun/Km1arM7a2uUxtPtAmNqAa61N4XTOgZ+w+xAP6yD4TDnez84m3xIbez1
	VZvm9DabIgtgG5aDDfsksuPdnnNotSn0oxC2k/ittPjmsMJTXb53sRj9Jz77BwnX
	N67MCTPS4G1EVycvyiLIk2mSf4knt2tBt9pLfoAJN5ZVWVrUGEu2PmOBcLO5+WU3
	k6KvIK7eZDxuA4VcJ6G9Te7sMriX690Kk8xhszgICI7HL1N6n28mf4YySu44OX3I
	8ROUO/tYmCNKX4I78KHBRv2xhDQEZ+utXIV9B3jSw44Yah/TA5yeKlqvtO3fcuDC
	Fl1Okg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj3r71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:27:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R5RYMc020190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:27:34 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 22:27:31 -0700
Message-ID: <208f3edd-2be0-4edd-be25-d874d00b770d@quicinc.com>
Date: Thu, 27 Mar 2025 10:57:28 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8NOGiPWwjg7VCHgxcPrPDn4WeJACh39q
X-Proofpoint-ORIG-GUID: 8NOGiPWwjg7VCHgxcPrPDn4WeJACh39q
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e4e1c7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=kRCqjBm0PVXXUO08W4wA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1011 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270033

Looks good to me.

On 3/26/2025 8:09 PM, Marcus Folkesson wrote:
> The driver do support I2C_M_IGNORE_NAK, so add
> I2C_FUNC_PROTOCOL_MANGLING to the feature list.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> The driver do support I2C_M_IGNORE_NAK, so the
> I2C_FUNC_PROTOCOL_MANGLING bit should be set.
> 
> I2C_M_IGNORE_NAK is the only supported "mangling-feature" though, but
> other i2c bus drivers also seems to support only a subset of available
> mangling-features, so I guess this is ok.
> ---
>   drivers/i2c/busses/i2c-davinci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index 6a909d339681214ed4f382b62f8cd924f4295e69..6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -551,7 +551,8 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   
>   static u32 i2c_davinci_func(struct i2c_adapter *adap)
>   {
> -	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
> +		I2C_FUNC_PROTOCOL_MANGLING;
>   }
>   
>   static void terminate_read(struct davinci_i2c_dev *dev)
> 
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250326-i2c-5561bf853f8d
> 
> Best regards,


