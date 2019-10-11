Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965FFD441E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2019 17:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfJKP0n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Oct 2019 11:26:43 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:41480 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfJKP0n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Oct 2019 11:26:43 -0400
Received: by mail-qt1-f196.google.com with SMTP id v52so14385413qtb.8
        for <linux-i2c@vger.kernel.org>; Fri, 11 Oct 2019 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRn4roEJSzpTyDExYMB5YRiC6eeEvLxHuD3AyVm9/fQ=;
        b=KFejTWJHNjTnR44YCUwks7BgkHSVpEVSMwbyb8GCG7hSdalEeDznu0hUud9TFv83K4
         F3RQc9oLk1UpP3yFBwuUzibVWrsjooanzTLu0Tv4GLFPdPdkBG/Znn7HBD4RX3OE9RFm
         wOFkArdGr5fmlt+FW4L7HItQybiVFDvo+HGxuN5g26bRUWz6Li8OQjeE6TSZdCQLIict
         PUEntXN3pjzgQZYyAGn3AK1Vgk2C6o/08+oOJQMOYKxVDNJ/A2ZKLknhW5J+F97rB/Hy
         RVwB3FEhwFZq3T6LRSljsG+Wn4li+XmhFW7wm5YvlKhduOFBB954bgHChEPS0gMTjp9m
         wqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRn4roEJSzpTyDExYMB5YRiC6eeEvLxHuD3AyVm9/fQ=;
        b=kIbZodVfVqfIEdVwIsp99AUhF5HW0sDhMNzWJKMhpZAmMQNa6XXCoRZ6sOLAjnzBOs
         0+3OXinl0z1Mjnzsu1tKQDdMTqYx8bPOGEQyjcY58VLJomRMhDGBL1+CS05ebcyun+y1
         epG586PhAuaMbrMBfGKg4BIrTfLGVQdg9HZZnukXujQozxBjOl4zFUOVDmJwsFYgaBug
         TLB9y+3tb9xSeqCH9+Lk6wfyLk91AyPC+9o6uYmv/LBSk8GEYcuODusqGQyaAwodFx4E
         5ZKWfcn+sqZlNak1ygIDdottwcGNltu7dK+sGQcTMD37nUwv/5yDmx9rusZ3SB7T4mmL
         QPmA==
X-Gm-Message-State: APjAAAX8NjIgp4nsdPNNHwO1dgmB+dyigzJKyp+SQ9VN7yRpsT7NO3u9
        2nHv1GRvzUoRslrrd0oZH1y1moWLBsaucwAraKx1Sg==
X-Google-Smtp-Source: APXvYqxrtN3fjv/JkOHaSqd8V1L6Z8eS5LVlbVm0DsuNdAHvbA4o99mWth4g3wDEOVrQTrwArjQflAt/WeBVwnBvMSQ=
X-Received: by 2002:a0c:e2c9:: with SMTP id t9mr16258464qvl.22.1570807600553;
 Fri, 11 Oct 2019 08:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
 <CACPK8XcaAa8aRjqV+vYzh71KMp6hEwLi+qV6bcQUC5xATm0zzg@mail.gmail.com>
 <CACT4Y+ZXaz31ktL3XBAb+rVXrGw9+nujC0+kUU6fRin-rGXcuA@mail.gmail.com> <CAFd5g45xQvYozyuoFKXXcP6FFBZ6ZOVR-=gQ8J7_MEwWG_QmOg@mail.gmail.com>
In-Reply-To: <CAFd5g45xQvYozyuoFKXXcP6FFBZ6ZOVR-=gQ8J7_MEwWG_QmOg@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 17:26:28 +0200
Message-ID: <CACT4Y+bJZYzvdJ+YzsPVDDv=U2xjVGLMBkVZGuze0bftcNpB6Q@mail.gmail.com>
Subject: Re: i2c-aspeed testing with kunit fake and syzkaller
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Joel Stanley <joel@jms.id.au>, linux-i2c@vger.kernel.org,
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

