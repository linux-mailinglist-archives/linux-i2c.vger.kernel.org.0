Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0506C9A044
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 21:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732221AbfHVTlf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 15:41:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37782 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731942AbfHVTlf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Aug 2019 15:41:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id C0F0428D4C2
Subject: Re: [PATCH] platform: chrome: chromeos_laptop: drop checks of
 NULL-safe functions
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org
References: <20190820153449.7866-1-wsa+renesas@sang-engineering.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <b6612ae3-9d6f-baf7-98db-f3d26f4a5108@collabora.com>
Date:   Thu, 22 Aug 2019 21:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820153449.7866-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 20/8/19 17:34, Wolfram Sang wrote:
> No need to check the argument of i2c_unregister_device() and
> property_entries_free() because the functions do check it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for chrome-platform-5.4

Thanks,
 Enric

> ---
> Build tested only, buildbot is happy, too.
> 
> Please apply to your tree.
> 
>  drivers/platform/chrome/chromeos_laptop.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
> index 7abbb6167766..8723bcf10c93 100644
> --- a/drivers/platform/chrome/chromeos_laptop.c
> +++ b/drivers/platform/chrome/chromeos_laptop.c
> @@ -838,18 +838,14 @@ static void chromeos_laptop_destroy(const struct chromeos_laptop *cros_laptop)
>  		i2c_dev = &cros_laptop->i2c_peripherals[i];
>  		info = &i2c_dev->board_info;
>  
> -		if (i2c_dev->client)
> -			i2c_unregister_device(i2c_dev->client);
> -
> -		if (info->properties)
> -			property_entries_free(info->properties);
> +		i2c_unregister_device(i2c_dev->client);
> +		property_entries_free(info->properties);
>  	}
>  
>  	for (i = 0; i < cros_laptop->num_acpi_peripherals; i++) {
>  		acpi_dev = &cros_laptop->acpi_peripherals[i];
>  
> -		if (acpi_dev->properties)
> -			property_entries_free(acpi_dev->properties);
> +		property_entries_free(acpi_dev->properties);
>  	}
>  
>  	kfree(cros_laptop->i2c_peripherals);
> 
