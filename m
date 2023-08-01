Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375BF76B444
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 14:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234470AbjHAMCV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 08:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234498AbjHAMCE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 08:02:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0371C449D;
        Tue,  1 Aug 2023 05:01:09 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so4862283e87.0;
        Tue, 01 Aug 2023 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690891265; x=1691496065;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0LjPdjjc4ZMKtqm7lOFvAlr5b1k31FiFS89qat9F8E=;
        b=eWYh/cUys2QzHEjwByAFe+4BypeE4zktjixesBwnezhhHPfzCGxcE69Sy1+S0JBLGM
         VfenZn1nm9R1Cq9WV/4H4SuKcJfd0I2lT1Fd2UFb4cAuo7GvK0FJzWsov3r5wdo7pSnj
         GVBCaO/rk5/O4zdI9FKoRW5hwagE4yFByZ7gXs98hAnCUlbM+AjhgDbAoDHyLehwCUX2
         QXYDkOSwu5UquWWPs2oHn6vJJV0Q3wlku2Stwq8rPu+f1ZIzIDRFEIrqOCF4JG2ATewW
         RxIAbSVweepFELcR7pBWI9/PtlLVTBtZfU1nQHUJaWJZmJlUHOn+Cp014ikdbwTjOnVz
         fJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690891265; x=1691496065;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0LjPdjjc4ZMKtqm7lOFvAlr5b1k31FiFS89qat9F8E=;
        b=Nwg6fxRKQR/TgUJYsKcOjLFlEBVmkuI7S/iisbg6EX4ZfPubLpY9oIclcjCe2NbHhB
         BHpkv2n6G9glg6+SOqt2nr+l32gRTNPAfW1XoKjRA4N7vtDxbBjgW9AL2yLeUO3FgItq
         QNQW6+9Y+4UkX/YKINZsazPu7sznCw55LhZaE6KR6+VJMMJ4Sl4hip1KSJSQW0fz+Yrx
         vaQCLyzoQonCeKKxAkTXeYRui9Is6Ym+c/7V0FL3qUfXwPoefTbA3NtkJHvD2vJ7rAlY
         Jeatn66bL88vkpO3sfjnL3lHSl78Hhr/4r6f/u1y222kXaaktINfTdENv3S3t5qG7+On
         TTLw==
X-Gm-Message-State: ABy/qLbT8x3xN3VVExf5S6ZeOj0CswAV5B1cPVxTI7uIsZfX9wXCGyyV
        4uMmeOgEk1kUKGN3LivRh3Q=
X-Google-Smtp-Source: APBJJlHL4GqflpupMzaWBM7H2XZV1jRjRXbT87fu1NbZ8XZ2KVgP10+16KOTPj7YJAZIvQ4uvQXMSg==
X-Received: by 2002:a05:6512:2010:b0:4fe:3724:fdb6 with SMTP id a16-20020a056512201000b004fe3724fdb6mr944608lfb.30.1690891264259;
        Tue, 01 Aug 2023 05:01:04 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id j15-20020ac2550f000000b004fe432108aesm368553lfk.261.2023.08.01.05.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 05:01:03 -0700 (PDT)
Date:   Tue, 1 Aug 2023 15:00:51 +0300
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Marcin Wojtas <mw@semihalf.com>, netdev@vger.kernel.org,
        Andreas Klinger <ak@it-klinger.de>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Paul Cercueil <paul@crapouillou.net>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Eric Dumazet <edumazet@google.com>, linux-i2c@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v8 0/8] fix fwnode_irq_get[_byname()] returnvalue
Message-ID: <cover.1690890774.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hQsyJyfrnR1cLwNR"
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hQsyJyfrnR1cLwNR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fwnode_irq_get() and the fwnode_irq_get_byname() may have returned
zero if mapping the IRQ fails. This contradicts the
fwnode_irq_get_byname() documentation. Furthermore, returning zero or
errno on error is unepected and can easily lead to problems
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

Thus the fwnode_irq_get() and the fwnode_irq_get_byname() were changed to
always return a negative errno upon failure.

https://lore.kernel.org/all/fb7241d3-d1d1-1c37-919b-488d6d007484@gmail.com/

This is a clean-up patch to adjust callers. Please note that callers
were audited based on v6.4-rc2:

