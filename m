Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11F264AD44A
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 10:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349651AbiBHJD1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 04:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237702AbiBHJD0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:03:26 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1875C03FEC3;
        Tue,  8 Feb 2022 01:03:24 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id l14so9342238vko.12;
        Tue, 08 Feb 2022 01:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g7Zin2rUPB97FeKXpo4tsRMRhY3AWBi3dGQJ2mNf6+4=;
        b=FwaJSf4cmxqj0kr3AaXMp8lonIfAVaWAyVNwBcpOaDNtXTtz9Dti2xOSdqS4zlW4Rx
         NRVtec57NFaWGiPr4zyHMz6aFrNSn07YPX7X6ZDfShlaIntYqAn/xFhA3rLuvC8j5MCl
         805BozXUKF0vruVlDQA3TIjjql9VCTaLZRdztZNCwgCc/E6jmAlGUsO2JRzdqUgiqM/t
         VgJ1aAySF28mAeISOMCjM1GIFPG84kBmy90OhIfSEG++JWBuVRb7RhcabAiWWcSCB6wt
         yM+Fj+ExdpsTKPQCGtN5rOFENv+Ja1z54EDdohiWtHdrLpVresiPAgvw69mgX/TTU42a
         hAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g7Zin2rUPB97FeKXpo4tsRMRhY3AWBi3dGQJ2mNf6+4=;
        b=i3cC4g0stJUZyyUQy8WrcaaWUtOTmtXGm3ufgqmF3i9APdJstOKqthG43cYxATAtMI
         evP+8+mS4jzH1v/WfX0t1Lcp57nUyXctK72Bvn2MZcHxyy7MjCYQkRON38u6eq+9jG1+
         4yQ4wjcJD4ZIvmHVxViZ0y7F7GbYvDDk63H/Z6Z98FxUlb7DB1I+T0VFolleOp7q6HzG
         820XLjOHU47H1L1BCHRN/nRtjX11twc0IvEkldlFmVNDpCDfK6fkodxrS8/gQQs10Aad
         +rzxgZrJ7c+8MbuqlzK0LGKCEwzfm2okSl46nK362Z1j8F5jzjuaAcPZbPInibrgsj4g
         bl1A==
X-Gm-Message-State: AOAM532o/VSW6Io3RvdwUPOsJbFbmAjyenHHR+HEE3vYNwpcRdakCjhG
        VsA7DZcfjNHjV4SiXobmJRIK84qEbT7BNkUMTDzM65C6zTh6e90=
X-Google-Smtp-Source: ABdhPJyinu4n6GoB11vkNuf0WE0tbwdWbilUOFXd8tUNEKbSfSiWxNOJhGqQ+2aAdj53Gyr6yQ2eJogPz61o5GOgXgc=
X-Received: by 2002:a05:6122:8d2:: with SMTP id 18mr1267658vkg.31.1644311003630;
 Tue, 08 Feb 2022 01:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-2-warp5tw@gmail.com>
 <1644243760.823059.320509.nullmailer@robh.at.kernel.org>
In-Reply-To: <1644243760.823059.320509.nullmailer@robh.at.kernel.org>
From:   warp5tw <warp5tw@gmail.com>
Date:   Tue, 8 Feb 2022 17:03:12 +0800
Message-ID: <CACD3sJa4JOV2MYknMVGXVT0wEVbA4SkexaV5JLg_ukXqyE84+g@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
To:     Rob Herring <robh@kernel.org>
Cc:     Avi.Fishman@nuvoton.com, openbmc@lists.ozlabs.org,
        lukas.bulwahn@gmail.com, bence98@sch.bme.hu, sven@svenpeter.dev,
        devicetree@vger.kernel.org, tali.perry1@gmail.com,
        krzysztof.kozlowski@canonical.com, arnd@arndb.de,
        benjaminfair@google.com, tmaimon77@gmail.com, yuenn@google.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        semen.protsenko@linaro.org, olof@lixom.net, venture@google.com,
        wsa@kernel.org, avifishman70@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, kfting@nuvoton.com,
        tali.perry@nuvoton.com, yangyicong@hisilicon.com,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com
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

Hi all:

Thank you for your comments and they will be addressed.

Regards,
Tyrone


Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=887=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 07 Feb 2022 14:33:33 +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This commit adds compatible and syscon description for NPCM845 i2c modu=
le.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1589171
>
>
> i2c@80000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>
> i2c@81000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@82000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@83000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@84000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@85000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@86000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@87000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@88000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@89000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8a000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8b000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8c000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8d000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8e000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>
> i2c@8f000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>
