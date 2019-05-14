Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C211C565
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2019 10:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfENIww (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 May 2019 04:52:52 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:49670 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENIwv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 May 2019 04:52:51 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,468,1549954800"; 
   d="scan'208";a="31386410"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 14 May 2019 01:52:45 -0700
Received: from localhost (10.10.76.4) by chn-sv-exch02.mchp-main.com
 (10.10.76.38) with Microsoft SMTP Server id 14.3.352.0; Tue, 14 May 2019
 01:52:42 -0700
Date:   Tue, 14 May 2019 10:52:09 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Eugen Hristev - M18282 <Eugen.Hristev@microchip.com>
CC:     Raag Jadav <raagjadav@gmail.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: at91: handle TXRDY interrupt spam
Message-ID: <20190514085209.pud5sqrxn2zjrqix@M43218.corp.atmel.com>
Mail-Followup-To: Eugen Hristev - M18282 <Eugen.Hristev@microchip.com>,
        Raag Jadav <raagjadav@gmail.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <1556005008-6318-1-git-send-email-raagjadav@gmail.com>
 <20190429090005.f6ydghzu5n5yruav@M43218.corp.atmel.com>
 <20190429223332.GA3908@pc>
 <20190502140116.rim72idpgvq4h4vc@M43218.corp.atmel.com>
 <20190503235851.GA4242@pc>
 <408ff580-3633-f510-4223-50064f93024a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <408ff580-3633-f510-4223-50064f93024a@microchip.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 06, 2019 at 10:19:01AM +0200, Eugen Hristev - M18282 wrote:
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

Good to know.

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

You're right with a faulty hardware it can lead to disaster. As you
mentionned issues with this patch, the end of loop condition is not good
as it can stay true indefinitely.

For sure a timeout is a solution but its value can be controversial.
Maybe there is a better combination of flags to check in the status
register. I'll see this point too.

Regards

Ludovic

> 
> For me, reverting this patch solves hanging issues.
> 
> Hope this helps,
> 
> Eugen
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
