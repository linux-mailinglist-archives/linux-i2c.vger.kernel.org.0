Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1A81F279B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 01:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387978AbgFHXrV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jun 2020 19:47:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387930AbgFHXrP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Jun 2020 19:47:15 -0400
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE15420842;
        Mon,  8 Jun 2020 23:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591660034;
        bh=JfeR1OvUTiZ0lO8gFO9nXXNApbqP7Edk3LbRreh8u6o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ywVQtU9EpMa3kP7TzlTaYd3MC12ox9PdByU6JDD/+1ap9wTefo28zwbDbtquuTTXs
         q4SPNj+fsG+okq4AuKRockpnZdiBNJVW/msRnFgduqIe/mcn6dRp+arC+1RK8sGZ2j
         E8yZNl7fH+hOZqypdm+lPKFtCbiHHwk4e9Hqv1bw=
Received: by mail-oo1-f52.google.com with SMTP id 7so3818488oof.8;
        Mon, 08 Jun 2020 16:47:14 -0700 (PDT)
X-Gm-Message-State: AOAM5313IxO3b+ngWsMl/aLyQSIZnHRLKeHaf9QodYpbmaeNnmAwenuE
        kj6SZgiGXeLD4dwgSmnYnoLu2PmH0tC5LWQn5g==
X-Google-Smtp-Source: ABdhPJz3gIjlkhZ2RmMRXkIMPB6UylOzQLyhAs6ndsfed5PFu+br/5Z+8Z79xY7reJQ2jrwzMbD3741AqHxlS9Wo3LE=
X-Received: by 2002:a4a:345b:: with SMTP id n27mr19140154oof.25.1591660034065;
 Mon, 08 Jun 2020 16:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-3-Sergey.Semin@baikalelectronics.ru> <20200527153351.rmzguymz7lm6gvsx@mobilestation>
 <20200529181338.GA2676189@bogus> <20200529182256.3bp4uvvrvz3ddlrq@mobilestation>
 <20200529184201.GX1634618@smile.fi.intel.com> <20200529184534.wyyv5i7hcto5y3d3@mobilestation>
 <20200529185824.o2vcpxe4f63aw465@mobilestation>
In-Reply-To: <20200529185824.o2vcpxe4f63aw465@mobilestation>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 8 Jun 2020 17:46:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZjYF2Jrvcd8BAHsMfm5-S1J11NVoc6o2q5zE5ekmRTw@mail.gmail.com>
Message-ID: <CAL_JsqKZjYF2Jrvcd8BAHsMfm5-S1J11NVoc6o2q5zE5ekmRTw@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 29, 2020 at 12:58 PM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> On Fri, May 29, 2020 at 09:45:37PM +0300, Serge Semin wrote:
> > On Fri, May 29, 2020 at 09:42:01PM +0300, Andy Shevchenko wrote:
> > > On Fri, May 29, 2020 at 09:22:56PM +0300, Serge Semin wrote:
> > > > On Fri, May 29, 2020 at 12:13:38PM -0600, Rob Herring wrote:
> > > > > On Wed, May 27, 2020 at 06:33:51PM +0300, Serge Semin wrote:
> > >
> > > > > you're sending
> > > > > new versions too fast. Give people time to review.
> > > >
> > > > Yeah, you did. Sorry for sending the new versions very fast. Normally I prefer
> > > > to keep up with comments so to past a particular maintainer review as fast as
> > > > possible without long delays. In my experience the longer you wait, the lesser
> > > > maintainers remember about your patchset, the harder for one to continue the
> > > > next versions review.
> > >
> >
>
> > > Documentation/process/submitting-patches.rst:
> > >
> > > "Wait for a minimum of one week before resubmitting or pinging reviewers -
> > > possibly longer during busy times like merge windows."
> >
> > Good to know what I already know.) How much do you personally wait before
> > resubmitting? In my experience reviewing your DW APB GPIO patches, no longer
> > than a few hours.
>
> Moreover the statement you cited is about the patches, which doesn't get any
> attention from the maintainers/reviewers for quite some time. In this case I
> normally resubmit the patches no sooner than a week. I was talking about the
> situation when you get the review comments, which need to be addressed.

There's not going to be any rule that always works. It takes
judgement. I'd say the greater the rework from review comments, the
sooner you can resend. But then if it's multiple
subsystems/maintainers, you need to give all of them time.

I go in date order mostly. You send a new version, then you go to the
back of the queue. So if you want it reviewed the soonest, send it 2
weeks ago. ;) There's also the strategy of reviewing other patches in
front of yours. Sometimes I go by version numbers, but send version 50
and I might be suspicious. And that's rewarding folks who are sloppy
or keep sending broken stuff. The real solution is I just need more
help reviewing things.

Rob
