Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80943ECCE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 00:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbfD2Wdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Apr 2019 18:33:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41057 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729481AbfD2Wdk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Apr 2019 18:33:40 -0400
Received: by mail-pg1-f194.google.com with SMTP id f6so5845501pgs.8;
        Mon, 29 Apr 2019 15:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hL5lSSld0IWgxzNWY+bqrGKso5WccHGfqU5/pwos1Ts=;
        b=sAzxFF00P47bPDHQeN4SDrTy3myFJgatoUS4PlumX1u/gcawnsFZRjiPNJxdGf+BPL
         tA811xDyDIHr+uixedWIjFoqh/Nfl/aI3aIp9RLM1zrNF4cWZuEduJ6pyiIR2OYouS0Z
         KVPc0IBWNZzUfjP4PAp3OuH5vGEPGWIAMy9WTlU+LLVuAzFQBPn9XYj79sJxMc/4E6xs
         j31m7v/bY6g9fQLCUirgdolBreFo5oXqL2ocBLcXSLCmoDZY2YLP3X0Dv4xqdhQY+D+T
         F9OY5k+zNbpycd9JCcBcyfUAA4tsPQT/5lzilccYpWFSS8PEjq3qmDabdtWtudoDF1yA
         s4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hL5lSSld0IWgxzNWY+bqrGKso5WccHGfqU5/pwos1Ts=;
        b=J+yEtVuz46KzyR+uU87KmdwpcWly+skcCe8ApDHf2ePzJZkX1syTA59awBpXXVlRBB
         KAH8twsLZ+hoteIzTRP3plyXqGHE+oC07PL1Hkj+xFwuD1qXUnOt4ARfc+GNTWPJu50H
         bp1sh4SHRl4HlgpKX41gIs2FRp6AtHqk6E4iTHlwmOhVgbXqeu3r4isOGIpw9nHcUXz9
         RkmhroFjjXCuAifoZJ2dH5ZwoYYdYtzns2NuO8NHPpx3bA8hH5EBUN5qHmO+7vRWsfjL
         5WUGT2d6ZAbsVfZEOX0bsfSwDzxYpLMbapdcAVHBnx3DxHTSZlF8yD3yJz2yNGKR7q1d
         UvIw==
X-Gm-Message-State: APjAAAUYrpe0fXRHrP9Ln/0K0+vXTZgIp9xe+7/070r7LoOclquMRGVZ
        IiCyG7e+n3iX5liH5kaUiOY=
X-Google-Smtp-Source: APXvYqyr8866HGbkrmQwWIE2ZBU4+4HYiqTbjqjMLHtUz0q7+GMQWueEYFZvyprsEcTKlBuS17IAUg==
X-Received: by 2002:a63:c702:: with SMTP id n2mr23366927pgg.255.1556577219738;
        Mon, 29 Apr 2019 15:33:39 -0700 (PDT)
Received: from pc ([219.91.196.46])
        by smtp.gmail.com with ESMTPSA id d10sm10194424pgi.6.2019.04.29.15.33.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 15:33:38 -0700 (PDT)
Date:   Tue, 30 Apr 2019 04:03:32 +0530
From:   Raag Jadav <raagjadav@gmail.com>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-i2c@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: at91: handle TXRDY interrupt spam
Message-ID: <20190429223332.GA3908@pc>
References: <1556005008-6318-1-git-send-email-raagjadav@gmail.com>
 <20190429090005.f6ydghzu5n5yruav@M43218.corp.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429090005.f6ydghzu5n5yruav@M43218.corp.atmel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 29, 2019 at 11:00:05AM +0200, Ludovic Desroches wrote:
> Hello Raag,
> 
> On Tue, Apr 23, 2019 at 01:06:48PM +0530, Raag Jadav wrote:
> > External E-Mail
> > 
> > 
> > Performing i2c write operation while SDA or SCL line is held
> > or grounded by slave device, we go into infinite at91_twi_write_next_byte
> > loop with TXRDY interrupt spam.
> 
> Sorry but I am not sure to have the full picture, the controller is in
> slave or master mode?
> 
> SVREAD is only used in slave mode. When SVREAD is set, it means that a read
> access is performed and your issue concerns the write operation.
> 
> Regards
> 
> Ludovic

Yes, even though the datasheet suggests that SVREAD is irrelevant in master mode,
TXRDY and SVREAD are the only ones being set in status register upon reproducing the issue.
Couldn't think of a better way to handle such strange behaviour.
Any suggestions would be appreciated.

Cheers,
Raag

> 
> > 
> > Signed-off-by: Raag Jadav <raagjadav@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-at91.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-at91.c b/drivers/i2c/busses/i2c-at91.c
> > index 3f3e8b3..b2f5fdb 100644
> > --- a/drivers/i2c/busses/i2c-at91.c
> > +++ b/drivers/i2c/busses/i2c-at91.c
> > @@ -72,6 +72,7 @@
> >  #define	AT91_TWI_TXCOMP		BIT(0)	/* Transmission Complete */
> >  #define	AT91_TWI_RXRDY		BIT(1)	/* Receive Holding Register Ready */
> >  #define	AT91_TWI_TXRDY		BIT(2)	/* Transmit Holding Register Ready */
> > +#define	AT91_TWI_SVREAD		BIT(3)	/* Slave Read */
> >  #define	AT91_TWI_OVRE		BIT(6)	/* Overrun Error */
> >  #define	AT91_TWI_UNRE		BIT(7)	/* Underrun Error */
> >  #define	AT91_TWI_NACK		BIT(8)	/* Not Acknowledged */
> > @@ -571,7 +572,10 @@ static irqreturn_t atmel_twi_interrupt(int irq, void *dev_id)
> >  		at91_disable_twi_interrupts(dev);
> >  		complete(&dev->cmd_complete);
> >  	} else if (irqstatus & AT91_TWI_TXRDY) {
> > -		at91_twi_write_next_byte(dev);
> > +		if ((status & AT91_TWI_SVREAD) && (dev->buf_len == 0))
> > +			at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
> > +		else
> > +			at91_twi_write_next_byte(dev);
> >  	}
> >  
> >  	/* catch error flags */
> > -- 
> > 2.7.4
> > 
> > 
