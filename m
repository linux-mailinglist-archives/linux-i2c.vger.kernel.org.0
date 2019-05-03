Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32391366B
	for <lists+linux-i2c@lfdr.de>; Sat,  4 May 2019 01:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbfECX7A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 May 2019 19:59:00 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41390 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfECX67 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 May 2019 19:58:59 -0400
Received: by mail-pf1-f193.google.com with SMTP id 188so3656143pfd.8;
        Fri, 03 May 2019 16:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DdddGI6DDT7dsMKCDs7wmk1NY1s6eqW3FG1qa627pfU=;
        b=ntfThZULWIMDKZD8/FI97Sy8goP7TxfL2GUgz3WMEJBa0EVSmZx/8tH/d63kkoZxp9
         pvJKiWDe6rZpTQbrAEkRc4RFkcGH3ypR093twH8LFUYQMXLQ1rbGDjNx/18Xl+asTYoh
         KyjuYxFOpRkhA5+WOrLQ6BxRQOnOWDkcd2PAw7ZmYJm4DPS4xaomXRr5DxrrDMMfAZK+
         QJwXmiXTSRyoNAxAD3hX7okYG80IyhTOC2+bGrsgmNn8pVHcNzQ2pPyicuH4Wkcp8v2v
         CZW/v7A9o8PCP1E+eRw5IFAcgxS7WrXEhhBtV8NIQ5M8uUzGRap+9o+95KExRYmBhEGa
         2G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DdddGI6DDT7dsMKCDs7wmk1NY1s6eqW3FG1qa627pfU=;
        b=rIzUc8toXVyv84Hlt43YeoRYQip4YhYZqHILPwkwHR4OehYxbaP1gHxK64913ZRWkU
         1R2CunW01yUqFZju1yPGWuAlfoGhZQ2TLaiRMQavjjeh+uJgjmJBAU4eUm07KBO0I6Bv
         Bft/5vX28psDBzUB6RXNzS6JRIxp6xvMaNcAsX8thnR3MZUgqPljE9iynBhSm5BlzLLh
         ZLqYWd/4nNe2Fkc8uGF56XWDOd1zYw8HbfnUAjBPIEEJ1WHpfP6MOBejJhMXSFPzu/uc
         hLEpmdjzQeAazq+oru+wKeIadAHcnYnMQmQ2MoK80uxiemQrX9i0Gh3fXNbciox6z5d/
         ZwCw==
X-Gm-Message-State: APjAAAW20uInmIoJK4/GIuEGfhvBEAKFgeedIYzzuitgGWjtdMCaNn55
        CNizqXLkhm2b1wzRslgpeWs=
X-Google-Smtp-Source: APXvYqywxmvzEg/abOIYBaWKkRkJeaD7WfUZmeBvshORCc5bVqRKb1vw7fMBaC+PVFCTiTq2WBkBxw==
X-Received: by 2002:a65:6541:: with SMTP id a1mr13854624pgw.233.1556927938712;
        Fri, 03 May 2019 16:58:58 -0700 (PDT)
Received: from pc ([123.201.65.103])
        by smtp.gmail.com with ESMTPSA id j32sm3703933pgi.73.2019.05.03.16.58.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 16:58:57 -0700 (PDT)
Date:   Sat, 4 May 2019 05:28:51 +0530
From:   Raag Jadav <raagjadav@gmail.com>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: at91: handle TXRDY interrupt spam
Message-ID: <20190503235851.GA4242@pc>
References: <1556005008-6318-1-git-send-email-raagjadav@gmail.com>
 <20190429090005.f6ydghzu5n5yruav@M43218.corp.atmel.com>
 <20190429223332.GA3908@pc>
 <20190502140116.rim72idpgvq4h4vc@M43218.corp.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502140116.rim72idpgvq4h4vc@M43218.corp.atmel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 02, 2019 at 04:01:16PM +0200, Ludovic Desroches wrote:
