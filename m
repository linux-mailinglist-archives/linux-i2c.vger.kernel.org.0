Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4AD1A95DB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393788AbgDOIJg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:09:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgDOIJe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:09:34 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 687D42D1;
        Wed, 15 Apr 2020 10:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586938172;
        bh=0M0sxbl5iAtIUwwTWGS+6Es0MSqO8PrYDHJ+hWBnTkg=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=WZ/854G9YuTrymYtHbFXpQrUkdQ2q3ZiB+UAszByRERfHLpH489og3N1CNxbl+UuZ
         eA7KtivXXJ0zrqiTyV1XBAXCUOAQPXxa4T1qkkCfzuUwk45o4507K4aDwJ1Eio7Ax6
         OnD1tN3cmzFt8gyPQWMgCiq/EX3ZKahVyZBMbIuQ=
Subject: Re: [RFC PATCH v2 1/6] i2c: use DEFINE for the dummy driver name
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-2-wsa+renesas@sang-engineering.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <fb32a47b-50e0-aac2-7e25-fbaa3f578931@ideasonboard.com>
Date:   Wed, 15 Apr 2020 09:09:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 18/03/2020 15:00, Wolfram Sang wrote:
> We use it in multiple places, so make sure it is consistent whenever we
> need to change it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/i2c/i2c-core-base.c | 8 ++++----
>  drivers/i2c/i2c-core.h      | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index cefad0881942..3d7b8a00a7d9 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -853,7 +853,7 @@ EXPORT_SYMBOL_GPL(i2c_unregister_device);
>  
>  
>  static const struct i2c_device_id dummy_id[] = {
> -	{ "dummy", 0 },
> +	{ I2C_DUMMY_DRV_NAME, 0 },
>  	{ },
>  };
>  
> @@ -869,7 +869,7 @@ static int dummy_remove(struct i2c_client *client)
>  }
>  
>  static struct i2c_driver dummy_driver = {
> -	.driver.name	= "dummy",
> +	.driver.name	= I2C_DUMMY_DRV_NAME,
>  	.probe		= dummy_probe,
>  	.remove		= dummy_remove,
>  	.id_table	= dummy_id,
> @@ -896,7 +896,7 @@ static struct i2c_driver dummy_driver = {
>  struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
>  {
>  	struct i2c_board_info info = {
> -		I2C_BOARD_INFO("dummy", address),
> +		I2C_BOARD_INFO(I2C_DUMMY_DRV_NAME, address),
>  	};
>  
>  	return i2c_new_client_device(adapter, &info);
> @@ -1487,7 +1487,7 @@ static void i2c_do_del_adapter(struct i2c_driver *driver,
>  static int __unregister_client(struct device *dev, void *dummy)
>  {
>  	struct i2c_client *client = i2c_verify_client(dev);
> -	if (client && strcmp(client->name, "dummy"))
> +	if (client && strcmp(client->name, I2C_DUMMY_DRV_NAME))
>  		i2c_unregister_device(client);
>  	return 0;
>  }
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 517d98be68d2..fb89fabf84d3 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -22,6 +22,8 @@ int i2c_check_7bit_addr_validity_strict(unsigned short addr);
>  int i2c_dev_irq_from_resources(const struct resource *resources,
>  			       unsigned int num_resources);
>  
> +#define I2C_DUMMY_DRV_NAME "dummy"
> +
>  /*
>   * We only allow atomic transfers for very late communication, e.g. to send
>   * the powerdown command to a PMIC. Atomic transfers are a corner case and not
> 

