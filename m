Return-Path: <linux-i2c+bounces-10058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFF5A7491C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 12:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C57FF17C0CE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 11:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94829213E67;
	Fri, 28 Mar 2025 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P8KhpqBV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB4A1C3BE2;
	Fri, 28 Mar 2025 11:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160813; cv=none; b=acBLeVL1rn+4ZuN6WnTB4dPNwfQxJZpcPNKhJBOjCryr9Q6zX11YoQCdEw9bQqGZQBKUxf1atzmzjQHXMkk4ys+5glbtXmEyMUMWDTTddX3xfhJEdbmyUC5l7FY4ezoLnxXOb5tCFkpRyb+KCjXtpIttEF8EiCQzcBnrt5LIKwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160813; c=relaxed/simple;
	bh=0ZPSp3btIrmhUTN6L0ttOPzcih+9F47B2CwBcEZlaW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nsm27Jkore7AfvvP9VgyBMq40xl6kSNkrmTSYK/SV2RHjTxMmuIoYoEXrNd1/xcVsfLKcJA35nZLofHFGASGG9ZIDRrDuSOctWeE/QV+A82hOtSuYGkHEY3MZZyvgKEtUKWiuOJFZILyq2ULtZ3Bai6qwpv7oWCaC7M1g0FY4Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P8KhpqBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S56siu021236;
	Fri, 28 Mar 2025 11:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GO7N2+DbqSmQmIQly8bmUa7Rwhx/tS+87oapSWjvioo=; b=P8KhpqBVEMWC10tF
	z44j66u15c12eHHroXps2MREQpOE+cFoQha9Rcd9HtgFtq6WRwTBEJcz93cPLa9R
	LVm8Y0scQiGB7rVN0u9E6WeOIGusRY6nu/8Uz1j9eZjmUxnH+JhmKzclKfAH6P5/
	SNuZDE1Y9HdxKqeViI3gvmwkC5HdfG3qpRX/tbhJNZRKhr9zlRyQp+2MtLzTyW70
	7IVZNhWFFCcbPj83M5uuIwxigsmLoWwm8BgCsC3RRsU+ZSzIPa7x3H6biL58i42P
	BtSw9YynMjr4Acm4JZ15BTbQRRsLQQFZiYVg3qrlslWVnjud0CS01eEt/aYbIV9S
	I5paYg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9sp5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:20:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SBK5Fg026904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:20:05 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 04:20:02 -0700
Message-ID: <547a51bf-a3ad-48ed-9797-65d28c63e852@quicinc.com>
Date: Fri, 28 Mar 2025 16:49:59 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: npcm: Add clock toggle recovery
To: <mohammed.0.elbadry@gmail.com>, <avifishman70@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andi.shyti@kernel.org>, <venture@google.com>
CC: Tali Perry <tali.perry1@gmail.com>
References: <20250324205901.1274708-2-mohammed.0.elbadry@gmail.com>
 <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W_uzPud8X8nKkpskZRvytLgMwsitWorX
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e685e6 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=OQBl7lQLBQ5js10xF0oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: W_uzPud8X8nKkpskZRvytLgMwsitWorX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=894 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280077



On 3/28/2025 1:08 AM, mohammed.0.elbadry@gmail.com wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to recover them first before failing.
> Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> ---
>   drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2fe68615942e..f05cae20cb27 100644
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
> +		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
> +				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
> +		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
You are here post trying recovery. In the log below you may want to add, 
"Post recovery" ? instead of "init fail" ? Just a suggestion.
> +			dev_err(bus->dev, "I2C%d init fail: lines are low, SDA=%d SCL=%d\n",
> +				bus->num, npcm_i2c_get_SDA(&bus->adap),
Thanks for making previous change. Now "lines are low" not relevant as 
you just need to print status 1 or 0.
> +				npcm_i2c_get_SCL(&bus->adap));
> +			return -ENXIO;
> +		}
>   	}
>   
>   	npcm_i2c_int_enable(bus, true);


