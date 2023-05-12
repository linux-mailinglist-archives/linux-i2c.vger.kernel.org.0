Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610D27001DE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 09:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240363AbjELHyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 03:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240374AbjELHx6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 03:53:58 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E64106FD;
        Fri, 12 May 2023 00:53:31 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac80da3443so105629231fa.0;
        Fri, 12 May 2023 00:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683878010; x=1686470010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+fkvnw5qJK8Z9ZsEdDbVAibOHT/dgf1NL+n5A0kE4I=;
        b=P2el5kc09GmR4TELHXaLBONDRptaapBZXgUK3wEKkHoAPmtY9J2Qc1yr8KUR/4u5HP
         dnNBqWE0Pa2xaUIy4VJKr+uWa9bVH1jW7m4y/iSTDrl8wBvUhrRt5ePLB2XiEo61eS3l
         JKOtVi8/7GNe2+m7JMSU9goRVv+YB0MfD5rt9s7GRkkXloLQV1Hgj6paBsYn3Rk/d0nC
         ysMD5oN0iiYk111epYMERRDTCBq8z/fRrtOgCqssglyPDBHQmujNsmVViI18VbXN7AFl
         QAdKY8B16cLejoIMDgTb37tCb1/DZnJbcvBmOo0PCN7qZuJFUupLFsRrgddkzk4WFYnG
         a9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683878010; x=1686470010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+fkvnw5qJK8Z9ZsEdDbVAibOHT/dgf1NL+n5A0kE4I=;
        b=M30ogO3oM2xaPhYftT+PQ8K80B0odPDxBNWsriN0gGAOPGTUZwiuvr3C3mGROQJwFX
         vIXLaejj7XoqrlV/TWsJiuotXG7lcB82eXIn2Lpcvou7o+7TMdzA3HuR+n2wNKF9wUnd
         KnTQk7xXnvdCUR6yGzdt6vo9fwoH9gPsbJqPLE5VR4Ij1BHaGzC7U1px7Azm+lLLMaQF
         SUuucEnWx6JARCEdgiqr67J0fU5JEKA7CxH7TM+Jd1YrEiwRdM/Iv8QkzYNIjdSYTrWe
         aiK6qctAvu8Ou8j6HMXXPrZRW5Vv0QEwgMgLQ2X+zGHORFR68zEeb3fVphlKXYCcCGQ3
         06kw==
X-Gm-Message-State: AC+VfDwi2Akw+8Twd7qYw/lO3JlLbGy+H4H02WlcuVSPGMkx4S1bLSsC
        wFgrnFArQd+GMGIXfldxDvY=
X-Google-Smtp-Source: ACHHUZ51mCBU4t5K+r6iUvLR0RIkn1IL1WxlHPQYiauSW0ImZb7mE0vLP5zf4X8InqXz4KoUNWkjhA==
X-Received: by 2002:a2e:7004:0:b0:2ac:8e5a:1054 with SMTP id l4-20020a2e7004000000b002ac8e5a1054mr3988058ljc.0.1683878009870;
        Fri, 12 May 2023 00:53:29 -0700 (PDT)
Received: from fedora (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id l18-20020a05651c10d200b002aa4713b925sm2691194ljn.21.2023.05.12.00.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 00:53:29 -0700 (PDT)
Date:   Fri, 12 May 2023 10:53:25 +0300
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
Subject: [PATCH v3 2/3] i2c: i2c-smbus: fwnode_irq_get_byname() return value
 fix
Message-ID: <d7f053c9ba0c88968d9a163b07621169125d4009.1683875389.git.mazziesaccount@gmail.com>
References: <cover.1683875389.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Sw9x6276K4F6zIlx"
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


--Sw9x6276K4F6zIlx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fwnode_irq_get_byname() was changed to not return 0 upon failure so
return value check can be adjusted to reflect the change.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---

Depends on the mentioned return value change which is in patch 1/2. The
return value change does also cause a functional change here. Eg. when
IRQ mapping fails, the fwnode_irq_get_byname() no longer returns zero.
This will cause also the probe here to return nonzero failure. I guess
this is desired behaviour - but I would appreciate any confirmation.

Please, see also previous discussion here:
https://lore.kernel.org/all/fbd52f5f5253b382b8d7b3e8046134de29f965b8.166671=
0197.git.mazziesaccount@gmail.com/

Another suggestion has been to drop the check altogether. I am slightly
reluctant on doing that unless it gets confirmed that is the "right
thing to do".
---
 drivers/i2c/i2c-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 138c3f5e0093..893fe7cd3e41 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -129,7 +129,7 @@ static int smbalert_probe(struct i2c_client *ara)
 	} else {
 		irq =3D fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
 					    "smbus_alert");
-		if (irq <=3D 0)
+		if (irq < 0)
 			return irq;
 	}
=20
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

--Sw9x6276K4F6zIlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmRd8HUACgkQeFA3/03a
ocXvcggAk5aObDwpWtqR1qWXesz7ZVA6Qd9JmIw2ZATG/KViK9uqzosK2OI9Ne3O
uxAQlZCbBkDKqAp7ZjqzXE+wJNrePnHE7nWs7/x2kgeze7pY7INhvxOixM3hp8AR
hdw4m5WjlivSdl3L6ygkD0CcrPbX2p9HsSAM8vNta+QFKcugg1CLDlaHY8IWNIRh
0TFwpodoIm/WLYnHtT23UXrymSzSg/PR5jtTeon3D6hJ/Q3o48nPEBv47vDGCbNY
7Hv9QioTtwTyUhRkoh8S/oSORRfUePL7P8lkVGAyOdJX1DP1abxW18AhtnxbaAjy
x0E+RfudXOA1qE6ijA6fxIvlFCgRtg==
=ai5R
-----END PGP SIGNATURE-----

--Sw9x6276K4F6zIlx--
