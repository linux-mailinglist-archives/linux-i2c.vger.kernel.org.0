Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6616A60C6E8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 10:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbiJYIvS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 04:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbiJYIvJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 04:51:09 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE83100BEF;
        Tue, 25 Oct 2022 01:51:06 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id bn35so7203826ljb.5;
        Tue, 25 Oct 2022 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8R7Dzkg4GW8RstwwsY0aTGhaifKaL40i/WfeE85O4HQ=;
        b=M4gG5q52M/fQ9S4AOTPRH4k1dtWqpvOU0rll7wPOXPb3Bwet7P3t8f3mFv42GbrAy9
         5EURqb4L7WnK/nC3JOiYfyGIGCDzWD4i6bHe0GX6e4/4fdYuaGk5orrzxKxmyHHnH1zN
         u24zaLTaynom7ACPi3VX8hiX03meCkywL+o6ONYMDc5scpG5EccOSBdrcVeSalgbzLRA
         v5V3PsOAfFOcJUWy+q/jA/g+oCqwET8SAAEiVCdOT9tLmshrPsEBrUewWDE0z99G/q6B
         4rxDuEI7l8y/uV0E2Kinc6RPR7lKpJkMy3zF8fYozGaU+HIIUXEuq5+s56J/W0PPufAg
         Gp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8R7Dzkg4GW8RstwwsY0aTGhaifKaL40i/WfeE85O4HQ=;
        b=WjJnxSb30D1Za/VjN+lzib1JeT0D1FITxn53zBKuM9pWP1rAuJuPzVcdZ1b2K8AUKf
         tP56pn/17WP3s7VM8We1wasPGpJvpu+R5sxFhwhMSNCXo5C9i4lYmVKoXBCmHMWH3FjX
         YWPCmcayDn/Cof7ZrBoo9i3fvZKecaWhZcHfBBoMpCdPW6Dlb1YcVzGcAJfkPh8RsA2w
         qPTauK9cNYCaP4w3nmVLxQokF/EljO9lRSKrJE4/EIN9muNORRu4cKHdI/DbrVmSNnZF
         Rz0X2qSuGTxUEO575l1dW5GlfDm6/ZM4Zrjtly60V5iw9Q9oppxUD5O6PEQzWuCcbNbI
         kIeQ==
X-Gm-Message-State: ACrzQf06MhXtJNTKCnqaeQHB853PyXS8rulsC0dffQ/G/+WLrMAg23qZ
        YzZ8GygLwV1Y19MRf8X6ydRlLod0FC0=
X-Google-Smtp-Source: AMsMyM7n1L9PPIffLH1ajY4W5iGiaOUMO2bRde9qkIiM0wgTpAlSYIFbHPglgLZnhCsLvU6I+4GokQ==
X-Received: by 2002:a2e:9b17:0:b0:26e:367c:c904 with SMTP id u23-20020a2e9b17000000b0026e367cc904mr14717348lji.326.1666687864570;
        Tue, 25 Oct 2022 01:51:04 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512114400b0049b8c0571e5sm326150lfg.113.2022.10.25.01.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 01:51:03 -0700 (PDT)
Date:   Tue, 25 Oct 2022 11:50:59 +0300
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
Subject: [PATCH 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
References: <cover.1666687086.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GQxlVILDjRRRfse1"
Content-Disposition: inline
In-Reply-To: <cover.1666687086.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GQxlVILDjRRRfse1
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

---

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
index 4d6278a84868..bfc6c7286db2 100644
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
+
+	if (!ret)
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

--GQxlVILDjRRRfse1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNXo3MACgkQeFA3/03a
ocXUzQgAn/FudubW4sIYBT7m0pcwLuUrpgxF94sHleHEANpl5VKG+DAjUvfGkPCT
W5MI0fXk/mJU+FwGq4LBHkJ2sr0olRVSae/WF4f2sv9uNe+f+yawhldv5lvqmdep
oHPSmvffRbOcey7CWfDTflCI4zeTx8nP/g6Cl6Mcn3t1QC3zUKBo78wDZjFzjXuQ
lP1blOvkezJJBPl1n0wWXBVlyYrNEqddk3UzMz7KBtTe/tfpCIv5rK9LfdLanLaf
PmKsNMhp23yGQgIUeHBfQ2VK/C7DpCiEPuMEQcYSed1sw+i04MZ2RhgJc2r5cBRm
mWXSe/6AjyKjKgNQI3190zCQZmANvA==
=p8W2
-----END PGP SIGNATURE-----

--GQxlVILDjRRRfse1--
