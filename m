Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9BB61BAE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 10:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbfGHI0o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 04:26:44 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46372 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbfGHI0o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jul 2019 04:26:44 -0400
Received: by mail-ot1-f67.google.com with SMTP id z23so15302313ote.13
        for <linux-i2c@vger.kernel.org>; Mon, 08 Jul 2019 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uoItMK1A2qDechzKVKSEqDhxI2F4iG1fp09oUvQ+1pE=;
        b=cKorSYt48ybN37VDp8EzCbQuYGVXMwY01AGY95OC5E2pgRipUW0Nai/KQnfl+NH90s
         C6MA5awv0QdWxClglYGEJ3/6UvtZS39A8aSESzAfJdtaOfGHZxGNCeiPb/gkhaHYKtxc
         CWbNW+r0G0Lq1K8zc9I88r81xKbPg7K+D5X9I616pGqmQ0BL1fI8XK7zPeALOnEjTQTE
         a0tV5r+T2HaaMENkEAOH5T594NV6SoIpyX4nrxT7OpahHwe76wd8SMS2q2RBang9xjs7
         TwCmMJ10ODKKe/BXmtXC0FInOuWTRK7uDrcmRHFfxyDMizwqqTi/G9NNabvrLD9iuo/A
         9VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uoItMK1A2qDechzKVKSEqDhxI2F4iG1fp09oUvQ+1pE=;
        b=GCmVhndl2a/wq2ZWq3JqgrXOi3RVNZE4NT2bVIPtWDUsUW52ezA/nD3ZnG3lmyI8TA
         ird+9mzThSnSVs6ll6qBMcKugMdJA81hHE2HnR4oWJbN05qL5cSv+74jlt/chf1tgQqC
         pZboWifhv2skRRfPUNp89CHeM6eiB5+P8FQObTEHrZQMmhDamGjSKLvuXwVewjbfEY39
         WpoECKpCPi3L+jt8QfGlEideNriOMkSaojiXHUQDiQGldAaq/eyruUFOnXKR+xfZOdX0
         7RH6FZbVghaNit+cto7lsI2BrLR5rksQJ+Xj1/sSNhk/khi21YPEnCOTqC4be44LPakp
         WUwA==
X-Gm-Message-State: APjAAAVgiKuzGID2QPCVEZF8Mx91UvT1j7kk9qJvNxdw+o0L5AepDFwr
        mOPK8XyVn0Pnv151Z/YLZiCVKeZ72OOoi0tvGAWGbg9F
X-Google-Smtp-Source: APXvYqx2NcHNdDVQv1rKawvPTCZEf6PnV+duEYljtrmwmQQ49v5mwLZo9amCQSbmx5vuwDWObDiqZ/xiCa8oIDDKcew=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr13860683otk.292.1562574403803;
 Mon, 08 Jul 2019 01:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <1562347885-58349-1-git-send-email-cst@phaseone.com>
 <CAMpxmJX3x5kOi63+cs5JFHp2Eu5W+0=zKBURcde7pZ5K_2=3nA@mail.gmail.com> <4359efb29daa2a6922e651bba90908794190de07.camel@phaseone.com>
In-Reply-To: <4359efb29daa2a6922e651bba90908794190de07.camel@phaseone.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Jul 2019 10:26:31 +0200
Message-ID: <CAMpxmJVX=x5ed9yTyczEqiaEp8nfS1VWZkMaBwToqMX9nMu80g@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Limit gpio calls to when wp_gpio is defined
To:     "Claus H. Stovgaard" <cst@phaseone.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

sob., 6 lip 2019 o 19:57 Claus H. Stovgaard <cst@phaseone.com> napisa=C5=82=
(a):
>
> On l=C3=B8r, 2019-07-06 at 19:33 +0200, Bartosz Golaszewski wrote:
> > Hi Claus,
> >
> > gpiod_set_value_cansleep() doesn't complain if the passed descriptor
> > is NULL - it just quietly returns. Could you give me some more info
> > on
> > how you trigger this warning?
> >
> > Bart
>
> Hi Bart
>
> If you don't have enabled gpiolib, (E.g. CONFIG_GPIOLIB is not set)
> gpiod_set_value_cansleep ends in /include/linux/gpio/consumer.h with
> the following code
>
> ---
> static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int
> value)
> {
>         /* GPIO can never have been requested */
>         WARN_ON(1);
> }
> ---
>
> So we get warnings like this in the log
>
> [  148.508317] WARNING: CPU: 0 PID: 1903 at
> include/linux/gpio/consumer.h:396 at24_write+0x150/0x260
> [  148.517187] Modules linked in:
> [  148.520236] CPU: 0 PID: 1903 Comm: DataObjects Tainted:
> G        W         4.19.0-p1-iq4-05669-g6fe8008-dirty #2
> [  148.530394] Hardware name: P1 IQ4 (DT)
> [  148.534129] pstate: 60000005 (nZCv daif -PAN -UAO)
> [  148.538914] pc : at24_write+0x150/0x260
> [  148.542741] lr : at24_write+0x11c/0x260
> [  148.546565] sp : ffffff800d5f3c40
> [  148.549864] x29: ffffff800d5f3c40 x28: 0000000000000000
> [  148.555167] x27: 0000000000000001 x26: ffffffc975096304
> [  148.560470] x25: ffffff8008d46980 x24: ffffffc975293020
> [  148.565774] x23: 00000000ffff6c15 x22: ffffffc977484498
> [  148.571077] x21: 00000000000006e2 x20: 0000000000000000
> [  148.576381] x19: 00000000000006e1 x18: 0000000000000400
> [  148.581684] x17: 0000000000000000 x16: ffffffc977008300
> [  148.586988] x15: 0000000000000400 x14: 0000000000000088
> [  148.592291] x13: 0000000000000000 x12: 0000000000000001
> [  148.597595] x11: 0000000000000001 x10: 00000000000007f0
> [  148.602898] x9 : ffffff800d5f37e0 x8 : ffffffc977008b50
> [  148.608202] x7 : ffffffc97ff76800 x6 : 000000001fbe647a
> [  148.613505] x5 : 00000000ffff6c0f x4 : ffffffbf211a0d8f
> [  148.618809] x3 : ffffffbf211a0d90 x2 : ffffff80084e55c4
> [  148.624113] x1 : 00000000000005dc x0 : 0000000000000001
> [  148.629417] Call trace:
> [  148.631852]  at24_write+0x150/0x260
> [  148.635335]  bin_attr_nvmem_write+0x6c/0xa0
> [  148.639510]  sysfs_kf_bin_write+0x64/0x80
> [  148.643510]  kernfs_fop_write+0xcc/0x1e0
> [  148.647425]  __vfs_write+0x30/0x158
> [  148.650905]  vfs_write+0xa4/0x1a8
> [  148.654211]  ksys_write+0x5c/0xc0
> [  148.657519]  __arm64_sys_write+0x18/0x20
> [  148.661436]  el0_svc_common+0x84/0xd8
> [  148.665087]  el0_svc_handler+0x68/0x80
> [  148.668828]  el0_svc+0x8/0xc
> [  148.671699] ---[ end trace f3f414c3b5f66f98 ]---
>

Cc Linus Walleij

I see. This isn't a problem with at24 but with the GPIO API. I Cc'ed
you on a patch I've just sent. Please take a look a possibly test.

Bart
