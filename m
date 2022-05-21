Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD9D52FC86
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 15:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236577AbiEUNAv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 09:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbiEUNAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 09:00:50 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977C3E6A;
        Sat, 21 May 2022 06:00:47 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id c62so10677789vsc.10;
        Sat, 21 May 2022 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UiYBOOmE3B2tSMcIdam7Gz2hPUtw38sVw9m7ntvwfEA=;
        b=dLYTDccXOF5vdOcM3oYWeoDuEOe54vEE4MBQ4R2N4kJ0igBgtDxgjrcTmNno4/JYpU
         GCcDVEj5y1Xd0mFpJDTzwQCRcc0Fun+V4xGU8tybudQaPobtD5MQSknBJG47m9O4JNdY
         RNonrsVcOwvBn7VZuvbazM4jE5m7PTDXznBFyXxXo4Brvh0SfIDMeXLIqfMo9OKuUctn
         ksOd1CzhjJgaHIjm0ignljw8gatzaoNQmF8dL4/dPq+gSRntJCICTh3IOA9G5vElMjHR
         3jNsWJNJxDPlHyHne+ed8UIlgrT9eGAj2yIfLGO9hj900vbevMKLkh6CsUxU5SXc5GZ8
         ZXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UiYBOOmE3B2tSMcIdam7Gz2hPUtw38sVw9m7ntvwfEA=;
        b=RSpOn5mlzVaOZDXszF+Fpoap8GVLpwfNafZjze4jvidQf2MOIh+Ce67qK1kXXlTV65
         0nH2m/exgZq4kCIKcLvrpQA8zJCI9oaPC5jLr73tTO/mewp09iEP9PMwMIorslF1x4+s
         BYUymhBsouq80KP5O9xGniq9/Jh+X5bzuwcKh18hgz9LEfaSei50puIeJsqe3oNF5cWd
         4RR7eIU1DUdlE/IPIfaYxL5El0bb390BoNexzucwgBd3BUe4qWVZlB0Tr9mg91Xblhif
         IemLMj6hRfWxFOOSjPjXEooBfxRBTsMq834OWMoIRad2j0Ltx5GAUFeQFLO2SNia5SpO
         pAEg==
X-Gm-Message-State: AOAM530hKDtlucu6Hi3zZdc8BZ9042HO0ywTOEBsBks2EBzjG5XBfTnM
        WvbY+LD2m5TTySU7KZM6791SRHRk3GDXUttk54qr3HSwCPJK
X-Google-Smtp-Source: ABdhPJwsVewjsXSGmqYnvos4AOWRr7OMnGYmuogma9c6Tmg7y3vgxiG6y6zNx3QmQQ8Cb58ZOP81bncQx7cAkIryqDk=
X-Received: by 2002:a67:d88c:0:b0:337:9a25:36c3 with SMTP id
 f12-20020a67d88c000000b003379a2536c3mr818585vsj.84.1653138046685; Sat, 21 May
 2022 06:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-8-warp5tw@gmail.com>
 <Yoh+YZestxT7oG8B@shikoro>
In-Reply-To: <Yoh+YZestxT7oG8B@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 21:00:35 +0800
Message-ID: <CACD3sJbcOdCED24Fno-jd1z0T21KuJ_hTWNQcSHqhbxaZZaXwA@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] i2c: npcm: Handle spurious interrupts
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
Cc:     jie.deng@intel.com
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

Thank you for your review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:39PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > On some platforms in rare cases (1 to 100,000 transactions),
> > the i2c gets a spurious interrupt which means that we enter an interrup=
t
> > but in the interrupt handler we don't find any status bit that points t=
o
> > the reason we got this interrupt.
> >
> > This may be a case of a rare HW issue or signal integrity issue that is
> > still under investigation.
> >
> > In order to overcome this we are doing the following:
> > 1. Disable incoming interrupts in master mode only when slave mode is n=
ot
> >    enabled.
> > 2. Clear end of busy (EOB) after every interrupt.
> > 3. Clear other status bits (just in case since we found them cleared)
> > 4. Return correct status during the interrupt that will finish the
> >    transaction.
> >
> > On next xmit transaction if the bus is still busy the master will issue=
 a
> > recovery process before issuing the new transaction.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
