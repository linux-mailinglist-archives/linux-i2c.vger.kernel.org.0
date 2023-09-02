Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 931C1790939
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 20:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbjIBSnH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 14:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjIBSnH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 14:43:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F19AA7;
        Sat,  2 Sep 2023 11:43:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0584DB808C3;
        Sat,  2 Sep 2023 18:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01E6C433C8;
        Sat,  2 Sep 2023 18:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693680180;
        bh=63LT2SePid2WbQx3HWwxI66tqL0YKl1hPL5zeGEanTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=skyXmd629UJAc+VFGaSNUwSNpmDNXhCiacDz1kBMnXX43UeQYGxhPUwcWONS8KiIe
         A0hfQxU0JdXGV8yY4EgS6A3Q+87w5yf0yRtcEs8IuSHwpWL6cI3eNbJbInqwbqirEf
         BmqEqivoN996iZRbAa5DKF62g6SXlj+Tz+MiZ+qNRANrVN/XXM/3X4a8mVYrf0Fxy4
         lMPHdL5NsDmhTo1YAK8A670ne4w+XPOG2VyntSWbLdavz7/8GlC39K9AotixmrPkOU
         ATtKgStFOKii0wCD7Aphrab/PZdVPccZ3aadKbW70U/5qzGTSU2hkXsG3rH0t10hWX
         KFf8Yxd9bnXCw==
Date:   Sat, 2 Sep 2023 20:42:56 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: muxes: Enable features on MAX7357
Message-ID: <20230902184256.6g2lfgqfaeanjtwz@zenone.zhora.eu>
References: <20230830115744.4102929-1-Naresh.Solanki@9elements.com>
 <20230830115744.4102929-2-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830115744.4102929-2-Naresh.Solanki@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Naresh,

On Wed, Aug 30, 2023 at 01:57:43PM +0200, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Detect that max7357 is being used and run custom init sequence.
> 
> By default MAX7357 disconnects all channels on a bus lock-up and
> signals	this condition to the bus master using an interrupt.

please replace this tab with a space.

> Disable the interrupt as it's not useful within the kernel and
> it might conflict with the reset functionality that shares the same
> pin.
> 
> Use the introduced 'maxim,bus-lockup-fix' property to enable
> faulty channel isolation and flush-out sequence generation.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 56 ++++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 2219062104fb..0c1ff1438e7c 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -57,6 +57,21 @@
>  
>  #define PCA954X_IRQ_OFFSET 4
>  
> +/*
> + * MAX7357 exposes 7 registers on POR which allow to configure additional
> + * features. The configuration register holds the following settings:
> + */
> +#define MAX7357_CONF_INT_ENABLE			BIT(0)
> +#define MAX7357_CONF_FLUSH_OUT			BIT(1)
> +#define MAX7357_CONF_RELEASE_INT		BIT(2)
> +#define MAX7357_CONF_LOCK_UP_CLEAR		BIT(3)
> +#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
> +#define MAX7357_CONF_BUS_LOCKUP_DETECT_DIS	BIT(5)
> +#define MAX7357_CONF_ENABLE_BASIC_MODE		BIT(6)
> +#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)

Not all these defines are are used, can we remove those that we
don't need?

> +#define MAX7357_POR_DEFAULT_CONF		BIT(0)

I think:

   #define MAX7357_POR_DEFAULT_CONF	MAX7357_CONF_INT_ENABLE

has a better meaning... but overall, do we need it?

> +
>  enum pca_type {
>  	max_7356,
>  	max_7357,
> @@ -477,6 +492,41 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  	return ret;
>  }
>  
> +static int max7357_init(struct i2c_client *client, struct pca954x *data)
> +{
> +	struct i2c_adapter *adap = client->adapter;
> +	u8 conf = MAX7357_POR_DEFAULT_CONF;
> +	int ret;
> +
> +	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> +		return pca954x_init(client, data);
> +
> +	if (data->idle_state >= 0)
> +		data->last_chan = pca954x_regval(data, data->idle_state);
> +	else
> +		data->last_chan = 0; /* Disconnect multiplexer */
> +
> +	/*
> +	 * The interrupt signals downstream channels that are stuck, but
> +	 * there's nothing to do and it prevents using the shared pin as reset.
> +	 */
> +	conf &= MAX7357_CONF_INT_ENABLE;
> +
> +	/*
> +	 * On bus lock-up isolate the failing channel and try to clear the
> +	 * fault by sending the flush-out sequence.
> +	 */
> +	if (device_property_read_bool(&client->dev, "maxim,bus-lockup-fix"))
> +		conf |= MAX7357_CONF_DISCON_SINGLE_CHAN |
> +			MAX7357_CONF_FLUSH_OUT;

this function is identical to pca954x_init() except for the
conf.

If you:

	u8 conf = 0;

	...

	if (i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
		conf &= MAX7357_CONF_INT_ENABLE;

		if (device_property_read_bool(&client->dev,
					      "maxim,bus-lockup-fix"))
			conf |= MAX7357_CONF_DISCON_SINGLE_CHAN |
				MAX7357_CONF_FLUSH_OUT;
	}

	ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
	...


You basically should obtain the same thing, I guess and we make
things easier.


> +	ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
> +	if (ret < 0)
> +		data->last_chan = 0;
> +	return ret;
> +}
> +
>  /*
>   * I2C init/probing/exit functions
>   */
> @@ -560,7 +610,11 @@ static int pca954x_probe(struct i2c_client *client)
>  	 * initializes the mux to a channel
>  	 * or disconnected state.
>  	 */
> -	ret = pca954x_init(client, data);
> +	if ((dev->of_node && of_device_is_compatible(dev->of_node, "maxim,max7357")) ||
> +	    id->driver_data == max_7357)
> +		ret = max7357_init(client, data);

what happens if this is true and in max7357_init(); the i2c
functionality check fails?

Which of the two if's is redundant? Should they be merged?

Andi

> +	else
> +		ret = pca954x_init(client, data);
>  	if (ret < 0) {
>  		dev_warn(dev, "probe failed\n");
>  		ret = -ENODEV;
> -- 
> 2.41.0
> 