Another problem popped up. It turns out kunit can produce assertion
failures, but syzkaller wasn't catching them as they have syntax
different from any other kernel bugs/oopses.
Eventually kunit assertion handling code triggered "BUG: sleeping
function called from invalid context" and "WARNING:
syz-executor.4/3822 still has locks held!", so I looked at the log and
noticed the kunit assertion as well. Full output is here:
https://gist.githubusercontent.com/dvyukov/19326832ad245aff33b6696b4e97f5a3/raw/917549be0e97ee90b6e679e4d9a75190a77d1932/gistfile1.txt

It would be useful to give some explicit thought to the way kunit
reports all issues and converge on some easier-to-parse unified
format.
How kernel notifies about bugs/oopses is effectively a public
interface for any kind of kernel testing systems -- they need to
understand that the kernel has self-detected something bad and to
parse that message to some degree. Parsing kernel crash output is lots
of fun:
https://github.com/google/syzkaller/blob/master/pkg/report/linux.go

Based on our experience with syzbot, we converged on the following
crash identity as the most useful/stable: "TOOL: bug-type in
function-name".
For the current kunit message:

kunit aspeed-i2c-test: ASSERTION FAILED at
drivers/i2c/busses/i2c-aspeed-fake.c:87

(1) It's hard to understand that it's in fact a bug. If we look for
"kunit", then any informational kunit message may be confused with a
bug. Looking for "ASSERTION FAILED" may be better, but it does not
capture all other possible bug types kunit may detect (or will fail if
you decide to rephrase "ASSERTION FAILED").
(2) file/line number is not too good as bug identity, consider we pull
new code, and now suddenly it becomes a different line. Is it the old
bug? Or a new one? Function name works better as bug identity.

Brendan, could you do some common recognizable prefix for all
kunit-detected bugs? (e.g. "KUNIT:" or something)
Also it would be good to have function name, not necessary on the
first line, syzkaller can extract it from subsequent lines too. But
ideally it's unambiguously recognizable with some regexp (not not
confuse it with some other unrelated output).





