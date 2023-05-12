Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1787001D1
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 09:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240339AbjELHxO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 03:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240310AbjELHxG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 03:53:06 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246A8E738;
        Fri, 12 May 2023 00:52:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f14468ef54so10960535e87.0;
        Fri, 12 May 2023 00:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683877967; x=1686469967;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfrfdrSrNKE90eE0l8Rc2KZKqXQ3Sz7SANrwHCEDoDk=;
        b=LLWpebN/XjBOI9ynbOxwWnrY5MbIAfDg8r4idfu1bpYIou99BvDMPBsqv0048lv0m3
         dSzG/f9J4FEIZUkNvWjGNilQO0iNdjaBvb9MASr99Wi90drA4oHzrYTM6IV2e8hdChhY
         qlj0XHTKrl/meTCzfRpNF0/8ADjDPgVZ92wyECkvkVvIabbshHmjucUB+k8uVFU96AZl
         us2f31b29ug/Bkcc3Xpml2SG8aNUNOpbUOeP96EoOiG9UND30VW+CFz7Uaqi5GmUpbSQ
         uhfuVRJt+oSbDMlD+z1LIamYDeIyTdu7z83eWEojxDo6nLP4CxgJ27GaFxElNOHRuBfQ
         Mczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683877967; x=1686469967;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfrfdrSrNKE90eE0l8Rc2KZKqXQ3Sz7SANrwHCEDoDk=;
        b=S0JKQKPCRHW+gwgJpxFbN1YGsBwc5lIK2XT54Ej+g1oFhyk+REyiRn3FHKlbGHYT6k
         84G7GWTFMSnUD6c/ghSRGBRAEGZqoqAFxZ0Gk2brOoHnR9zQLM9asvdkucWWipFd/Plt
         Red4WE3krtHb/3y0CF/G3Uvj3B7mFtrMAvsHDf4yg+gonGfJaDP8hkyG74IwUoPN9FXr
         4s01DIBO2p2JtO1YAU9sygHWjG1SSd6k5EO9zB8Ij8ChlkEDITrWfwV6cCli+dpT1LM+
         5/a0VNuE0v9VQxXWu01p3WQaWcmO6Ay47G72UUl2M8TVzoSOKbIk2zOe3xRaxxHXdBAK
         g0+Q==
X-Gm-Message-State: AC+VfDy7W0ROoMs3lDqdClof1vqhARYO02eM1Ups4+y2CnlTDTXY3bt9
        ujVOG062BA+7DoqMgJN4aQo=
X-Google-Smtp-Source: ACHHUZ4SQ1I2y3NrGxAklPxOegaQJ1TbG1EqTdvzK9IxvpJVYxGfm+D0mXFnSpAEvl1zqKXZ4Ub/TA==
X-Received: by 2002:ac2:50d3:0:b0:4f1:4a1a:ded7 with SMTP id h19-20020ac250d3000000b004f14a1aded7mr3778979lfm.37.1683877966823;
        Fri, 12 May 2023 00:52:46 -0700 (PDT)
Received: from fedora (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id e24-20020ac25478000000b004f25df23cddsm1104988lfn.170.2023.05.12.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 00:52:46 -0700 (PDT)
Date:   Fri, 12 May 2023 10:52:38 +0300
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
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org
Subject: [PATCH v3 0/3] fix fwnode_irq_get_byname() returnvalue
Message-ID: <cover.1683875389.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kJRFahmE85T8dRW8"
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


--kJRFahmE85T8dRW8
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
errno upon failure. I have also audited following callers (v6.4-rc1):

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

and it seems to me these calls will be Ok after the change. The
i2c-smbus.c and kionix-kx022a.c will gain a functional change (bugfix?) as
after this patch the probe will return -EINVAL should the IRQ mapping fail.
The series will also adjust the return value check for zero to be omitted.

---

Matti Vaittinen (3):
  drivers: fwnode: fix fwnode_irq_get_byname()
  i2c: i2c-smbus: fwnode_irq_get_byname() return value fix
  iio: kx022a fix irq getting

 drivers/base/property.c           | 9 +++++++--
 drivers/i2c/i2c-smbus.c           | 2 +-
 drivers/iio/accel/kionix-kx022a.c | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)


base-commit: ac9a78681b921877518763ba0e89202254349d1b
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

--kJRFahmE85T8dRW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmRd8EMACgkQeFA3/03a
ocXs+wgAgttVfEWuvTkynQaplS0Q1bgzeu4JzFj/jFU7MOlS9LcMUU4K4Wv5cKaC
Pv1Smr3TaijDvVDhXUPDQvfvoBZPy5L7BwnpGWRlKHLC4utLBDPTDvszvBOibGTO
GMHiwNBvl66ZZbyF3DM1c1jX6vP5aoWUk88Xm9KdCUYUEoyNcj4oV04RW9duxP+c
6Z0PViOuKKcdiTdXb3iskW2Y+gsraDyYvHXw8N9rr1jsQHgYvX8yfpcf3Nbs6rHF
ak7nt0xwcnzg9Z1bXLN4AL54FjZdZIFyr0tE6hokikTisychnFCZX9JJOvBDNBbA
Wy+WRp4rWm879aBtjbP3uOlt2C+OJA==
=1tud
-----END PGP SIGNATURE-----

--kJRFahmE85T8dRW8--
