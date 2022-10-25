Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3050460C6EB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 10:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbiJYIvq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 04:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbiJYIvg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 04:51:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D22104538;
        Tue, 25 Oct 2022 01:51:30 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z24so5908094ljn.4;
        Tue, 25 Oct 2022 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3rqVRlWpSG6VhxIJc6elhskuf/gfvFUZOs7XfqtDQ4=;
        b=PhT/oTUlDmRpv0Bb4JK6SuAV7SfeTBOaUeARe12U3pXsQ7U6TVJ2j5K2k+atR1d8vk
         tM/06kMcF6NbAP8TlOctINFiaTlEF2XMyhRbCtE3My5IfILstolxutOF1+WRdmdj1OBr
         fG0P0VIZAdmF7Dz9JUDKWM1fv5k2I8t3IBkfuaITggVmkgB5oDpcI0AUVJfc2k/h4hiU
         VsWRL5Jdq2PK4sTYIC1eAssKvX0VZWKLUzA0ovT9Z9endNqdJtA6eH4DCtzU1wlIaVaV
         JkV+gpAEOe0PykcmX1dq819Vu+62ZyojEfUVJRg4VqR6fFB1oFL4hkTndCwfOUW354sb
         AW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3rqVRlWpSG6VhxIJc6elhskuf/gfvFUZOs7XfqtDQ4=;
        b=Oq7ZGncmFMBoFjDydRf/8mfd8c27jpd3jIJvjmzi3AiVhIzVX9q1mzS7qf9g2hG6BA
         ku7rMn1IzbPu7V2IWUwzcdX+vx/48i+9Sa5KAtcII7T80uXOkdOyvZieCUEMJG23Jlcx
         ybstn2srDuOlm9p+KCfSZUWHw/B3DpCqX1O+UIdAeGJ0giDM6DBFfPPWxPhOVJUETXWI
         yccr7/XO19Ci+u90s8+iDPF0LKS+xPQ285kgA8z921xi98WSsqGbvf0E6B3CxGuL/lUd
         lBXw8XIBIfOvbr0fUMvM2w16+0Cojd8jyyjkGd5vsZtZN+EXfSutOdrMH4cx03MV5xyg
         DqRw==
X-Gm-Message-State: ACrzQf3hDivAcd58MLKtvM8hG3GAqMYFWwZNSnwOiBy+0CeHdSVqltv1
        /fToWH3PEaiXfR/wCnIjDHg=
X-Google-Smtp-Source: AMsMyM74Jng8VYpXW1kaXxr8PkbuDusArrxPGpGFkyFF195SvESqix+NnNDVN3E1lw3x2QQmuF19ig==
X-Received: by 2002:a2e:8541:0:b0:261:b44b:1a8b with SMTP id u1-20020a2e8541000000b00261b44b1a8bmr14594268ljj.46.1666687889255;
        Tue, 25 Oct 2022 01:51:29 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id p8-20020a2eba08000000b00277041268absm383931lja.78.2022.10.25.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 01:51:28 -0700 (PDT)
Date:   Tue, 25 Oct 2022 11:51:22 +0300
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
Subject: [PATCH 2/2] i2c: i2c-smbus: fwnode_irq_get_byname() return value fix
Message-ID: <c53d71c979405b9b925a05d36c322873fa45d649.1666687086.git.mazziesaccount@gmail.com>
References: <cover.1666687086.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZWBdPoZHksHXJmH5"
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


--ZWBdPoZHksHXJmH5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fwnode_irq_get_byname() was changed to not return 0 upon failure so
return value check can be adjusted to reflect the change.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

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

--ZWBdPoZHksHXJmH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNXo4oACgkQeFA3/03a
ocWr6AgAhZDLtYfJkt44+ibVyiblqBDWMi6GI7RWkZxfSvoc5HJMURURaWuv1RsJ
UJnL6ivT+RieDYZGPQboSNhmzssn9JzJP3DMgE0H0pWCPR/VEDaBL9yKVkgtnJpv
IbItSVm/j95sdZ5E11ZU7Ik1yjzaT8Slpioa49bzi8qLKltLS9p3i4MprWTL8xVS
fksIQg4EmwihNonsxjgUgAKGr9FX4+rzD1pQqp6kF9WpuS/lRt7gOCtyb3qD4Il8
DcpgdIXz9CPua5a0FdmiwRN2SsAtqs7jRMh47Ss8/EzADOqDWMIHcjjSkiNpVMU5
3u0uzRgW343wHR7YuokqFLrMYUDmKg==
=P602
-----END PGP SIGNATURE-----

--ZWBdPoZHksHXJmH5--
