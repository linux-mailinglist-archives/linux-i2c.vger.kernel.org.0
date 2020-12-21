Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557DA2DFD4C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Dec 2020 16:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgLUPNA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 10:13:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:47798 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgLUPNA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Dec 2020 10:13:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5A327B732;
        Mon, 21 Dec 2020 15:12:19 +0000 (UTC)
Date:   Mon, 21 Dec 2020 16:12:17 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Fix the i2c-mux gpiod_lookup_table not being
 properly terminated
Message-ID: <20201221161217.1423fd16@endymion>
In-Reply-To: <20201221134225.106728-1-hdegoede@redhat.com>
References: <20201221134225.106728-1-hdegoede@redhat.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Mon, 21 Dec 2020 14:42:25 +0100, Hans de Goede wrote:
> gpiod_add_lookup_table() expects the gpiod_lookup_table->table passed to
> it to be terminated with a zero-ed out entry.
> 
> So we need to allocate one more entry then we will use.
> 
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ae90713443fa..877fe3733a42 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1449,7 +1449,7 @@ static int i801_add_mux(struct i801_priv *priv)
>  
>  	/* Register GPIO descriptor lookup table */
>  	lookup = devm_kzalloc(dev,
> -			      struct_size(lookup, table, mux_config->n_gpios),
> +			      struct_size(lookup, table, mux_config->n_gpios + 1),
>  			      GFP_KERNEL);
>  	if (!lookup)
>  		return -ENOMEM;

Good catch.

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
