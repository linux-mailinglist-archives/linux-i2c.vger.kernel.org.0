Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB8A5533E1
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 15:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiFUNkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 09:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiFUNkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 09:40:23 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A492AD;
        Tue, 21 Jun 2022 06:40:21 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LDdlIi018286;
        Tue, 21 Jun 2022 15:40:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Apf+7CviifI2y9qxHX4Kx+OwpIulEKFtZSgO3H/Qjrs=;
 b=2FLelbh+BDz/vcA8AwNMPxiFMf36KNmB+QCzMm9wS2kSARnT309KLR9nxLY4RJkdGsrZ
 reWe32l1yJM4waESv+b1/xSlt9lHVIQB1ZNngVWFL74pWfjP+R8rEKvBButhQelDom60
 aJiiy9w3uGYkC1x9juVox5i6D/5XEHVATcPU1MWFJpiW7d5VDYCQNlNT5E+G02mwEcFG
 PoZom/TuY4RY4yybQi+Q5v2B/mp0/IvimuEw0j7Z//uApNQPSHDK2jmQnKd9MB6OhFUl
 n9ssOsZ+7gd+5eb3PGdv5BU6ZOxIyUiB7KVPRBTNR86E/aBZGZpIgAQRrVR32mu5w7hx cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3guau51v7j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 15:40:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB886100034;
        Tue, 21 Jun 2022 15:40:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFF29222CBD;
        Tue, 21 Jun 2022 15:40:01 +0200 (CEST)
Received: from [10.48.0.19] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 15:40:01 +0200
Message-ID: <18c0e9c9-f0c9-7458-8287-e52f63247c16@foss.st.com>
Date:   Tue, 21 Jun 2022 15:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] i2c: stm32: only perform a reset if there is a reset
 property
Content-Language: en-US
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-3-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20220620105405.145959-3-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_06,2022-06-21_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All

Look good to me.

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 6/20/22 12:54, Alain Volmat wrote:
> Allow the driver to properly initialize even if there is no reset
> property given.  In such case reset control is not done and
> initialization proceed.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 6d4aa64b195d..b29d8e476342 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2138,13 +2138,14 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  
>  	rst = devm_reset_control_get(&pdev->dev, NULL);
>  	if (IS_ERR(rst)) {
> -		ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
> -				    "Error: Missing reset ctrl\n");
> -		goto clk_free;
> +		ret = PTR_ERR(rst);
> +		if (ret == -EPROBE_DEFER)
> +			goto clk_free;
> +	} else {
> +		reset_control_assert(rst);
> +		udelay(2);
> +		reset_control_deassert(rst);
>  	}
> -	reset_control_assert(rst);
> -	udelay(2);
> -	reset_control_deassert(rst);
>  
>  	i2c_dev->dev = &pdev->dev;
>  

-- 
--
~ Py MORDRET
--
