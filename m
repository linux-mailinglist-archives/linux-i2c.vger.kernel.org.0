Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4EC4BD802
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 09:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343714AbiBUIeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 03:34:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343682AbiBUIeR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 03:34:17 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE7A1AA;
        Mon, 21 Feb 2022 00:33:54 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id g21so16747923vsp.6;
        Mon, 21 Feb 2022 00:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ufcy944rkWYKZObvy1+rpFgMmzS5p+LaqMauq+MUEW4=;
        b=anYGhEvXvHwbxgxsHz489ymn/gP/REFDdoRerZAfwz/vbB8aDXxPvY1rUSUcibANRy
         UiFK1mpVtXQkCnUA5LUyQAiADQ7yL5YRAqWx9vQ+scj0ycQhWh4C18/iHALNSp13W8mS
         QuSJQCILZqTa1iQnnkzdfA/kPDD5KIdgsPfcH5aE6AcT4oXc6itDcF5CtpVPL1k03v4K
         4S4eZbvsFeIbAApBbzqRP8jgwV3CAokSxhHciEaM0n/gQG8mh0h8GXMtCsSRtd2whx0h
         KUXz0TbrQtYWGUbbEJ0EuY3Xx5LD8yn53kyCgntIqelnYkvh4/PWmHdUOkPM9ZYUh+tT
         Fquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ufcy944rkWYKZObvy1+rpFgMmzS5p+LaqMauq+MUEW4=;
        b=P1VOIIdCMJMgT8M9BUalDJzclxZz5baxbJhsMH35xkGC0SbYp+PYehVOf5g/OZFKyw
         aiPMfS86alJJyKUNKmXPeI+Iw5AMCMSIdmx/IIeS1SgOGUbO4Apwy3jsLb2JNK7lUynA
         M7AZrmZp0pWF3IqV67F/Ty8xuiVmBQyPWMYlVkT4Fb/C9FLMcjwJF8OejTdCpaFXxjgO
         67PmiT+eI2AgpUPwWUGARVnxjiM+otD0avfhyEUYV3cPYZ+ZJbyneoMAt0Ho3TBVXwDk
         gOxCqkbFMBhbx28paPjnglb5Qj//hUj6E87io7QW8W1KkKoQledyNnBzM5XNxSPolD8p
         LduQ==
X-Gm-Message-State: AOAM530BJ+FEeuvgMQI8r0PgVBxdoZm3CfUHLnZapFoFKZ7lS1/PlmGu
        pYQKyNJT7lhejTRROuHzXnPCHcxS9qgIz8SXhA==
X-Google-Smtp-Source: ABdhPJwJNio1dad1aaWQl70fBp62eHOCefzP0BnnUismdjIt1635Ofbsf+YmMSai31L2tPhyjh5ESBxdt/6SyOFXsCM=
X-Received: by 2002:a67:db0c:0:b0:31c:2859:2ff2 with SMTP id
 z12-20020a67db0c000000b0031c28592ff2mr2541361vsj.29.1645432433446; Mon, 21
 Feb 2022 00:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <20220220035321.3870-12-warp5tw@gmail.com>
 <888977e0-03bb-3a6b-eca3-7fbf35f53ffc@canonical.com>
In-Reply-To: <888977e0-03bb-3a6b-eca3-7fbf35f53ffc@canonical.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Mon, 21 Feb 2022 16:33:41 +0800
Message-ID: <CACD3sJaFFC2Fe_EyzM3t1_DCkYPRe-mXQdqpe4=Y27vuRajKoA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] i2c: npcm: Support NPCM845
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
        olof@lixom.net, arnd@arndb.de, digetx@gmail.com,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof:

