Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33EEF5779E7
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 06:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbiGRESv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 00:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGRESu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 00:18:50 -0400
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3ABD12741;
        Sun, 17 Jul 2022 21:18:45 -0700 (PDT)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 10587C3F2A70;
        Mon, 18 Jul 2022 06:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 10587C3F2A70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1658117921; bh=41KGE0z3Ej55Cxp2F/mwCt22CFNs3EZaA+H4OPsmPec=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=PIwkagZwqWvI11IGk5uqr762WglmqntgH+0ewUk77c5XC/KyRhpIsKQ3QujWgr3Vz
         mC/SXuX6OgjfVbeTgPOR9feQjFa5dBCbEBtGYmCw0bF6+wvVtPHp01VWMFzNwUA0sB
         s4y6apa4cZ5sxi5EYV6V55UbCJ6NmzOCOLpHG0O4=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Johannes Holland <johannes.holland@infineon.com>,
        Amir Mizinski <amirmizi6@gmail.com>,
        Alexander Steffen <Alexander.Steffen@infineon.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-integrity@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 0/6] i2c: Make remove callback return void
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
        <20220704083947.55ioswcze7r36g44@pengutronix.de>
        <20220716151527.u5vh4lz6ubpqq2tv@pengutronix.de>
Sender: khalasa@piap.pl
Date:   Mon, 18 Jul 2022 06:18:40 +0200
In-Reply-To: <20220716151527.u5vh4lz6ubpqq2tv@pengutronix.de> ("Uwe
        =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Sat, 16 Jul 2022 17:15:27
 +0200")
Message-ID: <m3v8rvdpen.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, license restriction
X-KLMS-AntiPhishing: not scanned, license restriction
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, license restriction
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> Now there is a forth driver in next that needs adaption:
> drivers/media/i2c/ar0521.c adding=20

Very well. It's even already
Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -1018,7 +1018,7 @@ static int ar0521_probe(struct i2c_client *client)
>  	return ret;
>  }
>=20=20
> -static int ar0521_remove(struct i2c_client *client)
> +static void ar0521_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>  	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
> @@ -1031,7 +1031,6 @@ static int ar0521_remove(struct i2c_client *client)
>  		ar0521_power_off(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
>  	mutex_destroy(&sensor->lock);
> -	return 0;
>  }
>=20=20

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
