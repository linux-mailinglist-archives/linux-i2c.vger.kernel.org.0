Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71793D07CA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 09:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfJIHGX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Oct 2019 03:06:23 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33078 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfJIHGW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Oct 2019 03:06:22 -0400
Received: by mail-qk1-f195.google.com with SMTP id x134so1286618qkb.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Oct 2019 00:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5C/Xf1z5fv/jAWW18gGeEsLNpV/wFOp2/29F3EEqfg0=;
        b=pr9ZefvNrZzWlSPXS1uPnFLw0XgUsDn2NHHSi05YOoYQlSmYgsGak49kvskwFuaUWL
         bEmKr3f8Tbzk2SN+9cUE7gzsH0iBLO0UL1TWIu7LzCa3qmFEUxit5T+Rh0eidUiiNDRL
         z2bo/nDDZghCtmnmR9xf1xnfvoXMWbIDDz+03uNvcMCs85RqE4aPp20lpOdNr42vclW1
         LqGnA86Z1ZONhGB0L02omNPWzRYhF9/9BS1lWZhii5uB0Psf0M/86SIqJkN6alB/eG0Z
         V3wkucc50tce1f4gSeToM+JLuQl0XTC58VHVM+WSoi/iG8x4jsfSzh56t3pJGKKWQB8L
         Gwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5C/Xf1z5fv/jAWW18gGeEsLNpV/wFOp2/29F3EEqfg0=;
        b=Qszt/HbapJLmCTMxrEi+GEhgVUTOfOWVkqkRrrcgdtDNAqaa77e5F3FGtvH+CMfZFl
         FUDAq8lbarcSXmIEMJBn1vqGRnmM73XE0ZEQdr62udxkirU9LJVVQw/e7z8nciOjDARJ
         cq1NjSazKfQzASNzwby1VRncjrWRb5Pj7rikHcQuClMauVbRARUdOaw9Z8mqgvP2J4LY
         tF2GOaODqJsGM/2yWfrZu6Imr4varctx2YwIDwqTLzaS4IpaUD+e9Y4fkksEAvdlanRv
         DJpP838oJ5asFAsYGxc6+sn//SpeGWDEt346BbkLpOTDpFDFl4cw21E9HBzZLcGwIrp6
         TijA==
X-Gm-Message-State: APjAAAXcPQNHp5UaN2hOISTE26+szfOG88J//qkMBGH37WTtbaYx0rjp
        jNxKCXsV476ofuReSdqu6sCF0Z4iZ8ukAHNNRDNa2BuhYNg=
X-Google-Smtp-Source: APXvYqylNOfk/dos/exZnKXlWoreP++MXYFAIrR4wt0A9XzOtsfvMXZmWSYRHCMG6UDz7YnDt4skePhaA+VTUd5MXMw=
X-Received: by 2002:a05:620a:2158:: with SMTP id m24mr2244333qkm.250.1570604780965;
 Wed, 09 Oct 2019 00:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
 <CACPK8XcaAa8aRjqV+vYzh71KMp6hEwLi+qV6bcQUC5xATm0zzg@mail.gmail.com>
In-Reply-To: <CACPK8XcaAa8aRjqV+vYzh71KMp6hEwLi+qV6bcQUC5xATm0zzg@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 9 Oct 2019 09:06:09 +0200
Message-ID: <CACT4Y+ZXaz31ktL3XBAb+rVXrGw9+nujC0+kUU6fRin-rGXcuA@mail.gmail.com>
Subject: Re: i2c-aspeed testing with kunit fake and syzkaller
To:     Joel Stanley <joel@jms.id.au>
Cc:     linux-i2c@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        syzkaller <syzkaller@googlegroups.com>,
        Shuah Khan <shuah@kernel.org>, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 9, 2019 at 8:48 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 8 Oct 2019 at 14:44, Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > Hi i2c/aspeed-related people,
