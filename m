Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6542E7EC8E
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 08:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfHBGXP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 02:23:15 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:62006 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfHBGXP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Aug 2019 02:23:15 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: UX4exTg3P9WGaryRCrTXPDZ73JnibPWU+HAnzbVSnatIlmpwTXWkNbqRAbyr3mF2lSU9N29hND
 PLelQrkQFWv/nSwLFoY7C+wFigTQYlLk9G4AIqErwO9+L7rB4Qp3vu4/DJzLJtGEzcc2/vFgBL
 igNSSnpvH4oMiLB4quIsUAMV6rPffLV/+scmevJOWl0seGNwog3OL2Vpr9fmw4vzMVUowT7kJF
 1KhE2lrzIO3VrHnTdCKreDYabD2eW/GoC746xi8XtM+/QdN6DNwMhcA8WFvjm4PxcxyDUjHKpp
 IfU=
X-IronPort-AV: E=Sophos;i="5.64,337,1559545200"; 
   d="scan'208";a="42927021"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Aug 2019 23:23:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Aug 2019 23:23:14 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 1 Aug 2019 23:23:14 -0700
Date:   Fri, 2 Aug 2019 08:22:16 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Raag Jadav <raagjadav@gmail.com>
CC:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        <linux-i2c@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i2c: at91: disable TXRDY interrupt after sending data
Message-ID: <20190802062216.aimo7sygmy3vfega@M43218.corp.atmel.com>
Mail-Followup-To: Raag Jadav <raagjadav@gmail.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
 <20190731123734.4ixxlurouni6nopp@M43218.corp.atmel.com>
 <20190801170552.GA3873@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190801170552.GA3873@pc>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 01, 2019 at 10:35:52PM +0530, Raag Jadav wrote:
> External E-Mail
> 
> 
> On Wed, Jul 31, 2019 at 02:37:35PM +0200, Ludovic Desroches wrote:
> > Hi,
> > 
> > On Mon, Jul 22, 2019 at 08:55:27PM +0200, Michał Mirosław wrote:
> > > 
> > > Driver was not disabling TXRDY interrupt after last TX byte.
> > > This caused interrupt storm until transfer timeouts for slow
> > > or broken device on the bus. The patch fixes the interrupt storm
> > > on my SAMA5D2-based board.
> > > 
> > > Cc: stable@vger.kernel.org # 5.2.x
> > > [v5.2 introduced file split; the patch should apply to i2c-at91.c before the split]
> > > Fixes: fac368a0404 ("i2c: at91: add new driver")
> > > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> 
> 
> Tested-by: Raag Jadav <raagjadav@gmail.com>
> 
> > 
> > Sounds good to me as AT91_TWI_TXRDY is only used to send the next byte.
> > 
> > Raag, you added you in the copy list as it seems close to your issue. I am
> > really sorry, I didn't have time to go further with your issue. Is this
> > patch solves your issue?
> 
> Yes, although I had a v2 ready to send out with similar changes,
> this patch does the job as well.

Great, thanks for the test Raag.

Regards

Ludovic

> 
> Cheers,
> Raag
> 
> > 
> > Thanks for this patch.
> > 
> > Ludovic
> > 
> > > ---
> > >  drivers/i2c/busses/i2c-at91-master.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> > > index e87232f2e708..a3fcc35ffd3b 100644
> > > --- a/drivers/i2c/busses/i2c-at91-master.c
> > > +++ b/drivers/i2c/busses/i2c-at91-master.c
> > > @@ -122,9 +122,11 @@ static void at91_twi_write_next_byte(struct at91_twi_dev *dev)
> > >  	writeb_relaxed(*dev->buf, dev->base + AT91_TWI_THR);
> > >  
> > >  	/* send stop when last byte has been written */
> > > -	if (--dev->buf_len == 0)
> > > +	if (--dev->buf_len == 0) {
> > >  		if (!dev->use_alt_cmd)
> > >  			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_STOP);
> > > +		at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
> > > +	}
> > >  
> > >  	dev_dbg(dev->dev, "wrote 0x%x, to go %zu\n", *dev->buf, dev->buf_len);
> > >  
> > > @@ -542,9 +544,8 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
> > >  		} else {
> > >  			at91_twi_write_next_byte(dev);
> > >  			at91_twi_write(dev, AT91_TWI_IER,
> > > -				       AT91_TWI_TXCOMP |
> > > -				       AT91_TWI_NACK |
> > > -				       AT91_TWI_TXRDY);
> > > +				       AT91_TWI_TXCOMP | AT91_TWI_NACK |
> > > +				       (dev->buf_len ? AT91_TWI_TXRDY : 0));
> > >  		}
> > >  	}
> > >  
> > > -- 
> > > 2.20.1
> > > 
