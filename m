Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E84D1EF04E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jun 2020 06:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgFEEUx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jun 2020 00:20:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgFEEUw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jun 2020 00:20:52 -0400
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C2E5206E6;
        Fri,  5 Jun 2020 04:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591330852;
        bh=L0r6kjmvHjs80cz5MhruOEH0mjPhI95u+Q4pmOZ9REM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I28GuoR2dhIx8TWV1VOxJ8avcaxXvTiZ/9vhYE7g/tmcnI3rFn2hbbxYBC7FYVv6w
         BaR2W1vdHGGEtVXdG5+3pGyUhg4KqPfqodQM+PWQly4M2dZBzEpp8qYeaBzikj3TO1
         wnbn+cykfuFrqMbuV3aVxzZ7Kg6f8rlJlQIQ4oaY=
Date:   Thu, 4 Jun 2020 21:20:50 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     syzbot <syzbot+60f9ee7f99afe29ef9fa@syzkaller.appspotmail.com>
Cc:     brendanhiggins@google.com, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael.j.wysocki@intel.com,
        rafael@kernel.org, rdunlap@infradead.org,
        syzkaller-bugs@googlegroups.com, wsa@the-dreams.de
Subject: Re: KASAN: use-after-free Read in put_device
Message-ID: <20200605042050.GM2667@sol.localdomain>
References: <00000000000045f37205a653bcf8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000045f37205a653bcf8@google.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 23, 2020 at 10:04:14AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    c11d28ab Add linux-next specific files for 20200522
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=114e4f06100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6dbdea4159fb66
> dashboard link: https://syzkaller.appspot.com/bug?extid=60f9ee7f99afe29ef9fa
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ba16e2100000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16caefe6100000
> 
> The bug was bisected to:
> 
> commit 4ef12f7198023c09ad6d25b652bd8748c965c7fa
> Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Date:   Wed May 13 15:18:40 2020 +0000
> 
>     kobject: Make sure the parent does not get released before its children
> 

Commit was reverted.

#syz invalid