> >
> > Some time ago Brendan and myself did an experiment of testing the
> > i2c-aspeed driver in a qemu VM (without any hardware/emulation) using
> > kunit-based fake hardware. The fake allowed us to get 10 i2c devices
> > successfully probe and appear in /dev/. Which in turn allowed us to
> > test the actual driver with syzkaller.
> > I will just leave here some details and traces as FYI and for future
> > reference. I think this is an important precedent in general.
>
> Wow, this is extensive. It will take me some time to digest it.
>
> Thanks for sending it along.
>
> Cheers,
>
> Joel
>
>
> >
> > The kernel branch is here:
> > https://github.com/dvyukov/linux/commits/kunit-i2c-stub2
> > This is one of kunit branches with this commit on top:
> > https://github.com/dvyukov/linux/commit/c9c1706611fdc49679c5bf5bff1e147ab7c7aa79
> > This contains lots of hacks to get the fake working on x86 and leave
> > persistent devices initialized (rather than shutdown them after
> > unit-testing).

One thing I should have pointed to is the actual "hardware fake":
https://github.com/dvyukov/linux/blob/d154ffa80dff44c8b941814d700b22e6cf4c23c2/drivers/i2c/busses/i2c-aspeed-fake.c

Brendan, in this mode kunit prints whole lot of messages re
missed/failed expectations, etc. It probably should have a special
mode for platform mock when it does not bother about expectations, at
least doesn't print anything.

> > This is the kernel config:
> > https://gist.githubusercontent.com/dvyukov/72a31dad43b5687e6ffdcdb4cb342175/raw/24b706326e2d9202789fece5bfc17355aadda411/gistfile1.txt
> > (some i2c configs + a bunch of debugging configs).
> >
> > If you boot this kernel with the config in qemu, you should see /dev/i2c-{0,10}.
> >
> > Probably any syzkaller commit will work, but I just testing on this one:
> > https://github.com/google/syzkaller/tree/2ab6c4a4571d4170b0009a5b14b9789b016814b6
> > Here is syzkaller config I used:
> > https://gist.githubusercontent.com/dvyukov/d0a3c0e9b44cc7d445b36a8a50404ed8/raw/5f6aab34c6515cc4e96dac6cf3a98aaaf5e21b58/gistfile1.txt
> >
> > Here is kernel coverage we achieved as the result of fuzzing:
> > https://drive.google.com/file/d/1JdNshmCWI3crJ3BuVo6uvRuHMBrwH5eB/view?usp=sharing
> >
> > For crashes, I've got 3 different task hangs:
> >
> > INFO: task hung in i2c_transfer
> > https://gist.githubusercontent.com/dvyukov/25e98a59b643bc868c7489f566ed9eab/raw/67b717488ae9af381a5b0615e5ddf2d226369d3c/gistfile1.txt
> >
> > INFO: task hung in i2c_smbus_xfer
> > https://gist.githubusercontent.com/dvyukov/7ca87fea1b397d46e3393227a34595b9/raw/f5385f025abfc3ad2e91fd4f2616e58c7de8804e/gistfile1.txt
> >
> > INFO: task hung in aspeed_i2c_master_xfer
> > https://gist.githubusercontent.com/dvyukov/dbc51e3ea7034f255c8fd1c99965d91a/raw/a5165e4e6c3b41d593d02fc22996104e468cfab3/gistfile1.txt
> >
> > And some memory corruptions (non-thread-safe kunit data structures?):
> >
> > KASAN: use-after-free Read in aspeed_i2c_fake_write_command_reg
> > https://gist.githubusercontent.com/dvyukov/6ca5bca5cf7a40a93636360635a4672c/raw/5ad0e7b33907f4b0db102b74c2a11237df612462/gistfile1.txt
> >
> > KASAN: use-after-free Read in __of_find_property
> > https://gist.githubusercontent.com/dvyukov/95ed93a39d38fd215c141b58e5d3ec0f/raw/ea7f2346982a31ab16fca2850f91e1ef11faf687/gistfile1.txt
> >
> > general protection fault in mock_do_expect
> > https://gist.githubusercontent.com/dvyukov/8c2e3def6775d39cb7496b56a77cbcd8/raw/5778337009e21397b484aafe5b24c87ebe64b63f/gistfile1.txt
> >
> > There are probably a number of things that can be improved in kunit
> > platform mock, the fake driver and syzkaller i2c coverage, but this is
> > a starting point.
> >
> > Thanks
