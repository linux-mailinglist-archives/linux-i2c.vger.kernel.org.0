Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C067197DFE
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 16:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgC3OLL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 10:11:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60904 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgC3OLL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Mar 2020 10:11:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id B5B8F29661E
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 1/2] platform/chrome: chromeos_laptop: make I2C API
 conversion complete
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org
References: <20200326210952.12857-1-wsa+renesas@sang-engineering.com>
 <20200326210952.12857-2-wsa+renesas@sang-engineering.com>
Message-ID: <2d4269eb-0f17-47c8-d393-a3887a72526e@collabora.com>
Date:   Mon, 30 Mar 2020 16:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200326210952.12857-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 26/3/20 22:09, Wolfram Sang wrote:
> When converting to i2c_new_scanned_device(), it was overlooked that a
> conversion to i2c_new_client_device() was also needed. Fix it.
> 
> Fixes: c82ebf1bf738 ("platform/chrome: chromeos_laptop: Convert to i2c_new_scanned_device")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/platform/chrome/chromeos_laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
> index 4f3651fcd9fe..472a03daa869 100644
> --- a/drivers/platform/chrome/chromeos_laptop.c
> +++ b/drivers/platform/chrome/chromeos_laptop.c
> @@ -103,7 +103,7 @@ chromes_laptop_instantiate_i2c_device(struct i2c_adapter *adapter,
>  			pr_debug("%d-%02x is probed at %02x\n",
>  				 adapter->nr, info->addr, dummy->addr);
>  			i2c_unregister_device(dummy);
> -			client = i2c_new_device(adapter, info);
> +			client = i2c_new_client_device(adapter, info);
>  		}
>  	}
>  
> 

Queued for 5.7.

Thanks.
Enric
