Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82395B7D85
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2019 17:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390900AbfISPGV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Sep 2019 11:06:21 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55433 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389179AbfISPGV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Sep 2019 11:06:21 -0400
X-Originating-IP: 86.207.98.53
Received: from [192.168.10.51] (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BED25C0002;
        Thu, 19 Sep 2019 15:06:18 +0000 (UTC)
Subject: Re: [PATCH] i2c: at91: Send bus clear command if SCL or SDA is down
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, wsa@the-dreams.de
References: <20190911095854.5141-1-codrin.ciubotariu@microchip.com>
From:   kbouhara <kamel.bouhara@bootlin.com>
Message-ID: <1ed845e5-3835-f1aa-099a-b67c3bc16076@bootlin.com>
Date:   Thu, 19 Sep 2019 17:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911095854.5141-1-codrin.ciubotariu@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/11/19 11:58 AM, Codrin Ciubotariu wrote:
> After a transfer timeout, some faulty I2C slave devices might hold down
> the SCL or the SDA pins. We can generate a bus clear command, hoping that
> the slave might release the pins.
>
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>   drivers/i2c/busses/i2c-at91-master.c | 20 ++++++++++++++++++++
>   drivers/i2c/busses/i2c-at91.h        |  6 +++++-
>   2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index a3fcc35ffd3b..5f544a16db96 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -599,6 +599,26 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
>   		at91_twi_write(dev, AT91_TWI_CR,
>   			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
>   	}
> +
> +	/*
> +	 * After timeout, some faulty I2C slave devices might hold SCL/SDA down;
> +	 * we can send a bus clear command, hoping that the pins will be
> +	 * released
> +	 */
> +	if (!(dev->transfer_status & AT91_TWI_SDA) ||
> +	    !(dev->transfer_status & AT91_TWI_SCL)) {
> +		dev_dbg(dev->dev,
> +			"SDA/SCL are down; sending bus clear command\n");
> +		if (dev->use_alt_cmd) {
> +			unsigned int acr;
> +
> +			acr = at91_twi_read(dev, AT91_TWI_ACR);
> +			acr &= ~AT91_TWI_ACR_DATAL_MASK;
> +			at91_twi_write(dev, AT91_TWI_ACR, acr);
> +		}
> +		at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_CLEAR);

This bit is not documented on SoCs before SAMA5D2/D4, this write 
shouldn't be done unconditionally.


-- 
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

