Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E26628992
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 20:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbiKNTnL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 14:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiKNTnK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 14:43:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76FD1C134;
        Mon, 14 Nov 2022 11:43:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 738C7B81212;
        Mon, 14 Nov 2022 19:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C1DC433C1;
        Mon, 14 Nov 2022 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668454986;
        bh=URpbibhhEWl0uu+a+Kz/vax545HiRA1R4KMIR2BNtvM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ptPFYoqwflN6Nf+Jm6wAJpK6Fg9uE3Sz9VD3x4oTf2utaJpkBBjZ8FtqE0nenXTO8
         rrjDQYHC+i139siJ5l60K+D1OUoiYiAeywso+v/AWKIf7nI4D34qrfiF3gG8sJ923O
         Z8J/5pfaSB0MpX8ZRc45kKu5raiVrbYM32Fx6LLPz2mUcM7bXQ48MhZXC0F0gPlJcu
         hOrcMifAim5sxqtuu4LQ8CZXkSxOHa7/G1LeI10OzyoS86hCaSokDnCJOjj8xqyInK
         FTCB4CJfLl8BwqjlRCNbRDrgMt60xNRXfATNwV6UDQcrp4YFmrKkVB62w+PuqNbmo9
         jZvoddmx0Ii6Q==
Date:   Mon, 14 Nov 2022 19:55:23 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>
Cc:     linux-iio@vger.kernel.org,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: core: Introduce i2c_client_get_device_id
 helper function
Message-ID: <20221114195523.6fb2d064@jic23-huawei>
In-Reply-To: <a844cc7c85898b40abbdcb1f068338619c6010eb.1668361368.git.ang.iglesiasg@gmail.com>
References: <cover.1668361368.git.ang.iglesiasg@gmail.com>
        <a844cc7c85898b40abbdcb1f068338619c6010eb.1668361368.git.ang.iglesiasg@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 13 Nov 2022 18:46:30 +0100
Angel Iglesias <ang.iglesiasg@gmail.com> wrote:

> Introduces new helper function to aid in .probe_new() refactors. In order
> to use existing i2c_get_device_id() on the probe callback, the device
> match table needs to be accessible in that function, which would require
> bigger refactors in some drivers using the deprecated .probe callback.
>=20
> This issue was discussed in more detail in the IIO mailing list.
>=20
> Link: https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koeni=
g@pengutronix.de/
> Suggested-by: Nuno S=C3=A1 <noname.nuno@gmail.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index b4edf10e8fd0..9aa7b9d9a485 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2236,6 +2236,20 @@ int i2c_get_device_id(const struct i2c_client *cli=
ent,
>  }
>  EXPORT_SYMBOL_GPL(i2c_get_device_id);
> =20
> +/**
> + * i2c_client_get_device_id - get the driver match table entry of a devi=
ce
> + * @client: the device to query. The device must be bound to a driver
> + *
> + * Returns a pointer to the matching entry if found, NULL otherwise.
> + */
> +const struct i2c_device_id *i2c_client_get_device_id(const struct i2c_cl=
ient *client)
> +{
> +	const struct i2c_driver *drv =3D to_i2c_driver(client->dev.driver);
> +
> +	return i2c_match_id(drv->id_table, client);
> +}
> +EXPORT_SYMBOL_GPL(i2c_client_get_device_id);
> +
>  /* ----------------------------------------------------
>   * the i2c address scanning function
>   * Will not work for 10-bit addresses!
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f7c49bbdb8a1..d84e0e99f084 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -189,6 +189,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const s=
truct i2c_client *client,
>  					      u8 *values);
>  int i2c_get_device_id(const struct i2c_client *client,
>  		      struct i2c_device_identity *id);
> +const struct i2c_device_id *i2c_client_get_device_id(const struct i2c_cl=
ient *client);
>  #endif /* I2C */
> =20
>  /**

