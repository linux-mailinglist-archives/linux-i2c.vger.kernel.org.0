Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1EA3BC2FF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 21:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhGETKO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 15:10:14 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:49690 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhGETKN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 15:10:13 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru E415720D4741
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 2/3] i2c: pca-platform: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>
References: <f50837d5-9eb0-61c1-6d3a-5f7d1e17b9ae@omp.ru>
 <67f7fcd8-797f-b943-02f7-38a0685e96f9@omp.ru>
Organization: Open Mobile Platform
Message-ID: <d5972dcc-ee2b-b7b2-a1f8-21388f724e50@omp.ru>
Date:   Mon, 5 Jul 2021 22:07:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <67f7fcd8-797f-b943-02f7-38a0685e96f9@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

On 6/24/21 11:23 PM, Sergey Shtylyov wrote:

> The driver's probe() method chooses the polling mode if an IRQ # returned
> by platform_get_irq_optional() is 0 or  less.  We'll have to filter out
> -EPROBE_DEFER earlier for the deferred probing to work...
> 
> Fixes: 0e8ce93bdceb ("i2c: pca-platform: add devicetree awareness")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> Changed in version 2:
> - new patch.
> 
>  drivers/i2c/busses/i2c-pca-platform.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: linux/drivers/i2c/busses/i2c-pca-platform.c
> ===================================================================
> --- linux.orig/drivers/i2c/busses/i2c-pca-platform.c
> +++ linux/drivers/i2c/busses/i2c-pca-platform.c
> @@ -139,6 +139,8 @@ static int i2c_pca_pf_probe(struct platf
>  	int irq;
>  
>  	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq == -EPROBE_DEFER)
> +		return irq;

   Perhaps we should just use the polling mode? Or is this change still helpful?

>  	/* If irq is 0, we do polling. */
>  	if (irq < 0)
>  		irq = 0;
> 

MBR, Sergei
