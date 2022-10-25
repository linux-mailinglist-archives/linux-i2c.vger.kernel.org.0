Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4BD460D010
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 17:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbiJYPMW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 11:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbiJYPMU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 11:12:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A9740BD9;
        Tue, 25 Oct 2022 08:12:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u2so8169642ljl.3;
        Tue, 25 Oct 2022 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3VCaLUSkP0MHn9g1Bdf8SvWr5beC5vVRYzG/hEHOwM=;
        b=KTXHatYhfbJ2a1sMmM8whproz8b9Ke5Q7Nnzl12OSpOZiXx2lNMEkbn0qSlv0WvCbd
         7T0E/h+cX2gK+AVbtSMBG/I1CuRTDL1tMME+E5KkPVn+oghs3XSqj+RKpjkBSBxQZbMW
         94mZIyqeZRnuHH/3uSzyyGuEVGrL77eXiScoBqnSO978mmuxRreEpOIEqnoFXqaCrYxy
         g5VQLqd6SQoo6P48TPIWMstK2atLw0NASknSIC7DdswGQuZATKNYy7sdqSDg02C+/ZTB
         KnEmC+dkqLARf7ALRt2jx96PYE9aqWBguXjkGmu19mONskqZDIfC3CcnmI+/PoDOtgdY
         kMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3VCaLUSkP0MHn9g1Bdf8SvWr5beC5vVRYzG/hEHOwM=;
        b=4g4Y4vgumlDH7SvqBzY64abRzb1C16FTjwCbDLxMe5Cu1o9qmQmfy8tGnVPnENzMRi
         ogrXUve8ClgJ667S+m6nPTEZy71WbosCBIwZplsY9lQ3Owvp/b14DgdiIm3kBOL5/L1g
         4iptTQ6rXTVCsyRLlHOlviuQKuaf2rC7s5QEIH5qp9pKlot/Sg7WC+TdzHGinu4Y13aa
         SaC+IiUXup4G3eR+ateH61nX4BzkfrjGl0ZT0UXrjwXrY356Wr0m2b59eKtIXtpMlGw8
         CPKM8MvTzv9JiM/hNrey276DdCDGf1LMzxct4xEu+yqi68X5BxvgJ0XNPG+gj7EY+8W5
         ZpBg==
X-Gm-Message-State: ACrzQf0ChNU/aeXdPwvb2zTdsHfQEjeLMEPdeq3yj5vLy+1o2xR8LBvf
        NXQ5siF4r5EnFDbWH3g5pnA=
X-Google-Smtp-Source: AMsMyM4jlDjlJdOcztU47g3WlSh0KAN2tsPbAB0uuR9Wdc6tOFQwxyKUmQJCshu5WmoQd2gwwryK1A==
X-Received: by 2002:a05:651c:1241:b0:261:9313:9cb9 with SMTP id h1-20020a05651c124100b0026193139cb9mr14393521ljh.213.1666710737399;
        Tue, 25 Oct 2022 08:12:17 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id r7-20020a2eb607000000b0026befa96249sm545053ljn.8.2022.10.25.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:12:16 -0700 (PDT)
Date:   Tue, 25 Oct 2022 18:12:11 +0300
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
Subject: [PATCH v2 2/2] i2c: i2c-smbus: fwnode_irq_get_byname() return value
 fix
Message-ID: <fbd52f5f5253b382b8d7b3e8046134de29f965b8.1666710197.git.mazziesaccount@gmail.com>
References: <cover.1666710197.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l4NgxrvU12sZ6SXP"
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


--l4NgxrvU12sZ6SXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fwnode_irq_get_byname() was changed to not return 0 upon failure so
return value check can be adjusted to reflect the change.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---

Depends on the mentioned return value change which is in patch 1/2. The
return value change does also cause a functional change here. Eg. when
IRQ mapping fails, the fwnode_irq_get_byname() no longer returns zero.
This will cause also the probe here to return nonzero failure. I guess
this is desired behaviour.
---
 drivers/i2c/i2c-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 07c92c8495a3..d0cc4b7903ed 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -130,7 +130,7 @@ static int smbalert_probe(struct i2c_client *ara,
 	} else {
 		irq =3D fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
 					    "smbus_alert");
-		if (irq <=3D 0)
+		if (irq < 0)
 			return irq;
 	}
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

--l4NgxrvU12sZ6SXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNX/MsACgkQeFA3/03a
ocXWjQf5Ad3uT3IcCKD9oMes2g8FBvhi9jtZG+MiQRlG7SXFk7Nb0B0otsRhUsCL
J9pHh/ISir/zwemhIHJ+6eJIf4NlOKe5IddaPy9W7CCiEQGIGkeQignTT7AUDlLR
apayaW6z5rE6le/DDU8VBXB6uNWNypGdWy053Ob6Q40VmN9VYpQU3IO+V4Gueo8y
dLH7UsQCl8jy/CYMWbNdxp38HsTKH7gvu8nXygA8t4AjeMPgXcF1tVxcX1E3aC6p
8rMcpMEJDiYy/bC4p4oXv4pV9iuBlPOO6i3okb2vKhKgCUOXDdXaqsb20hHyPdkX
W6TXLsT7BXgbqdDbquaTm+jcvmLf3w==
=TFxZ
-----END PGP SIGNATURE-----

--l4NgxrvU12sZ6SXP--