fwnode_irq_get_byname():
drivers/i2c/i2c-smbus.c
drivers/iio/accel/adxl355_core.c
drivers/iio/accel/kionix-kx022a.c
drivers/iio/adc/ad4130.c
drivers/iio/adc/max11410.c
drivers/iio/addac/ad74115.c
drivers/iio/gyro/fxas21002c_core.c
drivers/iio/imu/adis16480.c
drivers/iio/imu/bmi160/bmi160_core.c
drivers/iio/imu/bmi160/bmi160_core.c

fwnode_irq_get():
drivers/gpio/gpio-dwapb.c
drivers/iio/chemical/scd30_serial.c
drivers/iio/proximity/mb1232.c
drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
drivers/net/mdio/fwnode_mdio.c
drivers/pinctrl/pinctrl-ingenic.c
drivers/pinctrl/pinctrl-microchip-sgpio.c
drivers/pinctrl/pinctrl-pistachio.c

and it seems to me these calls will be Ok after this clean-up. The
i2c-smbus.c and kionix-kx022a.c will gain a functional change (bugfix?) as
after this patch the probe will return -EINVAL should the IRQ mapping fail.
The series will also adjust the return value check for zero to be omitted.

NOTES:

Changes are compile-tested only.

drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
will also gain a functional change. The pinctrl-wpcm450.c change is easy
to see - after this series the device-tree mapping failures will be
handled as any other errors - probe will be aborted with -EINVAL. Other
feasible option could be treating other errors in IRQ getting same way
as the DT mapping failures - just silently skip the IRQ. Please see
comment in the respective patch.

drivers/iio/cdc/ad7150.c
Changed logic so that all the IRQ getting errors jump to the same
'no-IRQ' branch as the DT mapping error did.

Revision history:
v7 =3D> v8:
 - drop ptach 1/N which was merged during 6.4 development.
 - rebase on top of the v6.5-rc4.
v6 =3D> v7:
 - re-ordered patches per subsystem
 - mvpp2 - added a patch for not shadowing the return value
v5 =3D> v6:
 - iio: cdc: ad7150 - never abort probe if IRQ getting fails
v4 =3D> v5:
 - Fix subject lines for mvpp2 and wpcm450
 - drop unnecessary irqno assignment from mb1232
 - add back the drivers/i2c/i2c-smbus.c change which was accidentally
   dropped during v3 =3D> v4 work
v3 =3D> v4:
 - Change also the fwnode_irq_get() as was suggested by Jonathan.
Changelog v2 =3D> v3:
 - rebase/resend/add kx022a fix.
Changelog v1 =3D> v2:
 - minor styling

---

Matti Vaittinen (8):
  iio: mb1232: relax return value check for IRQ get
  iio: cdc: ad7150: relax return value check for IRQ get
  pinctrl: wpcm450: relax return value check for IRQ get
  pinctrl: ingenic: relax return value check for IRQ get
  pinctrl: pistachio: relax return value check for IRQ get
  i2c: i2c-smbus: fwnode_irq_get_byname() return value fix
  net-next: mvpp2: relax return value check for IRQ get
  net-next: mvpp2: don't shadow error

 drivers/i2c/i2c-smbus.c                         |  2 +-
 drivers/iio/cdc/ad7150.c                        | 10 +++++-----
 drivers/iio/proximity/mb1232.c                  |  7 ++-----
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 12 ++++++------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c       |  2 --
 drivers/pinctrl/pinctrl-ingenic.c               |  2 --
 drivers/pinctrl/pinctrl-pistachio.c             |  6 ------
 7 files changed, 14 insertions(+), 27 deletions(-)


base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
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

--hQsyJyfrnR1cLwNR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmTI8+0ACgkQeFA3/03a
ocWq6AgArSM5A9chUh4M5+/vENizsF6p+0LbIPfIwCcHNYQHv4XehXim+Yv/RJkY
Faie7r6CXkLdlbLi4glk2/WNiT2pKgBxm0/UbvGdsRe5kjMvS8CTPI3eJZFRXYuk
eCvwYqPyXd7bVsvBZpqSMn1geHHmeabPjEaP5uyfABDmuM8YBRdmGLaE58EdQbIn
hFJGWYgBGeVaQw4lDfmV8Qjsj1OFkqH0TY2LhgrEMefmIMU1tkGcr48m1shmUuNf
IbqyYt4VUfzOG3j/mP5E+CTTE1icgSOOBcmflbXTJSjb/6EOwfhvti6w314CGZeX
719Kq2PefFeoH1/0OUvKRWpDqM43ZA==
=Q8AR
-----END PGP SIGNATURE-----

--hQsyJyfrnR1cLwNR--
