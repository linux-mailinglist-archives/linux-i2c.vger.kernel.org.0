Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3972B535715
	for <lists+linux-i2c@lfdr.de>; Fri, 27 May 2022 02:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbiE0AbP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 20:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbiE0AbP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 20:31:15 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3B5B0B;
        Thu, 26 May 2022 17:31:13 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id c62so2913309vsc.10;
        Thu, 26 May 2022 17:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bx0K5msFh3pNmzh8X+2nPnmbDmrzr93sWsFhFuKypb8=;
        b=crvQFxy2kETdBwme1u+UE2SJEU3y4X9qCP5+LitHocqZ0XGaNcg6o5EEXugaczwjLW
         +usd3vggxutmLaSOc7RLyOglDpt3IpzRxkfM4UbU1i2LU8mz9iLFMHpVLI+/9t63pd3v
         4WiJ7YRnmhS7lg9EO2OiEcK2C29rAvUbwETU91nOQ6d5xDqHEdYYhJYgcyimUmY0LMFJ
         XuHIHlGE8+mjOFS9xnDI6xQF6kR8eHxHSjkdn2Ob0UF/m3xMCplPMyOdj02nJk1G/eV4
         u1G9SltfMDPNkY+RgnvfGDUJRWbY0Qu5N7vdFyudAkVwS7JxGBYRK0oqZwIdQ/w+LeEi
         rCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bx0K5msFh3pNmzh8X+2nPnmbDmrzr93sWsFhFuKypb8=;
        b=7ycCu4ocOTidIaEmtztwY1KCrFFOFonlm4oWU7WT1aETuG/O8LuDeq6FOnyz5ro95L
         5lI772GkCciMpe+Q9qltXDR5Js4HPQmOxYOk3fIJFd7KUWoq5qm1yp1lTV6IMjI0Rhoa
         O92ydbkwrOoG1QPAp2oCq/d87eOzsow4X5o1qh61GA+jZFKD+FoDFbn5ZDoOn/EaSIaz
         1nThn74I2Jx6w1STByluWmydioquchGc6Zy3+pNgWyHebjmnjQec3cTK2lxWOREUPQgc
         qSD19MrxG3pJ7UsomOGwQEMxgHDyRVXmQNecz90bdlDd61LnBJVhz79LLcfGa9NwkBgT
         T2/w==
X-Gm-Message-State: AOAM532XduddaswA50uBKrPBuZCGKDDMmT7tP69nm0PisxDs8WP18MAd
        PPA5ixXj6UG1fI/AoYk8RZ0euvABct3BMFIULw==
X-Google-Smtp-Source: ABdhPJxrv6RK04WOkAO9q9nyChrsL5sj/q/zMxHju9rv19w0OEl+GqzkgGRkR3ymujYxGl7/0mc9r5puVDakCE4dApA=
X-Received: by 2002:a67:1787:0:b0:337:d8cd:35b2 with SMTP id
 129-20020a671787000000b00337d8cd35b2mr6646742vsx.29.1653611472541; Thu, 26
 May 2022 17:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <Yo5ijJ9mqXRNB7d8@smile.fi.intel.com>
In-Reply-To: <Yo5ijJ9mqXRNB7d8@smile.fi.intel.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Fri, 27 May 2022 08:31:01 +0800
Message-ID: <CACD3sJbGxJMks02qB2uWTivtMvBFhxe9Chq4B4Wyk1UtmqnTUg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] i2c: npcm: Bug fixes timeout, spurious interrupts
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, jsd@semihalf.com, sven@svenpeter.dev,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
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

Thank you for your review.

Much appreciated.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
5=E6=9C=8826=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:32=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:36AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
> > - Add dt-bindings description for NPCM845.
> > - Bug fix for timeout calculation.
> > - Better handling of spurious interrupts.
> > - Fix for event type in slave mode.
> > - Removal of own slave addresses [2:10].
> > - Support for next gen BMC (NPCM845).
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > Addressed comments from:
> >  - Wolfram Sang : https://lkml.org/lkml/2022/5/21/51
> >
> > Changes since version 5:
> >  - Shorten npcm_i2caddr array since the number of supported i2c slave
> >    addresses is reduced.
> >  - Create a new patch from the original PATCH v5 08/10 to modify the sl=
ave
> >    transaction logic.
> >
> > Changes since version 4:
> >  - Remove quotes around ref handle to nuvoton,sys-mgr in i2c binding
> >    document.
> >  - Keep the "longer line first" order.
> >  - Correct the SoB chain.
> >  - Modify the if statement in one line and add new line characters.
> >  - Modify the commit message format in the patch Remove own slave
> >    addresses 2:10. Correct the if statement in one line and shorten the
> >    debug messages.
> >  - Create a new patch to capitalize the one-line comment in the driver.
> >
> > Changes since version 3:
> >  - Correct the const format in if condition in i2c binding document.
> >  - Add the oops message statement and register information in register
> >    access width patch.
> >  - Add the occurring rate of the i2c spurious interrupt issue and more
> >    details in driver's behavior to overcome this issue.
> >  - Address Andy's comments in the patch to support NPCM845.
> >
> > Changes since version 2:
> >  - Keep old code as fallback, if getting nuvoton,sys-mgr property fails=
.
> >  - Fix the error reported by running 'make DT_CHECKER_FLAGS=3D-m
> >    dt_binding_check'.
> >  - Make nuvoton,sys-mgr required for nuvoton,npcm845-i2c.
> >  - Correct the patch's subject about changing the way of getting GCR
> >    regmap and add the description about keeping old code as fallback
> >    if getting nuvoton,sys-mgr property fails.
> >  - Correct the patch title and description about removing the unused
> >    variable clk_regmap.
> >  - Use the data field directly instead of the macros since macros are
> >    not constants anymore in this patch.
> >
> > Changes since version 1:
> >  - Add nuvoton,sys-mgr property in NPCM devicetree.
> >  - Describe the commit message in imperative mood.
> >  - Modify the description in i2c binding document to cover NPCM series.
> >  - Add new property in i2c binding document.
> >  - Create a new patch for client address calculation.
> >  - Create a new patch for updating gcr property name.
> >  - Create a new patch for removing unused clock node.
> >  - Explain EOB in the commit description.
> >  - Create a new patch for correcting NPCM register access width.
> >  - Remove some comment since the corresponding logic no longer exists.
> >  - Remove fixes tag while the patch adds an additional feature.
> >  - Use devicetree data field to support NPCM845.
> >
> > Tali Perry (2):
> >   i2c: npcm: Remove own slave addresses 2:10
> >   i2c: npcm: Correct slave role behavior
> >
> > Tyrone Ting (3):
> >   dt-bindings: i2c: npcm: support NPCM845
> >   i2c: npcm: Support NPCM845
> >   i2c: npcm: Capitalize the one-line comment
> >
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 ++-
> >  drivers/i2c/busses/Kconfig                    |   8 +-
> >  drivers/i2c/busses/Makefile                   |   2 +-
> >  drivers/i2c/busses/i2c-npcm7xx.c              | 176 ++++++++++--------
> >  4 files changed, 124 insertions(+), 87 deletions(-)
> >
> > --
> > 2.17.1
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
