Return-Path: <linux-i2c+bounces-6970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC2985448
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 09:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8611C2812A6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 07:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87B815748E;
	Wed, 25 Sep 2024 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NHNnmoHz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0C156F55;
	Wed, 25 Sep 2024 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249830; cv=none; b=skUroEUPY/LTizjIdwOxSNITVA5lOptM9n8C5mXP/QRotn1w8CgiuUeX4IBlnhkq3AkAGspBUZlyW81o6Fz+4h2ZX/nhspn7jBoY7A0F2djEbrdqMG3gKx2UOx8D6Fwbcmtgh1UxTiOyJlheo8zLtvy6mGQfpb+7hg2fDL2xcNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249830; c=relaxed/simple;
	bh=yMl2CgUjE1vZxpHmmrNLL9Ere5j/hjy5L9/g+qd4Q5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DhYZ1Hj+X8drIwUpqnVK4JwWWjBmPCE0s95LRJN1edEr269TDjOLBaCV/SKMNa1hUSTY0FlxATAQA4Xla7ORWLmsntkPKya3/ZngtroXBaJqP145jl825/PSlPbydl1wTfmun044stDiUF3ymrMJrCr4m0rz7U+S3pmsMXnlpKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NHNnmoHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P73irJ026499;
	Wed, 25 Sep 2024 07:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8X9eoG5dZXKT/ZCNbX8qdgtglFp+pPJcZshg43W4RsE=; b=NHNnmoHzznjg4Iky
	ChCkfizzApj2JsIbinywVu78Tc5XZR7L6t3sl2ZpBWapG4CRpFtCqTNVC8XrSo9M
	lIsfbk7cpq48LKXFMH9HsXCK952g+vPxJu9xHffwzU5VE0tE+W56sbPdfcYHj0d5
	jLYHto7MdzTUI18L2g9C9rfL8DFP9op+yiojRcaqjREHAM8YtsIEJcD3YRI7r8Zi
	YQ9KGQ/fWs966g75qodyi299gyLpRpJ1fXqfGhzh/NDoU2aqBid0Z6kOSi7vV60W
	hI8KdArQwLHXQ6peDXqNrlJMpasPiNiVUd0jS0mbD3wGl4e08YZ4OFXi0ce5FRs8
	St6X8w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7uke1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:37:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P7b4l7025918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:37:04 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 00:37:01 -0700
Message-ID: <e14e2136-54eb-411d-afff-f6803a23ad6a@quicinc.com>
Date: Wed, 25 Sep 2024 13:06:58 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9yFwfLJOPhuonJjmifqlVIkR8PBGkor3
X-Proofpoint-ORIG-GUID: 9yFwfLJOPhuonJjmifqlVIkR8PBGkor3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=928 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409250053

Hi Manikanta,

On 9/24/2024 12:20 PM, Manikanta Mylavarapu wrote:
> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
would it be better to say , I2C SE is sourced from 32MHZ ?
> existing map table is based on 19.2MHz, this patch incorporate the
based on 19.2MHz. this patch /,/.
> clock map table to derive the SCL clock from the 32MHz SE clock.
from the 32MHz Source Clock frequency.
SE = Expand OR  (I2C Serial Engine Controller)
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 212336f724a6..bbd9ecf09f4b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -71,6 +71,7 @@ enum geni_i2c_err_code {
>   
>   #define I2C_AUTO_SUSPEND_DELAY	250
>   #define KHZ(freq)		(1000 * freq)
> +#define MHZ(freq)		(1000000 * freq)
>   #define PACKING_BYTES_PW	4
>   
>   #define ABORT_TIMEOUT		HZ
> @@ -152,11 +153,21 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
A thought - Should we rename this appending _19.2M ? In future one or 
more may come as it evolves speed.
>   	{KHZ(1000), 1, 3,  9, 18},
>   };
>   
> +/* source_clock = 32 MHz */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32M[] = {
> +	{KHZ(100), 7, 14, 18, 40},
> +	{KHZ(400), 4,  3, 11, 20},
> +	{KHZ(1000), 4, 3,  6, 15},
> +};
> +
>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   {
>   	int i;
>   	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
>   
> +	if (clk_get_rate(gi2c->se.clk) == MHZ(32))
> +		itr = geni_i2c_clk_map_32M;
> +
>   	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
>   		if (itr->clk_freq_out == gi2c->clk_freq_out) {
>   			gi2c->clk_fld = itr;

