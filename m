Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA5E522901
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 03:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbiEKBeX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 21:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbiEKBeW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 21:34:22 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E34525AF99;
        Tue, 10 May 2022 18:34:21 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id j14so457275vkp.4;
        Tue, 10 May 2022 18:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hUbRV+sAgUiSy2bUpARcOgCdPqjZDpreSWj6clywayk=;
        b=cvhcSZYUE8WppwVWg0K4i5OGAupu2BbFv5EGZXMWzpyT92xjLPbdPc1UlmdsYKkABF
         lSqmnsumW5ssSuqP8HBrh6tPngZ1sbcKIk55pFFSByEsnVM4Af3DQbTOyTwytZTC1iko
         L7lotJWsXyi7iUilU9qlKRgjLNIInmcPwFm6uLDBWQDEKcgzrY+5ibXsuEatjHkh9Izg
         Q791RaPG5meZIxhnwOBKEp1j5Alx9xIT1BclmVWMaAtso/Kt3cdks6c4dA0tzjGuTf36
         VEPuwOq2f5EsBS0qfj/JhqEoUxzS2nE1T8C+xOP1x7dGf37VexSP/HBNMPY5MlY+T1iC
         9ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hUbRV+sAgUiSy2bUpARcOgCdPqjZDpreSWj6clywayk=;
        b=MXoIaJTptUhd1o/a9oTIcKcOXwMKDMjPjUM3aqJE3EeX2uHIfbxcqhvs/exCloBlpx
         j3i6nm0VT+5FVAriGPoVmyt3O/kEKVV/474YVqJ7VjsuTm0qa5ghcbA3EVV9oE4rLUYQ
         o4oBHqNCImD74N6kYKkKXdmzljcGkpR+WKVFzDqP6BF4prhBJ1++cWlKGrEXVYLlewiW
         nLnC9cBsE9u1QtmpdZnU1IbCq1bZDJkL3job0LX5HKB3bKFwyiExdYjHWuaS1A0hSXJE
         kU0s1l0dOUyuNdqUuea1sM8g6CogwbXcHaRqv38GnHudC+iGFVqzR98rxqyeOmOW9QGb
         XgdQ==
X-Gm-Message-State: AOAM531u0PN8GEN1kgxCQOrVqbmYa3GamEq/RgNA6dGa3VYIbeWNjwbp
        p/htfLFufgvZHIV/pxG7f98pHflW1JGQ/2HDlw==
X-Google-Smtp-Source: ABdhPJy1LvIQrZzYr0kMhSSq0YcMODrI0B+H/NSEPuNclCK78Buj4unTd+AwI3LvbBD9ZUZI7/QEyyzgDsuIgF5A4y8=
X-Received: by 2002:a1f:91cb:0:b0:34e:10c8:cf1c with SMTP id
 t194-20020a1f91cb000000b0034e10c8cf1cmr13428181vkd.31.1652232860533; Tue, 10
 May 2022 18:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com> <20220510091654.8498-3-warp5tw@gmail.com>
 <Yno5mJMi/3dZyjNz@smile.fi.intel.com>
In-Reply-To: <Yno5mJMi/3dZyjNz@smile.fi.intel.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Wed, 11 May 2022 09:34:08 +0800
Message-ID: <CACD3sJYgb-kkTLFwCi16WotYTC3vN8ZReeuPf4=r7CT1-6CX6w@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        wsa@kernel.org, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
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

Hi Andy:

Thank you for your comment and it will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
5=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:08=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:47PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Change the way of getting NPCM system manager reigster (GCR)
> > and still maintain the old mechanism as a fallback if getting
> > nuvoton,sys-mgr fails while working with the legacy devicetree
> > file.
>
> ...
>
> > @@ -2236,6 +2236,7 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       static struct regmap *clk_regmap;
> >       int irq;
> >       int ret;
> > +     struct device_node *np =3D pdev->dev.of_node;
>
> Can we keep "longer line first" order?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
