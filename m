Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167ED777BA0
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 17:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbjHJPGi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 11:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235999AbjHJPGh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 11:06:37 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D3226B5;
        Thu, 10 Aug 2023 08:06:37 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37AERwXr018666;
        Thu, 10 Aug 2023 15:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=pz8PxBjSia+Poo9t9vfSuZHBGhA0g6sDShQiTqpbWqE=;
 b=mZ+08+XgwoNO88z0xtxTYHgoz87zeKzAUO+5gANxDgXemGe1AeWMLCoCQjYmtvAbj/81
 jpo/w7QRQv1zRpW8Q9wMsfZ+mm+oedqHjpQxYI0kRKrNyaHqoTOwkycSSu6ElObrmFI/
 d6rP6IQIpAXXheoBZn61G3P6YCaq4NHNJikuBKP12/L/6FIawOkEeI64+YxhqAbHUnDE
 elF6XkPkDLKTOVkLLAKP7mWkuJzL9nDz8pugevLFAzGW+x65axDSobhqJUsa/0SEoboX
 6bE60vwywTwosucRe55YQ9EO4+foYsVjaVlGLBIhAdmSVq1ekKVAq99/jbY3QHvNyn/B mA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scw2uru6d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Aug 2023 15:06:08 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AF677u018009
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Aug 2023 15:06:07 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 10 Aug 2023 08:06:06 -0700
Date:   Thu, 10 Aug 2023 08:06:05 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Liao Chang <liaochang1@huawei.com>
CC:     <andi.shyti@kernel.org>, <florian.fainelli@broadcom.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <yangyicong@hisilicon.com>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <kblaiech@nvidia.com>, <asmaa@nvidia.com>,
        <loic.poulain@linaro.org>, <rfoss@kernel.org>, <ardb@kernel.org>,
        <gcherian@marvell.com>, <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 5/9] i2c: qcom-cci: Use dev_err_probe in probe function
Message-ID: <20230810150605.GM1428172@hu-bjorande-lv.qualcomm.com>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-6-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808012954.1643834-6-liaochang1@huawei.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mAGN44fivB_znceJmiEne6nF9FdIzhdY
X-Proofpoint-ORIG-GUID: mAGN44fivB_znceJmiEne6nF9FdIzhdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_12,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100128
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 08, 2023 at 09:29:50AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 622dc14add9d..cf13abec05f1 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -588,10 +588,8 @@ static int cci_probe(struct platform_device *pdev)
>  	/* Clocks */
>  
>  	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
> -	if (ret < 1) {
> -		dev_err(dev, "failed to get clocks %d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 1)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");

devm_clk_bulk_get_all() will already have printed a more useful/specific
error message. Unfortunately will not be carried as the deferred probe
reason, but this error will just indicate that some clock controller
wasn't ready...

TL;DR I think we should just drop the error print from here instead.

Regards,
Bjorn
