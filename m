Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD98F15072A
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 14:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgBCN1E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Feb 2020 08:27:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:42348 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727077AbgBCN1E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Feb 2020 08:27:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id DBDA8AD07;
        Mon,  3 Feb 2020 13:27:02 +0000 (UTC)
Date:   Mon, 3 Feb 2020 14:27:01 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Lei YU <mine260309@gmail.com>
Subject: Re: [PATCH 2/2] docs: i2c: dev-interface: document the actual
 implementation
Message-ID: <20200203142701.5c1db1ba@endymion>
In-Reply-To: <ffac66db-0b58-b832-f6b5-d1a1da7a1da9@lucaceresoli.net>
References: <20200123105246.67732e33@endymion>
        <20200123111137.5899fa5a@endymion>
        <20200123110909.GG1105@ninjato>
        <ffac66db-0b58-b832-f6b5-d1a1da7a1da9@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca, Wolfram,

On Thu, 23 Jan 2020 14:42:33 +0100, Luca Ceresoli wrote:
> On 23/01/20 12:09, Wolfram Sang wrote:
> > On Thu, Jan 23, 2020 at 11:11:37AM +0100, Jean Delvare wrote:  
> >> The old i2c-dev API based on inline functions is long gone, we have
> >> libi2c now which implements the same as real functions and comes with
> >> complete API documentation. Update the dev-interface documentation
> >> file accordingly to only mention what can be done without the
> >> library, and redirect the reader to the libi2c manual page for the
> >> rest.
> >>
> >> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> >> Reported-by: Lei YU <mine260309@gmail.com>
> >> Cc: Wolfram Sang <wsa@the-dreams.de>
> >> Cc: Luca Ceresoli <luca@lucaceresoli.net>  
> > 
> > I wonder if we shouldn't move the 'C library'  paragraph before the 'C
> > example'? To make sure people are aware of it (and use it) early before
> > digging into the low-level C code?  
> 
> I agree, it would be better. For the rest it look good.

Hmmm. It's not like you can do everything with libi2c so you should
always use it. There are several things that can't be done with libi2c
so you will have to do them "manually". Anything that doesn't fit in the
SMBus specification basically. As a matter of fact, i2ctransfer does
not use libi2c.

Also, even when using libi2c, you still need to explicitly open the
device node, set the slave address, and close the device when you are
done (just seeing that's missing from the C example but it should be
added). So the C example is still relevant even if you use libi2c.

So I'm not sure swapping the sections makes that much sense. What would
help on the other hand is to add a pointer to the C library section at
the point of the C example where using the library would simplify the
code. Would that work for you?

-- 
Jean Delvare
SUSE L3 Support
