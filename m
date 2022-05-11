Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5EE8522BCC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 07:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbiEKFiA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 May 2022 01:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbiEKFh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 May 2022 01:37:58 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5133B2AF;
        Tue, 10 May 2022 22:37:56 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id a127so907543vsa.3;
        Tue, 10 May 2022 22:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=99+74zi/ugqpPP/H1BYx5mgxsw+MDJDahwiZMO6/fXg=;
        b=iSXjFtVdoulAW6NWsq1PlmfC+Qc6T0H6RCPJgN+0OIjZRODULDLwlVSQfCwx2mvpu4
         LeRNFlmImRZYhJo2Gipt91G9tXQlMJR6esNrSwjqvBDd218CuRg2Ct7WOxdYUoxA3dcy
         mma0bmpQdUAuxDWaBP4/vx2EshnDFGylyHaeVxK5KWWuW4mZpSOOy0Ogmyd1JaSkxuQg
         unlANkeTyEalXxWZMCJnsK2WG+XLkJJnMllmD17jQf2zbwj1Yl6Hn4s8ySOGuNUBoc3i
         si4s7/48IlQJ+tsGWUao50RjPAMdunVkiXKe6wmV9pUS/if4BYYIxycPZe5AqxByEjUE
         b69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=99+74zi/ugqpPP/H1BYx5mgxsw+MDJDahwiZMO6/fXg=;
        b=OoaaEcky3UIAORh7nPF1TaVbpVZW7xQLx+xq6V+GGcybSM/d9lDoSe0fqCWbQYooOl
         Hpx68uT7zbGA88XX8m0jNBp3ag/8KhKQYSwB6+S+IMeSg70lSNLmQk167RHokcwiXCdK
         R57lIW+2Gsb/OsqqGD20dBKny+BUNBFJDzyLxqa8rI36GZgGbmy3hJprm2uXaBA9IHnf
         rIpsx+HfOlrnhKtn38TiKUhyKQkdVlxBsrSbKUgRqQGEoKthQwVKKm8MZrSLytu6+aeM
         Pg8j9Qc9WFtHq1Zx3Ecf5lQjpCHv+ttWDp5SP9vw9M7uW4VxmdoZ8vOnN9jK7Gh0L6cz
         Xnsg==
X-Gm-Message-State: AOAM533qJrhLcYRcMA3k9x9K3uHUkh92JpYZukj/GdJUMRlvpqAs+8AE
        bXtL0iP9Pvmx/QT2GfkGtu2yocK3z4hfl8YnRg==
X-Google-Smtp-Source: ABdhPJzGI4xLPZN4cIpW61gkAg41dLMEipuG1mmnFJBEpFDmP97YmzjtAqLMeg6hmzlp8t4UkpaMK8VUfoOjgxnHaNs=
X-Received: by 2002:a67:b60b:0:b0:32c:e69e:15b3 with SMTP id
 d11-20020a67b60b000000b0032ce69e15b3mr13088417vsm.2.1652247475469; Tue, 10
 May 2022 22:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com> <20220510091654.8498-8-warp5tw@gmail.com>
 <Yno7IaBNnR5U2GuF@smile.fi.intel.com>
In-Reply-To: <Yno7IaBNnR5U2GuF@smile.fi.intel.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Wed, 11 May 2022 13:37:43 +0800
Message-ID: <CACD3sJYPrQoWzOkOKM5tWuTWS0uEertBSrwMa5QmX0cMAPF4EQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] i2c: npcm: Handle spurious interrupts
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, wsa@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
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

Thank you for your comments and they will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
5=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:15=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:52PM +0800, Tyrone Ting wrote:
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
>
> ...
>
> > +     /* clear status bits for spurious interrupts */
>
> Clear
>
> ...
>
> > +     /*
> > +      * if irq is not one of the above, make sure EOB is disabled and =
all
>
> If
>
> > +      * status bits are cleared.
> > +      */
>
> ...
>
> > +             /* verify no status bits are still set after bus is relea=
sed */
>
> Verify
>
> ...
>
> > +     /* check HW is OK: SDA and SCL should be high at this point. */
>
> Check
>
> ...
>
> > +     if ((npcm_i2c_get_SDA(&bus->adap) =3D=3D 0) ||
> > +         (npcm_i2c_get_SCL(&bus->adap) =3D=3D 0)) {
>
> This fits one line
>
> > +             dev_err(bus->dev, "I2C%d init fail: lines are low", bus->=
num);
> > +             dev_err(bus->dev, "SDA=3D%d SCL=3D%d", npcm_i2c_get_SDA(&=
bus->adap),
> > +                     npcm_i2c_get_SCL(&bus->adap));
>
> No '\n' at the end of each?!
>
> > +             return -ENXIO;
> > +     }
>
> ...
>
> > +     /* clear status bits for spurious interrupts */
>
> Clear
>
> ...
>
> > +     /* after any xfer, successful or not, stall and EOB must be disab=
led */
>
> After
>
> ...
>
> Maybe you chose the small letter for one-liner comments, but I see even i=
n the
> original code the inconsistent style. Please, add an explanation to the c=
over
> letter and follow it, assuming you add the patch at the end of the series=
 that
> makes comment style consistent (for the one-liners, for the multi-line co=
mments
> we have a clear understanding about the style).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
