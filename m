Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8FC7001E1
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 09:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240105AbjELHya (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 03:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240351AbjELHyJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 03:54:09 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03907100CE;
        Fri, 12 May 2023 00:53:51 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac8091351eso101835801fa.2;
        Fri, 12 May 2023 00:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683878025; x=1686470025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UamIyRZFBw0Clb1Qm1i1FDtoVxcrvBBxLqTrmWJ4kUM=;
        b=D8Nfc850hE+XcwHJJnodIg9lQCxPABMpNE8TbL4p2gx6vCBNNWMD8mRzuXKu3uG2lT
         f4r2EKd8yuMjEtM6VavfoemsphC2bhF5K4RGoWXRQLyl+niVwqjfRlnGj6ZxvDLQuncQ
         qa5oK5QtZQ3gOOAEiDNccDJpahMSkHZa3c0BQ/UGwVl5sYXQnFpKp64dJoKuNwhdSy//
         7yQIpoMWbISAjtGPlOR3pO/7Yv8cKtNV8jZP8rAxer3yrSlgXHbyDJYI5Png6/rPcBkn
         GYP3I0sgq5Als22F3lvCfZ0c5Iqgbzo2Fi5pe84Maoq2Oek4A9xuMWa5c1a9vttTHb/r
         Qf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683878025; x=1686470025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UamIyRZFBw0Clb1Qm1i1FDtoVxcrvBBxLqTrmWJ4kUM=;
        b=HrgYkHBmww4Wmkxj06QpYj7knbbg9ZYiQUwxaop5usWRqoa+VJmjqyAVunvYct4K/I
         XxVivNqhQ55cPtZ857MS5LG6Cv5v6DaYNCQmAITsVebAyjfGfGGle9arHfZ8l0D3vAKr
         7UqMOLl1TUZ4urDueCAF809eY0PkdhFpU4mEGewTHmJ329sYxFCXBzjoL0QcgB3Imyaq
         Qq7IHQf9KEAmAo4Ela1SPt61xsfC/HhgxTvC821LhawwN8FmrsMS4A3Pkurp8xjXl5wz
         M02VLvAvWWAY41va9RpXvaS+i2KBcj/OlRmx5uIjyXLk0pdP5H8hzaO9YWnGJXYjzLfQ
         OYXg==
X-Gm-Message-State: AC+VfDxqBjiH+NirDAgTP93jOucNerRmUf+B9Radpshy3xeX+QLFm6LY
        Xr3SfdBfiBi3qn6yiGhfXgc=
X-Google-Smtp-Source: ACHHUZ5tTAE/td2qUR/2Oxfo7q0tt4popK4haev3B//DkXySakT8sBeWAwj/t8s7JKOp5UNIAK2d7A==
X-Received: by 2002:a2e:3211:0:b0:2a8:ba15:eb6f with SMTP id y17-20020a2e3211000000b002a8ba15eb6fmr3979864ljy.6.1683878024857;
        Fri, 12 May 2023 00:53:44 -0700 (PDT)
Received: from fedora (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id z12-20020a19f70c000000b004db3d57c3a8sm1383610lfe.96.2023.05.12.00.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 00:53:44 -0700 (PDT)
Date:   Fri, 12 May 2023 10:53:41 +0300
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
Subject: [PATCH v3 3/3] iio: kx022a fix irq getting
Message-ID: <b45b4b638db109c6078d243252df3a7b0485f7d5.1683875389.git.mazziesaccount@gmail.com>
References: <cover.1683875389.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6Xa8OXPmvG4fszxi"
Content-Disposition: inline
In-Reply-To: <cover.1683875389.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6Xa8OXPmvG4fszxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fwnode_irq_get_byname() was returning 0 at device-tree mapping
error. If this occurred, the KX022A driver did abort the probe but
errorneously directly returned the return value from
fwnode_irq_get_byname() from probe. In case of a device-tree mapping
error this indicated success.

The fwnode_irq_get_byname() has since been fixed to not return zero on
error so the check for fwnode_irq_get_byname() can be relaxed to only
treat negative values as errors. This will also do decent fix even when
backported to branches where fwnode_irq_get_byname() can still return
zero on error because KX022A probe should later fail at IRQ requesting
and a prober error handling should follow.

Relax the return value check for fwnode_irq_get_byname() to only treat
negative values as errors.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202305110245.MFxC9bUj-lkp@intel.com/
Link: https://lore.kernel.org/r/202305110245.MFxC9bUj-lkp@intel.com/
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Fixes: 7c1d1677b322 ("iio: accel: Support Kionix/ROHM KX022A accelerometer")
---
 drivers/iio/accel/kionix-kx022a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-k=
x022a.c
index f98393d74666..b8636fa8eaeb 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -1048,7 +1048,7 @@ int kx022a_probe_internal(struct device *dev)
 		data->ien_reg =3D KX022A_REG_INC4;
 	} else {
 		irq =3D fwnode_irq_get_byname(fwnode, "INT2");
-		if (irq <=3D 0)
+		if (irq < 0)
 			return dev_err_probe(dev, irq, "No suitable IRQ\n");
=20
 		data->inc_reg =3D KX022A_REG_INC5;
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

--6Xa8OXPmvG4fszxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmRd8IQACgkQeFA3/03a
ocVELQf+L8qn+fDoOikmGkAkEd5YHCTzMA0lR7U4izBd2okzfB0yNHNScFafCv75
YA5yeTb8IIoUsUwyigjEZ6cNFAaIStnhTbX4zjTekhrD5NVDvWwA2coqpheAlpCc
k3jyi+W1JftnH/z1CTpDZp2jQBn7Bounm5l+ZE/H41qGVdWsSB5upcMmfKllzpl+
yWU+vqJu+PhRefmisl+YHVhd91/olg4V3L/etM31Qf3GoNpZMvWfPKmFwkjoz/q3
x1X9TwTXfKi1bY1QFxWiS8MmQIogsYpm64iJF4LzuYGQl8OkP/GZ66m9kXCTcM8l
3ChtzSsZ84w2Ha0WiW0MwjUUIxGQtA==
=Cws9
-----END PGP SIGNATURE-----

--6Xa8OXPmvG4fszxi--
