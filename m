Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F29F18EB5E
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 19:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgCVSIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 14:08:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:41510 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgCVSIR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 14:08:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 242A4AD8E;
        Sun, 22 Mar 2020 18:08:15 +0000 (UTC)
Date:   Sun, 22 Mar 2020 19:08:13 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in
 i801_isr_byte_done()
Message-ID: <20200322190813.39b92de2@endymion>
In-Reply-To: <20200320145748.GD1282@ninjato>
References: <0000000000009586b2059c13c7e1@google.com>
        <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
        <20200222124523.GI1716@kunai>
        <20200320145748.GD1282@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Can you please bounce the previous messages in this thread to me? I was
apparently not Cc'd so I'm missing the context.

Thanks,
Jean

On Fri, 20 Mar 2020 15:57:48 +0100, Wolfram Sang wrote:
> On Sat, Feb 22, 2020 at 01:45:23PM +0100, Wolfram Sang wrote:
> > On Tue, Jan 14, 2020 at 10:34:06AM +0300, Dan Carpenter wrote:  
> > > Assigning "priv->data[-1] = priv->len;" obviously doesn't make sense.
> > > What it does is it ends up corrupting the last byte of priv->len so
> > > priv->len becomes a very high number.
> > > 
> > > Reported-by: syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com
> > > Fixes: d3ff6ce40031 ("i2c-i801: Enable IRQ for byte_by_byte transactions")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---  
> > 
> > Daniel, Jean: what do you think?
> > Also, adding Jarkko to CC who works a lot with this driver...  
> 
> Ping. Adding more people...
> 
> >   
> > > Untested.
> > > 
> > >  drivers/i2c/busses/i2c-i801.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > > index f5e69fe56532..420d8025901e 100644
> > > --- a/drivers/i2c/busses/i2c-i801.c
> > > +++ b/drivers/i2c/busses/i2c-i801.c
> > > @@ -584,7 +584,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
> > >  					"SMBus block read size is %d\n",
> > >  					priv->len);
> > >  			}
> > > -			priv->data[-1] = priv->len;
> > >  		}
> > >  
> > >  		/* Read next byte */
> > > -- 
> > > 2.11.0
> > >   
