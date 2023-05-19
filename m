Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B357095CB
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 13:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbjESLDk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 07:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjESLDe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 07:03:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38621987;
        Fri, 19 May 2023 04:03:03 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af290cf9b7so870901fa.3;
        Fri, 19 May 2023 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684494180; x=1687086180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sK2xLHjcRHLrAnodiL9Mcc2q7WIuVpBASOZhsxiKp2o=;
        b=bzrHSZustUkWunhpAmaCubObV3Vl6sxXAKkjy8GT3sbSBohJu6G5LcyeMXvRtAjdjx
         rmn4QrEb4YMfEyjpcyORajQmdpBbfV49BLyrD60hQ6RM9owJRCHaDMXifAjUpynxfOWI
         YtLdsWoUDt/YINJPKSd5TyNAl4xexJvlw2DfdeeRfMLovDHk5awMIkbOqouBE18ftQuJ
         /PyTtWQGCHvLtUWWJ+vL8kUKm8SjjIHWTymekaDOl4jAFbGgAFnEId61rdYFcNlGnd/8
         xBU/hwdJ0/hYXu2zwaTL7qrf6OKxOA1873UUpnmnWLs/lxX5oMK3dgCliCM8f9OBDYZv
         6YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684494180; x=1687086180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK2xLHjcRHLrAnodiL9Mcc2q7WIuVpBASOZhsxiKp2o=;
        b=TUo8MZGNxuHo5hnmlSXLr3x2fbZrjlZM+O3dZ3UrFVVIt08UKd39Cw40ulM6xvrHjg
         aTB0jgIlm8hU1UKQeqnDf2YkjGgBeQh9BFpKAicjX3p5LO3GL/EB4vCsjsj6Sy7Kk9fx
         72hPYWngJz6rqXCZQoxWY4DGctzmb4tUihjMUXcy8j7tOTOluRm0DhaOZ7Miz7aYF8NF
         lhKncV9N+ErCYQC614KE0FjGXofM/lBaz/S+kt683XCr8jZnl8Ho3I6Hj7C83JRpUwKM
         9l1i3D270zhxX7NY14ycR9FCFadR8sDDWcM3nE0TTjdCUNbMquNaHpl8JMEqYq2WE5OJ
         49Zw==
X-Gm-Message-State: AC+VfDx/ZkR5uYjPx0CCyHU0At/Fe9oIuTq7zbBzlNkA0RWlh0tJYfAV
        RFOZsOkUKB2cCBr6i6zRauw=
X-Google-Smtp-Source: ACHHUZ5chLqQVl/sJRSoXh8LQwArbENYGHlmyooCeukzCHPICy04tGwa9LnbVEMDxFXKYQejNic/uw==
X-Received: by 2002:a2e:96cd:0:b0:2af:22a0:81ec with SMTP id d13-20020a2e96cd000000b002af22a081ecmr729672ljj.27.1684494180206;
        Fri, 19 May 2023 04:03:00 -0700 (PDT)
Received: from fedora (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id u22-20020a2e91d6000000b002a8c3ca2541sm776405ljg.121.2023.05.19.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 04:02:59 -0700 (PDT)
Date:   Fri, 19 May 2023 14:02:55 +0300
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Andreas Klinger <ak@it-klinger.de>,
        Marcin Wojtas <mw@semihalf.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, netdev@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v5 6/8] pinctrl: pistachio: relax return value check for IRQ
 get
Message-ID: <5d74bdf2ef8738aec0b419392b8d0f38a1b0728b.1684493615.git.mazziesaccount@gmail.com>
References: <cover.1684493615.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EBwGya5SWaZBlZjq"
Content-Disposition: inline
In-Reply-To: <cover.1684493615.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EBwGya5SWaZBlZjq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

fwnode_irq_get[_byname]() were changed to not return 0 anymore.

Drop check for return value 0.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>

---
Please note, I took Linus' reply to v4 cover-letter as ack && added the
tag. Please let me know if this was not Ok.

The first patch of the series changes the fwnode_irq_get() so this depends
on the first patch of the series and should not be applied alone.
---
 drivers/pinctrl/pinctrl-pistachio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-=
pistachio.c
index 53408344927a..8c50e0091b32 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1393,12 +1393,6 @@ static int pistachio_gpio_register(struct pistachio_=
pinctrl *pctl)
 			dev_err(pctl->dev, "Failed to retrieve IRQ for bank %u\n", i);
 			goto err;
 		}
-		if (!ret) {
-			fwnode_handle_put(child);
-			dev_err(pctl->dev, "No IRQ for bank %u\n", i);
-			ret =3D -EINVAL;
-			goto err;
-		}
 		irq =3D ret;
=20
 		bank =3D &pctl->gpio_banks[i];
--=20
2.40.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--EBwGya5SWaZBlZjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmRnV14ACgkQeFA3/03a
ocUCHQgAo00zjwHgiDD8DsyK3hrwyBMb6+mnsxxTll9Lx3w+m0I5FwYzoX8BbilU
bqImsiQgUxtVa2iQ6eTtQ46XV7jfkRhZUXEf6Z9RfLsfvjru1kAbjXwiImEj4Cat
kXx+v0iob8wdg/NvXElIb8CRa4+CXPQbdOTKcmFEltMCQLFFLImHx5DRwCru4iy+
RH7Hdh+bIk+FGIvCmhGkLC+RgI8Ba9ArI26e7t+D/eOrnmer0doz8N37eUdpnMQr
xoA2GlESfzwfn0vECAQPGYDfWTieSrdzMmZ60ZnxILu/6QBS5OnrWTybrukSZAFo
6D4rRxjgbgCmWlqkBWLjIck/fKjUlA==
=Qt9e
-----END PGP SIGNATURE-----

--EBwGya5SWaZBlZjq--
