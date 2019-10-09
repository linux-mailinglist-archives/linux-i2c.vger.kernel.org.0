Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70935D0487
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 02:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfJIAAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 20:00:50 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39988 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfJIAAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Oct 2019 20:00:50 -0400
Received: by mail-pl1-f196.google.com with SMTP id d22so132748pll.7
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2019 17:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ZbjV1DtYpk34EJ1xtvMn0i8wel5DTmAVc9X6bgnLME=;
        b=jQ25PkDI3GQhhIkZMrqDw7+D86d9eTwx5O8ZWcUSTroMqycRkxrch9Aqdi2G2aPdGT
         hjV+fCJCSwWREf0hWc/CU10JbmfyjXa1K/iEFpBZd7ep+gpna3UvQCRZg7mKBOIqiw3Q
         +e0pn1LFZ/WskDWlN/cxOdk5H92qEht014M681oKq1ZeCWoECD//tcz0CKNLZwu6rVBj
         0iI5tYrXcSZkOuwUuGfVR5EP1yl+2msH6aH3wb7sU2ZEWoFkO6kDpiIMk9SK7J00m5Mb
         BDCcxqetJDFGyZ/a1U8pDhHRb0M1B9Gg/aUcowkXqhQEy2ASoXeZ9gFuKJRaHWEZhnwv
         fQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ZbjV1DtYpk34EJ1xtvMn0i8wel5DTmAVc9X6bgnLME=;
        b=Soq//JMgiM+r9siGibCDaOXThouDXEfnFZ4pDVHJUroLpUu6vc123iJuD9RL+vvolF
         C2Ba943sKfRzvIsKiY1XyyytmDyXdSdRO8RjcZkwdk0VXhUwflxan2xaWlY72Am7a4Mp
         WCdWRot3k6dToCK1e5D7+1YCnh20gtf1QM0Dna3fnkhhG5mE2sl2Ox7tIGMIoswAg9Ak
         MrG1lon+Ntank5GzElJwLafCNg07q6yIC9w5hP/9lykkqysp/J2ucm6kYjYWSqDy1BLT
         zqO7emGtjGDlbpe6UVJluFz0TfDcLLOuYHI8EjQcFtCslpfl1uxZqmRzz/Zs0ZO9KK5j
         YzVA==
X-Gm-Message-State: APjAAAXw5Db3HjU579tFgDeElsuaE4TQK7rYS8qxAlWD3xHjlVWjQM7D
        2STnfL5ETloSrHVRIv0IuIsbcMyZAUOUFdscd48JIQ==
X-Google-Smtp-Source: APXvYqwlpumpcr53qautPqotAY8U4y0Bpq8LPeEYkc6CyB2PcuSXXn4QixEhk+wQ6nSNDEld+2R2p42AazmnqOWI7/U=
X-Received: by 2002:a17:902:8216:: with SMTP id x22mr268924pln.232.1570579247540;
 Tue, 08 Oct 2019 17:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
In-Reply-To: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 8 Oct 2019 17:00:36 -0700
Message-ID: <CAFd5g442rqbUmTYQ2oD87q5bHgxkt4DcJ5841oKs=H7DeXWKQw@mail.gmail.com>
Subject: Re: i2c-aspeed testing with kunit fake and syzkaller
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     linux-i2c@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        Wolfram Sang <wsa@the-dreams.de>,
        syzkaller <syzkaller@googlegroups.com>,
        Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+kunit-dev@googlegroups.com

