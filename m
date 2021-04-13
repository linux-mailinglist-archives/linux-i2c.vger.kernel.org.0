Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF60735E74C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 21:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348125AbhDMTuo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 15:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348131AbhDMTun (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 15:50:43 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FEEC061574
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 12:50:23 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso9554954pjh.2
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOecOrjP4ebjB9MfD+t/MwQe3gJqtePCpwG7b5PQgBs=;
        b=ep3RW5lfGiKUgUbny3bLO13DIO+Ejr205QO9Sj9bTseb2gaW4CooOeZ0UQy8VFbUo4
         IoX72M2BDxEO7GAvHFCZUjex8Xjs5EFdJz2j2ipVz8L/TDgYsBhFf718ooClu5tAY56+
         cNV3vwNptvDHbYivOEHLlfEUesW22uB/9W7/fRxp0jEh5N85IWibEQEgCkCSpXBN2pVM
         M/TE4CRqqcG6GBj+VLaDiv1tOZL/YPffagrD+73atSsvba5eqQEGmwBWvEVEAtzHxMca
         jBfOfF9bViKDnyIXT7i2qh/7zBfV3rhpzaBuLm2LkW+q67OGIYjpAdGJUnyyC5xjfGCk
         AYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOecOrjP4ebjB9MfD+t/MwQe3gJqtePCpwG7b5PQgBs=;
        b=ETwjcBU3LDLvY+rKa/fgVTpHBCBk2EDj2m9VksYdf4GwORMcb+kiJXsvsn6wUQ8Nlv
         2EF58JYKwrIdEpJ79F2LDNoeV2rsGugpyDg3tHjrYHjD6bjExTuc+Lev1rNVqpJHFGrC
         0e73hjscfejg+x2+5sO34KuxJyHFjaFUysGXEAHk/DA86jptTL8ULWWFMG0uJlncaSOg
         64c4oz2e5d4MLjLaB7ymHEua9wavRS0ZfZOCkx5imeP/zyMY2zNxotCSLQgB8ZmdNhTe
         xkox/74MnDss8xBCFPuucfBYpTCIP8a74Y7kupdbTjk/qaLN9YKgfOawvIht7EMMIQwq
         AbAw==
X-Gm-Message-State: AOAM531uZr6qakWMRSLgsCSyNDZmQ2JxJg/has/UJqqNR2d61LQyIZ4V
        gGgjj8D2kUavQaU6Aoo4VTNjDEIIxRwGVY/EbeTg4Q==
X-Google-Smtp-Source: ABdhPJwaj6udX1dNnKNlsRCyFoPlCACj+fhdmzsOnCuN8ke1sAMbselzI6xf9r5pQiR9bEI7Hb/t9N6kmsPzQMoE9to=
X-Received: by 2002:a17:90a:c7d5:: with SMTP id gf21mr1692957pjb.80.1618343422498;
 Tue, 13 Apr 2021 12:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com> <20210306203011.GA1152769@robh.at.kernel.org>
 <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com> <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
 <f1811747-3826-215a-d822-85170303a7c9@linux.intel.com> <fadf1244-ed6e-5973-ff1b-018bd20ff3b1@linux.intel.com>
In-Reply-To: <fadf1244-ed6e-5973-ff1b-018bd20ff3b1@linux.intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Apr 2021 12:50:11 -0700
Message-ID: <CAFd5g453L_+tu=vd0foiswJP16+repffPBEPCy6mpZQqnM50Ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andrew Jeffery <andrew@aj.id.au>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 8, 2021 at 10:50 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Ping.
>
> On 3/10/2021 7:55 AM, Jae Hyun Yoo wrote:
> > On 3/9/2021 6:15 PM, Rob Herring wrote:
> >> On Tue, Mar 9, 2021 at 10:02 AM Jae Hyun Yoo
> >> <jae.hyun.yoo@linux.intel.com> wrote:
> >>>
> >>> Hi Rob,
> >>>
> >>> On 3/6/2021 12:30 PM, Rob Herring wrote:
> >>>> On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
> >>>>> Append bindings to support transfer mode.
> >>>>>
> >>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >>>>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> >>>>> ---
> >>>>> Changes since v3:
> >>>>> - None
> >>>>>
> >>>>> Changes since v2:
> >>>>> - Moved SRAM resources back to default dtsi and added mode selection
> >>>>>     property.
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Removed buffer reg settings from default device tree and added
> >>>>> the settings
> >>>>>     into here to show the predefined buffer range per each bus.
> >>>>>
> >>>>>    .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37
> >>>>> +++++++++++++++----
> >>>>>    1 file changed, 30 insertions(+), 7 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> index b47f6ccb196a..242343177324 100644
> >>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>>>> @@ -17,6 +17,20 @@ Optional Properties:
> >>>>>    - bus-frequency    : frequency of the bus clock in Hz defaults
> >>>>> to 100 kHz when not
> >>>>>                 specified
> >>>>>    - multi-master     : states that there is another master active
> >>>>> on this bus.
> >>>>> +- aspeed,i2c-xfer-mode      : should be "byte", "buf" or "dma" to
> >>>>> select transfer
> >>>>> +                      mode defaults to "byte" mode when not
> >>>>> specified.
> >>>>> +
> >>>>> +                      I2C DMA mode on AST2500 has these restrictions:
> >>>>> +                        - If one of these controllers is enabled
> >>>>> +                            * UHCI host controller
> >>>>> +                            * MCTP controller
> >>>>> +                          I2C has to use buffer mode or byte mode
> >>>>> instead
> >>>>> +                          since these controllers run only in DMA
> >>>>> mode and
> >>>>> +                          I2C is sharing the same DMA H/W with them.
> >>>>> +                        - If one of these controllers uses DMA
> >>>>> mode, I2C
> >>>>> +                          can't use DMA mode
> >>>>> +                            * SD/eMMC
> >>>>> +                            * Port80 snoop
> >>>>
> >>>> How does one decide between byte or buf mode?
> >>>
> >>> If a given system makes just one byte r/w transactions most of the time
> >>> then byte mode will be a right setting. Otherwise, buf mode is more
> >>> efficient because it doesn't generate a bunch of interrupts on every
> >>> byte handling.
> >>
> >> Then why doesn't the driver do byte transactions when it gets small
> >> 1-4? byte transactions and buffer transactions when it gets larger
> >> sized transactions.
> >
> > Good question and it could be an option of this implementation.
> > Actually, each mode needs different register handling so we need to add
> > additional conditional branches to make it dynamic mode change depends
> > on the data size which can be a downside. Also, checked that small
> > amount of data transfer efficiency in 'buf' transfer mode is almost same
> > to 'byte' mode so there would be no big benefit from the dynamic mode
> > change. Of course, we can remove the 'byte' transfer mode but we should
> > also provide flexibility of configuration on what this hardware can
> > support, IMO.

I would rather set the choice in device tree or Kconfig, which the
former is what I think you did here.

As for doing byte mode for small transactions and buffer/DMA for large
transactions, I would prefer sticking to a single mode based on what
is selected at build/boot time. Seems less error prone to me. Then
again, Rob probably has more experience in this area than I do, so
maybe this kind of thing is pretty common and I just don't realize it.

In any case, as for getting rid of byte mode, I would support that,
but not in this patch set. I would rather switch the default and get
users on buffer/DMA mode before taking away a fallback option.

My 2 cents, but I think the OzLabs and other active OpenBMC people are
probably a little more up to date on this.

Cheers
