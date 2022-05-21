Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95EBE52FCD0
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 15:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344477AbiEUNW1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 09:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbiEUNWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 09:22:24 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F13F60064;
        Sat, 21 May 2022 06:22:23 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id e19so10715932vsu.12;
        Sat, 21 May 2022 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=k83DVcIcffNjBmT+wlu9VAh4wJXwqJzexEQvALMCO7A=;
        b=mKHk4RofXhQK4eLxHsDk3reXwyjiqEQbNfsXRsKBcRxL7PGJHEfGWrQ8bhweXz4jxG
         uq+3+8pHy4BRpHyRFeRtZ0gukNg7qQ6O7sILCCMt58U483zdPWBKHp+ueWMB3r3hNIVi
         8VsP5a0g5Tevkx/KXwAhUwOCsSamPX0ltozwWgemNIDUlnehLD9A6Z+MOLWODO4kxKqN
         +yLwWy1K675pz86c3DP780FZwasgG0lUh6T6jv871cdhEKFR5Xo8rVwjmyORMiBikx/7
         2ANja/zRSj6Y1f9ToeFivDSqScWMwSO+nI23R3B4z5xaT/XlIDwp0Bbx7CrAs3KZ8z0G
         i4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=k83DVcIcffNjBmT+wlu9VAh4wJXwqJzexEQvALMCO7A=;
        b=qIibgR1fg08Kg3ds3oG4ydHYtCKdirbgHC2SsUlyCwajrCsp5vB5KGvncGfGVDK+5I
         F4Zh+XzuFILnnM0I/Tnm9ppYWAO7ILuDzNhe8tw3hAnrzFWMkI9HbmVbMiyWcPPLvtgA
         afc8wIAa+aBvtGe2MLz2qlIbHc2OC9nzP9L7dRHDQm75U+iyl9AqITw6n+v+ZZ8p8xqr
         u8usWu4wB0f0QyvDZXQ4an7D6MBd4v28J186IdPUuKcBG7sm+tS3aeoChbnb8RAMtROQ
         uZsKFzO2WfMipkMOo0n12UT2+d+Lg1oaWvuz25dtO2NBFiRS0widXw/susQ0LXEXt1LI
         r5GA==
X-Gm-Message-State: AOAM5325OvUnJMi1ScgcNQUEeQGv9/k1JT5Vj9n7mSZMRDXETtMyXjcF
        fZi0VQT8th6saUKNa1pjBQO5QrjUxIRfXzKRKw==
X-Google-Smtp-Source: ABdhPJwdtT3lmW5L/ar4Qia93oyUEeZtSo6Wvd80aKSyRZZ7LHnsu45ANLywj2/NuRH/cy3ZSEbxXTtiwQ9Y6ncBtno=
X-Received: by 2002:a67:cc02:0:b0:335:c5ac:96d7 with SMTP id
 q2-20020a67cc02000000b00335c5ac96d7mr5905980vsl.50.1653139342676; Sat, 21 May
 2022 06:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-11-warp5tw@gmail.com>
 <YoiAmI2wZz2Bkcm1@shikoro>
In-Reply-To: <YoiAmI2wZz2Bkcm1@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 21:22:11 +0800
Message-ID: <CACD3sJb3ZBsZF=qtbvSikxUU8C-BLChZeHL2mG5JXKkx3QNWyw@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] i2c: npcm: Capitalize the one-line comment
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
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

Hi Wolfram:

Got it and thank you for your help.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:42PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Make the one-line comments capital in the driver to get the comment sty=
le
> > consistent.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Needs to wait until comments to patches 8+9 are addressed.
>

Best Regards,
Tyrone
