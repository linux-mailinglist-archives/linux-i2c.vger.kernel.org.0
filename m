Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDE81F9C9C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 18:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgFOQHz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 12:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729772AbgFOQHz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 12:07:55 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ADAC061A0E;
        Mon, 15 Jun 2020 09:07:55 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s10so7803438pgm.0;
        Mon, 15 Jun 2020 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbAqJspBEy3qPmYLBAGhLz99Oyo1IaGAYVCtozwHP14=;
        b=K3tMyfHDMU23lAAyeTy3R5+F+8tyV4F19bGC4jPgVkfFDReb++iNlqxZ4oV5dGt0II
         FxvF5FxulOHAwY5RTyXjpLUS9imSH/JqLleM9vPsu4aJgd8D+oDXgMTSyOW5IdRpPfa9
         d/PhvNOuS5DKM3chalq7BOKTVq/cwnseug70HAXC3DFOI3I+47mDmDfu0AOHHuvcjRFf
         kg2EASmKr9fivAHe4QHbQODrHpiStZ088UaaFW7zSYJC98U5qyLGyPXAGRgiFrcD8Dxl
         S2gqi7R0oliDmRVgRBeBYl2aQ73WaAdwaTbw1xyU9xAmj5UA/1cZWgdMPq3IFXuxmLw1
         PJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbAqJspBEy3qPmYLBAGhLz99Oyo1IaGAYVCtozwHP14=;
        b=fjYOf9wsnqNIBtkUxgJRpwyd4JkpVPqGytPjoj4UKkYGSpAr2B7/s9bMSjgkiBeZHJ
         wQZ4cW4PJWgVYI+/2UMk7J0r4QIfIGzHtX5ySfX3+ryHfIm8pirCicz7qalpG/EKnuNQ
         vu1ifMZYxrY80W94nxeKI7jjpZluP4EUbrm/xnkPq/21R/J8vj4vSzzihLHomQNpN1gW
         QX3GZyweWhIM88/iZIDJ2ttDd1bu2rkEnU+6Ia4afOkhJoMUZQ9UBKxb2jULp+nq3T1M
         oBntoe73J+ZQ5avA134CMZ7XgGlVw9FrFMozqHymNadTiyyu7Ts7eG7X9R28/8/NG/Fo
         7QGA==
X-Gm-Message-State: AOAM532PUsM2zx8eDHFikkm205bT0r+vaxlSC5UJmFhi1PxxD2t0S8c0
        6ueOzHqMTv5l3CpBmZn5wCXJPtxNUEYI+477MCc=
X-Google-Smtp-Source: ABdhPJxMa0K1+iV8tITENmtN1Fz5raSyajtdv9SEYFFAqnuM9mo09FrJFM8EqxRJU7zBb83nCsGxfk4xNnPoNPWu+lM=
X-Received: by 2002:a63:305:: with SMTP id 5mr21153696pgd.74.1592237274446;
 Mon, 15 Jun 2020 09:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200614210255.4641-1-sultan@kerneltoast.com> <20200614210255.4641-2-sultan@kerneltoast.com>
 <20200615094019.GP2428291@smile.fi.intel.com> <20200615160320.GA1949@sultan-book.localdomain>
In-Reply-To: <20200615160320.GA1949@sultan-book.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Jun 2020 19:07:42 +0300
Message-ID: <CAHp75Ve1TgRrKF0_d-7dY6EZU36QszwQ1ezwE03RERKywCxGYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: designware: Only check the first byte for SMBus
 block read length
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Pavel Balan <admin@kryma.net>, Tin Huynh <tnhuynh@apm.com>,
        Wolfram Sang <wsa@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 15, 2020 at 7:06 PM Sultan Alsawaf <sultan@kerneltoast.com> wrote:
> On Mon, Jun 15, 2020 at 12:40:19PM +0300, Andy Shevchenko wrote:
> > On Sun, Jun 14, 2020 at 02:02:54PM -0700, Sultan Alsawaf wrote:
> > > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > >
> > > SMBus block reads can be broken because the read function will just skip
> > > over bytes it doesn't like until reaching a byte that conforms to the
> > > length restrictions for block reads. This is problematic when it isn't
> > > known if the incoming payload is indeed a conforming block read.
> > >
> > > According to the SMBus specification, block reads will only send the
> > > payload length in the first byte, so we can fix this by only considering
> > > the first byte in a sequence for block read length purposes.
> >
> > I'm wondering if this overlaps with [1]. AFAIU that one is also makes sure that
> > the length is not a garbage.
> >
> > [1]: https://lore.kernel.org/linux-i2c/20200613104109.2989-1-mans@mansr.com/T/#u
>
> No overlap.

Thanks for clarifying.

> That looks like a similar bug for a different driver. In my case,
> the adapter provides native SMBus support, so emulation is never used. This is
> clear to see by looking at i2c_transfer_buffer_flags(), which only uses the
> master_xfer functions provided by the adapter; it doesn't call the emulation
> path at all.

But do we get an advantage if this can be done in the i2c core instead
(once for all)?

-- 
With Best Regards,
Andy Shevchenko
