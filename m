Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBED109C95
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2019 11:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfKZKwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Nov 2019 05:52:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:43108 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727817AbfKZKwq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 26 Nov 2019 05:52:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AE4BDAD00;
        Tue, 26 Nov 2019 10:52:44 +0000 (UTC)
Date:   Tue, 26 Nov 2019 11:52:43 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Lei YU <mine260309@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: i2c: Fix return value of i2c_smbus_xxx
 functions
Message-ID: <20191126115243.673fc164@endymion>
In-Reply-To: <20191125144857.GA2412@kunai>
References: <1574162632-65848-1-git-send-email-mine260309@gmail.com>
        <20191125144857.GA2412@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 25 Nov 2019 15:48:57 +0100, Wolfram Sang wrote:
> On Tue, Nov 19, 2019 at 07:23:52PM +0800, Lei YU wrote:
> > In i2c/dev-interface.rst it said
> >   
> > > All these transactions return -1 on failure  
> > 
> > But actually the i2c_smbus_xxx functions return negative error numbers
> > on failure, instead of -1.
> > 
> > Fix the document and remove the following sentence.
> > 
> > Signed-off-by: Lei YU <mine260309@gmail.com>
> > ---
> >  Documentation/i2c/dev-interface.rst | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
> > index 69c23a3..f2f2b28 100644
> > --- a/Documentation/i2c/dev-interface.rst
> > +++ b/Documentation/i2c/dev-interface.rst
> > @@ -163,11 +163,10 @@ for details) through the following functions::
> >    __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
> >                                     __u8 *values);
> >  
> > -All these transactions return -1 on failure; you can read errno to see
> > -what happened. The 'write' transactions return 0 on success; the
> > -'read' transactions return the read value, except for read_block, which
> > -returns the number of values read. The block buffers need not be longer
> > -than 32 bytes.
> > +All these transactions return a negative error number on failure.
> > +The 'write' transactions return 0 on success; the 'read' transactions
> > +return the read value, except for read_block, which returns the number
> > +of values read. The block buffers need not be longer than 32 bytes.  
> 
> I think the correct solution is to remove this paragraph entirely.
> Because the returned value does not depend on the kernel but on the
> libi2c version. Check this commit from 2012 in the i2c-tools repo:
> 
> 330bba2 ("libi2c: Properly propagate real error codes on read errors")
> 
> So, I think we should document it there. Jean, what do you think?

I would go further and move half of the document to i2c-tools. i2c-dev
itself only provides the ioctls. Everything on top of that is in libi2c
now, so the kernel documentation should point to libi2c and the
detailed documentation should come with libi2c.

So I guess I should review the whole document now to see what needs to
be updated, what should stay, and what should move.

-- 
Jean Delvare
SUSE L3 Support
