Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730953D0A9B
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jul 2021 10:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhGUHsA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jul 2021 03:48:00 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38450 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234630AbhGUHlX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jul 2021 03:41:23 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4671F1FE7C;
        Wed, 21 Jul 2021 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626855711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tcl5cDaIqMqE73ZOqGYcVvyHb9eNkCSZ2iF/c1CRjCM=;
        b=anyXctr5WzEJX8ZuGNc4atC6Qe2T/8PH78c7Pq5ensllQyfOBRG/dqGX7l4XR5VREILJTq
        PCUTYgQp/ahe4N64AZD3QIlh9sSyDt7MDu1eY1YTkeZ3ePlDdz7pob0pzgHKn6cFLWrX4R
        xrP72CSWpsLniQymRT+7eqW22oqmWvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626855711;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tcl5cDaIqMqE73ZOqGYcVvyHb9eNkCSZ2iF/c1CRjCM=;
        b=a4YxmfT55TUjivfjD/lVONl60kzHpD3Pk3vzXYw2qvNFHQFF0idO6SKCqwQmYt0FSKu7fR
        hR8qWESklDplLCBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0E7C913BC9;
        Wed, 21 Jul 2021 08:21:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id tVM0AB/Z92BkIgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Wed, 21 Jul 2021 08:21:50 +0000
Date:   Wed, 21 Jul 2021 10:21:46 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: parport: Switch to use
 module_parport_driver()
Message-ID: <20210721102146.66a486bc@endymion>
In-Reply-To: <20210712141119.22426-1-andriy.shevchenko@linux.intel.com>
References: <20210712141119.22426-1-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, 12 Jul 2021 17:11:19 +0300, Andy Shevchenko wrote:
> Switch to use module_parport_driver() to reduce boilerplate code.

This has the downside of moving the sanity check of the type parameter
to run time, instead of driver load time. In particular this means that
loading the i2c-parport driver without specifying the type will no
longer fail. The driver will load successfully, but won't do anything.

While I prefer user errors to be reported as soon as possible, I don't
really mind here, as parallel port drivers are not something worth
debating over at this point in time. As a matter of fact, I can't
possibly test this change as I no longer have a parallel port on any of
my systems.

So if that's the direction we want to take then so be it.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed compilation error (Jean, LKP)
>  drivers/i2c/busses/i2c-parport.c | 36 ++++++++++----------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
> index a535889acca6..231145c48728 100644
> --- a/drivers/i2c/busses/i2c-parport.c
> +++ b/drivers/i2c/busses/i2c-parport.c
> @@ -267,6 +267,16 @@ static void i2c_parport_attach(struct parport *port)
>  	int i;
>  	struct pardev_cb i2c_parport_cb;
>  
> +	if (type < 0) {
> +		pr_warn("adapter type unspecified\n");
> +		return;
> +	}
> +
> +	if (type >= ARRAY_SIZE(adapter_parm)) {
> +		pr_warn("invalid type (%d)\n", type);
> +		return;
> +	}
> +
>  	for (i = 0; i < MAX_DEVICE; i++) {
>  		if (parport[i] == -1)
>  			continue;
> @@ -392,32 +402,8 @@ static struct parport_driver i2c_parport_driver = {
>  	.detach = i2c_parport_detach,
>  	.devmodel = true,
>  };
> -
> -/* ----- Module loading, unloading and information ------------------------ */
> -
> -static int __init i2c_parport_init(void)
> -{
> -	if (type < 0) {
> -		pr_warn("adapter type unspecified\n");
> -		return -ENODEV;
> -	}
> -
> -	if (type >= ARRAY_SIZE(adapter_parm)) {
> -		pr_warn("invalid type (%d)\n", type);
> -		return -ENODEV;
> -	}
> -
> -	return parport_register_driver(&i2c_parport_driver);
> -}
> -
> -static void __exit i2c_parport_exit(void)
> -{
> -	parport_unregister_driver(&i2c_parport_driver);
> -}
> +module_parport_driver(i2c_parport_driver);
>  
>  MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
>  MODULE_DESCRIPTION("I2C bus over parallel port");
>  MODULE_LICENSE("GPL");
> -
> -module_init(i2c_parport_init);
> -module_exit(i2c_parport_exit);


-- 
Jean Delvare
SUSE L3 Support
