Return-Path: <linux-i2c+bounces-2318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F30877A6F
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 05:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7DDAB20A68
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 04:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7731C8825;
	Mon, 11 Mar 2024 04:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d2A0y2Rc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D0881F
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 04:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710132399; cv=none; b=XS8Kub0CiGhRrwwP3KfYI/CUrn0LykKFPPf5IwNCMbWB1WdKKJ6WvEr84clBexvLfbKxPgnN0SpiUUE/pybQjfDQwIiwM0YMgQCU4Qrl8R9p0pTBYnICriESG5hG70iIUPaoMIkAQsDXEDuNh8zBdA2D9bSH+eA4n9u7vMdenVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710132399; c=relaxed/simple;
	bh=ktUg84T2rB9rKizfVqETZROQkalYr5kpgbS/qvhJDs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ot73rGQcLgYqYs3gDu2YkzSOetAwKJj5rqHXHIIDexZPX//aD8Evu+7h61O+pKKpw99cx8TJGMoePj2OGLY1guC6dCQsYhd4o2rLT6S/fFurnFJHrZQYpJVT1fzncpHwWfTbK3CHS7I7FLXfsTZW5hwloppBvsmdB//laN3yd+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d2A0y2Rc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B4PN7H006357;
	Mon, 11 Mar 2024 04:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=X8wA6q0/2ydJsWB644beuJ1eWaI0zZhj0v5zIX7yj+w=; b=d2
	A0y2RcuwuM+UriJjuNKKpgAXUPjyODPO1x5WpvmD64ho7HDF90oUQ44Tm8z3XB8K
	30+SmVN/ftiChA8+mvabYpMwBrBASlr/WYqcl3Jn2dMll6vgn6mYxnuYdDQrFfFY
	jmYCLJoQOiyNOSC+1HiMhCouLboQrFDSBpj0PSxyeiZm+0rPUU063svfnBjCxGrV
	3Yd6eNGQiRTtokx0TzWdWmdR1bfj+0nN2xiiaz+LprRfq6FnD0xjo1OmQAgWznMO
	XLRee6rRMPwF63mSFMOZVgRBw+O8Q2vggpvQpdNA7MZXDVMvbN1dEA7PNlmIb8Yc
	grBct4gldIW+RHthaj2w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wrfuxtp5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 04:46:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42B4kWBu013642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 04:46:32 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 10 Mar
 2024 21:46:30 -0700
Message-ID: <97503419-f6a9-4939-89ee-195ce21b5d1e@quicinc.com>
Date: Mon, 11 Mar 2024 10:16:27 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: viai2c: Fix bug for msg->len is 0
Content-Language: en-US
To: Hans Hu <hanshu-oc@zhaoxin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>
CC: <hanshu@zhaoxin.com>
References: <20240311032600.56244-1-hanshu-oc@zhaoxin.com>
 <20240311032600.56244-2-hanshu-oc@zhaoxin.com>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20240311032600.56244-2-hanshu-oc@zhaoxin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sOP3LrEbjn9u0MCziLNC8nn3m66RgCRM
X-Proofpoint-GUID: sOP3LrEbjn9u0MCziLNC8nn3m66RgCRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_01,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110033



On 3/11/2024 8:56 AM, Hans Hu wrote:
> This is a bug that was accidentally introduced when
> adjusting the wmt driver. Now fix it
> 

what exactly is the bug which you are fixing here ?

> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> ---
>   drivers/i2c/busses/i2c-viai2c-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
> index 4c208b3a509e..894d24c6b4d3 100644
> --- a/drivers/i2c/busses/i2c-viai2c-common.c
> +++ b/drivers/i2c/busses/i2c-viai2c-common.c
> @@ -145,7 +145,7 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
>   		if (msg->len == 0) {
>   			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE;
>   			writew(val, base + VIAI2C_REG_CR);
> -			return 0;
> +			return 1;
Question: Do you really need to do anything when no data is there to 
transfer ? I am not sure what's the strategy adopted here.
>   		}
>   
>   		if ((i2c->xfered_len + 1) == msg->len) {

