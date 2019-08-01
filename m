Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDD797E0BA
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 19:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbfHARF7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 13:05:59 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39917 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfHARF7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Aug 2019 13:05:59 -0400
Received: by mail-pg1-f193.google.com with SMTP id u17so34550293pgi.6
        for <linux-i2c@vger.kernel.org>; Thu, 01 Aug 2019 10:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nkJbqodJ9C0ksiaRHQQhFUkCgZIL+2nK0xDpcGr6Ljw=;
        b=QowWdV4mL4TGIfHrdQC7wfEm66nWjhhPv07tiAboCYyF++NtJvXT2KTYakY32Avxvi
         IelVM16BHqefiPOC/iS2t2ynNbsSjh8Hq4hdBxjPbGpUCwjvUVi8utgpZnfkB3bNYZgX
         eu01JNvk2k7ZkaxH1HGMNcwp2vtwjPKY+swvX/kCPNosFnHYfGtuyGMkdNv7HIMgi40L
         o1bzJP+fqDz5PyZ08g4tEQNEIeQzTv+JkydwxR8XRnQdgU5sTAt9OGaoAlawp+EStlCc
         AMM7U4siaLbc256wRUKo0reQaq6PXPdg9VotoNx5iV+DMOGdJFdE34HaDiQxt0mIvIoc
         AG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nkJbqodJ9C0ksiaRHQQhFUkCgZIL+2nK0xDpcGr6Ljw=;
        b=rz11UuMbBdjAWOb//O8VEeyNc1X8fS39ppvLHQqhhBd0IJDRepYU1r66V+5r/z+H6t
         kTmNQOGTjBlTvZB83fQl0gtsEQYn7P0Akrz/Iid0qiI2BQwKbCFluUs45/SraxJ0BZQw
         jhc2Tk4CBQhl+uhucHxcApFSkC9Y2K8y/ayCA2wuEYxKdk/q0CKM2C69/bSbGdNfszMS
         yxZRnwELhl63cQ1kf391OZlisVFmivjGVczFHIyPHzF8zniRY9EGt9wuen0PPy5bqfDh
         YjK6PuJFgGQJVEU1SrUwIQxBcWt+GSFsdeETOzlWcEGoi39+6KqL1sfVPoVpZgqEoWbq
         JARg==
X-Gm-Message-State: APjAAAXKPre6Ppt4f7keYWZCue5rFDhgrsHu/Lsjzgbt6hj3veV8FuPQ
        iwcsQVBBQsg/jH/sl94azPkEO39G
X-Google-Smtp-Source: APXvYqxYK9JvCnUZm5+ZPqxDRS81eRzBDuvLFzR/aZuiE26lOuX+Ztnj15nSAddvY+ppa+XgSZN/EA==
X-Received: by 2002:a65:60d3:: with SMTP id r19mr95293962pgv.91.1564679158916;
        Thu, 01 Aug 2019 10:05:58 -0700 (PDT)
Received: from pc ([123.201.70.217])
        by smtp.gmail.com with ESMTPSA id a3sm72240386pfc.70.2019.08.01.10.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 10:05:58 -0700 (PDT)
Date:   Thu, 1 Aug 2019 22:35:52 +0530
From:   Raag Jadav <raagjadav@gmail.com>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i2c: at91: disable TXRDY interrupt after sending data
Message-ID: <20190801170552.GA3873@pc>
References: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
 <20190731123734.4ixxlurouni6nopp@M43218.corp.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190731123734.4ixxlurouni6nopp@M43218.corp.atmel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 31, 2019 at 02:37:35PM +0200, Ludovic Desroches wrote:
> Hi,
> 
> On Mon, Jul 22, 2019 at 08:55:27PM +0200, Michał Mirosław wrote:
> > 
> > Driver was not disabling TXRDY interrupt after last TX byte.
> > This caused interrupt storm until transfer timeouts for slow
> > or broken device on the bus. The patch fixes the interrupt storm
> > on my SAMA5D2-based board.
> > 
> > Cc: stable@vger.kernel.org # 5.2.x
> > [v5.2 introduced file split; the patch should apply to i2c-at91.c before the split]
> > Fixes: fac368a0404 ("i2c: at91: add new driver")
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> 

Tested-by: Raag Jadav <raagjadav@gmail.com>

> 
> Sounds good to me as AT91_TWI_TXRDY is only used to send the next byte.
> 
> Raag, you added you in the copy list as it seems close to your issue. I am
> really sorry, I didn't have time to go further with your issue. Is this
> patch solves your issue?

Yes, although I had a v2 ready to send out with similar changes,
this patch does the job as well.

Cheers,
Raag

> 
> Thanks for this patch.
> 
> Ludovic
> 
> > ---
> >  drivers/i2c/busses/i2c-at91-master.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> > index e87232f2e708..a3fcc35ffd3b 100644
> > --- a/drivers/i2c/busses/i2c-at91-master.c
> > +++ b/drivers/i2c/busses/i2c-at91-master.c
> > @@ -122,9 +122,11 @@ static void at91_twi_write_next_byte(struct at91_twi_dev *dev)
> >  	writeb_relaxed(*dev->buf, dev->base + AT91_TWI_THR);
> >  
> >  	/* send stop when last byte has been written */
> > -	if (--dev->buf_len == 0)
> > +	if (--dev->buf_len == 0) {
> >  		if (!dev->use_alt_cmd)
> >  			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_STOP);
> > +		at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
> > +	}
> >  
> >  	dev_dbg(dev->dev, "wrote 0x%x, to go %zu\n", *dev->buf, dev->buf_len);
> >  
> > @@ -542,9 +544,8 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
> >  		} else {
> >  			at91_twi_write_next_byte(dev);
> >  			at91_twi_write(dev, AT91_TWI_IER,
> > -				       AT91_TWI_TXCOMP |
> > -				       AT91_TWI_NACK |
> > -				       AT91_TWI_TXRDY);
> > +				       AT91_TWI_TXCOMP | AT91_TWI_NACK |
> > +				       (dev->buf_len ? AT91_TWI_TXRDY : 0));
> >  		}
> >  	}
> >  
> > -- 
> > 2.20.1
> > 
