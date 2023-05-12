Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648757001D6
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 09:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240355AbjELHxY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 03:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240337AbjELHxN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 03:53:13 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFD8100F9;
        Fri, 12 May 2023 00:53:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f14468ef54so10960816e87.0;
        Fri, 12 May 2023 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683877985; x=1686469985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGWZeSOJvbJTBrhI3yrJesYXVyhARM/YB/qVyBmPJnA=;
        b=p1T36/U67c4bI93KQPUoVzB8t570wxx699H81X4eDMaCi1TAsntFPzeBwOCJgxrjoc
         dZys5yPZkXmOaAESU27Qed0Qk+cg57AP6gr6qnsHxv1B5yVCV7WGyJ2AoU1i3UctCA9U
         AbJJLygmkOrf6MMahX7lqFAWUy0l+9r0Gpt5rfy2ohV17+owS+U8TTaZjLttWAx3j7iJ
         tBU3PyQQGfhLLoWEj+5bHlo2Ob63gl+DCx7g5FTXC9nhMQAOdMAaSL0ZXX86SGULftIN
         lIigeLOi9swBGwGk5mjSORvx7UZPVxf3MwSyX2Ls0LdUEa1BntPO2h6H1mAcBaKvQhYY
         f25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683877985; x=1686469985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGWZeSOJvbJTBrhI3yrJesYXVyhARM/YB/qVyBmPJnA=;
        b=kKWkE9SG+SYCB3SWx5nTEuzTyIWDKvrt31UAoOCXXB6wdwwTEju00SCV5ahZ9x00AY
         lJTKiLbUhwNU3zPQqAW+1rK9kEfLiC0v2o9qHrGXMovpFPCq+uF8bUAJDetlBQdbo/20
         qheNdAfj9d4GMwkcMlzdeeNQpznoe3Hw2U1KWHTmSrxic3p4ZZvpMvYk+G2gx5CGe9fX
         6QIy1aQ3Gyen/pNbldQntg1hou0TM3YnPjV60u7FvB44Y/RwcluyGeok9kk9iQ0hhR5B
         frsq7PAwM5kUt0RDTufgniJyPWVRNrY5HZlTBisbl7S+noV85rZVlFH9iZIRzx5VdNXH
         RbTQ==
X-Gm-Message-State: AC+VfDwBCmQsrrBYVAOHxVk01NC7383Ga/DZamWdb0fhi7N8JENNjz6M
        qaA7QSewo12pjhuCVzeUgj0=
X-Google-Smtp-Source: ACHHUZ7qYGp3wgx6QTPLyhqD5sl+XwY/8F9KO4E6giVnrinsLVSUiUhbsySoHpjo7zLnUXaDf3LcyQ==
X-Received: by 2002:a19:f813:0:b0:4ec:a48a:28c0 with SMTP id a19-20020a19f813000000b004eca48a28c0mr3574652lff.25.1683877985032;
        Fri, 12 May 2023 00:53:05 -0700 (PDT)
Received: from fedora (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id x17-20020ac25dd1000000b004f155743899sm1386872lfq.92.2023.05.12.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 00:53:04 -0700 (PDT)
Date:   Fri, 12 May 2023 10:53:00 +0300
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
Subject: [PATCH v3 1/3] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <9dd75817886fbb2a0cc58e2248dbba52d8a6d908.1683875389.git.mazziesaccount@gmail.com>
References: <cover.1683875389.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Z1RUJS5ly3oRxMWn"
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


--Z1RUJS5ly3oRxMWn
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
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/base/property.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index f6117ec9805c..a3b95d2d781f 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1011,7 +1011,7 @@ EXPORT_SYMBOL(fwnode_irq_get);
  */
 int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *=
name)
 {
-	int index;
+	int index, ret;
=20
 	if (!name)
 		return -EINVAL;
@@ -1020,7 +1020,12 @@ int fwnode_irq_get_byname(const struct fwnode_handle=
 *fwnode, const char *name)
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

--Z1RUJS5ly3oRxMWn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmRd8FwACgkQeFA3/03a
ocUUMAf9GTu5YfIPyjoc6yRUdlIF8HI15KeuiSkJIjakcDe8x/MEVcav7dsWvFA9
BV5hEgHuBOCyzdLAoc4N6Ns/U0mCEM3Uje/kub4gmal1WLJ0m3M9OYzFmaY2qgo8
sro8xoOHHbhHRfs0AQ9vx1Lcd0PbNlFvsos+dXB5P5mrkOm8naq8o3gf+i9Qioo8
Fk6c3yx23g/Wblwou4O52C/IsQ2LUSQpsZmZCyPg62X8N8+q/O/VwkigBUTbly0C
gza2KEWr1uemlFGoWk+UbNz5U3Vdt6qFojXVAt5wkzdrc7msJF4bpWl2e1yCIabR
sp8mMOrUm1HTQqakqTCUJaIsdAdYFA==
=RaES
-----END PGP SIGNATURE-----

--Z1RUJS5ly3oRxMWn--
