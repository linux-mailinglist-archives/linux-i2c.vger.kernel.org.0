Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FA21F9E43
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 19:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgFORPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 13:15:16 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45421 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729354AbgFORPQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 13:15:16 -0400
Received: by mail-pl1-f193.google.com with SMTP id d8so7049719plo.12;
        Mon, 15 Jun 2020 10:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FCIu8IiCUQi+aGjEXORugDoaPNJi9zDY2fZ9atryoaU=;
        b=gHIl6kedbk4LH/4YFqG5x5svgeAgzEcupg3MDg2VFqP8wzbtv93bToEpg1lZYLiYWT
         eOUSnCOE2me5BTzTQPLDmsBvDG0/bv7EyY/kX0e2ZEJLDQPlpIqJXrV4kxWqqKsSVUQN
         XAx3vOtRnGnqCgzmqf00vcsw3bRZDMM+bM9ctI/eDXHdBJUhyIjYoWs1YLKkEl+zO9Gq
         Maz9SATmmeqTMFSwmYAaH05luLkoB/meH4cPe+R1FxZ9cYqq8EkAllzaQGjnmc+wMnLY
         /GJkYHbirVxMm4bAb1DbBiCIziEFBQxgSVAV8O6Mh2NBQAndtQAajKipkEpkQYvyXiXo
         9nhQ==
X-Gm-Message-State: AOAM5305byAinA2pDSiPBMCMJm8R//pCCpunF5ngCKUKWpcbjTT/NjbZ
        0qZS7zkOMTK5J3ZZSG+FZeU=
X-Google-Smtp-Source: ABdhPJxOzYZMBPVCwDwb/VcurGYYUBAIP1XxMjkA/Y0IHrBP84cV+ZamibvHeyBqn5f+mBmQbaGY+A==
X-Received: by 2002:a17:90a:58f:: with SMTP id i15mr331529pji.78.1592241314281;
        Mon, 15 Jun 2020 10:15:14 -0700 (PDT)
Received: from sultan-book.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id t7sm97363pju.42.2020.06.15.10.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:15:13 -0700 (PDT)
Date:   Mon, 15 Jun 2020 10:15:08 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH 1/2] i2c: designware: Only check the first byte for SMBus
 block read length
Message-ID: <20200615171508.GA2663@sultan-book.localdomain>
References: <20200614210255.4641-1-sultan@kerneltoast.com>
 <20200614210255.4641-2-sultan@kerneltoast.com>
 <20200615094019.GP2428291@smile.fi.intel.com>
 <20200615160320.GA1949@sultan-book.localdomain>
 <CAHp75Ve1TgRrKF0_d-7dY6EZU36QszwQ1ezwE03RERKywCxGYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve1TgRrKF0_d-7dY6EZU36QszwQ1ezwE03RERKywCxGYg@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 15, 2020 at 07:07:42PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 15, 2020 at 7:06 PM Sultan Alsawaf <sultan@kerneltoast.com> wrote:
> > On Mon, Jun 15, 2020 at 12:40:19PM +0300, Andy Shevchenko wrote:
> > > On Sun, Jun 14, 2020 at 02:02:54PM -0700, Sultan Alsawaf wrote:
> > > > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > > >
> > > > SMBus block reads can be broken because the read function will just skip
> > > > over bytes it doesn't like until reaching a byte that conforms to the
> > > > length restrictions for block reads. This is problematic when it isn't
> > > > known if the incoming payload is indeed a conforming block read.
> > > >
> > > > According to the SMBus specification, block reads will only send the
> > > > payload length in the first byte, so we can fix this by only considering
> > > > the first byte in a sequence for block read length purposes.
> > >
> > > I'm wondering if this overlaps with [1]. AFAIU that one is also makes sure that
> > > the length is not a garbage.
> > >
> > > [1]: https://lore.kernel.org/linux-i2c/20200613104109.2989-1-mans@mansr.com/T/#u
> >
> > No overlap.
> 
> Thanks for clarifying.
> 
> > That looks like a similar bug for a different driver. In my case,
> > the adapter provides native SMBus support, so emulation is never used. This is
> > clear to see by looking at i2c_transfer_buffer_flags(), which only uses the
> > master_xfer functions provided by the adapter; it doesn't call the emulation
> > path at all.
> 
> But do we get an advantage if this can be done in the i2c core instead
> (once for all)?

We can't, because the adapter driver needs to know mid-transfer to look for the
payload length in the first byte, and then alter the transfer size on-the-fly.
That can't be done in the i2c core, sadly. The problem is that we don't know if
a transfer is going to be a block read or not beforehand. And altering the
transfer size mid-transfer is definitely a controller specific task.

Sultan