On Tue, Oct 8, 2019 at 7:44 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Hi i2c/aspeed-related people,
>
> Some time ago Brendan and myself did an experiment of testing the
> i2c-aspeed driver in a qemu VM (without any hardware/emulation) using
> kunit-based fake hardware. The fake allowed us to get 10 i2c devices
> successfully probe and appear in /dev/. Which in turn allowed us to
> test the actual driver with syzkaller.
> I will just leave here some details and traces as FYI and for future
> reference. I think this is an important precedent in general.
>
> The kernel branch is here:
> https://github.com/dvyukov/linux/commits/kunit-i2c-stub2
> This is one of kunit branches with this commit on top:
> https://github.com/dvyukov/linux/commit/c9c1706611fdc49679c5bf5bff1e147ab7c7aa79
> This contains lots of hacks to get the fake working on x86 and leave
> persistent devices initialized (rather than shutdown them after
> unit-testing).
>
> This is the kernel config:
> https://gist.githubusercontent.com/dvyukov/72a31dad43b5687e6ffdcdb4cb342175/raw/24b706326e2d9202789fece5bfc17355aadda411/gistfile1.txt
> (some i2c configs + a bunch of debugging configs).
>
> If you boot this kernel with the config in qemu, you should see /dev/i2c-{0,10}.
>
> Probably any syzkaller commit will work, but I just testing on this one:
> https://github.com/google/syzkaller/tree/2ab6c4a4571d4170b0009a5b14b9789b016814b6
> Here is syzkaller config I used:
> https://gist.githubusercontent.com/dvyukov/d0a3c0e9b44cc7d445b36a8a50404ed8/raw/5f6aab34c6515cc4e96dac6cf3a98aaaf5e21b58/gistfile1.txt
>
> Here is kernel coverage we achieved as the result of fuzzing:
> https://drive.google.com/file/d/1JdNshmCWI3crJ3BuVo6uvRuHMBrwH5eB/view?usp=sharing
>
> For crashes, I've got 3 different task hangs:
>
> INFO: task hung in i2c_transfer
> https://gist.githubusercontent.com/dvyukov/25e98a59b643bc868c7489f566ed9eab/raw/67b717488ae9af381a5b0615e5ddf2d226369d3c/gistfile1.txt
>
> INFO: task hung in i2c_smbus_xfer
> https://gist.githubusercontent.com/dvyukov/7ca87fea1b397d46e3393227a34595b9/raw/f5385f025abfc3ad2e91fd4f2616e58c7de8804e/gistfile1.txt
>
> INFO: task hung in aspeed_i2c_master_xfer
> https://gist.githubusercontent.com/dvyukov/dbc51e3ea7034f255c8fd1c99965d91a/raw/a5165e4e6c3b41d593d02fc22996104e468cfab3/gistfile1.txt
>
> And some memory corruptions (non-thread-safe kunit data structures?):
>
> KASAN: use-after-free Read in aspeed_i2c_fake_write_command_reg
> https://gist.githubusercontent.com/dvyukov/6ca5bca5cf7a40a93636360635a4672c/raw/5ad0e7b33907f4b0db102b74c2a11237df612462/gistfile1.txt
>
> KASAN: use-after-free Read in __of_find_property
> https://gist.githubusercontent.com/dvyukov/95ed93a39d38fd215c141b58e5d3ec0f/raw/ea7f2346982a31ab16fca2850f91e1ef11faf687/gistfile1.txt
>
> general protection fault in mock_do_expect
> https://gist.githubusercontent.com/dvyukov/8c2e3def6775d39cb7496b56a77cbcd8/raw/5778337009e21397b484aafe5b24c87ebe64b63f/gistfile1.txt
>
> There are probably a number of things that can be improved in kunit
> platform mock, the fake driver and syzkaller i2c coverage, but this is
> a starting point.
>
> Thanks

The mock_do_expect thing is definitely an issue, but also, not
upstream, so I will fix it before I send that out for review.

As for aspeed_i2c_master_xfer(); the issue appears to be that we do a
wait_for_completion_timeout, which should be interruptible. So I
should probably submit a fix for that.

I was less confident in i2c_transfer, i2c_smbus_xfer, and
__of_find_property; nevertheless:

i2c_transfer doesn't actually look like a bug. It looks like the
faking framework aborted, resulting in a condition which can never
happen in the i2c-core in the real world. Same goes for
i2c_smbus_xfer.

The issue in __of_find_property appears to be that it hits a property
which was not properly initialized when the device_node was
initialized with of_node_init()[1]. I am not an expert in how the
device tree stuff works, but I would expect that of_node_init() should
fully initialize the device_node passed to it. So that might be a
legitimate issue.

I'll take a closer look at i2c_transfer, and i2c_smbus_xfer and see if
I missed anything.

Cheers!
