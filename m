Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF46960F10
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 07:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfGFFTI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Jul 2019 01:19:08 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:48334 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbfGFFTI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 6 Jul 2019 01:19:08 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 89B92A0142;
        Sat,  6 Jul 2019 07:19:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id M3-2ntrIuL15; Sat,  6 Jul 2019 07:18:58 +0200 (CEST)
Subject: Re: [PATCH -next] i2c: mt7621: Fix platform_no_drv_owner.cocci
 warnings
To:     YueHaibing <yuehaibing@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20190629024421.177153-1-yuehaibing@huawei.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <4fc5562f-c760-6f0d-46c6-c750ad70151e@denx.de>
Date:   Sat, 6 Jul 2019 07:18:56 +0200
MIME-Version: 1.0
In-Reply-To: <20190629024421.177153-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29.06.19 04:44, YueHaibing wrote:
> Remove .owner field if calls are used which set it automatically
> Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 2a1cb414766d..62df8379bc89 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -343,7 +343,6 @@ static struct platform_driver mtk_i2c_driver = {
>   	.probe		= mtk_i2c_probe,
>   	.remove		= mtk_i2c_remove,
>   	.driver		= {
> -		.owner	= THIS_MODULE,
>   		.name	= "i2c-mt7621",
>   		.of_match_table = i2c_mtk_dt_ids,
>   	},

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
