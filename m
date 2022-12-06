Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8536E64418B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 11:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbiLFKtj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 05:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234242AbiLFKth (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 05:49:37 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7D8765A;
        Tue,  6 Dec 2022 02:49:36 -0800 (PST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 067191FE57;
        Tue,  6 Dec 2022 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1670323775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zU63U5rl0Gy/gP66cO2xSLyu3IA011SG6jmil2B+TGs=;
        b=nm9OqpPh/9KbT9vzqi+8RtGI7ev/VPOzYzMVXxAcBqlsRSi+pNiL4Hhv3S+MIP1lPMxMlz
        jLFSx5EZHxhvshIyNGSe2keW3Spgw9+qsB7ngB+KrtY0a+/W5S10BKPaFAhUNiSwnCqEob
        zjnaVP319ILd9/w/FclpvF6F8S/DYoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1670323775;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zU63U5rl0Gy/gP66cO2xSLyu3IA011SG6jmil2B+TGs=;
        b=PXLrZkxQrAR01vnqC4GbEg9iWiU2dvABISIVbs3O5cPaCoyP3u4eTj3ZDChAFBAasX1L3o
        g2v6k+r8oIncahDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 81558132F3;
        Tue,  6 Dec 2022 10:49:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id Bb38HT4ej2NJNgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Tue, 06 Dec 2022 10:49:34 +0000
Date:   Tue, 6 Dec 2022 11:49:29 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 209/606] Input: atmel_captouch - Convert to i2c's
 .probe_new()
Message-ID: <20221206114929.085b6f09@endymion.delvare>
In-Reply-To: <20221118224540.619276-210-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
        <20221118224540.619276-210-uwe@kleine-koenig.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Nov 2022 23:39:03 +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/input/misc/atmel_captouch.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/input/misc/atmel_captouch.c b/drivers/input/misc/atm=
el_captouch.c
> index 156c699a8913..d9704b174d3a 100644
> --- a/drivers/input/misc/atmel_captouch.c
> +++ b/drivers/input/misc/atmel_captouch.c
> @@ -161,8 +161,7 @@ static irqreturn_t atmel_captouch_isr(int irq, void *=
data)
>  /*
>   * Probe function to setup the device, input system and interrupt
>   */
> -static int atmel_captouch_probe(struct i2c_client *client,
> -		const struct i2c_device_id *id)
> +static int atmel_captouch_probe(struct i2c_client *client)
>  {
>  	struct atmel_captouch_device *capdev;
>  	struct device *dev =3D &client->dev;
> @@ -264,7 +263,7 @@ static const struct i2c_device_id atmel_captouch_id[]=
 =3D {
>  MODULE_DEVICE_TABLE(i2c, atmel_captouch_id);
> =20
>  static struct i2c_driver atmel_captouch_driver =3D {
> -	.probe		=3D atmel_captouch_probe,
> +	.probe_new	=3D atmel_captouch_probe,
>  	.id_table	=3D atmel_captouch_id,
>  	.driver		=3D {
>  		.name	=3D "atmel_captouch",

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
