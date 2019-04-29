Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74690DE8E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2019 11:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbfD2JAl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Apr 2019 05:00:41 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:30235 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbfD2JAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Apr 2019 05:00:41 -0400
X-IronPort-AV: E=Sophos;i="5.60,409,1549954800"; 
   d="scan'208";a="30867583"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 29 Apr 2019 02:00:40 -0700
Received: from localhost (10.10.76.4) by chn-sv-exch02.mchp-main.com
 (10.10.76.38) with Microsoft SMTP Server id 14.3.352.0; Mon, 29 Apr 2019
 02:00:39 -0700
Date:   Mon, 29 Apr 2019 11:00:05 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Raag Jadav <raagjadav@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: at91: handle TXRDY interrupt spam
Message-ID: <20190429090005.f6ydghzu5n5yruav@M43218.corp.atmel.com>
Mail-Followup-To: Raag Jadav <raagjadav@gmail.com>,
        linux-i2c@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <1556005008-6318-1-git-send-email-raagjadav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1556005008-6318-1-git-send-email-raagjadav@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Raag,

On Tue, Apr 23, 2019 at 01:06:48PM +0530, Raag Jadav wrote:
> External E-Mail
> 
> 
> Performing i2c write operation while SDA or SCL line is held
> or grounded by slave device, we go into infinite at91_twi_write_next_byte
> loop with TXRDY interrupt spam.

Sorry but I am not sure to have the full picture, the controller is in
slave or master mode?

SVREAD is only used in slave mode. When SVREAD is set, it means that a read
access is performed and your issue concerns the write operation.

Regards

Ludovic

> 
> Signed-off-by: Raag Jadav <raagjadav@gmail.com>
> ---
>  drivers/i2c/busses/i2c-at91.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91.c b/drivers/i2c/busses/i2c-at91.c
> index 3f3e8b3..b2f5fdb 100644
> --- a/drivers/i2c/busses/i2c-at91.c
> +++ b/drivers/i2c/busses/i2c-at91.c
> @@ -72,6 +72,7 @@
>  #define	AT91_TWI_TXCOMP		BIT(0)	/* Transmission Complete */
>  #define	AT91_TWI_RXRDY		BIT(1)	/* Receive Holding Register Ready */
>  #define	AT91_TWI_TXRDY		BIT(2)	/* Transmit Holding Register Ready */
> +#define	AT91_TWI_SVREAD		BIT(3)	/* Slave Read */
>  #define	AT91_TWI_OVRE		BIT(6)	/* Overrun Error */
>  #define	AT91_TWI_UNRE		BIT(7)	/* Underrun Error */
>  #define	AT91_TWI_NACK		BIT(8)	/* Not Acknowledged */
> @@ -571,7 +572,10 @@ static irqreturn_t atmel_twi_interrupt(int irq, void *dev_id)
>  		at91_disable_twi_interrupts(dev);
>  		complete(&dev->cmd_complete);
>  	} else if (irqstatus & AT91_TWI_TXRDY) {
> -		at91_twi_write_next_byte(dev);
> +		if ((status & AT91_TWI_SVREAD) && (dev->buf_len == 0))
> +			at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
> +		else
> +			at91_twi_write_next_byte(dev);
>  	}
>  
>  	/* catch error flags */
> -- 
> 2.7.4
> 
> 
