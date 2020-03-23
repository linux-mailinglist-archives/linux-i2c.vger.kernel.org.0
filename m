Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F11AE18FBE7
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 18:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgCWRvX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 13:51:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:44468 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727160AbgCWRvX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 13:51:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 5AE11AE89;
        Mon, 23 Mar 2020 17:51:21 +0000 (UTC)
Date:   Mon, 23 Mar 2020 18:51:20 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in
 i801_isr_byte_done()
Message-ID: <20200323185120.1a5cd734@endymion>
In-Reply-To: <20200323093733.GA26299@kadam>
References: <0000000000009586b2059c13c7e1@google.com>
        <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
        <20200322231106.3d431ced@endymion>
        <20200323093733.GA26299@kadam>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 23 Mar 2020 12:37:33 +0300, Dan Carpenter wrote:
> On Sun, Mar 22, 2020 at 11:11:06PM +0100, Jean Delvare wrote:
> > Definitely not correct. The first byte of the block data array MUST be
> > the size of the block read. Even if the code above does not do the
> > right thing, removing the line will not help.
> >   
> 
> Yeah.  I misread the code.
> 
> > Is it possible that kasan got this wrong due to the convoluted logic?
> > It's late and I'll check again tomorrow morning but the code looks OK
> > to me.  
> 
> KASan doesn't work like that.  It works at runtime and doesn't care
> about the logic.
> 
> https://syzkaller.appspot.com/bug?id=426fc8b1c1b63fb0af524d839dfcf452f2d858e2
> 
> At the bottom of the report it shows that we're in a field of f9
> poisoned data so it's not priv->len which is wrong.  (My patch was way
> off).
> 
> mm/kasan/kasan.h:#define KASAN_VMALLOC_INVALID   0xF9  /* unallocated space in vmapped page */
> 
> The logic looks okay to me too.  So possibly this was a race condition
> or even memory corruption in an unrelated part of the kernel.

I checked out the exact kernel version this report was generated for,
and the faulty line is:

  592:			priv->data[priv->count++] = inb(SMBBLKDAT(priv));

This would suggest the problem is with priv->count growing beyond the
end of the array, however the fact that we land in a memory spot full
of 0xF9 kind of excludes this possibility (the data before the spot
would contain different data if it was the case).

The other option is that priv->count wasn't initialized at the time
it is used. However I can't see how this could happen, given that the
priv structure is kzalloc'd.

So, to be honest I can't really see how priv->count can get wrong. So
I would be tempted to lend towards the theory that the i2c-i801 driver
was a collateral victim of a memory corruption happening somewhere else
in the kernel. Wouldn't Kasan catch this too? Is it possible to access
the other Kasan reports from the same test run?

-- 
Jean Delvare
SUSE L3 Support
