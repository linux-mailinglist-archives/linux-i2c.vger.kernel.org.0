Return-Path: <linux-i2c+bounces-10495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C7A94553
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 21:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D083B664A
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 19:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF411D6194;
	Sat, 19 Apr 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UOF4fUt2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7C1C84C7
	for <linux-i2c@vger.kernel.org>; Sat, 19 Apr 2025 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745092005; cv=none; b=k4efb2wLceEq34kcGS/YwJVqWvW1iAg/6jbA4/3PDV6fIPLjkI2lXWHfqa4OV3+X2TCC/HTZ+JCN44kuQMR5Y0kPG7wxScPMf2JMPThm1jFueteD0TOAH+/b+T6ExS0Tx1hbSGnewr7sbq0sZ7gqoqsmR1H1GWaw5+fs6Dtu5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745092005; c=relaxed/simple;
	bh=ARG47UzX1EnDeCFFYyMmWjOuyrYb5XwQRGtUWwD0/dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aK4PqzXz+NvH3W0u8nMBwceSnorgjbxWzG/qqlBd2shDWZTkwYQqg8epVoJB9PnbISSeu0haIvsIDuMy+9nNrUy69J58g+RasVRxVem8cwp7EShmYXsGrzvc6bO5VARqWc/KNlLN2aoSfnZvuDUuDtj8aLvkjb6wB7eSmGr6rs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UOF4fUt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53JBKbWR000469;
	Sat, 19 Apr 2025 19:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OR+5xkr2YL8ocAWcMjH5ygijERPFrW5jFcqnnvtbXs=; b=UOF4fUt2uXa5a8uN
	YmGhi52+5ILQax42J2Cusm0btdNLkVQcHgbrM+QxX4O3lW5/U0mzxbJdfZkSCZZX
	UbHc8kUU7tJtuA+FVCc285/vIgKqdbZLKH5QTfEbHSJVV31YnyYWPbdE4fvwx4Lm
	Yk1GodAxrbRKjnbXsqO1SZVLvgUjtFEW4DSQtSm2QBIf/yrxz6oGykv8L1SAkCGl
	o+4aNscj3M65KHOCZe0A+k2ADU2Ot+w8D58DgEzqSJW5VY4lc8NnHdz5ysHxgi/R
	DMKb3WqmK266vq48WKtiEjUTxfxuatmT207wFsq9Jp7zqSIQQfFCpjEPcnf54VSR
	qNmnrA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426gxej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Apr 2025 19:46:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53JJkdZg023644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Apr 2025 19:46:39 GMT
Received: from [10.216.43.255] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 19 Apr
 2025 12:46:38 -0700
Message-ID: <6d3ac68e-d4de-4ea3-bfee-b4ac43e5ed1d@quicinc.com>
Date: Sun, 20 Apr 2025 01:16:35 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] i2c: iproc: Move function and avoid prototypes
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
 <20250418211635.2666234-9-andi.shyti@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250418211635.2666234-9-andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: w0QjpDvhmV4rd_kh567XXlxBDOyAe_RO
X-Proofpoint-GUID: w0QjpDvhmV4rd_kh567XXlxBDOyAe_RO
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6803fd9f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=q9vyzV-owd-R0bOPvrIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190165



On 4/19/2025 2:46 AM, Andi Shyti wrote:
> Shuffle a bit the code in order to avoid prototypes.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>   drivers/i2c/busses/i2c-bcm-iproc.c | 143 ++++++++++++++---------------
>   1 file changed, 69 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index d25b393f456b..74903edb4925 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -224,11 +224,6 @@ static void slave_rx_tasklet_fn(unsigned long);
[...]
> +static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
> +{
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
> +
> +	if (iproc_i2c->slave)
> +		return -EBUSY;
> +
> +	if (slave->flags & I2C_CLIENT_TEN)
> +		return -EAFNOSUPPORT;
> +
> +	iproc_i2c->slave = slave;
> +
> +	tasklet_init(&iproc_i2c->slave_rx_tasklet, slave_rx_tasklet_fn,
> +		     (unsigned long)iproc_i2c);
> +
> +	bcm_iproc_i2c_slave_init(iproc_i2c, false);
one line gap/space before return.
> +	return 0;
> +}
> +
> +static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
> +{
> +	u32 tmp;
> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
Reverse xmas tree alignment during decalarations please ?
> +
> +	if (!iproc_i2c->slave)
> +		return -EINVAL;
> +
[...]

