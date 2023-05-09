Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0696FBF2C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbjEIGWQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbjEIGWP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:22:15 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F5759DB
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:22:14 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3495AWGT024206;
        Tue, 9 May 2023 08:21:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Wv2pR/qB32XSuXZHdYPyNr5zgLOj4Lp0mg2Q8uIoLq0=;
 b=0rSxLa9PY0lKY0yQG1idc/ZiNgPEDOIzoFoxFVAxISazztIxV5OXyrAjRBOlnE5Wy3sd
 SPESJ7GRrnWCyEtmdZ2cFlsY9qwQ8P/Qi29A8JWfVWB1Qyak1DIyxzTPldddiR4OOyxn
 Pc9nW4xNemuyYeUCkplEok47Qy/YOakH1nwOoFVMZg1cEJI8HY5+maIHVYK5iHCSV3/P
 bvvREOUETUD9xvy38NVshxeq5J9VCwKBsrLqnL3O0PXgultK1/pQnlifnPGGGvtzr6VV
 alkixoBPYs7/5uDgjKiCXCwuWPaohO7rX2ZIcr+iM6QFov6EO0pWpYGNzqEleumNF7A4 PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf787ae11-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 08:21:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67122100034;
        Tue,  9 May 2023 08:21:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E17E210F79;
        Tue,  9 May 2023 08:21:54 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 08:21:54 +0200
Message-ID: <ef44c484-31ab-2412-623b-2d3086eec66a@foss.st.com>
Date:   Tue, 9 May 2023 08:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 68/89] i2c: st: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <kernel@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-69-u.kleine-koenig@pengutronix.de>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230508205306.1474415-69-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_03,2023-05-05_01,2023-02-09_01
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe

On 5/8/23 22:52, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-st.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index f823913b75a6..25c3521cae0e 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -876,13 +876,11 @@ static int st_i2c_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int st_i2c_remove(struct platform_device *pdev)
> +static void st_i2c_remove(struct platform_device *pdev)
>  {
>  	struct st_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
>  	i2c_del_adapter(&i2c_dev->adap);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id st_i2c_match[] = {
> @@ -899,7 +897,7 @@ static struct platform_driver st_i2c_driver = {
>  		.pm = pm_sleep_ptr(&st_i2c_pm),
>  	},
>  	.probe = st_i2c_probe,
> -	.remove = st_i2c_remove,
> +	.remove_new = st_i2c_remove,
>  };
>  
>  module_platform_driver(st_i2c_driver);

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
