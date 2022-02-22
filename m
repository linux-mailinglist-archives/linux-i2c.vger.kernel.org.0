Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8F74BEF49
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Feb 2022 03:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbiBVCPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 21:15:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiBVCPm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 21:15:42 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1381D310;
        Mon, 21 Feb 2022 18:15:17 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id j3so5333484vsi.7;
        Mon, 21 Feb 2022 18:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BlI0MZtmyrupgAgtS84tifI22v5MszPHmzBYuMorQ2Q=;
        b=Rk4wLpnzqfp8r0wTeL769g6XltdeX4nvtAxkmAP0nmzzlyzhVkBToHl6P9L3bbm82o
         wPzymBMGB+rEQFwGR8DJwzTDHH1AfiXXQ4G3WVg8xyTg4rDw36f4a9vde+nrbZMLFRkN
         obhvmz22sTRmEZQECLHBOUsWFeHDcv//ZAROlAsniLb64mNcoPrtPspOds/Cpc10zv9R
         tlzoVoiVXTQzJeY37ud3nRWtGSRkVxkLPTrz+1IlnXy1RVuGZmbZw1EdUShCLfetw6XL
         gmoyEgSqsicqdd0DcdTS5Hy6oWEk8F2THhQOIN57Em92cCrNL2y8X9cOknB9YN/SywK5
         9dlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BlI0MZtmyrupgAgtS84tifI22v5MszPHmzBYuMorQ2Q=;
        b=b9y63x8HTVKEJf5yKkizS0CukIOTLY38HxJOEVeKRDEAaUX9sCNie03gtZ9eJ3y9Tw
         wOUqAxDEW7Wq+NDCWjGRGZ32RnoUT+MbqnJvlRsRwjKiFEq0CHrTR5IKIN06H4o4acuO
         bagLqFn+NBcpIkgpjB16B5AvpbuxILEqPYfIMN/qF4KUSfrZW6jzppn5YiOUbM+r6/FX
         HpVsVzBppFsCVy6ef7aSM8z7nbmWO482eK3LermpsKz4VOgfOsYFaARPt7xe4e8/lMxF
         I4P/5yDJ2GI2jgbj4zIKyw8Sm+JdqRL8+FWXM495IugiB9nUjD9mWF5x28m96ViTnubq
         S16Q==
X-Gm-Message-State: AOAM5301fyBRgwJfNruCCDmnNzQUznvQDAaFgl2xVuv67ZyGrMzqhzyj
        W1CBB4b5+6f6Mfh3NPxUZ7Tvu+NLAVqEdvB5iXYnmqlR0tY4
X-Google-Smtp-Source: ABdhPJwP8hGkmey95OH9kMBmiXbTjANOhIk00QyYwbxVhv9uJZHDNcE4hSC4Qy5vlaQyfzrxkO0dro8txp6TgLSZrkQ=
X-Received: by 2002:a05:6102:370f:b0:31b:60dc:4f76 with SMTP id
 s15-20020a056102370f00b0031b60dc4f76mr9690133vst.2.1645496116704; Mon, 21 Feb
 2022 18:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <20220220035321.3870-6-warp5tw@gmail.com>
 <YhN8OGIR9eSCus8E@latitude>
In-Reply-To: <YhN8OGIR9eSCus8E@latitude>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Tue, 22 Feb 2022 10:15:04 +0800
Message-ID: <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

Hi Jonathan:

Thank you for your comments and please find my reply next to your comments.

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:49=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Sun, Feb 20, 2022 at 11:53:15AM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Remove unused npcm750-clk node.
>
> You're not actually removing a node, for example in the sense of removing=
 a
> devicetree node from a devicetree.
>
> So, I think "Remove unused variable clk_regmap." would be a better
> description.
>

May I modify the description according to your input and attach
"Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>"
onto this commit in the next version of the patch set?

> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index a51db3f50274..9ccb9958945e 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2233,7 +2233,6 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       struct i2c_adapter *adap;
> >       struct clk *i2c_clk;
> >       static struct regmap *gcr_regmap;
> > -     static struct regmap *clk_regmap;
> >       int irq;
> >       int ret;
> >       struct device_node *np =3D pdev->dev.of_node;
> > @@ -2256,10 +2255,6 @@ static int npcm_i2c_probe_bus(struct platform_de=
vice *pdev)
> >               return PTR_ERR(gcr_regmap);
> >       regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL)=
;
> >
> > -     clk_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm75=
0-clk");
> > -     if (IS_ERR(clk_regmap))
> > -             return PTR_ERR(clk_regmap);
> > -
>
> The change itself looks good to me,
>
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> >       bus->reg =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(bus->reg))
> >               return PTR_ERR(bus->reg);
> > --
> > 2.17.1
> >
>
>
> Thanks,
> Jonathan

Best regards,
Tyrone
