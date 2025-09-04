Return-Path: <linux-i2c+bounces-12642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB33B43F93
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4B956848E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CCF308F25;
	Thu,  4 Sep 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWBjnhvg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3551F03DE
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997419; cv=none; b=hfcnVHOG1lai3hwyhiKRW30KZvyDnD0qprfBlYRYBbzCUfpBrX3yMgud7i13ZLcVQB1c5iEnXWqWWOTpP9SxUqkHfLMxNkE4E3YBULzmkzGQjv1nhWlUUPP/76uhd3Wuve6qfKS/jy0jx49MaqRv6Mw0+wrMEx3xn3pew0EO5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997419; c=relaxed/simple;
	bh=alMbirdT3CCc6D7G4e583oLfyh6D9HJKmtifjlFhTOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Og3p+PjaMfhKuUlCeRN3mu2U6L0+C5uobC8sAWN8ZcT6xtdEnhbePT9E2YOGOKVvyZhgsp7XlglDubVFH/mrsRB4Iqdna17X0WB7wh+M+3kKSVvn7+w9ZED89UJOr2NgL34X9BkkK21UPRXc8bDmOtmjoilUIIXh0V9Ozf4I8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWBjnhvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XBsD014013
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 14:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEN3DVQPWnQ3YmNmi0dGVFvSE5AeHGCdQkQ8yWp6IEM=; b=nWBjnhvgBAlcyJEd
	8K6sQ67Jt1vV0mUBXuWNZB+AydZGmLwO7+mQn/QTdhJEmnNJuR8YBYCSvkHnhBuZ
	iDiuP60TvAkucuIN4zMJ/SqcgtBVS6qUZxVuk+s3d+YxKKcCov7Hrfjxu3V7F9US
	fBSVit+0cQzXoXHUBmuCosYJUyzi74tuK7wTIY2xFGsJ+CZIbq+4AsTrze4WRt7L
	xI8xGXNZbUYTX9Jzq64Mi8g7k84jVxUVyXdDiM1V9qzyr+Sawp1oiu9dANZ3CrrH
	xYMS9RrjcGUCXSS8jvCMAQ0/dt/CyIlh2VbcpsH2J+xFhdBMUi8NG5GW/fPHTXhc
	oRx9VA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv807w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 14:50:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3387c826eso4211411cf.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 07:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997407; x=1757602207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEN3DVQPWnQ3YmNmi0dGVFvSE5AeHGCdQkQ8yWp6IEM=;
        b=vSM4Gz1JAJBMuGO5DN9JqtXVIIVReu3vmquaZWFTLfHOsKT+DiQl8gH1dGsZfYgFjm
         74iInzLGXa+KjQp7Zv7f3k+MU9PQJhbejMoa0Q/qEoGKDCgVoP1PlB/OPuescSLl42+I
         Q115Fw2fqkv8q8BKLfyh7u2Fa4Kno8f8Bv31tdBWO0aISSfB1D1cdrbMte2KOiLkSe6H
         OzargUhZnCfcVKMAPQiD2Tj2dmoHKJ4mJb7t7qQiGhEHaSFmkTgQLD0D8HlcH6hMSw4k
         vYnm/l0c4Osc4Vpe4K3zAmTo/nJIdMJjZc/eacchqX0a3uFlOU9Iv1Uz9BcIA5l5ZdZL
         1OZw==
X-Forwarded-Encrypted: i=1; AJvYcCWD1ZvTI+HWd8X45BBZ4rT5t7h9aDhFqE8bCySTBlq5x5Rsm+g3wsIqcVnVP3ghwaMQVvlMUOeiYpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4qg7H9Ue0hCEEOAvDbEZOqB0GLAw0h62EbXOIhv0HJ52EJZ0
	z+RMiOr6w7k2Z4WG5spqJf74iNlwL7BZ+XEn+SF1L4fqnRkxdu4wG93OWhhmgEbVdVenQUDWdJ4
	TtMIGuMYoXkyYmCIzXOIaAlPfM86yRJqR/pzU/FiVIgXs4UTPBZFQ5nlVaWPwCoE=
