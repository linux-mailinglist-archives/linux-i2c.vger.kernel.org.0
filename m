Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135F12804E5
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Oct 2020 19:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732569AbgJARPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Oct 2020 13:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732407AbgJARPB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Oct 2020 13:15:01 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AFFC0613D0;
        Thu,  1 Oct 2020 10:15:00 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id g7so7525634iov.13;
        Thu, 01 Oct 2020 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z+7Lt80oBeAGmb9TBQ2+JaFU8H0QfKMoZ05cXeDXD9U=;
        b=PhU9qdrPsdyEV4/IkasacTEJJ/IceRDChfTyR2GjTJOu+JE8YVw41h4EnNCIXyHx5K
         VxmwBQOp/VoPC6lRilRIeSw7sMZGwUJP65HpUyF2TrpIRJl+/9FIMyFS4rfDArgzjAD3
         9wnWYcn+4/8yfn7hbYcPmUCmoziaZDj5a5jwGBQFsY5NoDdFGWqGoq/vDemy7KGur45v
         zm1FX0djCPnwkbkCXSOaTfMMr+9jce90wF6JMv8v/IBGyuFz8MHRNLwswd3fiO4g+NHq
         oofiBj1Itz5FRRpIPuGr6PodDzBe7vGZD9jfuIea6hO5/Kxx3GR1NgIlRiDlU+kp/2Gb
         EsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z+7Lt80oBeAGmb9TBQ2+JaFU8H0QfKMoZ05cXeDXD9U=;
        b=A3b/Rx6rZhAwIPy/KUs6n8pm7SVBamJXCCJtVk/LtDj51EeoEt5DsUDm1rmr91U9Vx
         Uj/5cuZ7cB7MC1BveD/8vxxdD2e2qxMHrtDXg85bXQ/UhO2OJPuHc6rMHP1+VkGLAnef
         /c5fCxF+i+supUgrMcZEfFp4yaLmOv/AJmwtqIxUESWwNk5ysQSXh1HKErhQAaVV9AdM
         ngQr4y1I0yE89iy4KCuEl+u2iJ24jCYp17PWn7+P9smisrT1ooHPNkQZmAcffWDRVZE3
         PKQjtuwk/HiCk/EPE4LaQZA3dEyHrWb/pc34p4fqL6mZBJB+KAL4OU/Ztod3pEpLM5r0
         aDKQ==
X-Gm-Message-State: AOAM532pMVLfb39unvpKTbH57f+w6D/zVicfbbWOYLKTMhC0ioA8jOiG
        rdpkSZ8WJmB6Ye1bSOeS/TRwTCFdRv7vFJTNtA==
X-Google-Smtp-Source: ABdhPJy8DcqWDEWw9DLV6GesYGG7ZYbppxk0xqAtTGsejro8nMut9O+LwsIpL8jZd0UL1L6908xTBbJaDiAXgQZhBLU=
X-Received: by 2002:a02:ccdb:: with SMTP id k27mr6786779jaq.103.1601572500365;
 Thu, 01 Oct 2020 10:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com> <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com> <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
In-Reply-To: <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Thu, 1 Oct 2020 20:13:49 +0300
Message-ID: <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Alex Qiu <xqiu@google.com>,
        Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Customers using BMC with complex i2c topology asked us to support
changing bus frequency at run time, for example same device will
communicate with one slave at 100Kbp/s and another with 400kbp/s and
maybe also with smae device at different speed (for example an i2c
mux).
This is not only for debug.
Can DT overlay support that?

On Thu, Oct 1, 2020 at 6:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 1, 2020 at 8:34 AM Tali Perry <tali.perry1@gmail.com> wrote:
> > On Wed, Sep 30, 2020 at 12:31 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> > > > Systems that can dinamically add and remove slave devices
> > >
> > > dynamically
> > >
> > > > often need to change the bus speed in runtime.
> > >
> > > > This patch exposes the bus frequency to the user.
> > >
> > > Expose the bus frequency to the user.
> > >
> > > > This feature can also be used for test automation.
> > >
> > > In general I think that DT overlays or so should be user rather than =
this.
> > > If we allow to change bus speed settings for debugging purposes it mi=
ght make
> > > sense to do this on framework level for all drivers which support tha=
t (via
> > > additional callback or so).
> >
> > Do you mean adding something like this:
>
> Nope. I meant to use DT description for that. I=C2=B2C core should cope
> with DT already.
> I do not understand why you need special nodes for that rather than DT
> overlay which will change the speed for you.
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Regards,
Avi
