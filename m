Return-Path: <linux-i2c+bounces-10341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0FEA89CCE
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 13:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C49D18867AE
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 11:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDC5290BC6;
	Tue, 15 Apr 2025 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D8L00DBx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB127586B;
	Tue, 15 Apr 2025 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717733; cv=none; b=q1enRmqj/CMYNn0Bx+5CU/2Z8EjUW+R5EG9nJIsetw/IZes04vVK3S4kBk0DuhUm1Er49jUCZv7IXF4Cwp4kn3kK4SwulzI4ct5CWJ+/tKdnAc7olnUoxzNC7H4vojDZfQgalVk5ickOPvRPmR3gcMNZJiacinqPK4vFuYdvAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717733; c=relaxed/simple;
	bh=uxPhOzxY14pVCHZGfJbw2h3p6ZWpthGrzWp7eAolL2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eDTwEBI9V1l609jMOsBrQNCl/73FQdsAniZk/Ft3bzKOaoyUh9aTcAgqmiTITbM0dW1QJowK9iJ0q1S+CC0fattXSBPMpn1pOZTgd1Bz4PhbdRxvQEI/YOhXZ8w3iG8AcYLSNTlKHxCS/vgp0G2wSWzf4R9VxLwp8y65eNPm728=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D8L00DBx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tNPc002462;
	Tue, 15 Apr 2025 11:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPx0blElfQsDzlplnsNASavPopVyU/xxzlA7I369vRc=; b=D8L00DBxD6XIws3E
	pKwaBK34gh6NnOaJB2Ghd6AX3puoBBsVFJV09h4ayjUjTsR8IVKZ5XiCQIR/u0jD
	FLFIGq8YbO7EjKbTUlFWpc/UzciygLVSMHaYHg66K7fEjqk83YqCsuxIPnxewb17
	Jmcfo84ZDdJtbM1uhLja2++55Xwgk09PyV1VKwhzOtz9BX5mDrcmv184Y3F+6iz+
	J5i3XvEJLS8ngu4nR80+B9p+B0+2qV/WgSPAnsRgKRhdzht9PmceOZ0v+t6K9i+i
	WO+OQR4y4rKhsGfJzPt8MxAmloLbVbTjetVq6Ar1/WE+tqQU5Sa9HpEMGcrcwwtC
	9S9qpQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjyrvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 11:48:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FBmP4p025518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 11:48:25 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 04:48:21 -0700
Message-ID: <3204f619-61a5-41b9-b9a5-c72397b21d11@quicinc.com>
Date: Tue, 15 Apr 2025 17:18:18 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
To: Johan Hovold <johan+linaro@kernel.org>, Vignesh R <vigneshr@ti.com>,
        Andi
 Shyti <andi.shyti@kernel.org>
CC: Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade
	<andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>,
        Roger Quadros
	<rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Janusz Krzysztofik
	<jmkrzyszt@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jayesh Choudhary
	<j-choudhary@ti.com>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250415075230.16235-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe4789 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=CDmJc5vrhkyB_-nfjVoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PnkJCtQy-JYDDiG_fx88-OnPln3Z4BRm
X-Proofpoint-ORIG-GUID: PnkJCtQy-JYDDiG_fx88-OnPln3Z4BRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150083



On 4/15/2025 1:22 PM, Johan Hovold wrote:
> Using of_property_read_bool() for non-boolean properties is deprecated
> and results in a warning during runtime since commit c141ecc3cecd ("of:
> Warn when of_property_read_bool() is used on non-boolean properties").
> 
> Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
> Cc: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/i2c/busses/i2c-omap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 16afb9ca19bb..876791d20ed5 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1454,7 +1454,7 @@ omap_i2c_probe(struct platform_device *pdev)
>   				       (1000 * omap->speed / 8);
>   	}
>   
> -	if (of_property_read_bool(node, "mux-states")) {
> +	if (of_property_present(node, "mux-states")) {
>   		struct mux_state *mux_state;
>   
>   		mux_state = devm_mux_state_get(&pdev->dev, NULL);
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

