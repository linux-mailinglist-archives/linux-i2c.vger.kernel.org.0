Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6977C199
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2019 14:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387780AbfGaMic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Jul 2019 08:38:32 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:3120 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbfGaMic (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Jul 2019 08:38:32 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: QtWDPdtYaxhPlK+Opso5NZdaxPCloJ5bhv4/nRfD59BzHpBI/L8U3pizQYqjByBR+cCEBWWUMJ
 Dyz8WFitZ+yqS+NMXwp2o6jHNPVgssTtdPsSQ+5HpiRcxJNzbCFQaKz1C5R4tG32qXb4Goe9NJ
 5cTNqpTRxqJoBnvRYC13UJULdIgjZpPm+MFjMIfGqIA+IE3jLzeILhLyUq1IkiyeF1FdcHDYTD
 9YnsWkU/Leaht9KruUJqNc+tvzy1FLnuJjYBKftybeHth1F4AIdh/Es8a43f6DniWZq4Kp9pxg
 O0k=
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; 
   d="scan'208";a="43450858"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jul 2019 05:38:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 31 Jul 2019 05:38:29 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 31 Jul 2019 05:38:29 -0700
Date:   Wed, 31 Jul 2019 14:37:35 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
CC:     <linux-i2c@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <raagjadav@gmail.com>
Subject: Re: [PATCH] i2c: at91: disable TXRDY interrupt after sending data
Message-ID: <20190731123734.4ixxlurouni6nopp@M43218.corp.atmel.com>
Mail-Followup-To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        raagjadav@gmail.com
References: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Jul 22, 2019 at 08:55:27PM +0200, Michał Mirosław wrote:
> 
> Driver was not disabling TXRDY interrupt after last TX byte.
> This caused interrupt storm until transfer timeouts for slow
> or broken device on the bus. The patch fixes the interrupt storm
> on my SAMA5D2-based board.
> 
> Cc: stable@vger.kernel.org # 5.2.x
> [v5.2 introduced file split; the patch should apply to i2c-at91.c before the split]
> Fixes: fac368a0404 ("i2c: at91: add new driver")
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> 

Sounds good to me as AT91_TWI_TXRDY is only used to send the next byte.

Raag, you added you in the copy list as it seems close to your issue. I am
really sorry, I didn't have time to go further with your issue. Is this
patch solves your issue?

Thanks for this patch.

Ludovic

> ---
>  drivers/i2c/busses/i2c-at91-master.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index e87232f2e708..a3fcc35ffd3b 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -122,9 +122,11 @@ static void at91_twi_write_next_byte(struct at91_twi_dev *dev)
>  	writeb_relaxed(*dev->buf, dev->base + AT91_TWI_THR);
>  
>  	/* send stop when last byte has been written */
> -	if (--dev->buf_len == 0)
> +	if (--dev->buf_len == 0) {
>  		if (!dev->use_alt_cmd)
>  			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_STOP);
> +		at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
> +	}
>  
>  	dev_dbg(dev->dev, "wrote 0x%x, to go %zu\n", *dev->buf, dev->buf_len);
>  
> @@ -542,9 +544,8 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
>  		} else {
>  			at91_twi_write_next_byte(dev);
>  			at91_twi_write(dev, AT91_TWI_IER,
> -				       AT91_TWI_TXCOMP |
> -				       AT91_TWI_NACK |
> -				       AT91_TWI_TXRDY);
> +				       AT91_TWI_TXCOMP | AT91_TWI_NACK |
> +				       (dev->buf_len ? AT91_TWI_TXRDY : 0));
>  		}
>  	}
>  
> -- 
> 2.20.1
> 
