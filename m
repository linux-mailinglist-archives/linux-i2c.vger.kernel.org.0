Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9799CFCA8
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 16:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfJHOoW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 10:44:22 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43141 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfJHOoW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Oct 2019 10:44:22 -0400
Received: by mail-qk1-f196.google.com with SMTP id h126so16967973qke.10
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2019 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=77S/fCndU2ebwOJQnycUXPA5+chmlFYMx3LZwIty4+w=;
        b=b2bYt4KUBY6/oGk2hzre4AVwdwFNJKFzT/WR4vYnhD79dT91djC0Jc6uH5noy/amBM
         Qwq48fDbaKRjHBSLjGOGbIwwt8irFyoMpfKsJ3+wVtFJq9J5PXhCoCxTJIBJkB2Fjqjs
         a9SZrAwSCiqjvLkrOIZRsPnm2gM6eNd0p2nYZJvgAFMqy7GV5B1Q3klgClPqr9XD5v46
         n3fDAgTjlS/xgBJJjWvreszKnPDrpBBK0u1WwbhAEvk9lDNKSltDZIle9kXqZdxlbThT
         C7/CCcb8wIGuwn/q6XQylGL/PqoLDfXCOSjSISLjvyGKyVY0JMJt1Wy2dKBOoEwVyvis
         UIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=77S/fCndU2ebwOJQnycUXPA5+chmlFYMx3LZwIty4+w=;
        b=P2A89cudtzcdDVMyiA11wa1PzewwpGl1y3XjsDoC+lLlJgHHupu+pEbZ7ZCOLE3087
         43IuTPy5UzP2FV2lxIjkw3Qoa8uEm9IovbQjbTug3TVUZgzxEc5KJTVaErnNCuoZTxPb
         1uwT3jbSX+fV1m+ohyKMklJOS4qCjNsrsXbLcI/EQpUH09pM5TTHOyBwjLDbb3fGfqPO
         yYuL2QVnEqjIQNq9tIUDPOQAjgtNBgk7/oWr27p0bi9phB3Vi6KIyePqAYHuCqui3KSX
         BTHr84qh44cj/DYlEo6SoVGZx72zfC4QU0d9eceV1vAcQ9yURIGXFCSws8S+PZk9Fh1d
         /2jA==
X-Gm-Message-State: APjAAAXaNSq/LeRs2coPUxT4SeMNM3y912HbkbcOYqUbwNB6s0mm4WVC
        laes8Xm6YCbvzyyXBEa3MgIWF55/PTiH8X75suCynz+Nqnk=
X-Google-Smtp-Source: APXvYqx9KXd17N5JZ7Ztsu2CjTXciBgsPHwNXmzDG74FSy+C9F629m94FucdVgJnwXQr6EPjGyJkhBwq1JlZCYl5NCE=
X-Received: by 2002:a37:985:: with SMTP id 127mr28956985qkj.43.1570545859940;
 Tue, 08 Oct 2019 07:44:19 -0700 (PDT)
MIME-Version: 1.0
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 8 Oct 2019 16:44:08 +0200
Message-ID: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
Subject: i2c-aspeed testing with kunit fake and syzkaller
To:     linux-i2c@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org, wsa@the-dreams.de,
        syzkaller <syzkaller@googlegroups.com>,
        Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi i2c/aspeed-related people,

Some time ago Brendan and myself did an experiment of testing the
i2c-aspeed driver in a qemu VM (without any hardware/emulation) using
kunit-based fake hardware. The fake allowed us to get 10 i2c devices
successfully probe and appear in /dev/. Which in turn allowed us to
test the actual driver with syzkaller.
I will just leave here some details and traces as FYI and for future
reference. I think this is an important precedent in general.

The kernel branch is here:
https://github.com/dvyukov/linux/commits/kunit-i2c-stub2
This is one of kunit branches with this commit on top:
https://github.com/dvyukov/linux/commit/c9c1706611fdc49679c5bf5bff1e147ab7c7aa79
This contains lots of hacks to get the fake working on x86 and leave
persistent devices initialized (rather than shutdown them after
unit-testing).

This is the kernel config:
https://gist.githubusercontent.com/dvyukov/72a31dad43b5687e6ffdcdb4cb342175/raw/24b706326e2d9202789fece5bfc17355aadda411/gistfile1.txt
(some i2c configs + a bunch of debugging configs).

If you boot this kernel with the config in qemu, you should see /dev/i2c-{0,10}.

Probably any syzkaller commit will work, but I just testing on this one:
https://github.com/google/syzkaller/tree/2ab6c4a4571d4170b0009a5b14b9789b016814b6
Here is syzkaller config I used:
https://gist.githubusercontent.com/dvyukov/d0a3c0e9b44cc7d445b36a8a50404ed8/raw/5f6aab34c6515cc4e96dac6cf3a98aaaf5e21b58/gistfile1.txt

Here is kernel coverage we achieved as the result of fuzzing:
https://drive.google.com/file/d/1JdNshmCWI3crJ3BuVo6uvRuHMBrwH5eB/view?usp=sharing

For crashes, I've got 3 different task hangs:

INFO: task hung in i2c_transfer
https://gist.githubusercontent.com/dvyukov/25e98a59b643bc868c7489f566ed9eab/raw/67b717488ae9af381a5b0615e5ddf2d226369d3c/gistfile1.txt

INFO: task hung in i2c_smbus_xfer
https://gist.githubusercontent.com/dvyukov/7ca87fea1b397d46e3393227a34595b9/raw/f5385f025abfc3ad2e91fd4f2616e58c7de8804e/gistfile1.txt

INFO: task hung in aspeed_i2c_master_xfer
https://gist.githubusercontent.com/dvyukov/dbc51e3ea7034f255c8fd1c99965d91a/raw/a5165e4e6c3b41d593d02fc22996104e468cfab3/gistfile1.txt

And some memory corruptions (non-thread-safe kunit data structures?):

KASAN: use-after-free Read in aspeed_i2c_fake_write_command_reg
https://gist.githubusercontent.com/dvyukov/6ca5bca5cf7a40a93636360635a4672c/raw/5ad0e7b33907f4b0db102b74c2a11237df612462/gistfile1.txt

KASAN: use-after-free Read in __of_find_property
https://gist.githubusercontent.com/dvyukov/95ed93a39d38fd215c141b58e5d3ec0f/raw/ea7f2346982a31ab16fca2850f91e1ef11faf687/gistfile1.txt

general protection fault in mock_do_expect
https://gist.githubusercontent.com/dvyukov/8c2e3def6775d39cb7496b56a77cbcd8/raw/5778337009e21397b484aafe5b24c87ebe64b63f/gistfile1.txt

There are probably a number of things that can be improved in kunit
platform mock, the fake driver and syzkaller i2c coverage, but this is
a starting point.

Thanks
