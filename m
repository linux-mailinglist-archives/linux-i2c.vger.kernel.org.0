Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE4FD1FFF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 07:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfJJF2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 01:28:41 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45364 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfJJF2l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Oct 2019 01:28:41 -0400
Received: by mail-qk1-f196.google.com with SMTP id z67so4451166qkb.12;
        Wed, 09 Oct 2019 22:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6Hep4iY8u0yDM4dyep+02jvirG1WxfZPi0UCSgzEPA=;
        b=mgx7nbirD+B+qWsSDYrOWzbCFx0K9ERikuPVhs/EhHAJrKz+tDqgfmUgXGWGRSBrbo
         UryoiU6AXZ6g1zlqeWA+/eHChgkS7xn/ksIRDyTXhZHZZI91skLOoYs5Y6Z3ls60l2+j
         NN8svFecFJkunpLR7aajvO1GIMk04+rGWimLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6Hep4iY8u0yDM4dyep+02jvirG1WxfZPi0UCSgzEPA=;
        b=qk9iPZux4FNk3AdJl0PZ2LVs+JOhqxuYIiooqrgCs2cavkXN8/4FpDQ7iYA0H0d5ZP
         xKB8fCfZ1Miy3BEJzVTS2O3VQyEjAOyfJUfZpk3zXS7OaCQYzo74KRSqDOfmEO4sNxzD
         2V8IVojL601r6q8gpQEQBf6S3/ch0350NWvkFH9hHRgLguXBZZ8DJyoXvJfq6aC0vZEy
         oKtG6lWTFrA3pR7LfFJjBy9kilkIt3brg0OlyDFCw1XbGUqc3nVdyqdougbOy74H1gyU
         1ibBwimvOnCqbVV3rW0sNuaoggijE7mcLlwthEbsa/SnOwm33DUuVASp7l+Nam83bg5H
         ckaQ==
X-Gm-Message-State: APjAAAUImP7jouoyQefI3nhcPSGuhBlOglgLJKh1Ajwp+hbovZRqTR18
        B1iaJ0KgOVBJ/R/31l0YnRZHJRMlLTDRA+e6gGQ=
X-Google-Smtp-Source: APXvYqwH0HMFFELFCxD2oINqI+YV0TL764wqxPt4fBPtvmrISd7LnBC85T0wCOC+E1zA48qshusCVPt0cVV1W/T+8QY=
X-Received: by 2002:a37:4dca:: with SMTP id a193mr7795691qkb.292.1570685318745;
 Wed, 09 Oct 2019 22:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com> <20191008203157.GA184092@google.com>
 <ac256b3f-2a06-6fa5-72ab-d8f8014d253e@linux.intel.com> <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
In-Reply-To: <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Oct 2019 05:28:26 +0000
Message-ID: <CACPK8Xc4JCNDwVfJ4zzsaZvoSmtqgMZwhYO8sv76aRnPiQwK_A@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Oct 2019 at 21:54, Brendan Higgins <brendanhiggins@google.com> wrote:
>
> On Tue, Oct 8, 2019 at 2:13 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
> >
> > On 10/8/2019 1:31 PM, Brendan Higgins wrote:
> > > On Mon, Oct 07, 2019 at 04:13:11PM -0700, Jae Hyun Yoo wrote:
> > >> In case of master pending state, it should not trigger the master
> > >> command because this H/W is sharing the same data buffer for slave
> > >> and master operations, so this commit fixes the issue with making
> > >> the master command triggering happen when the state goes to active
> > >> state.
> > >
> > > nit: Makes sense, but can you explain what might happen without your
> > > change?
> >
> > If we don't use this fix, a master command could corrupt data in the
> > shared buffer if H/W is still on processing slave operation at the
> > timing.
>
> Right, can you add that to the commit message?
>
> Is this trivially reproducible? We might want to submit this
> separately as a bugfix.
>
> Actually yeah, can you send this separately as a bugfix? I think we
> might want to include this in 5.4.
>
> Wolfram and Joel, what do you think?

Yes, good suggestion. A corruption fix should be merged I think.

Always send bug fixes upstream with Fixes tags so they land in the
stable tree. This is preferable to sending them separately to the
openbmc for inclusion in that tree, and potentially reaches a wider
audience.

Cheers,

Joel