On Thu, Oct 10, 2019 at 2:54 AM 'Brendan Higgins' via syzkaller
<syzkaller@googlegroups.com> wrote:
>
> On Wed, Oct 9, 2019 at 12:06 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > On Wed, Oct 9, 2019 at 8:48 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Tue, 8 Oct 2019 at 14:44, Dmitry Vyukov <dvyukov@google.com> wrote:
> > > >
> > > > Hi i2c/aspeed-related people,
> > > >
> > > > Some time ago Brendan and myself did an experiment of testing the
> > > > i2c-aspeed driver in a qemu VM (without any hardware/emulation) using
> > > > kunit-based fake hardware. The fake allowed us to get 10 i2c devices
> > > > successfully probe and appear in /dev/. Which in turn allowed us to
> > > > test the actual driver with syzkaller.
> > > > I will just leave here some details and traces as FYI and for future
> > > > reference. I think this is an important precedent in general.
> > >
> > > Wow, this is extensive. It will take me some time to digest it.
> > >
> > > Thanks for sending it along.
> > >
> > > Cheers,
> > >
> > > Joel
> > >
> > >
> > > >
> > > > The kernel branch is here:
> > > > https://github.com/dvyukov/linux/commits/kunit-i2c-stub2
> > > > This is one of kunit branches with this commit on top:
> > > > https://github.com/dvyukov/linux/commit/c9c1706611fdc49679c5bf5bff1e147ab7c7aa79
> > > > This contains lots of hacks to get the fake working on x86 and leave
> > > > persistent devices initialized (rather than shutdown them after
> > > > unit-testing).
> >
> > One thing I should have pointed to is the actual "hardware fake":
> > https://github.com/dvyukov/linux/blob/d154ffa80dff44c8b941814d700b22e6cf4c23c2/drivers/i2c/busses/i2c-aspeed-fake.c
> >
> > Brendan, in this mode kunit prints whole lot of messages re
> > missed/failed expectations, etc. It probably should have a special
> > mode for platform mock when it does not bother about expectations, at
> > least doesn't print anything.
>
> That's a good point. I will put it on the TODO list. Nevertheless, I
> am afraid there are a lot of things ahead of it (in regard to KUnit).
> (People should let me know if they find this interesting and I will
> try to move it up the priority list.)
>
> > > > This is the kernel config:
> > > > https://gist.githubusercontent.com/dvyukov/72a31dad43b5687e6ffdcdb4cb342175/raw/24b706326e2d9202789fece5bfc17355aadda411/gistfile1.txt
> > > > (some i2c configs + a bunch of debugging configs).
> > > >
> > > > If you boot this kernel with the config in qemu, you should see /dev/i2c-{0,10}.
> > > >
> > > > Probably any syzkaller commit will work, but I just testing on this one:
> > > > https://github.com/google/syzkaller/tree/2ab6c4a4571d4170b0009a5b14b9789b016814b6
> > > > Here is syzkaller config I used:
> > > > https://gist.githubusercontent.com/dvyukov/d0a3c0e9b44cc7d445b36a8a50404ed8/raw/5f6aab34c6515cc4e96dac6cf3a98aaaf5e21b58/gistfile1.txt
> > > >
> > > > Here is kernel coverage we achieved as the result of fuzzing:
> > > > https://drive.google.com/file/d/1JdNshmCWI3crJ3BuVo6uvRuHMBrwH5eB/view?usp=sharing
> > > >
> > > > For crashes, I've got 3 different task hangs:
> > > >
> > > > INFO: task hung in i2c_transfer
> > > > https://gist.githubusercontent.com/dvyukov/25e98a59b643bc868c7489f566ed9eab/raw/67b717488ae9af381a5b0615e5ddf2d226369d3c/gistfile1.txt
> > > >
> > > > INFO: task hung in i2c_smbus_xfer
> > > > https://gist.githubusercontent.com/dvyukov/7ca87fea1b397d46e3393227a34595b9/raw/f5385f025abfc3ad2e91fd4f2616e58c7de8804e/gistfile1.txt
> > > >
> > > > INFO: task hung in aspeed_i2c_master_xfer
> > > > https://gist.githubusercontent.com/dvyukov/dbc51e3ea7034f255c8fd1c99965d91a/raw/a5165e4e6c3b41d593d02fc22996104e468cfab3/gistfile1.txt
> > > >
> > > > And some memory corruptions (non-thread-safe kunit data structures?):
> > > >
> > > > KASAN: use-after-free Read in aspeed_i2c_fake_write_command_reg
> > > > https://gist.githubusercontent.com/dvyukov/6ca5bca5cf7a40a93636360635a4672c/raw/5ad0e7b33907f4b0db102b74c2a11237df612462/gistfile1.txt
> > > >
> > > > KASAN: use-after-free Read in __of_find_property
> > > > https://gist.githubusercontent.com/dvyukov/95ed93a39d38fd215c141b58e5d3ec0f/raw/ea7f2346982a31ab16fca2850f91e1ef11faf687/gistfile1.txt
> > > >
> > > > general protection fault in mock_do_expect
> > > > https://gist.githubusercontent.com/dvyukov/8c2e3def6775d39cb7496b56a77cbcd8/raw/5778337009e21397b484aafe5b24c87ebe64b63f/gistfile1.txt
> > > >
> > > > There are probably a number of things that can be improved in kunit
> > > > platform mock, the fake driver and syzkaller i2c coverage, but this is
> > > > a starting point.
> > > >
> > > > Thanks
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller/CAFd5g45xQvYozyuoFKXXcP6FFBZ6ZOVR-%3DgQ8J7_MEwWG_QmOg%40mail.gmail.com.
