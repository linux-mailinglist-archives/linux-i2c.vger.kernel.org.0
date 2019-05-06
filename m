Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963AB150D9
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 18:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfEFQCt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 12:02:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37464 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfEFQCt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 12:02:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id e6so6675948pgc.4;
        Mon, 06 May 2019 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h65MRHziS/XlCWzkTo39Affot/MxBBxZ2XDqR6AxO+k=;
        b=T2uzTZYHpOy4PG50ZS7kPplrZmFrxlPpPjn/ROJsOlfzqJ2yB+OpnPQ3f+QwwEMs1d
         2XjnstY7q9UOyC8dekFPY1YWSkRa+y2hpm40p1z8FL4gOgh0sgQWMNlXrK/qHOHJlGXh
         bPnrHchFQHD6WTeCZU3UZUKQqo5SO6Iy5YNtmeL601IurzdsL/jCIKICFaSGWU3kOLZ/
         A0MlkE9UTOCbREzqKh6I6gfztCzSkVzr6DqjAn/eH/c0E+8BPzO8b0f3eiIMPYu1QpbR
         UVfQeIuGAxZov3Jazo2/pKVt12GzU8mTJQ/HsHNdtXC4W5UQ+EMzQrVuWWCQeuA4EX3d
         AbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h65MRHziS/XlCWzkTo39Affot/MxBBxZ2XDqR6AxO+k=;
        b=M/Njc192H4urkOATN1E3s7GXr6Gw/TlMFsPVyqw81LyeNUuq83Yyyz+aMr4HPlyPWT
         jvi5L2YANM+CzSrahe/thymZ2b2+xL9n1PZIIvHG3XQuLgUCSGV8l+Zt17XnaAXIWdiz
         b8cG5A9+xenRPamVy9d6W7jTMNNZxkbi/6sYMiWER4OODjWKInnEqU59rnQDu3sCLPdc
         UagspDt4p+kb94pnwjw5Nrf4DTwea/0ZLenvCdLfzyCnMRsWvm9tyiv8hKri76ejjA2a
         AFm+1uhGixN/F3VMa8uzscN9zcckuXhezQekOv75qwyzpZGoN7JIgJIafqFHX55HvwRD
         cN9w==
X-Gm-Message-State: APjAAAWFUbOnT3qKsq87lkh0xDO0xSeLNZ7TITwLIDm011O9c/edE/ac
        wdy+JfwouVa902yrH/BdYl9v7XCdhYo=
X-Google-Smtp-Source: APXvYqxivXnK448bMAew0yXX3RSNOeE2Ns7z5/ZQ/JaTWPkpJWQ4CnT1HrnEg2Aw6Ar/nsLt7sqegw==
X-Received: by 2002:aa7:8e55:: with SMTP id d21mr34046155pfr.62.1557158568291;
        Mon, 06 May 2019 09:02:48 -0700 (PDT)
Received: from pc ([219.91.191.230])
        by smtp.gmail.com with ESMTPSA id h127sm14343108pgc.31.2019.05.06.09.02.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 09:02:47 -0700 (PDT)
Date:   Mon, 6 May 2019 21:32:40 +0530
From:   Raag Jadav <raagjadav@gmail.com>
To:     Eugen.Hristev@microchip.com, ludovic.desroches@microchip.com
Cc:     alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: at91: handle TXRDY interrupt spam
Message-ID: <20190506160240.GA3156@pc>
References: <1556005008-6318-1-git-send-email-raagjadav@gmail.com>
 <20190429090005.f6ydghzu5n5yruav@M43218.corp.atmel.com>
 <20190429223332.GA3908@pc>
 <20190502140116.rim72idpgvq4h4vc@M43218.corp.atmel.com>
 <20190503235851.GA4242@pc>
 <408ff580-3633-f510-4223-50064f93024a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <408ff580-3633-f510-4223-50064f93024a@microchip.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 06, 2019 at 08:19:01AM +0000, Eugen.Hristev@microchip.com wrote:
