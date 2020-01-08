Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34A79133FBE
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 11:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgAHK6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 05:58:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:34348 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgAHK6Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jan 2020 05:58:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 582E2AD54;
        Wed,  8 Jan 2020 10:58:23 +0000 (UTC)
Date:   Wed, 8 Jan 2020 11:58:22 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/12] i2c: taos-evm: convert to use
 i2c_new_client_device()
Message-ID: <20200108115822.20871d77@endymion>
In-Reply-To: <20200107174748.9616-7-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
        <20200107174748.9616-7-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, 7 Jan 2020 18:47:40 +0100, Wolfram Sang wrote:
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Build tested only.
> 
>  drivers/i2c/busses/i2c-taos-evm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-taos-evm.c
> index 0bff3f3a8779..b4050f5b6746 100644
> --- a/drivers/i2c/busses/i2c-taos-evm.c
> +++ b/drivers/i2c/busses/i2c-taos-evm.c
> @@ -49,10 +49,10 @@ static struct i2c_client *taos_instantiate_device(struct i2c_adapter *adapter)
>  	if (!strncmp(adapter->name, "TAOS TSL2550 EVM", 16)) {
>  		dev_info(&adapter->dev, "Instantiating device %s at 0x%02x\n",
>  			tsl2550_info.type, tsl2550_info.addr);
> -		return i2c_new_device(adapter, &tsl2550_info);
> +		return i2c_new_client_device(adapter, &tsl2550_info);
>  	}
>  
> -	return NULL;
> +	return ERR_PTR(-ENODEV);
>  }
>  
>  static int taos_smbus_xfer(struct i2c_adapter *adapter, u16 addr,

Looks good to me, although ideally the caller should handle the error
instead of ignoring it. But that's out of scope for this conversion
patch, I'll look into submitting an update on top.

So:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

I'll also try to revive my evaluation module to give it some testing.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
