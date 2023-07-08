Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02E074BCFF
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jul 2023 11:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjGHJNR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jul 2023 05:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjGHJNP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jul 2023 05:13:15 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B59919BD;
        Sat,  8 Jul 2023 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688807592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=puPcf+V/6sYMK2fF/csgHvd5WcNj3g1IOwnH/eQ0e6M=;
        b=EpaY7FBThokHiE8Qntc3o9lFnB+3/fuOCESW6gkkOmtKmEi+KCT4Ys1priFKiTWy4K3qxk
        LfUcRfcM4a4q2f7cnUrw51s8MMeUWfwgQc966yjhMivIVz/ID40hLXtZnnCUhvoUJXRcKB
        IqvxzBGA07h9B29szX9JcnGB8Vv5IoQ=
Message-ID: <180fece4bfe6084c740b8f73cc040d269b0f8968.camel@crapouillou.net>
Subject: Re: [PATCH 11/23] i2c: kempld: Remove #ifdef guards for PM related
 functions
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 08 Jul 2023 11:13:11 +0200
In-Reply-To: <20230706103737.00007497@Huawei.com>
References: <20230705204314.89800-1-paul@crapouillou.net>
         <20230705204314.89800-12-paul@crapouillou.net>
         <20230706103737.00007497@Huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jonathan,

Le jeudi 06 juillet 2023 =C3=A0 10:37 +0800, Jonathan Cameron a =C3=A9crit=
=C2=A0:
> On Wed,=C2=A0 5 Jul 2023 22:43:02 +0200
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
> > Use the new PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> >=20
> > This has the advantage of always compiling these functions in,
> > independently of any Kconfig option. Thanks to that, bugs and other
> > regressions are subsequently easier to catch.
> >=20
> > Note that the driver should most likely be updated to use the
> > platform_driver.driver.pm.{suspend,resume} callbacks.
>=20
> Agreed.=C2=A0 In this particular case I'd be tempted to do that first
> so that we don't introduce pm_ptr() usage for these hooks.
> Look at the platform device core, I suspect they should be
> pm_sleep_ptr()
> but not 100% sure.

Ok, I'll just convert it then, the diff won't be much bigger.

Cheers,
-Paul

> Jonathan
>=20
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> > =C2=A0drivers/i2c/busses/i2c-kempld.c | 9 ++-------
> > =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-kempld.c
> > b/drivers/i2c/busses/i2c-kempld.c
> > index 281058e3ea46..cb61e7b9202c 100644
> > --- a/drivers/i2c/busses/i2c-kempld.c
> > +++ b/drivers/i2c/busses/i2c-kempld.c
> > @@ -350,7 +350,6 @@ static void kempld_i2c_remove(struct
> > platform_device *pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_del_adapter(&i2c->a=
dap);
> > =C2=A0}
> > =C2=A0
> > -#ifdef CONFIG_PM
> > =C2=A0static int kempld_i2c_suspend(struct platform_device *pdev,
> > pm_message_t state)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct kempld_i2c_data =
*i2c =3D platform_get_drvdata(pdev);
> > @@ -377,10 +376,6 @@ static int kempld_i2c_resume(struct
> > platform_device *pdev)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0}
> > -#else
> > -#define kempld_i2c_suspend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL
> > -#define kempld_i2c_resume=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL
> > -#endif
> > =C2=A0
> > =C2=A0static struct platform_driver kempld_i2c_driver =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D {
> > @@ -388,8 +383,8 @@ static struct platform_driver kempld_i2c_driver
> > =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D kempld_i2c_probe,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove_new=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D kempld_i2c_remove,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D kempld_i2c_suspend,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D kempld_i2c_resume,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.suspend=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D pm_ptr(kempld_i2c_suspend),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.resume=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D pm_ptr(kempld_i2c_resume),
> > =C2=A0};
> > =C2=A0
> > =C2=A0module_platform_driver(kempld_i2c_driver);
>=20

