Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0F623DF97
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 19:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgHFRuR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 13:50:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:49582 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728225AbgHFQdo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Aug 2020 12:33:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 47FBDAD4D;
        Thu,  6 Aug 2020 12:14:55 +0000 (UTC)
Date:   Thu, 6 Aug 2020 14:14:36 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: VAIO EEPROM support in at24
Message-ID: <20200806141436.4dcdfe08@endymion>
In-Reply-To: <CAMRc=MeoWUaL_qvwL6bkpaVUvxh4x3ZN6V4UNQr+bjnLo3NubQ@mail.gmail.com>
References: <20200317151409.7940926c@endymion>
        <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
        <20200805163655.6cfa6e17@endymion>
        <CAMRc=MeoWUaL_qvwL6bkpaVUvxh4x3ZN6V4UNQr+bjnLo3NubQ@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 5 Aug 2020 20:14:28 +0200, Bartosz Golaszewski wrote:
> On Wed, Aug 5, 2020 at 4:36 PM Jean Delvare <jdelvare@suse.de> wrote:
> > I finally found the time to give it a try. Here's what my (tested)
> > prototype looks like:
> 
> Hi Jean,
> 
> this looks good at first glance.
> 
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > (...)
> > @@ -427,6 +450,15 @@ static int at24_read(void *priv, unsigne
> >
> >         pm_runtime_put(dev);
> >
> > +       if ((at24->flags & AT24_FLAG_MASKED_RANGE) && !capable(CAP_SYS_ADMIN)) {  
> 
> Maybe use unlikely() here? It's not necessarily a hotpath but at least
> it would be obvious it's a corner case.

Sure.

> > (...)
> > 1* Do we actually need to use a struct resource? With the current
> >    requirements, that looks overkill to me. We really only need the
> >    start and end offsets of the masked area (or start and length). Or
> >    do you plan to ever support multiple masked ranges, and
> >    resource.child would be used to daisy-chain these ranges? Personally
> >    I would wait until the need exists.
> 
> Yes, since this change doesn't seem to commit to any stable ABI, I'd
> say we can drop the reference to struct resource and possibly add it
> in the future. This just was the first thing that came to mind when I
> suggested it.

OK, I changed it to simple integers for now.

> >    Note that if we would just store mstart and mlen in struct
> >    at24_chip_data then we could even get rid of AT24_FLAG_MASKED_RANGE,
> >    as mlen > 0 would imply a masked range.
> 
> Makes sense.

Done.

> > 2* I chose the name "eeprom-vaio" because "vaio" would be too generic.
> >    I'm open to suggestions if you don't like that name.
> 
> Are you sure there won't be any different models of vaio eeproms? How
> about '24c02-vaio' or 'eeprom-vaio-24c02'?

All I've seen were 24C02 but last time was a decade ago. I have no idea
if recent Vaio laptops still have this EEPROM, at this address, of that
size. 'eeprom-vaio-24c02' is too long to my taste, and kind of
redundant as '24c02' implies 'eeprom'. I like '24c02-vaio' very much
though, it is both concise and accurate, and is future-proof too. I'll
go for that, thanks for the suggestion.

> > 3* at24_read() was pretty elegant before my changes, but with the need
> >    to remember the original value of many parameters, it no longer is.
> >    I'm considering rewriting it in a way that does not modify the
> >    parameters needed to process the masked range, either as part of
> >    this patch or as a subsequent clean-up patch. That would hopefully
> >    make the code elegant again.
> 
> All clean-ups are welcome.

OK, I'll give it a try and see if I can tidy it up.

> > 4* I made the masking active only for non-root users as this is what
> >    the legacy eeprom driver was doing. I hope that's OK with you.
> >  
> 
> Yes, it's fine with me. If more fine-grained control is needed we can
> probably extend it.

OK :-)

I have a patch almost ready, I'll submit v2 later today.

-- 
Jean Delvare
SUSE L3 Support