X-Gm-Gg: ASbGncsReJvSAiA7yFfO7bVhadqCgAR0LkJEQGL4k2Gvb06TcmAnPPiAPIQ305U939R
	motnVdZQ5Px6oZ66h7kuJkZUuboCOcWxp+E8uasicZTFiSw7lDXCz/eEcmu0pxyCDr4o7RTqv/h
	fqt2Bxg/y4++TqvYMF4zcWtjoXV0KGeUC3tKhDyk2vBxFzx4MQe63HvJguwX70DdJ5MEfQPf+Fk
	WHg9cy+bM186v2adztrgaSz07b+8kAuhAky0XLzeBFHahuystYbrthduW4syzt67d3jtcXOwNFM
	/cCVuUHmfVbwaHyRHl1/xy9ZpgrMTHEPgkPSRSj7DHa0lJbSC5OMh9pj3KEBOkkyk/zeywoEDMl
	njo2rAWNMzhBaf9Qy9JLmXw==
X-Received: by 2002:a05:622a:314:b0:4b2:9c61:4925 with SMTP id d75a77b69052e-4b313f6f611mr170378141cf.11.1756997406640;
        Thu, 04 Sep 2025 07:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6TDGPjmSsCamHewOM2+IFNcFZnByXwpc+6NwBdpVl4gFaguUqKR2wdfL7cEbd1fWAsWZrWw==
X-Received: by 2002:a05:622a:314:b0:4b2:9c61:4925 with SMTP id d75a77b69052e-4b313f6f611mr170377791cf.11.1756997405872;
        Thu, 04 Sep 2025 07:50:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046cd5c274sm375616366b.98.2025.09.04.07.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:50:05 -0700 (PDT)
Message-ID: <6501e5b4-9939-4dac-991c-7a2033cfb506@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:50:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX4J8aGVlvFoZj
 ++I7KBN8CrNn3fDJbv5U3koVMa0ybgP6NGhQPljSCFRU5k8P/qomATBSOtZJrhAVGGZG4Bw4te0
 2vKpa73JhKOy6kHMdN0ZYi8SVS3R+BnXeGtMQg1MyVEyVfAkerRCI9dnLV8NsoAS5Y6yDXmFUPi
 nSp3WO8gfrJdBxKrH6G2KcVlS9o4I9DlYiGVNZFmj++diSPdQUOTnPW0fNzgOpVbClcNKFrjltO
 /kyNK9mFFnF7Pf+pOe/plR4IjTHrNwizaadctqmKkbtbNgjy7WGxmvpEXwMZmyV5fCy7Rlxw65T
 GJmh95d9y3ncPAIz8i7QApkMeZdwwnvOpu31ibZy44X2njDm8wdmT9u7XQxwMJb8C37SGTCpaLW
 IKB/FyQR
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b9a727 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=scFqH3SFngUqC7XewS8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8wRJ_ZVd4Vt8B5FKulUMGdV7eK2yrklR
X-Proofpoint-GUID: 8wRJ_ZVd4Vt8B5FKulUMGdV7eK2yrklR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 9/4/25 4:31 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The CCI clock has voltage requirements, which need to be described
> through an OPP table.
> 
> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> (which is a value common across all SoCs), since it's not possible to
> reach the required timings with the default 19.2 MHz rate.
> 
> Address both issues by introducing an OPP table and using it to vote
> for the faster rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 74fedfdec3ae4e034ec4d946179e963c783b5923..d6192e2a5e3bc4d908cba594d1910a41f3a41e9c 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  
>  #define CCI_HW_VERSION				0x0
> @@ -121,6 +122,7 @@ struct cci_data {
>  	struct i2c_adapter_quirks quirks;
>  	u16 queue_size[NUM_QUEUES];
>  	struct hw_params params[3];
> +	bool fast_mode_plus_supported;
>  };
>  
>  struct cci {
> @@ -466,9 +468,22 @@ static const struct i2c_algorithm cci_algo = {
>  	.functionality = cci_func,
>  };
>  
> +static unsigned long cci_desired_clk_rate(struct cci *cci)
> +{
> +	if (cci->data->fast_mode_plus_supported)
> +		return 37500000ULL;
> +
> +	return 19200000ULL;

Well this is embarrassing

ULL -> UL

Konrad

