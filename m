Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1E176C91F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 11:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbjHBJON (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 05:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjHBJOM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 05:14:12 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDFEFE
        for <linux-i2c@vger.kernel.org>; Wed,  2 Aug 2023 02:14:11 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3728S4iq015448;
        Wed, 2 Aug 2023 11:13:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=UktlgZBqEUso5HQ/4lJ3W
        OPb8ljEy4QVZS8fnvcd8hs=; b=izp/JrqrZsW5iI3RsteGEhZJ2JQJ1cIzIr+4G
        ruWZUS3w5gKA8G+0ae1Gyrp5kpANNnVluTPlEX6rJogkN1GSGwdp4CkGrmhCeT0Y
        42csRnib8iN76pU0CxGE4RaVTfk6R03Hil30WpQo14Xg04GI6FvkCP0LqFctxzKF
        Kg5phZ4DUt9RzIsi3lGJSBxIqlOYINVxmYPeAve+GkMy9WklZziFqwvCnpS90t3a
        2iX92TDGU+SOPXAmHKzarFdeDU9JV7DUmQNcW3Ixrl2AMjxrZUB0W7KZ94CMqG7z
        dyixCtm7f1jWA9WoFBsYB82C6hFyB5otnwRx5DjHNJHjbweHQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s7g7nsq4n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 11:13:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3A2B100085;
        Wed,  2 Aug 2023 11:13:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A83FA237D70;
        Wed,  2 Aug 2023 11:13:38 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 2 Aug
 2023 11:13:38 +0200
Date:   Wed, 2 Aug 2023 11:13:30 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
CC:     <pierre-yves.mordret@foss.st.com>, <andi.shyti@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH -next] i2c: stm32: fix the return value handle for
 platform_get_irq()
Message-ID: <20230802091330.GA2156918@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Ruan Jinjie <ruanjinjie@huawei.com>,
        pierre-yves.mordret@foss.st.com, andi.shyti@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230731112755.1943630-1-ruanjinjie@huawei.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_04,2023-08-01_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ruan,

thanks for your patch.

On Mon, Jul 31, 2023 at 07:27:55PM +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e897d9101434..579b30581725 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2121,12 +2121,12 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	phy_addr = (dma_addr_t)res->start;
>  
>  	irq_event = platform_get_irq(pdev, 0);
> -	if (irq_event <= 0)
> -		return irq_event ? : -ENOENT;
> +	if (irq_event < 0)
> +		return irq_event;
>  
>  	irq_error = platform_get_irq(pdev, 1);
> -	if (irq_error <= 0)
> -		return irq_error ? : -ENOENT;
> +	if (irq_error < 0)
> +		return irq_error;
>  
>  	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
>  						    "wakeup-source");
Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards
Alain
> -- 
> 2.34.1
> 
