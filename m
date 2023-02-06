Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B74F68C593
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 19:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjBFSRw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 13:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjBFSRu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 13:17:50 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50E922A37;
        Mon,  6 Feb 2023 10:17:44 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316Dw1Mr003538;
        Mon, 6 Feb 2023 18:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dJJ13g6rj+xIrq0T3eUEIbV10GxuSSR5Gcak2Juy/lM=;
 b=XtQxUCLz6Y3AyjDUMsjJ1ieYJ2KdSaDxIulaEFH/QGB/1BDDVbTGFvu+MyFGgXqd3317
 +xNLSS1PvD+e09Y3jKpiWxOmkvCb2Ev0IECUyt+BlHOPjOvQzPUHzfsT+ZQwf5VkLpX7
 iEorYsQCNOeZAbupmHVEdJTDI/rI5+0fVjqGhvh7vx79GJALjqK0xOzYwswhQc3/w/4s
 JnWDniGmAmD1y0DCOC2kSGQDSPVVTYyLaDy95RraLHg2bWHDxpqbxB/rTPDywqM130Re
 /tPne3FMszTdgHZrnqA5toXJQSeZXdYB86jKm+fypK3AqDmv0az5REO2E2TqfeAS0i/E Sw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nheb0vdak-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Feb 2023 18:17:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316IHdfF011629
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Feb 2023 18:17:39 GMT
Received: from [10.134.67.48] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 10:17:39 -0800
Message-ID: <298c709e-5873-7aa8-3c00-b1a0ddc5c436@quicinc.com>
Date:   Mon, 6 Feb 2023 10:17:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] soc: qcom: geni-se: Move qcom-geni-se.h to
 linux/soc/qcom/geni-se.h
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC:     Visweswara Tanuku <quic_vtanuku@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-serial@vger.kernel.org>
References: <20230203210133.3552796-1-quic_eberman@quicinc.com>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <20230203210133.3552796-1-quic_eberman@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UDYBliO-YNogq6ZqeomTMFdH1cyj3V5s
X-Proofpoint-GUID: UDYBliO-YNogq6ZqeomTMFdH1cyj3V5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060158
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/3/2023 1:01 PM, Elliot Berman wrote:
> Move include/linux/qcom-geni-se.h to include/linux/soc/qcom/geni-se.h.
> This removes 1 of a few remaining Qualcomm-specific headers into a more
> approciate subdirectory under include/.

Need to s/approciate/appropriate/ (Thanks Mukesh!)

> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c                   | 2 +-
>   drivers/soc/qcom/qcom-geni-se.c                      | 2 +-
>   drivers/spi/spi-geni-qcom.c                          | 2 +-
>   drivers/tty/serial/qcom_geni_serial.c                | 2 +-
>   include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} | 0
>   5 files changed, 4 insertions(+), 4 deletions(-)
>   rename include/linux/{qcom-geni-se.h => soc/qcom/geni-se.h} (100%)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index fd70794bfcee..80d586b0be7a 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -14,7 +14,7 @@
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> -#include <linux/qcom-geni-se.h>
> +#include <linux/soc/qcom/geni-se.h>
>   #include <linux/spinlock.h>
>   
>   #define SE_I2C_TX_TRANS_LEN		0x26c
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index f0475b93ca73..795a2e1d59b3 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -14,7 +14,7 @@
>   #include <linux/of_platform.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> -#include <linux/qcom-geni-se.h>
> +#include <linux/soc/qcom/geni-se.h>
>   
>   /**
>    * DOC: Overview
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 4e83cc5b445d..e05e40a49294 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -12,7 +12,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_opp.h>
>   #include <linux/pm_runtime.h>
> -#include <linux/qcom-geni-se.h>
> +#include <linux/soc/qcom/geni-se.h>
>   #include <linux/spi/spi.h>
>   #include <linux/spinlock.h>
>   
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index b487823f0e61..52f3a0184577 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -16,7 +16,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_wakeirq.h>
> -#include <linux/qcom-geni-se.h>
> +#include <linux/soc/qcom/geni-se.h>
>   #include <linux/serial.h>
>   #include <linux/serial_core.h>
>   #include <linux/slab.h>
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/soc/qcom/geni-se.h
> similarity index 100%
> rename from include/linux/qcom-geni-se.h
> rename to include/linux/soc/qcom/geni-se.h
> 
> base-commit: 3866989ec2c319341e2cf69ec6116269b634a271
