Return-Path: <linux-i2c+bounces-6601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C382D97602C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 06:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B9651F2407C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 04:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E4517C9B3;
	Thu, 12 Sep 2024 04:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JnLB2a6q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB105BAF0;
	Thu, 12 Sep 2024 04:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116812; cv=none; b=MDcCB7IQBlcbxac+GY+pnT/d4/fNbwXhBmQrNvCaDoJ2Qd+ZDzv5bWATr2puG6xjCttgOXbmKnzg9tzVJbYiVUdUUuUO1dnnRGM+Y2zKtxvswsrTRB5MhPqzwquyyI0wH251mjb17qoDv1G64x5a1B6QLpwHLe4dmyf7V+8h59E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116812; c=relaxed/simple;
	bh=Axuziv3RzQm1VaF9u9EyEYNRi/zJsHyXJ0vz+Qm2ZWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lpDjAZf1ybiByOiMevxItCKC56bWiYZRiDBnQJQndkjbVdapN7mCZnNZKhqhJMq5Xg00hC1s4VGr13kcqxo6hMo5YC5Aw/CaO3g6O6WZebCcSd3nNnk6+N+rU9/MFO9Zxp3ahBwi3ySZEMrRIcev0lH9ccYZRS2bc5/fqnlFDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JnLB2a6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2L9wc025835;
	Thu, 12 Sep 2024 04:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miJR6kfm3MDD7M15XdBwIa3oOuR3QExzTAMeNwCbunY=; b=JnLB2a6qtRwyfNQE
	+QkLF+6h4sAIPsI+jccIWNb2De1KdvLi7jmr66hDVerrKkhhBHX2ELpesWZn5bzn
	ATDV/A7M2oXoV6HNk6C56Ro0ec3fBUiUK2eYAP/Te52ejpQEYB6XiPQXMp4JhHBL
	kfxIvYNZRtZU+EOEQwx7UTkf0PsGWaQcNxv/3gJQlkQjCPt+bfcfwsIYxJ7rV9pO
	tLpPawzmHzameNymSZXItTGHx0Fw+3EjPLTTjAgu1QEajTCCb9UhKdyZ6xv+pGZ8
	2ViRo05Cxvztx8icIL7x04trm7YQVKouRkAZzmWg6RWORLAWR9q8f6OhcOckMmu6
	ZrGMEQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6ebty6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 04:51:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C4phAK022734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 04:51:43 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Sep
 2024 21:51:40 -0700
Message-ID: <00d54f08-d2f8-47e0-8561-cae53d1ef330@quicinc.com>
Date: Thu, 12 Sep 2024 10:21:38 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
To: Jinjie Ruan <ruanjinjie@huawei.com>, <andi.shyti@kernel.org>,
        <swboyd@chromium.org>, <wsa@kernel.org>, <sdharia@codeaurora.org>,
        <girishm@codeaurora.org>, <dianders@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20240912033459.3013904-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20240912033459.3013904-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SrMJ6V9mOKPr6VKJl3J_ssVn8gVo5m58
X-Proofpoint-ORIG-GUID: SrMJ6V9mOKPr6VKJl3J_ssVn8gVo5m58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=755 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409120034

Looks good to me.

On 9/12/2024 9:04 AM, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 06e836e3e877..4c9050a4d58e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -818,15 +818,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	init_completion(&gi2c->done);
>   	spin_lock_init(&gi2c->lock);
>   	platform_set_drvdata(pdev, gi2c);
> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>   			       dev_name(dev), gi2c);
>   	if (ret) {
>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>   			gi2c->irq, ret);
>   		return ret;
>   	}
> -	/* Disable the interrupt so that the system can enter low-power mode */
> -	disable_irq(gi2c->irq);
>   	i2c_set_adapdata(&gi2c->adap, gi2c);
>   	gi2c->adap.dev.parent = dev;
>   	gi2c->adap.dev.of_node = dev->of_node;

