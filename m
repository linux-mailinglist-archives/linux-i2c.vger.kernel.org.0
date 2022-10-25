Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D11C60D006
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 17:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbiJYPLj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 11:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbiJYPLi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 11:11:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213391A9916;
        Tue, 25 Oct 2022 08:11:36 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id o12so22575494lfq.9;
        Tue, 25 Oct 2022 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MWul1tU4IjkmONdULsGbXx3VTw+2F7vYwrYbT4qfDWk=;
        b=Z+al1FwzheJmJi29u7rREJFZgLX1IOoO3LjLp9XVN7j70XdxwCew3JkHhWQi+mzeSN
         RLshy1L3ieOmjUfJBUUR5XA/AJzyYtCI7gO5HCv7qP87Ruzkm+Rp/aSuAhgNtaMiuXvQ
         47xvgR1meAZ7av5MtGB8OlyzoHKZnaCjrBPL1ejjMphg3ef8WammYiTm9uLPcbraJwTI
         tR9+IHCNyezLUfwsMuj+dAmdJz6fgqbRRtFLQyZhRSKQDGNkwRbXBv3IEZkJRtWhekCp
         74CcTwSUCDTHyBM5nO6oT28pwIziOyNfuDrZ+4Pq4h+28vd+DsdSqBeME/xZfu6d+VQZ
         7nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWul1tU4IjkmONdULsGbXx3VTw+2F7vYwrYbT4qfDWk=;
        b=lgZaFMmZRKZS0D7Ikbzh7QC+A5PNizJLpZwnVwQuNBTQC68hiJcWFbKDXuIX1bp4yl
         ejedH991rsKMKEP7N8OpHgmherh7NuK7YY+SFQqJa5mQkIOhDZL3zvld1YL8ne8ba+tR
         tBuXLtI5byd0ut7hi7kzDzuaP/7+jbQyGfjZMQbX7flDZhabgBzZ8UHVtrVMS9jAr4oL
         uJASqVW2uKRj8AwKn1BD39ohccnKfRu2jf9XfbiREzfnFZ2KHx515hDqvEeOhcMV1QJP
         zyYvLgCd2xOfbofMei6yLlW9blO38FXKuNezTA/Xj+Ta0QESOj1DXvldnoWlFXNLrgdS
         3vRg==
X-Gm-Message-State: ACrzQf2Ho3nFyg6y5iZnUbNpq97YkY8IdFl8ZcZQsMMLn9m9D3NYpcvo
        0sS2zY9EiVnuZbaGgxsfyhY=
X-Google-Smtp-Source: AMsMyM52GZYPhz8VhljMtqnPuDj5cPIm5wR/Vd3dmECrYTZ7fu2asTreYMNi4h8a3wyrs9SRb9zjqg==
X-Received: by 2002:a05:6512:75:b0:4a4:6c3e:a75d with SMTP id i21-20020a056512007500b004a46c3ea75dmr13354062lfo.408.1666710694300;
        Tue, 25 Oct 2022 08:11:34 -0700 (PDT)
Received: from fedora (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id n11-20020ac2490b000000b004979df1c1fasm453946lfi.61.2022.10.25.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:11:33 -0700 (PDT)
Date:   Tue, 25 Oct 2022 18:11:26 +0300
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
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/2] fix fwnode_irq_get_byname() returnvalue
Message-ID: <cover.1666710197.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t1R8QCdkJ9VqjNyC"
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t1R8QCdkJ9VqjNyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fix fwnode_irq_get_byname() may have returned zero if mapping the
IRQ fails. This contradicts the documentation. Furthermore, returning
zero or errno on error is unepected and can easily lead to problems
like:

int probe(foo)
{
=2E..
	ret =3D fwnode_irq_get_byname(...);
	if (ret < 0)
		return ret;
=2E..
}

or

int probe(foo)
{
=2E..
	ret =3D fwnode_irq_get_byname(...);
	if (ret <=3D 0)
		return ret;
=2E..
}

which are both likely to be wrong. First treats zero as successful call and
misses the IRQ mapping failure. Second returns zero from probe even though
it detects the IRQ mapping failure correvtly.

Here we change the fwnode_irq_get_byname() to always return a negative
errno upon failure. I have also audited following callers:

drivers/i2c/i2c-smbus.c
drivers/iio/accel/adxl355_core.c
drivers/iio/gyro/fxas21002c_core.c
drivers/iio/imu/adis16480.c
drivers/iio/imu/bmi160/bmi160_core.c
drivers/iio/imu/bmi160/bmi160_core.c

and it seems to me these calls will be Ok after the change. The
i2c-smbus.c will gain a functional change (bugfix?) as after this patch
the probe will return -EINVAL should the IRQ mapping fail. The series
will also adjust the return value check for zero to be omitted.

Changelog v1 =3D> v2:
 - minor styling

---

Matti Vaittinen (2):
  drivers: fwnode: fix fwnode_irq_get_byname()
  i2c: i2c-smbus: fwnode_irq_get_byname() return value fix

 drivers/base/property.c | 9 +++++++--
 drivers/i2c/i2c-smbus.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)


base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740
--=20
2.37.3


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

--t1R8QCdkJ9VqjNyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNX/J4ACgkQeFA3/03a
ocXOkQgAq0+GJzHMzhUv+D5OZ0idZ4ZX0qKwMCcdTxS11fetfx2xqhNGDXhPMdOH
M8SJSo7HgvR5QNqGJ7se8c61BzXtigWjo6Jj0FJ/AQHjhFq3mgYMUnR74DfBw4yr
XZafFAhLk95WbMgOt/G3yXaFQPMK47yS4qW1yd1hd0sSnFFj7z3nNHZqvNah6YGF
pIGf3AThYnHGMJIwkaDnktHCpuo2+nDz2QptEVgxmUrOBSXCc+RnoayTU1wkEkj1
FrDQq1NnNIcB2N7SVqqRyfbpGPGo7ekpQRflJw1JA8x/67JFKh4645HtvYSEGaxx
uSteZw4Qe8L0d4gFs6OgvWcE/HuaRw==
=LzQ4
-----END PGP SIGNATURE-----

--t1R8QCdkJ9VqjNyC--
