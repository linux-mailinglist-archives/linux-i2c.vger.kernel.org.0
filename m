Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D3E135545
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 10:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgAIJMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 04:12:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:46330 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728448AbgAIJMv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 04:12:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7462EB9EB;
        Thu,  9 Jan 2020 09:12:49 +0000 (UTC)
Date:   Thu, 9 Jan 2020 09:54:58 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/12] i2c: i801: convert to use i2c_new_client_device()
Message-ID: <20200109095458.62499f28@endymion>
In-Reply-To: <20200107174748.9616-3-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
        <20200107174748.9616-3-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 7 Jan 2020 18:47:36 +0100, Wolfram Sang wrote:
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Build tested only.
> 
>  drivers/i2c/busses/i2c-i801.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f5e69fe56532..44db3a91d32d 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1142,7 +1142,7 @@ static void dmi_check_onboard_device(u8 type, const char *name,
>  		memset(&info, 0, sizeof(struct i2c_board_info));
>  		info.addr = dmi_devices[i].i2c_addr;
>  		strlcpy(info.type, dmi_devices[i].i2c_type, I2C_NAME_SIZE);
> -		i2c_new_device(adap, &info);
> +		i2c_new_client_device(adap, &info);
>  		break;
>  	}
>  }
> @@ -1296,7 +1296,7 @@ static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
>  	memset(&info, 0, sizeof(struct i2c_board_info));
>  	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
>  	strlcpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> -	i2c_new_device(&priv->adapter, &info);
> +	i2c_new_client_device(&priv->adapter, &info);
>  }
>  
>  /* Register optional slaves */
> @@ -1312,7 +1312,7 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
>  		memset(&info, 0, sizeof(struct i2c_board_info));
>  		info.addr = apanel_addr;
>  		strlcpy(info.type, "fujitsu_apanel", I2C_NAME_SIZE);
> -		i2c_new_device(&priv->adapter, &info);
> +		i2c_new_client_device(&priv->adapter, &info);
>  	}
>  
>  	if (dmi_name_in_vendors("FUJITSU"))

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