> 
> 
> On 04.05.2019 02:58, Raag Jadav wrote:
> 
> > On Thu, May 02, 2019 at 04:01:16PM +0200, Ludovic Desroches wrote:
> >> On Tue, Apr 30, 2019 at 04:03:32AM +0530, Raag Jadav wrote:
> >>> External E-Mail
> >>>
> >>>
> >>> On Mon, Apr 29, 2019 at 11:00:05AM +0200, Ludovic Desroches wrote:
> >>>> Hello Raag,
> >>>>
> >>>> On Tue, Apr 23, 2019 at 01:06:48PM +0530, Raag Jadav wrote:
> >>>>> External E-Mail
> >>>>>
> >>>>>
> >>>>> Performing i2c write operation while SDA or SCL line is held
> >>>>> or grounded by slave device, we go into infinite at91_twi_write_next_byte
> >>>>> loop with TXRDY interrupt spam.
> >>>>
> >>>> Sorry but I am not sure to have the full picture, the controller is in
> >>>> slave or master mode?
> >>>>
> >>>> SVREAD is only used in slave mode. When SVREAD is set, it means that a read
> >>>> access is performed and your issue concerns the write operation.
> >>>>
> >>>> Regards
> >>>>
> >>>> Ludovic
> >>>
> >>> Yes, even though the datasheet suggests that SVREAD is irrelevant in master mode,
> >>> TXRDY and SVREAD are the only ones being set in status register upon reproducing the issue.
> >>> Couldn't think of a better way to handle such strange behaviour.
> >>> Any suggestions would be appreciated.
> >>
> >> I have the confirmation that you can't rely on the SVREAD flag when in
> >> master mode. This flag should always have the same value.
> >>
> >> I am trying to understand what could lead to your situation. Can you
> >> give me more details. What kind of device it is? What does lead to this
> >> situation? Does it happen randomly or not?
> > 
> > One of the sama5d2 based board I worked on, was having trouble complete its boot
> > because of a faulty i2c device, which was randomly holding down the SDA line
> > on i2c write operation, not allowing the controller to complete its transmission,
> > causing a massive TXRDY interrupt spam, ultimately hanging the processor.
> > 
> > Another strange observation was that SVREAD was being set in the status register
> > along with TXRDY, every time I reproduced the issue.
> > You can reproduce it by simply grounding the SDA line and performing i2c write
> > on the bus.
> > 
> > Note that NACK, LOCK or TXCOMP are never set as the transmission never completes.
> > I'm not sure why slave bits are being set in master mode,
> > but it's been working reliably for me.
> > 
> > This patch doesn't recover the SDA line. It just prevents the processor from
> > getting hanged in case of i2c bus lockup.
> 
> Hello,
> 
> I have noticed the same hanging at some points... In my case it is 
> because of this patch:
> 
> commit e8f39e9fc0e0b7bce24922da925af820bacb8ef8
> Author: David Engraf <david.engraf@sysgo.com>
> Date:   Thu Apr 26 11:53:14 2018 +0200
> 
> 
> diff --git a/drivers/i2c/busses/i2c-at91.c b/drivers/i2c/busses/i2c-at91.c
> index bfd1fdf..3f3e8b3 100644
> --- a/drivers/i2c/busses/i2c-at91.c
> +++ b/drivers/i2c/busses/i2c-at91.c
> @@ -518,8 +518,16 @@ static irqreturn_t atmel_twi_interrupt(int irq, 
> void *dev_id)
>           * the RXRDY interrupt first in order to not keep garbage data 
> in the
>           * Receive Holding Register for the next transfer.
>           */
> -       if (irqstatus & AT91_TWI_RXRDY)
> -               at91_twi_read_next_byte(dev);
> +       if (irqstatus & AT91_TWI_RXRDY) {
> +               /*
> +                * Read all available bytes at once by polling RXRDY 
> usable w/
> +                * and w/o FIFO. With FIFO enabled we could also read 
> RXFL and
> +                * avoid polling RXRDY.
> +                */
> +               do {
> +                       at91_twi_read_next_byte(dev);
> +               } while (at91_twi_read(dev, AT91_TWI_SR) & AT91_TWI_RXRDY);
> +       }
> 
> 
> In my opinion having a do/while with an exit condition relying solely on 
> a bit read from hardware is unacceptable in IRQ context - kernel can 
> hang here.
> A timeout would be a solution...
> 
> For me, reverting this patch solves hanging issues.
> 
> Hope this helps,
> 
> Eugen

Thank you for your input, but my issue concerns i2c write operation.
I haven't noticed any issue with i2c read yet.
But given the same scenario, it could be true for RXRDY as well.

Cheers,
Raag

> 
> > 
> > Cheers,
> > Raag
> > 
> >>
> >> Regards
> >>
> >> Ludovic
> >>
> >>>
> >>> Cheers,
> >>> Raag
> >>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Raag Jadav <raagjadav@gmail.com>
> >>>>> ---
> >>>>>   drivers/i2c/busses/i2c-at91.c | 6 +++++-
> >>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/i2c/busses/i2c-at91.c b/drivers/i2c/busses/i2c-at91.c
> >>>>> index 3f3e8b3..b2f5fdb 100644
> >>>>> --- a/drivers/i2c/busses/i2c-at91.c
> >>>>> +++ b/drivers/i2c/busses/i2c-at91.c
> >>>>> @@ -72,6 +72,7 @@
> >>>>>   #define	AT91_TWI_TXCOMP		BIT(0)	/* Transmission Complete */
> >>>>>   #define	AT91_TWI_RXRDY		BIT(1)	/* Receive Holding Register Ready */
> >>>>>   #define	AT91_TWI_TXRDY		BIT(2)	/* Transmit Holding Register Ready */
> >>>>> +#define	AT91_TWI_SVREAD		BIT(3)	/* Slave Read */
> >>>>>   #define	AT91_TWI_OVRE		BIT(6)	/* Overrun Error */
> >>>>>   #define	AT91_TWI_UNRE		BIT(7)	/* Underrun Error */
> >>>>>   #define	AT91_TWI_NACK		BIT(8)	/* Not Acknowledged */
> >>>>> @@ -571,7 +572,10 @@ static irqreturn_t atmel_twi_interrupt(int irq, void *dev_id)
> >>>>>   		at91_disable_twi_interrupts(dev);
> >>>>>   		complete(&dev->cmd_complete);
> >>>>>   	} else if (irqstatus & AT91_TWI_TXRDY) {
> >>>>> -		at91_twi_write_next_byte(dev);
> >>>>> +		if ((status & AT91_TWI_SVREAD) && (dev->buf_len == 0))
> >>>>> +			at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
> >>>>> +		else
> >>>>> +			at91_twi_write_next_byte(dev);
> >>>>>   	}
> >>>>>   
> >>>>>   	/* catch error flags */
> >>>>> -- 
> >>>>> 2.7.4
> >>>>>
> >>>>>
> >>>
> >>> _______________________________________________
> >>> linux-arm-kernel mailing list
> >>> linux-arm-kernel@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >>>
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > 
> > 
