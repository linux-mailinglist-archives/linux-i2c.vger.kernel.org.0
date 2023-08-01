Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97ED76B457
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 14:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbjHAMEi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 08:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbjHAMEU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 08:04:20 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DC92130;
        Tue,  1 Aug 2023 05:04:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe3c7f16bbso2599385e87.0;
        Tue, 01 Aug 2023 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690891451; x=1691496251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2FjbYEwYSQTRx95ARkE4igv1HNA98Re6gC6tnSqpe0=;
        b=LTrajoxpgDtUfizhJQgA+9IYKFAwZqwY22SfSeX/lkDJeGZl8yRJ+H/kWtYqTh6z+5
         QMs765/iNCrSq3MmY5amDQKrQgR1vh3c0V3g/nZ+T4Rpy1alxkOTlmbO2Z8kYoLZjMZh
         V4BQNc+jxQ1jVpYWX6ctz2VQVCuFQqpvm6kAcmoybM2Npzu5OtUV3dsP8SFk1FCPGoZP
         KUnNeUXqb4RqcDxYqxHvm94P16ZvLX8MuzYhDhpiXGCkMYvGCFwg3JuVYbew3g+PflSS
         XttpDUZUhqrqYHe/MRqw1wdsB0Z1adbKUx60Y/I20lBupyyyGEtyGhBs2+fEpbnSc/y/
         njCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690891451; x=1691496251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2FjbYEwYSQTRx95ARkE4igv1HNA98Re6gC6tnSqpe0=;
        b=BTG2lfr63vf3Fw4LvjwMNQbR0an6Ii7QhdyvHOy1OJsWd901Z6rCPaCNMVvfH/2/js
         O1+OK8ZJua6UBZswcynzDRIaIiC/18UwwmeCILY9neVCESeYnaTTLdrcSe4EmEQWxBAQ
         7HgYrj8wrofvBP3VxF/55CrYhk1MdwQMvQD3F3eb/FJpepoEC7rjCla5mMaW7ctdpZZx
         v0TPSEQJyyDjCzLGwE0sE108EXry/+mWm1e/NNTPB+XSVL4Cps29l283KmkMt6KAqpIQ
         9xq04t4ZdglcW5dLX4Ar/Rvahf+jPqNC3QzIXuakFbXQsYsOyTh0wl9LgmIuU/mfnHem
         91mA==
X-Gm-Message-State: ABy/qLbwNkh1R1Uypo7bePRLKQwobwjFo3I7YSs6KZ0haTQNfQPk798o
        34IBTL9wrvnOD6tXwm7oYY4=
X-Google-Smtp-Source: APBJJlHghj6Ntuc24CM32xjyPHGp4G2F6BLMTq9uNq7xqF8EYmL0MaCmratdBGH+k2Mwy5MdTPLp6Q==
X-Received: by 2002:a19:915c:0:b0:4f8:5e8b:5ec8 with SMTP id y28-20020a19915c000000b004f85e8b5ec8mr2000288lfj.9.1690891451609;
        Tue, 01 Aug 2023 05:04:11 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b004fe1960dd7csm2408074lfc.132.2023.08.01.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 05:04:10 -0700 (PDT)
Date:   Tue, 1 Aug 2023 15:04:07 +0300
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/8] i2c: i2c-smbus: fwnode_irq_get_byname() return value
 fix
Message-ID: <fe65ac347a126b72e6deb30dbcd8c71530147509.1690890774.git.mazziesaccount@gmail.com>
References: <cover.1690890774.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t5IIdvlUffOw7YI0"
Content-Disposition: inline
In-Reply-To: <cover.1690890774.git.mazziesaccount@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t5IIdvlUffOw7YI0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The fwnode_irq_get_byname() was changed to not return 0 upon failure so
return value check can be adjusted to reflect the change.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
Revision history:
v5 =3D>:
 - No changes
v4 =3D> v5:
 - Added back after this was accidentally dropped at v4.

The patch changing the fwnode_irq_get() got merged during 5.4:
https://lore.kernel.org/all/fb7241d3-d1d1-1c37-919b-488d6d007484@gmail.com/
This is a clean-up as agreed.

The return value change did also cause a functional change here. Eg. when
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

--t5IIdvlUffOw7YI0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmTI9LcACgkQeFA3/03a
ocUhHAgAkvkj3Vn65/NMmeq91WR7BQwOaMmyA/Q/vG/UjIosy7wx6dLbeoqIAqrs
Pn+xQBcSqUEPsZ936JKdD9pb5w63hDsWMKAewMyhKxGvx5D0po8ydyVcK11Q31Kj
s6iGR1rJmKiY+hsk+elW4I9jVdcReVqnYiyAXcGeCTIM+/qfIS/dIuGK02MP0T6w
UfAZh1Yxh0Py/ejeKDhe03lyYkvO0piXf0oWLLv98HKtLKlOBncpnvhYTM0IWMCC
OZ6Fa5cmYEg7Uez8gvCus9oj4gFsCcVMbItbdpImQAGGgJZ2L2YW78gmW9Cxonuz
KHFsG8dl+RBj8pTnlFC5w1xH6BFPAg==
=fNKQ
-----END PGP SIGNATURE-----

--t5IIdvlUffOw7YI0--
