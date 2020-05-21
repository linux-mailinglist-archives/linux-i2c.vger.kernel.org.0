Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B2D1DD89E
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 22:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbgEUUqB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 16:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbgEUUqB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 16:46:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7078C061A0E;
        Thu, 21 May 2020 13:45:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q2so9941784ljm.10;
        Thu, 21 May 2020 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uTez8kuMY3TP5XsYIYA67o+sB7pgMVGNezpgMi033kI=;
        b=H+JXV4Ixd6t9+mkrG0yCupqx+KR1gWYSFhjUFNvuKf/wkH+6khAb6xrNdNuhnj5QXk
         X9Zm/XBFtHdUmbOmELCzPYWUI20raJQz8yo3cgVLs+6gTwPtuh8rC1gYYGkCbnqSNjvq
         FKGXIEO5+WlXbr7mDxvQKahVXYOykev04GbpMcOK1//pegIotbHdVOPnPDPIJ+Q43i6K
         3+NZEH8E0T8oCXk2yB8v8jPjAMrOmL2FB26EvDJqRacwpz+Z7L0QhWMjWRU49U1stx1e
         bMHNCva0IhTKMKVUOvjV7rocF8mJaazH7yMc0h8TI32bZRcJb4uVXDKLZ1SioqjCAY/x
         pe+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uTez8kuMY3TP5XsYIYA67o+sB7pgMVGNezpgMi033kI=;
        b=q5b5NxsYtmGyRd0kqj3OZUEALbMXCSe7giNFtaxg1W6BkdSWsdqLyxdNcS/114KPSa
         Ocye0ATlWUIltd2zd/Eim2kiMrTRJCFGDA9zIH36OYwlK4t1mWu8mRLg3gOH2q3826vy
         L4B39Iqe3IIcI0oIOUCv+n8tW6ZwRQiRz/yCf0+4k32SyfHAPCYHor+iiGd0bP32nrHG
         5zq7nRe1SglagBZVxA9+TrLx3goWy79kIn0cPhL/XMnImaZOdbGoHIypP3m8rqa15Ne8
         O3tZtm4QuuxI3wpyaQ+LnOj/wQIjDFsl3caWSIarRgyH1ctQR3NQON4sydqFVUUcEvGY
         AqeQ==
X-Gm-Message-State: AOAM531ABBpUQS14beMzpcC0LOdciesaGzO7foxjzoncs55vec9WSFOM
        QRf2agTfAlxhU+Vrnnk0qKo65/KgpNez5zSvGEU=
X-Google-Smtp-Source: ABdhPJxzQSWFIUeHpddcteib1fh2PMeMjFE+FkunevVip9n2ACN30aLCRo7QK85YpmYxoO6chpiGZFOVh0YMQSAjPsg=
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr5990758ljq.2.1590093958157;
 Thu, 21 May 2020 13:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200521110910.45518-1-tali.perry1@gmail.com> <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com> <20200521143100.GA16812@ninjato>
 <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
 <20200521145347.GO1634618@smile.fi.intel.com> <20200521203758.GA20150@ninjato>
In-Reply-To: <20200521203758.GA20150@ninjato>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 21 May 2020 23:47:18 +0300
Message-ID: <CAHb3i=tF2YF3LbbWRK9buObU-LjWGhxKCwvj2Jtn=VH1p+zDJg@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ofer Yehielli <ofery@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        kfting@nuvoton.com, Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 21, 2020 at 11:37 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > > > I wondered also about DEBUG_FS entries. I can see their value when
> > > > developing the driver. But since this is done now, do they really h=
elp a
> > > > user to debug a difficult case? I am not sure, and then I wonder if=
 we
> > > > should have that code in upstream. I am open for discussion, though=
.
> > >
> > > The user wanted to have health monitor implemented on top of the driv=
er.
> > > The user has 16 channels connected the multiple devices. All are oper=
ated
> > > using various daemons in the system. Sometimes the slave devices are =
power down.
> > > Therefor the user wanted to track the health status of the devices.
> >
> > Ah, then there are these options I have in mind (Wolfram, FYI as well!)=
:
> > 1) push with debugfs as a temporary solution and convert to devlink hea=
lth protocol [1];
> > 2) drop it and develop devlink_health solution;
> > 3) push debugfs and wait if I=C2=B2C will gain devlink health support
>
> No need for 2). We can push it now and convert it later. That being
> said, I wonder if [1] is suitable for this driver? Things like NACKs and
> timeouts happen regularly on an I2C bus and are not a state of bad
> health.
>

Agree, having a timeout every now and then is not an issue. The user
is interested
in cases when the number of timeouts\BER\nack\recovery are high.
