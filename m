Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D68E4CBE6E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 14:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbiCCNE7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 08:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbiCCNE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 08:04:57 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9069F50477;
        Thu,  3 Mar 2022 05:04:11 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id j5so3984546qvs.13;
        Thu, 03 Mar 2022 05:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lVVqGzxWl1Ux5ICb2CCCQDe80RAQD6Gjf6fg6zMkY8=;
        b=Ztb+V9aWpOLnDQnK8i2xWUBhxQ7+roYPkRS4jvaARlWILKSyBe7MfmnHHd3R4n+bFT
         ClCXjl97vna3KL0S2uQszBOzV7kFp8m0N7Hot0+fvLLSnlmWebPTaW8zeUP2EKP0+/eg
         oYQVSNAjkaks3Nc88jbzNy5KYE6ZFW6UZQ3V/md9sRy+Wl98aDfOuWtbGYaGg/5h3bpV
         +tUSRAfOsPwShrpRdlUdUtGwFieCOQgBEGd4TIrvDKidxGtU5pU/ShEv5bo0NY+Ye5rW
         r2JhUXmQZVBtrB5Ez/Gyom1FkFb/O7KEYgBdiRXYVMv97NwteH/TTiuU/GE7uTgid+3f
         JZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lVVqGzxWl1Ux5ICb2CCCQDe80RAQD6Gjf6fg6zMkY8=;
        b=d0Z1v2ABmxTedKno4+vSAcTxqxT5MWRwqlBNn43NW09GnaZANhWMVbj+p+Js04TgJc
         0qrOE3MCeWhliw0z7LAdPFlDoRooTetJTaSXjzAy6gBM3/E5L5ch0XEmtEW2MpukaBhL
         tUz41wBuppRI0UiP7e4dHTTtE9gB15ww9PzkyCPAmzKtBewLUpe2M2/Un3tU8QTNrmht
         I7jvBWN4j+c2rcjuGleyAIkv0ZwcrDF6pSiPiBnrchYb4ALwJK9TaXruMv6Tk5Ts1H/J
         dXjBbFxywCy0rn7aUaWVeBsUSUZed4sh/W78wDfCTgM4CIQWxC9Kp1pmleWGNOco1fpq
         Oncg==
X-Gm-Message-State: AOAM531t2PG/yeXndWeAkPHp1i9kOZ3atkgKJ2Ctx4oYzIc9dqNAlK3Z
        dERloGExHx+WAtShn418/JHaCOBty7Uw9wEHyNM=
X-Google-Smtp-Source: ABdhPJwdktgf6aoxdjY555xRSyIKgajAti2vfX8KCBRVqgNzmbSLxxuW2JQwZsXmzwFidaRikPpLS1azpbs3dq6ldI8=
X-Received: by 2002:ad4:5ba8:0:b0:434:66a8:6cd8 with SMTP id
 8-20020ad45ba8000000b0043466a86cd8mr10177600qvq.4.1646312650715; Thu, 03 Mar
 2022 05:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <YiCXujUOUum+CAU9@smile.fi.intel.com>
In-Reply-To: <YiCXujUOUum+CAU9@smile.fi.intel.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 3 Mar 2022 15:03:59 +0200
Message-ID: <CAHb3i=sW16cykfp2Q=s6evzodD4wKreK3PrOb2YPeQzE-NWe4A@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 3, 2022 at 12:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 03, 2022 at 04:31:30PM +0800, Tyrone Ting wrote:
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
> Overall my impression that the code was never tested for this driver and
> somehow appears in the upstream and hence this series.
>
> Anyway, I'm going to review the changes here.
>
> --


Actually it was and is being used by multiple users in lots of BMCs.
We haven't submitted patches for this driver for a while
and accumulated them all on Nuvoton Github repo, but now we wanted to
clear the table.

All your comments will be addressed and fixed for the next patchset.
As always, we really appreciate your review and taking the time to go
through all these changes.


> With Best Regards,
> Andy Shevchenko
>
>

Thanks!

Tali Perry