Thank you for your comments and they'll be addressed.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8820=E6=97=A5
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 20/02/2022 04:53, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add NPCM8XX I2C support.
> > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > The internal HW FIFO is larger in NPCM8XX.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  drivers/i2c/busses/Kconfig       |  8 +--
> >  drivers/i2c/busses/Makefile      |  2 +-
> >  drivers/i2c/busses/i2c-npcm7xx.c | 87 ++++++++++++++++++++++----------
> >  3 files changed, 66 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index 42da31c1ab70..ab9ee2de5e00 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -817,13 +817,13 @@ config I2C_NOMADIK
> >         I2C interface from ST-Ericsson's Nomadik and Ux500 architecture=
s,
> >         as well as the STA2X11 PCIe I/O HUB.
> >
> > -config I2C_NPCM7XX
> > +config I2C_NPCM
> >       tristate "Nuvoton I2C Controller"
> > -     depends on ARCH_NPCM7XX || COMPILE_TEST
> > +     depends on ARCH_NPCM || COMPILE_TEST
> >       help
> >         If you say yes to this option, support will be included for the
> > -       Nuvoton I2C controller, which is available on the NPCM7xx BMC
> > -       controller.
> > +       Nuvoton I2C controller, which is available on the NPCM BMC
> > +       controllers.
> >         Driver can also support slave mode (select I2C_SLAVE).
> >
> >  config I2C_OCORES
> > diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> > index 1d00dce77098..01fdf74a5565 100644
> > --- a/drivers/i2c/busses/Makefile
> > +++ b/drivers/i2c/busses/Makefile
> > @@ -80,7 +80,7 @@ obj-$(CONFIG_I2C_MT7621)    +=3D i2c-mt7621.o
> >  obj-$(CONFIG_I2C_MV64XXX)    +=3D i2c-mv64xxx.o
> >  obj-$(CONFIG_I2C_MXS)                +=3D i2c-mxs.o
> >  obj-$(CONFIG_I2C_NOMADIK)    +=3D i2c-nomadik.o
> > -obj-$(CONFIG_I2C_NPCM7XX)    +=3D i2c-npcm7xx.o
> > +obj-$(CONFIG_I2C_NPCM)               +=3D i2c-npcm7xx.o
> >  obj-$(CONFIG_I2C_OCORES)     +=3D i2c-ocores.o
> >  obj-$(CONFIG_I2C_OMAP)               +=3D i2c-omap.o
> >  obj-$(CONFIG_I2C_OWL)                +=3D i2c-owl.o
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2cbf9c679aed..b281e0424e3e 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >
> > @@ -91,7 +92,7 @@ enum i2c_addr {
> >
> >  /* init register and default value required to enable module */
> >  #define NPCM_I2CSEGCTL                       0xE4
> > -#define NPCM_I2CSEGCTL_INIT_VAL              0x0333F000
> > +#define NPCM_I2CSEGCTL_INIT_VAL              bus->data->segctl_init_va=
l
> >
> >  /* Common regs */
> >  #define NPCM_I2CSDA                  0x00
> > @@ -228,8 +229,7 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D=
 {
> >  #define NPCM_I2CFIF_CTS_CLR_FIFO     BIT(6)
> >  #define NPCM_I2CFIF_CTS_SLVRSTR              BIT(7)
> >
> > -/* NPCM_I2CTXF_CTL reg fields */
> > -#define NPCM_I2CTXF_CTL_TX_THR               GENMASK(4, 0)
> > +/* NPCM_I2CTXF_CTL reg field */
> >  #define NPCM_I2CTXF_CTL_THR_TXIE     BIT(6)
> >
> >  /* NPCM_I2CT_OUT reg fields */
> > @@ -238,22 +238,22 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =
=3D {
> >  #define NPCM_I2CT_OUT_T_OUTST                BIT(7)
> >
> >  /* NPCM_I2CTXF_STS reg fields */
> > -#define NPCM_I2CTXF_STS_TX_BYTES     GENMASK(4, 0)
> > +#define NPCM_I2CTXF_STS_TX_BYTES     bus->data->txf_sts_tx_bytes
>
> It's not a clean code to use defines for complex types. It's not a
> constant anymore, so just use bus->data->txf_sts_tx_bytes directly.
>
> The same in other places.
>
> >  #define NPCM_I2CTXF_STS_TX_THST              BIT(6)
> >
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
