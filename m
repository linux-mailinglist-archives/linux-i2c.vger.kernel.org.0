Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12383264147
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 11:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730240AbgIJJQm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 10 Sep 2020 05:16:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:40232 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730225AbgIJJOq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 05:14:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AB296AE84;
        Thu, 10 Sep 2020 09:14:58 +0000 (UTC)
Date:   Thu, 10 Sep 2020 11:14:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Volker =?UTF-8?B?UsO8bWVsaW4=?= <volker.ruemelin@googlemail.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 1/2] i2c: i801: Fix resume bug
Message-ID: <20200910111442.5b4259d6@endymion>
In-Reply-To: <19d445a6-0410-78a0-77aa-4297e864d064@googlemail.com>
References: <20200901152221.3cea0048@endymion>
        <19d445a6-0410-78a0-77aa-4297e864d064@googlemail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Volker,

On Sun, 6 Sep 2020 10:00:50 +0200, Volker Rümelin wrote:
> with these two patches the code in i2c-i801.c looks really good.

Great, thanks for the review.

> But there is an issue with the reproducer.
> 
> > I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
> > doesn't inititialize the SMBus master. After 1s of SMBus inactivity
> > autosuspend disables the SMBus master. To reproduce please note QEMU's
> > ICH9 SMBus emulation does not handle interrupts and it's necessary
> > to pass the parameter disable_features=0x10 to the i2c_i801 driver.  
> 
> Since commit a9c8088c7988e "i2c: i801: Don't restore config
> registers on runtime PM" the reproducer doesn't work anymore.
> This is because commit a9c8088c7988e works as intended and the
> pm->runtime_* callbacks no longer call i801_suspend() and
> i801_resume().

To be honest I was surprised that you were able to reproduce the resume
bug with QEMU in the first place. I did not remember about commit
a9c8088c7988e.

> But there is more. With the SMBus master in runtime suspended state
> the direct-complete mechanism skips the calls to the pm->suspend
> and pm->resume callbacks on system suspend/resume. I am convinced
> in nearly all cases this disables the fix from commit a5aaea37858fb
> "i2c-i801: Restore the device state before leaving".

My understanding of the PM subsystem is fairly limited (it evolves
faster than my leaning curve I'm afraid) but you are most certainly
right on that.

> At the moment I see two ways to fix this problem. One way is to
> revert a9c8088c7988e "i2c: i801: Don't restore config registers
> on runtime PM", the other is to set the driver flag
> DPM_FLAG_NO_DIRECT_COMPLETE in i801_probe(). I tested both, but I
> can't decide which way is better.

Reverting a9c8088c7988e would make run-time PM inefficient again, so I
am opposed to doing that. Flag DPM_FLAG_NO_DIRECT_COMPLETE seems to
have been introduced for exactly this purpose, so I would just use
that. To be honest I don't really understand why it is not the default,
but again I don't know much about the PM subsystem.

-- 
Jean Delvare
SUSE L3 Support
