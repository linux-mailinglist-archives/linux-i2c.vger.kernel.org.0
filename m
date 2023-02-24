Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78976A1F40
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 17:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjBXQCj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 11:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjBXQCe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 11:02:34 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B65D300;
        Fri, 24 Feb 2023 08:02:23 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2EE09FF810;
        Fri, 24 Feb 2023 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677254541;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CD8U5sr8w6jSqbcjvxhIR3vCP+1xg2kTb5807+FRtk0=;
        b=QpUrEFS+Vt79PAbyFr37DeKAPYDojPSsTXhKaRktlalUSAFnB9u9ennaqO16wgv9S255Op
        t9T3voIKNZkC+/xLyeARAixy5URjySViYDse2DFzlqahajHlV9BqOXuRydkEV3wnr1Oy2/
        FOjqXhvle1NAcmiL8pq2Lo6CEgysEZL8HSPQdxx7+MR2AQUwk/d26RlJPUXnZtkoRRcwyP
        6gR5d9QwH4C0spm6FMMNCzbOwRNwwl0ZWAYip1iEx3Z5DlaMgb9i2W/o//apYCZm5E+nb3
        IG5I6DA+iBUgr8D1CZfQfjlnHe5fan6kqVPFAtfxWPgA08qRntspvP8+euLYRA==
Date:   Fri, 24 Feb 2023 17:02:18 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 7/9] i2c: Switch .probe() to not take an id parameter
Message-ID: <20230224170218.22c0af0c@booty>
In-Reply-To: <20230224120600.1681685-8-u.kleine-koenig@pengutronix.de>
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
        <20230224120600.1681685-8-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Fri, 24 Feb 2023 13:05:58 +0100
Uwe Kleine-K=C3=B6nig         <u.kleine-koenig@pengutronix.de> wrote:

> Commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
> type") introduced a new probe callback to convert i2c init routines to
> not take an i2c_device_id parameter. Now that all in-tree drivers are
> converted to the temporary .probe_new() callback, .probe() can be
> modified to match the desired prototype.
>=20
> Now that .probe() and .probe_new() have the same semantic, they can be
> defined as members of an anonymous union to save some memory and
> simplify the core code a bit.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thank you, I love this cleanup!

> ---
>  drivers/i2c/i2c-core-base.c | 11 ++---------
>  include/linux/i2c.h         | 14 +++++++++-----
>  2 files changed, 11 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 087e480b624c..1fbe16221085 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -558,15 +558,8 @@ static int i2c_device_probe(struct device *dev)
>  		goto err_detach_pm_domain;
>  	}
> =20
> -	/*
> -	 * When there are no more users of probe(),
> -	 * rename probe_new to probe.
> -	 */
> -	if (driver->probe_new)
> -		status =3D driver->probe_new(client);
> -	else if (driver->probe)
> -		status =3D driver->probe(client,
> -				       i2c_match_id(driver->id_table, client));
> +	if (driver->probe)
> +		status =3D driver->probe(client);
>  	else
>  		status =3D -EINVAL;
> =20
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d84e0e99f084..c3e022d53182 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -272,14 +272,18 @@ enum i2c_driver_flags {
>  struct i2c_driver {
>  	unsigned int class;
> =20
> +	union {
>  	/* Standard driver model interfaces */
> -	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
> +		int (*probe)(struct i2c_client *client);
> +		/*
> +		 * Legacy callback that was part of a conversion of .probe().
> +		 * Today it has the same semantic as .probe(). Don't use for new
> +		 * code.
> +		 */
> +		int (*probe_new)(struct i2c_client *client);
> +	};
>  	void (*remove)(struct i2c_client *client);
> =20
> -	/* New driver model interface to aid the seamless removal of the
> -	 * current probe()'s, more commonly unused than used second parameter.
> -	 */
> -	int (*probe_new)(struct i2c_client *client);

The kerneldoc for this struct should also be updated:

- * @probe: Callback for device binding - soon to be deprecated
- * @probe_new: New callback for device binding
+ * @probe: Callback for device binding=20
+ * @probe_new: Transitional callback for device binding - do not use

Otherwise LGTM.

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
