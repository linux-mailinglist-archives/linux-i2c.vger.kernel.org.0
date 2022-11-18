Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC8F630546
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbiKRXw6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237066AbiKRXwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:52:14 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A0EBCE65;
        Fri, 18 Nov 2022 15:27:29 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C2D805C00E6;
        Fri, 18 Nov 2022 18:27:26 -0500 (EST)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Fri, 18 Nov 2022 18:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1668814046; x=
        1668900446; bh=SGIEerNCKEfpjA8HEJkeaYNJjnPVrXJob1usk0cWuG0=; b=V
        VLUgtFnKjZTexZJbrqR/OpvIoxRu+jFoiU+LffyQMY+Vmw9ROwTLVt9wed+k1+O/
        l5TQF6iKG9+FHLrfdrXY+d9CK+O/bJCzHYcHQh4ZjxjYL4Rm0EgZZGvVBaVuk0hP
        TfpRSd2VDysvOk/e+gYKFqTpn32DnoGZSjs19gwM+pe+O/KkLAQLs7lIiit44zrj
        1hLYNl/L3+wOdbwMH3cZqsTqQhjeFhq3x5OChub0bM9mlPSOYI6O4V9obZ92EFcB
        QEu7RsHF5TwzBSK26pIp19TA1Umu08l97jnTJe2R/Tl3w/pE8aVQR6mCGu9YrNek
        YVitZSW7vTJVqq+oCEMgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668814046; x=
        1668900446; bh=SGIEerNCKEfpjA8HEJkeaYNJjnPVrXJob1usk0cWuG0=; b=E
        ms3mN9ZQO7MldF9OqT0q3/6xr6+7vu9ElqEJwLKf7mCb/ANmixPaazabRKraxK4y
        cKrDn2+P2INCjoLBLlp4LuWq+d++pHioxQLrftwDeFk7/FKPuj9itKyNjTj1vHCg
        DmuX+pp48G/u3XJXSPUBdBjqAAwkGyBT76YadfprqQpedAFhsaAqW42uheL7Hs8J
        DoiNa1AmvAWqbWMhEyaAZDxnRdmMRIV6E2kzLd78EoNp/5QjvQgzxdw+WRvjEgoH
        NzcF8gjcJYDuZXBE7xHnIq09yDIza2AKTtCLNpkQnmgier2oZer57QgDnDPMUuJY
        ToHUrgzhX7EepNXHM+obQ==
X-ME-Sender: <xms:3hR4Y8cNujFHs_Eb-ZZP-kFkR0-xvO9f0K_kchhpRbudjrepKFy20Q>
    <xme:3hR4Y-PDAuIpxOI3DciMF6lSPYzMtZvc8Ar6_xv50Q5xyu1UJ8aHyANQnDRiZ58Zw
    kNzWog2kKLDcwwPSzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedugdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpeetlhhi
    shhtrghirhcuoegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrf
    grthhtvghrnhephfegveetjedvveevvdekveehuedvjeduhfffgfdvhfegueethfeftdeu
    udelfedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:3hR4Y9ixzx2cAS6BHQA4FcKhkwiDlJq64tNmr3bpuy6gvzwseFliXg>
    <xmx:3hR4Yx81OtMM-dLUgYWcTr5SJY9wBln8MJiHxv_9Jnbp5OYn7DF-Jg>
    <xmx:3hR4Y4s8WlKyyT69kZDdkyWwd0tZVflxsoZNV0jGnVBBYAUbm3yPaA>
    <xmx:3hR4Y2DArv4QmCNF7A3mruf6fE8jVdyjru568dV8n6-VgwH04JHvIQ>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5EDBC2D40091; Fri, 18 Nov 2022 18:27:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <ecb333d9-b681-4024-ac3a-3a9e51d613eb@app.fastmail.com>
In-Reply-To: <20221118224540.619276-265-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-265-uwe@kleine-koenig.org>
Date:   Sat, 19 Nov 2022 09:27:04 +1000
From:   Alistair <alistair@alistair23.me>
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        "Angel Iglesias" <ang.iglesiasg@gmail.com>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Grant Likely" <grant.likely@linaro.org>,
        "Wolfram Sang" <wsa@kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-input@vger.kernel.org,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 264/606] Input: wacom_i2c - Convert to i2c's .probe_new()
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 19 Nov 2022, at 8:39 AM, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter s=
o it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

> ---
> drivers/input/touchscreen/wacom_i2c.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/tou=
chscreen/wacom_i2c.c
> index 141754b2764c..c9188ee00c62 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -162,8 +162,7 @@ static void wacom_i2c_close(struct input_dev *dev)
> disable_irq(client->irq);
> }
> =20
> -static int wacom_i2c_probe(struct i2c_client *client,
> -    const struct i2c_device_id *id)
> +static int wacom_i2c_probe(struct i2c_client *client)
> {
> struct device *dev =3D &client->dev;
> struct wacom_i2c *wac_i2c;
> @@ -265,7 +264,7 @@ static struct i2c_driver wacom_i2c_driver =3D {
> .pm =3D &wacom_i2c_pm,
> },
> =20
> - .probe =3D wacom_i2c_probe,
> + .probe_new =3D wacom_i2c_probe,
> .id_table =3D wacom_i2c_id,
> };
> module_i2c_driver(wacom_i2c_driver);
> --=20
> 2.38.1
>=20
>=20
