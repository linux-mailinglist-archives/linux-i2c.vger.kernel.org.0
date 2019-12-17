Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7543A1227F2
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 10:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfLQJxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 04:53:25 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43804 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbfLQJxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 04:53:25 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 61FAE284AE2
Subject: Re: [PATCH 1/1] platform: chrome: convert to i2c_new_scanned_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org
References: <20191216122951.3679-1-wsa+renesas@sang-engineering.com>
 <20191216122951.3679-2-wsa+renesas@sang-engineering.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <2e7e6761-1bde-9599-bf1a-01a0a8130b60@collabora.com>
Date:   Tue, 17 Dec 2019 10:53:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191216122951.3679-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 16/12/19 13:29, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for 5.6

Thanks,
 Enric
> ---
> Build tested only.
> 
>  drivers/platform/chrome/chromeos_laptop.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
> index 8723bcf10c93..4f3651fcd9fe 100644
> --- a/drivers/platform/chrome/chromeos_laptop.c
> +++ b/drivers/platform/chrome/chromeos_laptop.c
> @@ -63,7 +63,7 @@ struct acpi_peripheral {
>  struct chromeos_laptop {
>  	/*
>  	 * Note that we can't mark this pointer as const because
> -	 * i2c_new_probed_device() changes passed in I2C board info, so.
> +	 * i2c_new_scanned_device() changes passed in I2C board info, so.
>  	 */
>  	struct i2c_peripheral *i2c_peripherals;
>  	unsigned int num_i2c_peripherals;
> @@ -87,8 +87,8 @@ chromes_laptop_instantiate_i2c_device(struct i2c_adapter *adapter,
>  	 * address we scan secondary addresses. In any case the client
>  	 * structure gets assigned primary address.
>  	 */
> -	client = i2c_new_probed_device(adapter, info, addr_list, NULL);
> -	if (!client && alt_addr) {
> +	client = i2c_new_scanned_device(adapter, info, addr_list, NULL);
> +	if (IS_ERR(client) && alt_addr) {
>  		struct i2c_board_info dummy_info = {
>  			I2C_BOARD_INFO("dummy", info->addr),
>  		};
> @@ -97,9 +97,9 @@ chromes_laptop_instantiate_i2c_device(struct i2c_adapter *adapter,
>  		};
>  		struct i2c_client *dummy;
>  
> -		dummy = i2c_new_probed_device(adapter, &dummy_info,
> -					      alt_addr_list, NULL);
> -		if (dummy) {
> +		dummy = i2c_new_scanned_device(adapter, &dummy_info,
> +					       alt_addr_list, NULL);
> +		if (!IS_ERR(dummy)) {
>  			pr_debug("%d-%02x is probed at %02x\n",
>  				 adapter->nr, info->addr, dummy->addr);
>  			i2c_unregister_device(dummy);
> @@ -107,12 +107,14 @@ chromes_laptop_instantiate_i2c_device(struct i2c_adapter *adapter,
>  		}
>  	}
>  
> -	if (!client)
> +	if (IS_ERR(client)) {
> +		client = NULL;
>  		pr_debug("failed to register device %d-%02x\n",
>  			 adapter->nr, info->addr);
> -	else
> +	} else {
>  		pr_debug("added i2c device %d-%02x\n",
>  			 adapter->nr, info->addr);
> +	}
>  
>  	return client;
>  }
> 
