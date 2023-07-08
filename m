Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD0BD74BCE1
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jul 2023 10:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjGHInB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jul 2023 04:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGHInA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jul 2023 04:43:00 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C4C1FEE;
        Sat,  8 Jul 2023 01:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688805777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ElVQEajXfVFXasGEa/f93f+xNyXaUC+ldwTnIqRBAVE=;
        b=yGmZbQQYtjAhFAfswdRHcYY2Bd4WGG/LdcCFX7kmtzPOkXiIIH37RTJWLqZJB78Ts8MmaY
        NQSqHI3oMHjFGDkpwFmETG5ahlutk4UyBV1l6m0zN6XNciqYxUuTaL506IE42kfbAymf2i
        pBm7wFQLLo0XZFMxqEXJNVLIKvOyQOg=
Message-ID: <b76cab3b8b5dc4138a03410d5bc8c65dc7bc80b6.camel@crapouillou.net>
Subject: Re: [PATCH 01/23] i2c: amd-mp2: Remove #ifdef guards for PM related
 functions
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Date:   Sat, 08 Jul 2023 10:42:56 +0200
In-Reply-To: <20230706100913.00007c4a@Huawei.com>
References: <20230705204314.89800-1-paul@crapouillou.net>
         <20230705204314.89800-2-paul@crapouillou.net>
         <20230706100913.00007c4a@Huawei.com>
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

Le jeudi 06 juillet 2023 =C3=A0 10:09 +0800, Jonathan Cameron a =C3=A9crit=
=C2=A0:
> On Wed,=C2=A0 5 Jul 2023 22:42:52 +0200
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
> > Note that the use of the UNIVERSAL_DEV_PM_OPS() macro was likely to
> > be
> > wrong, as it sets the same callbacks for the runtime-PM and system
> > suspend/resume. This patch does not change this behaviour, but I
> > suspect
> > that it should be changed to use DEFINE_RUNTIME_DEV_PM_OPS()
> > instead, as
> > the current documentation for UNIVERSAL_DEV_PM_OPS() suggests.
>=20
> I'd be tempted to leave this one alone because it'll be much harder
> to spot that it's an ex UNIVERSAL_DEV_PM_OPS() that needs some
> thinking
> about after this change.

Ok, that's a good point.

Cheers,
-Paul

> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> > ---
> > Cc: Elie Morisse <syniurge@gmail.com>
> > Cc: Shyam Sundar S K <shyam-sundar.s-k@amd.com>
> > ---
> > =C2=A0drivers/i2c/busses/i2c-amd-mp2-pci.c=C2=A0 | 14 +++++---------
> > =C2=A0drivers/i2c/busses/i2c-amd-mp2-plat.c |=C2=A0 8 ++------
> > =C2=A0drivers/i2c/busses/i2c-amd-mp2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 --
> > =C2=A03 files changed, 7 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > index 143165300949..114fe329279a 100644
> > --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > @@ -382,7 +382,6 @@ static void amd_mp2_pci_remove(struct pci_dev
> > *pci_dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amd_mp2_clear_reg(privd=
ata);
> > =C2=A0}
> > =C2=A0
> > -#ifdef CONFIG_PM
> > =C2=A0static int amd_mp2_pci_suspend(struct device *dev)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_dev *pci_dev=
 =3D to_pci_dev(dev);
> > @@ -434,9 +433,10 @@ static int amd_mp2_pci_resume(struct device
> > *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > =C2=A0}
> > =C2=A0
> > -static UNIVERSAL_DEV_PM_OPS(amd_mp2_pci_pm_ops,
> > amd_mp2_pci_suspend,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 amd_mp2_pci_resume, NULL);
> > -#endif /* CONFIG_PM */
> > +static const struct dev_pm_ops amd_mp2_pci_pm_ops =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SYSTEM_SLEEP_PM_OPS(amd_mp2_=
pci_suspend,
> > amd_mp2_pci_resume)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RUNTIME_PM_OPS(amd_mp2_pci_s=
uspend, amd_mp2_pci_resume,
> > NULL)
> > +};
> > =C2=A0
> > =C2=A0static const struct pci_device_id amd_mp2_pci_tbl[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{PCI_VDEVICE(AMD, PCI_D=
EVICE_ID_AMD_MP2)},
> > @@ -449,11 +449,7 @@ static struct pci_driver amd_mp2_pci_driver =3D
> > {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.id_table=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D amd_mp2_pci_tbl,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D amd_mp2_pci_probe,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D amd_mp2_pci_remove,
> > -#ifdef CONFIG_PM
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0.pm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D &amd_mp2_pci_pm_o=
ps,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> > -#endif
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver.pm=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D pm_ptr(&amd_mp2_pci_pm_ops),
> > =C2=A0};
> > =C2=A0module_pci_driver(amd_mp2_pci_driver);
> > =C2=A0
> > diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c
> > b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> > index 112fe2bc5662..4c677aeaca29 100644
> > --- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
> > +++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> > @@ -183,7 +183,6 @@ static const struct i2c_algorithm
> > i2c_amd_algorithm =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.functionality =3D i2c_=
amd_func,
> > =C2=A0};
> > =C2=A0
> > -#ifdef CONFIG_PM
> > =C2=A0static int i2c_amd_suspend(struct amd_i2c_common *i2c_common)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct amd_i2c_dev *i2c=
_dev =3D
> > amd_i2c_dev_common(i2c_common);
> > @@ -198,7 +197,6 @@ static int i2c_amd_resume(struct amd_i2c_common
> > *i2c_common)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return i2c_amd_enable_s=
et(i2c_dev, true);
> > =C2=A0}
> > -#endif
> > =C2=A0
> > =C2=A0static const u32 supported_speeds[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0I2C_MAX_HIGH_SPEED_MODE=
_FREQ,
> > @@ -276,10 +274,8 @@ static int i2c_amd_probe(struct
> > platform_device *pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0platform_set_drvdata(pd=
ev, i2c_dev);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_dev->common.cmd_com=
pletion =3D &i2c_amd_cmd_completion;
> > -#ifdef CONFIG_PM
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_dev->common.suspend =3D =
&i2c_amd_suspend;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_dev->common.resume =3D &=
i2c_amd_resume;
> > -#endif
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_dev->common.suspend =3D =
pm_ptr(&i2c_amd_suspend);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_dev->common.resume =3D p=
m_ptr(&i2c_amd_resume);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Register the adapter=
 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amd_mp2_pm_runtime_get(=
mp2_dev);
> > diff --git a/drivers/i2c/busses/i2c-amd-mp2.h
> > b/drivers/i2c/busses/i2c-amd-mp2.h
> > index 018a42de8b1e..40f3cdcc60aa 100644
> > --- a/drivers/i2c/busses/i2c-amd-mp2.h
> > +++ b/drivers/i2c/busses/i2c-amd-mp2.h
> > @@ -160,10 +160,8 @@ struct amd_i2c_common {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum speed_enum i2c_spe=
ed;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 *dma_buf;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_addr_t dma_addr;
> > -#ifdef CONFIG_PM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*suspend)(struct a=
md_i2c_common *i2c_common);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*resume)(struct am=
d_i2c_common *i2c_common);
> > -#endif /* CONFIG_PM */
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
>=20

