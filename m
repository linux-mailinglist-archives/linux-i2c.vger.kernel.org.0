Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B5C3603B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 17:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfFEPUs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 11:20:48 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46443 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbfFEPUs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 11:20:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id y11so14997553pfm.13;
        Wed, 05 Jun 2019 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytP8/UBgkO5jaVHKQWoDG4zyk6kKGN8zAlZwPlNeK+0=;
        b=eydmK6tc4MgDPycaqdm/O5Q+CSa79lSoqm8NG+ARuvnKj6Z8eUG7QCmZ1QUwQu22zB
         4zjJyUXjp42Rvpc8fI/wI70hTuR12hqBAb3iFow2sG4zFUlhqmRfLNn7Tng/ZA8WVtXm
         dTQlYO+ysBAOFfsuS09hjzAhyQz0HjSKRy78XyYNJcwdquIKYgHSisxvxv97JrPYQZN7
         TpD8WggHqwa+ga5dtlWnDiMbSDzw4C+1lXA5wiVdDk/yvB2mS8UJuv5inoTQDGNH6ZY0
         u7Zk5kJN2rjKISogeVuP5jCyY6URY525DadPzqA4OCFYTHNmZWsYFsAMlZFrzX7EjThY
         fHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytP8/UBgkO5jaVHKQWoDG4zyk6kKGN8zAlZwPlNeK+0=;
        b=Fb7hwfZyEYMESOiC823ygTCCuWv2Vg2ELufBjxFWFu5QUhIZUZYRTDOyrvxrKj5MX/
         prr1VmV75BckNN/QF9009P1rdhLZMOqxXpvAsKXb5vYEk4p9beiV449YUflCVs6Y+y6P
         NDw7ynVDE2y+bk+MVMoggzdggEAv2kfijCX0ipDnp5XQiEpe2p7SzDYLEMc3M+NLqKbZ
         6cUr9Wa8vr3Zv7Ldv7b9jY0kXK24nU58xfOudp0dIZNZS1wMLvUxlfzIPaPVL8rw1bDB
         7YHOqxJqrN4QMcBNx4SiROJuqlwjKX0omCN+9m8DmAuWsiuzT6NxaVZ4m2ffUIxaV9Hk
         pHDw==
X-Gm-Message-State: APjAAAWQZBBdtPBNazoj5wtGrEsriH55AYjHnGufhzzEAv/aLn54vhis
        WheVD+ZmaEreYUU7kVpRI3Gz5/xLvVVbrJWatqI=
X-Google-Smtp-Source: APXvYqy/zQc1MrZjkBcP6ci++gjzvUHIrtBhYRl/S1HiaU61MVgeSgZUwKU+cpn86SZ8W3rEeqyGHdZgpU4Y730Nw10=
X-Received: by 2002:a17:90a:a596:: with SMTP id b22mr32581985pjq.20.1559748047820;
 Wed, 05 Jun 2019 08:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190531043347.4196-1-eduval@amazon.com> <20190531043347.4196-3-eduval@amazon.com>
 <20190604171611.GS9224@smile.fi.intel.com> <20190605032709.GA1534@u40b0340c692b58f6553c.ant.amazon.com>
 <CAHp75Vdaeprj0hFXukMqDi_dnK9-vA-O-OTRiGY6y3aGrNHUjQ@mail.gmail.com> <20190605143158.GB1534@u40b0340c692b58f6553c.ant.amazon.com>
In-Reply-To: <20190605143158.GB1534@u40b0340c692b58f6553c.ant.amazon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jun 2019 18:20:37 +0300
Message-ID: <CAHp75Vc2us0UDmGnzjF0vkzWM_9KqRa0AZKnRsUYmFRTsgwEyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: slave-mqueue: add a slave backend to receive and
 queue messages
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 5, 2019 at 5:32 PM Eduardo Valentin <eduval@amazon.com> wrote:
> On Wed, Jun 05, 2019 at 11:25:39AM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 5, 2019 at 6:30 AM Eduardo Valentin <eduval@amazon.com> wrote:

> Well, yes, but the point is you would be switching from a simple AND (&) operation
> to a division...
>
> I am keeping the power of 2 dep so that we can keep this with a simple &.

Works for me.

> > > > > +           .of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
> > > >
> > > > Wouldn't compiler warn you due to unused data?
> > > > Perhaps drop of_match_ptr() for good...
> > >
> > > Not sure what you meant here. I dont see any compiler warning.
> > > Also, of_match_ptr seams to be well spread in the kernel.
> >
> > If this will be compiled with CONFIG_OF=n...
>
> I see.. I obviously did not test with that config..
>
> > Though I didn't check all dependencies to see if it even possible. In
> > any case of_match_ptr() is redundant in both cases here.
> > Either you need to protect i2c_slave_mqueue_of_match with #ifdef
> > CONFIG_OF, or drop the macro use.
>
> I will wrap it into CONFIG_OF..

Would be this expected to work in the case of CONFIG_OF=n?
If no, why to introduce ugly #ifdef:s and additional macros?
Wouldn't be better to have
  depends on OF || COMPILE_TEST
?

-- 
With Best Regards,
Andy Shevchenko