> On Tue, Apr 30, 2019 at 04:03:32AM +0530, Raag Jadav wrote:
> > External E-Mail
> > 
> > 
> > On Mon, Apr 29, 2019 at 11:00:05AM +0200, Ludovic Desroches wrote:
> > > Hello Raag,
> > > 
> > > On Tue, Apr 23, 2019 at 01:06:48PM +0530, Raag Jadav wrote:
> > > > External E-Mail
> > > > 
> > > > 
> > > > Performing i2c write operation while SDA or SCL line is held
> > > > or grounded by slave device, we go into infinite at91_twi_write_next_byte
> > > > loop with TXRDY interrupt spam.
> > > 
> > > Sorry but I am not sure to have the full picture, the controller is in
> > > slave or master mode?
> > > 
> > > SVREAD is only used in slave mode. When SVREAD is set, it means that a read
> > > access is performed and your issue concerns the write operation.
> > > 
> > > Regards
> > > 
> > > Ludovic
> > 
> > Yes, even though the datasheet suggests that SVREAD is irrelevant in master mode,
> > TXRDY and SVREAD are the only ones being set in status register upon reproducing the issue.
> > Couldn't think of a better way to handle such strange behaviour.
> > Any suggestions would be appreciated.
> 
> I have the confirmation that you can't rely on the SVREAD flag when in
> master mode. This flag should always have the same value.
> 
> I am trying to understand what could lead to your situation. Can you
> give me more details. What kind of device it is? What does lead to this
> situation? Does it happen randomly or not?

One of the sama5d2 based board I worked on, was having trouble complete its boot
because of a faulty i2c device, which was randomly holding down the SDA line
on i2c write operation, not allowing the controller to complete its transmission,
causing a massive TXRDY interrupt spam, ultimately hanging the processor.

Another strange observation was that SVREAD was being set in the status register
along with TXRDY, every time I reproduced the issue.
You can reproduce it by simply grounding the SDA line and performing i2c write
on the bus.

Note that NACK, LOCK or TXCOMP are never set as the transmission never completes.
I'm not sure why slave bits are being set in master mode,
but it's been working reliably for me.

This patch doesn't recover the SDA line. It just prevents the processor from
getting hanged in case of i2c bus lockup.

Cheers,
Raag

> 
> Regards
> 
> Ludovic
> 
> > 
> > Cheers,
> > Raag
> > 
> > > 
> > > > 
> > > > Signed-off-by: Raag Jadav <raagjadav@gmail.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-at91.c | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/i2c/busses/i2c-at91.c b/drivers/i2c/busses/i2c-at91.c
> > > > index 3f3e8b3..b2f5fdb 100644
> > > > --- a/drivers/i2c/busses/i2c-at91.c
> > > > +++ b/drivers/i2c/busses/i2c-at91.c
> > > > @@ -72,6 +72,7 @@
> > > >  #define	AT91_TWI_TXCOMP		BIT(0)	/* Transmission Complete */
> > > >  #define	AT91_TWI_RXRDY		BIT(1)	/* Receive Holding Register Ready */
> > > >  #define	AT91_TWI_TXRDY		BIT(2)	/* Transmit Holding Register Ready */
> > > > +#define	AT91_TWI_SVREAD		BIT(3)	/* Slave Read */
> > > >  #define	AT91_TWI_OVRE		BIT(6)	/* Overrun Error */
> > > >  #define	AT91_TWI_UNRE		BIT(7)	/* Underrun Error */
> > > >  #define	AT91_TWI_NACK		BIT(8)	/* Not Acknowledged */
> > > > @@ -571,7 +572,10 @@ static irqreturn_t atmel_twi_interrupt(int irq, void *dev_id)
> > > >  		at91_disable_twi_interrupts(dev);
> > > >  		complete(&dev->cmd_complete);
> > > >  	} else if (irqstatus & AT91_TWI_TXRDY) {
> > > > -		at91_twi_write_next_byte(dev);
> > > > +		if ((status & AT91_TWI_SVREAD) && (dev->buf_len == 0))
> > > > +			at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
> > > > +		else
> > > > +			at91_twi_write_next_byte(dev);
> > > >  	}
> > > >  
> > > >  	/* catch error flags */
> > > > -- 
> > > > 2.7.4
> > > > 
> > > > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 
