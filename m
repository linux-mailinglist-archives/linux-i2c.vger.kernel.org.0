Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E3260D00A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 17:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbiJYPL6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 11:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbiJYPL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 11:11:58 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E051F2C2;
        Tue, 25 Oct 2022 08:11:56 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id z24so7343412ljn.4;
        Tue, 25 Oct 2022 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ2+YP+cPm60d2/5NOUBXuBeSPhDydv5METYzP/z0a4=;
        b=AoD0+jUlhKuShGAvHefomjU16pIUI47QirDqHeF6R9B/SKWtuWB+XEeXrH/2tq6Myx
         6J90gflCVR+PUzUYY8WXi38WQ4P4vSseIBqz6UL3LKdbHtnaI5Sn4ECWDpp+SgBYd3Cw
         HL4xWKl3CC+KX2lTfwpL3OwnJgamLbFIF5zxasQFa/AJLcawT2MffG2+1MOIwhJUXO5B
         1TAIcN8YJTrFEmWliIeSsNorOv9OvOo8zTycao/B9KOxF47lC2tv5s6lpqdG0IIECG+x
         XH6P+0XpejVLFiJ7AKJYf3S8SkJv+c/q5bZ9YPYHdpidp5bf+J4y2Ry1a2Oidtzr+31/
         9olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ2+YP+cPm60d2/5NOUBXuBeSPhDydv5METYzP/z0a4=;
        b=hUgWAHN9m0QooupihleE9tTHAWO5L66beu9V+QOtNyQMHX6uVLcKJ5poqE0kYqHhCL
         /zYEVYnfouxGS76kzVKBquDgC/Z/1SfY0tzymvZa5I+OJRNyhHBeLmi7zHYBrFeDiE+F
         VdjSTSysK+//8yyT+tqZpiL5Kk27oh8p3MJ2g8YoTDhEaXiEqDW4YUktMzLrW6jKEQFu
         lWJrJhYiznPN6XAlpsovMNDzbjB7BtHIOwNjDBD7dFMnkR1gOIiUs+8/JtiEIi0bwDRn
         Pq605RTspktS61huij1TBwKB22m1jSr2YUpl0DzMquxyP8R1XCJZC5Ly84ArnGZmJZLg
         eE+w==
X-Gm-Message-State: ACrzQf1Ic5U2WpoSv8LngjK7Ni9LykTennuSmD81vhAj7SnP6sat/wFi
        y9bIm7SPZzuyB2E8zhzG9gs=
X-Google-Smtp-Source: AMsMyM4RpDJZQC14HbxKi/x9pYMmm2HRPKLbHmzUIaGRcuIwg5PACYftISFclsh6Z1EYORgJJYz6BA==
X-Received: by 2002:a05:651c:1111:b0:26f:eb56:5844 with SMTP id e17-20020a05651c111100b0026feb565844mr15107789ljo.4.1666710715209;
        Tue, 25 Oct 2022 08:11:55 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id c7-20020a056512074700b004a46f92a15bsm455046lfs.41.2022.10.25.08.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:11:54 -0700 (PDT)
Date:   Tue, 25 Oct 2022 18:11:49 +0300
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
Subject: [PATCH v2 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <a3bf7094a9f9ebf114736dc7944553dcc701fe73.1666710197.git.mazziesaccount@gmail.com>
References: <cover.1666710197.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A023IJH4n4xEpZ4V"
Content-Disposition: inline
In-Reply-To: <cover.1666710197.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A023IJH4n4xEpZ4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fwnode_irq_get_byname() does return 0 upon device-tree IRQ mapping
failure. This is contradicting the function documentation and can
potentially be a source of errors like:

int probe(...) {
	...

	irq =3D fwnode_irq_get_byname();
	if (irq <=3D 0)
		return irq;

	...
}

Here we do correctly check the return value from fwnode_irq_get_byname()
but the driver probe will now return success. (There was already one
such user in-tree).

Change the fwnode_irq_get_byname() to work as documented and according to
the common convention and abd always return a negative errno upon failure.

Fixes: ca0acb511c21 ("device property: Add fwnode_irq_get_byname")
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
v1 =3D> v2:
- change check if (!ret) =3D> if (ret =3D=3D 0), add comment.
- fix drop redundant empty line.

I did a quick audit for the callers at v6.1-rc2:
drivers/i2c/i2c-smbus.c
drivers/iio/accel/adxl355_core.c
drivers/iio/gyro/fxas21002c_core.c
drivers/iio/imu/adis16480.c
drivers/iio/imu/bmi160/bmi160_core.c
drivers/iio/imu/bmi160/bmi160_core.c

I did not spot any errors to be caused by this change. There will be a
functional change in i2c-smbus.c as the probe will now return -EINVAL
should the IRQ dt-mapping fail. It'd be nice if this was checked to be
Ok by the peeps knowing the i2c-smbus :)
---
 drivers/base/property.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 4d6278a84868..b4ccc64f7bd2 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -964,7 +964,7 @@ EXPORT_SYMBOL(fwnode_irq_get);
  */
 int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *=
name)
 {
-	int index;
+	int index, ret;
=20
 	if (!name)
 		return -EINVAL;
@@ -973,7 +973,12 @@ int fwnode_irq_get_byname(const struct fwnode_handle *=
fwnode, const char *name)
 	if (index < 0)
 		return index;
=20
-	return fwnode_irq_get(fwnode, index);
+	ret =3D fwnode_irq_get(fwnode, index);
+	/* We treat mapping errors as invalid case */
+	if (ret =3D=3D 0)
+		return -EINVAL;
+
+	return ret;
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
=20
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

--A023IJH4n4xEpZ4V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNX/LUACgkQeFA3/03a
ocXoQwf/U38IGZg2gZXDJsSsSwQB6GvJ0ne1TVbUxPp7/RBAQFVKg8yFZnsKtmPS
Hw91FqYW+/MTBEIqXMf/bCyVre76cUDb56VMZ+mk2rED3h41mJ3Lew0NSmwXA9/b
kjYxjhrAlQWXYIGZcooXmkWpt7WvrRx1Fu7BUy3K19wwXYGQUnrEoIoARWM1GjOo
3/3gLpOt1aoSM+6rVw28cOcoKqKnD0b7+WxeChaXXRgoQOgGkABpgC6weQlzrno9
HUq7BIKf0Ox9KuRtit5MCFP4UZCrMvXzCs4Y9XtaX3Qbz3UhqeE5YqR75tw+EWPw
5/NvEve7tW6L7S184ef7uOq+djXWZw==
=V8kr
-----END PGP SIGNATURE-----

--A023IJH4n4xEpZ4V--
