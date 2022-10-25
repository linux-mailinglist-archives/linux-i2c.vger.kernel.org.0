Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33A5C60C6E4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 10:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbiJYIuq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 04:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiJYIup (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 04:50:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540CAE31BA;
        Tue, 25 Oct 2022 01:50:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b2so20753236lfp.6;
        Tue, 25 Oct 2022 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ThKIv3p/MunjRRcs90V/JUQZIVOWApuxjs8vyFYsMxw=;
        b=XxncA3KI8siFx2VjT4NwTCMr/0b9E4ZXVdYrXeLCpjtX01m69ESKM5nj/VrV00gv2W
         2U814RfoLlrmtE/wxXEVqdtsaHVmFieOZtwopoZoCRKmW72iy4GWXP7/XgbRXvFJ9nWI
         kW8sCnePTDHQPCBPue8no6Oo5apO0n8Q0/hOseLFEp2DXWKeyK4vMO0sJtLCXOwzpfMT
         +FQSCtjM5Nx8Ppmr3ufk0a4ZrzFLKURmNrrdmKWfT5s1fLaDPnsRmGjHXlpGPBan8fM/
         mpU8kZl33OdY/NFYw6UcHK17GfOXbVWlo42EsMew0KZwZDoPMW4lnImTXAZOqNxwSQIW
         gTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThKIv3p/MunjRRcs90V/JUQZIVOWApuxjs8vyFYsMxw=;
        b=kF1SoGT0Z04IyIbDAW178Q/+FTQ5vXSKwcrAw80xTUXUZ3Aw461ITGsZ9nGRqp4ClM
         XhcOmcaXxeW9YCSk5h+DGvEe1dMaHbUre3Yr2nbwf8qEZLfivFtrvtqlNVnECQFZDaOl
         uh+R4vqNjTeAjCrdICKOvphEX8FqdqBCzpfDqd+iiewCfxLbddy99ryaaudLfyBTeXVj
         zLswlsvUo2VxbnubVk60jlxxyPlCzuhx95WSnB7/FhGJG9xezrfnWDGV/DE/GgJnAjZW
         XXz7QAoeaoWhAkkMAudFB+iviqJUsGkH9vD7QM56lWVvCmUr5nUk7R08xhJ4kMyi1kQo
         ZL6w==
X-Gm-Message-State: ACrzQf2AAFI54aeKOeGvETqYh6M2+/Vc0JyUlfSYGswiyoq5FVauIHxz
        9udWcbZs2gacUNgEufN50XE=
X-Google-Smtp-Source: AMsMyM7L/Xk5Ter4HACaAUtohVX+eTWaQayZfRuwjMG6OSlh6cb9q+nkjasnUmb8yegVPFiFgb3Zqg==
X-Received: by 2002:ac2:5e35:0:b0:4ab:a198:73ad with SMTP id o21-20020ac25e35000000b004aba19873admr3598836lfg.295.1666687842491;
        Tue, 25 Oct 2022 01:50:42 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id s7-20020ac25fa7000000b0048aa9d67483sm322701lfe.160.2022.10.25.01.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 01:50:41 -0700 (PDT)
Date:   Tue, 25 Oct 2022 11:50:24 +0300
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
Subject: [PATCH 0/2] fix fwnode_irq_get_byname() returnvalue
Message-ID: <cover.1666687086.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aUVJkUmvAY2RFD/9"
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


--aUVJkUmvAY2RFD/9
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

--aUVJkUmvAY2RFD/9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNXo0EACgkQeFA3/03a
ocVyCwgAhUhtoCJ+uLjTTM8cjS/ilbLeicDA5oO0xSLmJxkPK4mgSeAF+XBLUC1h
I/UnfSngtUpMk/hPAk6iu+T5SF7kxiUvGO+AWuXCWsTkG7fZx1Ie/YiVsgkq+Wbw
cbEKzHbPcWjWsoHTRIEbX/mJYlFZY3u4zvoP37+Fmr9plOTUb9FFJinFohViiKB/
sECvsQfJNSHht6y8ucrgABt3kXkX7F8MkFfId4nGaW3fo4BV9z1L2ICr5sS9riVc
baWcVStdCbGMxprLftml1p5RNYn9mt3MfpBfgvaD46nQiw9Z3lsB3ptmCsDitAcU
fQ6Bx6a/08z2zITDolkmv2kHLZTurA==
=fqmE
-----END PGP SIGNATURE-----

--aUVJkUmvAY2RFD/9--
