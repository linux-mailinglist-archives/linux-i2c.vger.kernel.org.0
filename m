Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1EBE52290D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 03:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239646AbiEKBkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 21:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234515AbiEKBkD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 21:40:03 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41111260863;
        Tue, 10 May 2022 18:40:01 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id z15so211647uad.7;
        Tue, 10 May 2022 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CcFxQLzTZRJwr99fvgXAPxv27Gu79cyIN89beQ0h8+I=;
        b=doQTqwTJY/0aNgS3TuLFjyoXwLksQMSfsszsNSnDHaolf1MYeOl9gG5O24PLVU82fH
         btXj6S4frOw6tM9Z8GDA3by2QXpXn/WRgFG2WHiPhccEtDXkigJ3McQdvck16+qFbQUE
         zcajmkr9sYjabxlbjMGVYu3hiaVg9TVfrkJcfEgzK0w/ftyVRIOUzjJrdJFVyHoMfYz1
         xTTsT4FPfpa6wRskPwjoM8B5YNU8mRgis934ucNRgBsKSZbXoFHAdgPjgO6p5rGhYd9W
         T+jYjGuPqxjbF18YNLyhCe27fVQsAQxm7h+Farsbe/wFNi60+8nVHRybTq1F8v5W8g5s
         KStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CcFxQLzTZRJwr99fvgXAPxv27Gu79cyIN89beQ0h8+I=;
        b=jLU/Bi9RKtgj4NsbUgcjCxlFbPqqc7aWU11+PkvTQ/AvHjpmxtRKaHbJ+ULBVYOruA
         4QM9wVQermynbIW1dHcEKNDBgCZeQ0GxM4ZWi4/KBDkD9tn14Cjkd2SPBpCan/Er6rqW
         VJH0zmIsV+BxTN55Wfm8dW49zTaW/peo+9YstNxAgQCStpMhso9yn8GF57Pyg2gfVH+G
         s1pyhjZIjoFhM1pramAArkL5vDks7r+UohvG7IZ7vWFLxmLoGeqjla98a5+R+L6R6hK3
         5EPfb6TCKWB0iL0xWBarvVEidrW+7EGP6UMzO+6Q63y4/70XECEgF/vH499If+HqLxE7
         d+QA==
X-Gm-Message-State: AOAM533bKQXDE8qJrQHnDl6LaI5h1TjUZIwoW3kBXzC1DlHV++Jc0zIY
        CCK95e/OyCjhWGYuhzeYIuAhDBApFORSimvJFA==
X-Google-Smtp-Source: ABdhPJwOdeGJuYqe4UdD24r6xFX8A4WORqnypLWn7xKLOUFSl3SkCt3/PITp6+sTRwqH8HOqqFo3SqgByFDcT98cVao=
X-Received: by 2002:ab0:6f95:0:b0:362:8cb3:36f3 with SMTP id
 f21-20020ab06f95000000b003628cb336f3mr12861637uav.46.1652233200103; Tue, 10
 May 2022 18:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com> <20220510091654.8498-9-warp5tw@gmail.com>
 <Yno8KMycNbJ+VGtc@smile.fi.intel.com>
In-Reply-To: <Yno8KMycNbJ+VGtc@smile.fi.intel.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Wed, 11 May 2022 09:39:48 +0800
Message-ID: <CACD3sJYVyV_fFJu9zXJGL1ro02KnkHoeNNSNB8O46FRwd6=-BA@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: npcm: Remove own slave addresses 2:10
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, jarkko.nikula@linux.intel.com,
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
5=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:19=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:53PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > NPCM can support up to 10 own slave addresses.
> > In practice, only one address is actually being used.
> > In order to access addresses 2 and above, need to switch
> > register banks. The switch needs spinlock.
> > To avoid using spinlock for this useless feature
> > removed support of SA >=3D 2.
>
> > Also fix returned slave event enum.
> >
> > Remove some comment since the bank selection is not
> > required. The bank selection is not required since
> > the supported slave addresses are reduced.
>
> Fancy indentation. Please fix it in all your commit messages where it app=
lies.
>
> ...
>
> > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADDR1=
0) {
> > +             dev_err(bus->dev,
> > +                     "try to enable more then 2 SA not supported\n");
>
> Make it one line and drop {}.
>
> > +     }
>
> ...
>
> > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADDR1=
0) {
> > +             dev_err(bus->dev,
> > +                     "get slave: try to use more then 2 slave addresse=
s not supported\n");
>
> As per above be consistent with abbreviations ("SA" here, which makes lin=
e
> shorter) and follow the above recommendation.
>
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
