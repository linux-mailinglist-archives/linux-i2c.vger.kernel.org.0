Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C2D6FC05B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 09:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjEIHYi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 03:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjEIHYh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 03:24:37 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94105173C
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 00:24:35 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3495mG7d029670;
        Tue, 9 May 2023 09:24:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=selector1;
 bh=2p4B4VsX8mwlIJ0lOLM/WNkj+IlVckkXoyqXM1FAEX8=;
 b=oHptbxkDEgro/cDRgDNPGEOYjyJxHmXJW30D962A47M1Z+d4YtS9/lvuYccm9h1UENlY
 Tc/7GtexCWXWaaMSyjcL0N3uZucwrwSYfWUHYSzIz320dOBI0wQVDGVXBNdMA1TqslI8
 QRXKKwPHpKcm04whzM3pqN71JcFGdNTtrbJybkdyytsKyf65kmSDMGMWyK6pUns1IZ01
 XUGXZDqU98goYWCRaZ4KPpK4eE/My3zuUHHYU58mEmcs8duB4R/EsoNCNWxr9QR5E2o6
 fgJhxgtKJte9IvEoexMyjSU41U6fU7NoLLtmpRLO3nCogUGjrgSDK11f6GfycG321OW7 oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf790jumv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 09:24:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FB5710002A;
        Tue,  9 May 2023 09:24:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 267B321231E;
        Tue,  9 May 2023 09:24:20 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 09:24:19 +0200
Date:   Tue, 9 May 2023 09:24:18 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 69/89] i2c: stm32f4: Convert to platform remove callback
 returning void
Message-ID: <20230509072418.GB1593946@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-70-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230508205306.1474415-70-u.kleine-koenig@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_04,2023-05-05_01,2023-02-09_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Mon, May 08, 2023 at 10:52:46PM +0200, Uwe Kleine-König wrote:
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
>  drivers/i2c/busses/i2c-stm32f4.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index eebce7ecef25..6ad06a5a22b4 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -861,15 +861,13 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int stm32f4_i2c_remove(struct platform_device *pdev)
> +static void stm32f4_i2c_remove(struct platform_device *pdev)
>  {
>  	struct stm32f4_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
>  	i2c_del_adapter(&i2c_dev->adap);
>  
>  	clk_unprepare(i2c_dev->clk);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id stm32f4_i2c_match[] = {
> @@ -884,7 +882,7 @@ static struct platform_driver stm32f4_i2c_driver = {
>  		.of_match_table = stm32f4_i2c_match,
>  	},
>  	.probe = stm32f4_i2c_probe,
> -	.remove = stm32f4_i2c_remove,
> +	.remove_new = stm32f4_i2c_remove,
>  };
>  
>  module_platform_driver(stm32f4_i2c_driver);
> -- 
> 2.39.2
> 
