Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D8E2EC0D3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jan 2021 17:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbhAFQD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jan 2021 11:03:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:38326 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbhAFQD6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Jan 2021 11:03:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 75ECBAD89;
        Wed,  6 Jan 2021 16:03:16 +0000 (UTC)
Date:   Wed, 6 Jan 2021 17:03:15 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 2/3] i2c: i801: Drop duplicate NULL check in
 i801_del_mux()
Message-ID: <20210106170315.7cd1bdac@endymion>
In-Reply-To: <20201228200618.58716-2-andriy.shevchenko@linux.intel.com>
References: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
        <20201228200618.58716-2-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 28 Dec 2020 22:06:17 +0200, Andy Shevchenko wrote:
> Since gpiod_remove_lookup_table() is NULL-aware, no need to have this check
> in the caller. Drop duplicate NULL check.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ae90713443fa..7c2569a18f8c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1487,8 +1487,7 @@ static void i801_del_mux(struct i801_priv *priv)
>  {
>  	if (priv->mux_pdev)
>  		platform_device_unregister(priv->mux_pdev);
> -	if (priv->lookup)
> -		gpiod_remove_lookup_table(priv->lookup);
> +	gpiod_remove_lookup_table(priv->lookup);
>  }
>  
>  static unsigned int i801_get_adapter_class(struct i801_priv *priv)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
