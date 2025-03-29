Return-Path: <linux-i2c+bounces-10065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC99A75562
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 10:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6379A16DD51
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 09:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F10618A6AE;
	Sat, 29 Mar 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ouvRbnBK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A013C0C;
	Sat, 29 Mar 2025 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743239772; cv=none; b=O+b/U2hgxJDS3/9EXRd190/FEXFzpfjef+gCI3pXOtABrf2JKEVCy68DlN+J1cmiswtLKLlv5AI9tIyDAeSuThEjlCPrN4OlZ44mYdrCYUor/sAAqcYYorMaBjJik2rdoQ1wxy9tCHM9vhzwrnMxwAFzQYYVj5EjDCOMTL8Zm6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743239772; c=relaxed/simple;
	bh=QUXkIaog4eeiNtGeVu2ZSxK9kZQgwHPHGcj4zcluliY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=habWx425l6vUdi0I9RgFRKHVqzueCjVQueE+RdRDUcLEXUNG2lI0yQ14KAE8RH86+bynbR/t7viCUUz7NYQ4XeQ78Ff0FYzHqBZBi9a/SVLEjjP3gy0Swc2J9+4UXKkF/t90kBFQh471h6rp0Hy7YJHxs6d3e1IbAH73XMXDZLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ouvRbnBK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7jw1u005966;
	Sat, 29 Mar 2025 09:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZctcELcPbgMeBUILORibRhO1veAYoqsegMxTqB8eDys=; b=ouvRbnBK4ZUEElK3
	MlAD7AqG5EZTqa75fF0DvbDWjXVgk2bb1feBrNmmoeJ4SkFcESnl5Brrq/rPgAnK
	F9jPj7MPVN2O7ow/IvJiZxLoRGTogG4ghB3Ib3qlDNt/p7yVVOE33vtLlIrJVKlC
	PlCc4SuQV1SU7odfghoFUpr5pWR0XZZuO156ahumVVmZNCck4fbOih1o8RRUGdXo
	IENYQ0v1Dn+47DWIVOFD78Rqkzyi7Guy2e8A9LuDD5EB0ASe6v4uMTmX1Jg3pr+b
	eW69ZxYbnfRZRdSwbDjM/P0A+tPhG9g8vz04hOAZZrYRc3jbjuvdYu0NB35iYPUe
	3GdZVQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935rdew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:16:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52T9FiKa031640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:15:44 GMT
Received: from [10.216.2.59] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 29 Mar
 2025 02:15:41 -0700
Message-ID: <e09c0d10-60f3-480b-a3f9-654ee2f14978@quicinc.com>
Date: Sat, 29 Mar 2025 14:45:38 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
To: <mohammed.0.elbadry@gmail.com>
CC: Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Andi
 Shyti <andi.shyti@kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
 <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QJ1FZTKbAJbJEPaabUI_orjrK2185UbJ
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e7ba51 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=XycGwPUB66WHHuA_nGUA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QJ1FZTKbAJbJEPaabUI_orjrK2185UbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290065

Looks good to me.

On 3/29/2025 1:02 AM, mohammed.0.elbadry@gmail.com wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to recover them first before failing.
> Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2fe68615942e..caf9aa1e6319 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
>   
>   	/* Check HW is OK: SDA and SCL should be high at this point. */
>   	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
> -		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
> -		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
> -			npcm_i2c_get_SCL(&bus->adap));
> -		return -ENXIO;
> +		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
> +				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
> +		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> +			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
> +				bus->num, npcm_i2c_get_SDA(&bus->adap),
> +				npcm_i2c_get_SCL(&bus->adap));
> +			return -ENXIO;
> +		}
>   	}
>   
>   	npcm_i2c_int_enable(bus, true);


