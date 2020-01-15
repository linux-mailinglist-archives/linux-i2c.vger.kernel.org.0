Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B150113C5BD
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 15:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgAOORq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 09:17:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:45684 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgAOORp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 09:17:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 289C0AD19;
        Wed, 15 Jan 2020 14:17:44 +0000 (UTC)
Date:   Wed, 15 Jan 2020 15:17:43 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: parport: move include file into main source
Message-ID: <20200115151743.63e6b02d@endymion>
In-Reply-To: <20200113210643.5033-4-wsa+renesas@sang-engineering.com>
References: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
        <20200113210643.5033-4-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 13 Jan 2020 22:06:43 +0100, Wolfram Sang wrote:
> After removal of the parport-light driver, this include is used by the
> parport driver exclusively and can be included in the main source.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-parport.c | 100 ++++++++++++++++++++++++++++-
>  drivers/i2c/busses/i2c-parport.h | 106 -------------------------------
>  2 files changed, 99 insertions(+), 107 deletions(-)
>  delete mode 100644 drivers/i2c/busses/i2c-parport.h
> 
> diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
> index e8ed882de402..d03d22812eef 100644
> --- a/drivers/i2c/busses/i2c-parport.c
> +++ b/drivers/i2c/busses/i2c-parport.c
> (...)
> @@ -42,6 +125,7 @@ static LIST_HEAD(adapter_list);
>  static DEFINE_MUTEX(adapter_list_lock);
>  #define MAX_DEVICE 4
>  static int parport[MAX_DEVICE] = {0, -1, -1, -1};
> +static int type = -1;
>  
>  
>  /* ----- Low-level parallel port access ----------------------------------- */
> @@ -318,5 +402,19 @@ MODULE_PARM_DESC(parport,
>  		 " Default is one device connected to parport0.\n"
>  );
>  
> +module_param(type, int, 0);
> +MODULE_PARM_DESC(type,
> +	"Type of adapter:\n"
> +	" 0 = Philips adapter\n"
> +	" 1 = home brew teletext adapter\n"
> +	" 2 = Velleman K8000 adapter\n"
> +	" 3 = ELV adapter\n"
> +	" 4 = ADM1032 evaluation board\n"
> +	" 5 = ADM1025, ADM1030 and ADM1031 evaluation boards\n"
> +	" 6 = Barco LPT->DVI (K5800236) adapter\n"
> +	" 7 = One For All JP1 parallel port adapter\n"
> +	" 8 = VCT-jig\n"
> +);

Isn't it considered a better practice to keep the module_param (and
MODULE_PARM_DESC) close to the declaration of the variable itself so
that correctness can be easily verified and changing the type later
would be easier?

Other than that, I'm fine with the change, thanks for doing this.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
