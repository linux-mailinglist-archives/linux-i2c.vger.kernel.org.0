Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4E464418D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 11:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbiLFKt4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 05:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234328AbiLFKt4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 05:49:56 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35A7DF23;
        Tue,  6 Dec 2022 02:49:54 -0800 (PST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8F3FD1FE58;
        Tue,  6 Dec 2022 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1670323793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ahN7gbHVXaTQLrfbJeZmjq0/q2AujLjg3VQqp4OUvw4=;
        b=QySoV1Fa2hWUR3Al02Y4ACe6XdnRcggCktWE+saY58Q0zz89B5LyYXqOhe+hWJz7kxYg4G
        ha429SmF7nceQA3W3Gdt4gUDBDcSg1dpAAcRSkd9RCuJdMg531W5C9xLdJUGzvxrpAWVQc
        75fzuUJvoc15I+jaCAjmXEsE5DJJq+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1670323793;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ahN7gbHVXaTQLrfbJeZmjq0/q2AujLjg3VQqp4OUvw4=;
        b=70fAJenpsXdyWBHZlvqFN+yCvoVHA+iEBSa361CgTA38sfGiOeZR4IpXC4bNrK1uovZ0KT
        w+DKNG4I7HDTYhBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2174D132F3;
        Tue,  6 Dec 2022 10:49:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id zwaeBlEej2OENgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Tue, 06 Dec 2022 10:49:53 +0000
Date:   Tue, 6 Dec 2022 11:49:52 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Krzysztof =?UTF-8?B?SGHFgmFzYQ==?= <khalasa@piap.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?UTF-8?B?S2xlaW5l?= =?UTF-8?B?LUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 222/606] Input: synaptics_i2c - Convert to i2c's
 .probe_new()
Message-ID: <20221206114952.0323433d@endymion.delvare>
In-Reply-To: <20221118224540.619276-223-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
        <20221118224540.619276-223-uwe@kleine-koenig.org>
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

On Fri, 18 Nov 2022 23:39:16 +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/input/mouse/synaptics_i2c.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/sy=
naptics_i2c.c
> index 987ee67a1045..6487c8c60d5e 100644
> --- a/drivers/input/mouse/synaptics_i2c.c
> +++ b/drivers/input/mouse/synaptics_i2c.c
> @@ -521,8 +521,7 @@ static struct synaptics_i2c *synaptics_i2c_touch_crea=
te(struct i2c_client *clien
>  	return touch;
>  }
> =20
> -static int synaptics_i2c_probe(struct i2c_client *client,
> -			       const struct i2c_device_id *dev_id)
> +static int synaptics_i2c_probe(struct i2c_client *client)
>  {
>  	int ret;
>  	struct synaptics_i2c *touch;
> @@ -651,7 +650,7 @@ static struct i2c_driver synaptics_i2c_driver =3D {
>  		.pm	=3D &synaptics_i2c_pm,
>  	},
> =20
> -	.probe		=3D synaptics_i2c_probe,
> +	.probe_new	=3D synaptics_i2c_probe,
>  	.remove		=3D synaptics_i2c_remove,
> =20
>  	.id_table	=3D synaptics_i2c_id_table,

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
