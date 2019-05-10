Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74931994C
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2019 10:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfEJIJ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 May 2019 04:09:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:40572 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726936AbfEJIJ6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 May 2019 04:09:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D06A6AF1F;
        Fri, 10 May 2019 08:09:56 +0000 (UTC)
Date:   Fri, 10 May 2019 10:09:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH 3/3] i2c: i801: avoid panic if ioreamp fails
Message-ID: <20190510100955.497a1a57@endymion>
In-Reply-To: <20190510030320.109154-3-wangkefeng.wang@huawei.com>
References: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
        <20190510030320.109154-3-wangkefeng.wang@huawei.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Kefeng,

On Fri, 10 May 2019 11:03:20 +0800, Kefeng Wang wrote:
> If ioremap fails, NULL pointer dereference will happen and
> leading to a kernel panic when access the virtual address
> in check_signature().
> 
> Fix it by check the return value of ioremap.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-i2c@vger.kernel.org
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 679c6c41f64b..fc6ccb8aba17 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1068,7 +1068,10 @@ static void __init input_apanel_init(void)
>  	void __iomem *bios;
>  	const void __iomem *p;
>  
> -	bios = ioremap(0xF0000, 0x10000); /* Can't fail */
> +	bios = ioremap(0xF0000, 0x10000);
> +	if (!base)

That would be "if (!bios)". Please don't send patches without at least
test-building the result.

We don't need this anyway. The comment says it can't fail, so why
bother checking for a condition which will never happen?

> +		return -ENOMEM;
> +
>  	p = bios_signature(bios);
>  	if (p) {
>  		/* just use the first address */


-- 
Jean Delvare
SUSE L3 Support
