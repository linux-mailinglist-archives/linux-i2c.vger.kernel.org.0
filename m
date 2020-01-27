Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27C6E14A03C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 09:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbgA0IzF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 03:55:05 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:3679 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgA0IzF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 03:55:05 -0500
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 9gnP4sLxVQkijU7l3eAY+o7jqwLPGVvdLkXP5qosgjXc7ZiqeS0VoHRCh2ow4tJXFZnogaIRm6
 k6io2LD4eNENufiS41Ic/sw78Cg3bcHEgrQGtI7cPISEXVIG9u2uzEfOV6n5FWiy+TlQd9DdcP
 QsDksiWE85vf7m1S2A6EV+vj2NOTMHf7X2lskHi9gXhCTz6pJOR6gVAW2yfojfwpIbNu+ljGBN
 +xQ1R9SZwAOmoV3glJALN7Ih9aQpZibCvv8wSU54MqQKLfRSuvb90O44czJLLk+Rv2Hp8HruoD
 4ew=
X-IronPort-AV: E=Sophos;i="5.70,369,1574146800"; 
   d="scan'208";a="177887"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2020 01:55:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Jan 2020 01:55:03 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 27 Jan 2020 01:55:03 -0700
Date:   Mon, 27 Jan 2020 09:54:38 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kamel.bouhara@bootlin.com>,
        <wsa@the-dreams.de>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 3/6] i2c: at91: Send bus clear command if SDA is down
Message-ID: <20200127085438.2jflamo2ar467rds@M43218.corp.atmel.com>
Mail-Followup-To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        robh@kernel.org, peda@axentia.se, linux@armlinux.org.uk
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
 <20200115115422.17097-4-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200115115422.17097-4-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 15, 2020 at 01:54:19PM +0200, Codrin Ciubotariu wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> After a transfer timeout, some faulty I2C slave devices might hold down
> the SDA pin. We can generate a bus clear command, hoping that the slave
> might release the pins.
> If the CLEAR command is not supported, we will use gpio recovery, if
> available, to reset the bus.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

I still have issue to apply it even if the context seems correct.
Sometimes git am is picky... so

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
> 
> Changes in v3:
>  - rebased on top of i2c/for-next;
>   - remove unnecessary initializations with false;
>  - replaced SCL with SDA in title and commit message;
>  - updated commit message;
> 
> Changes in v2:
>  - use CLEAR command only if SDA is down; update patch subject to
>    reflect this;
>  - CLEAR command is no longer used for sama5d2, only sam9x60;
> 
>  drivers/i2c/busses/i2c-at91-core.c   |  2 ++
>  drivers/i2c/busses/i2c-at91-master.c | 32 +++++++++++++++++++++++-----
>  drivers/i2c/busses/i2c-at91.h        |  7 +++++-
>  3 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index 3da1a8acecb5..e14edd236108 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -131,6 +131,7 @@ static struct at91_twi_pdata sama5d2_config = {
>         .has_dig_filtr = true,
>         .has_adv_dig_filtr = true,
>         .has_ana_filtr = true,
> +       .has_clear_cmd = false, /* due to errata, CLEAR cmd is not working */
>  };
> 
>  static struct at91_twi_pdata sam9x60_config = {
> @@ -142,6 +143,7 @@ static struct at91_twi_pdata sam9x60_config = {
>         .has_dig_filtr = true,
>         .has_adv_dig_filtr = true,
>         .has_ana_filtr = true,
> +       .has_clear_cmd = true,
>  };
> 
>  static const struct of_device_id atmel_twi_dt_ids[] = {
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index 0aba51a7df32..bcc05a8fe826 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -480,7 +480,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
>         unsigned long time_left;
>         bool has_unre_flag = dev->pdata->has_unre_flag;
>         bool has_alt_cmd = dev->pdata->has_alt_cmd;
> -       struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> +       bool has_clear_cmd = dev->pdata->has_clear_cmd;
> 
>         /*
>          * WARNING: the TXCOMP bit in the Status Register is NOT a clear on
> @@ -641,10 +641,32 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
>                                AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
>         }
> 
> -       if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
> -               dev_dbg(dev->dev,
> -                       "SDA is down; clear bus using gpio\n");
> -               i2c_recover_bus(&dev->adapter);
> +       /*
> +        * some faulty I2C slave devices might hold SDA down;
> +        * we can send a bus clear command, hoping that the pins will be
> +        * released
> +        */
> +       if (has_clear_cmd) {
> +               if (!(dev->transfer_status & AT91_TWI_SDA)) {
> +                       dev_dbg(dev->dev,
> +                               "SDA is down; sending bus clear command\n");
> +                       if (dev->use_alt_cmd) {
> +                               unsigned int acr;
> +
> +                               acr = at91_twi_read(dev, AT91_TWI_ACR);
> +                               acr &= ~AT91_TWI_ACR_DATAL_MASK;
> +                               at91_twi_write(dev, AT91_TWI_ACR, acr);
> +                       }
> +                       at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_CLEAR);
> +               }
> +       } else {
> +               struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> +
> +               if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
> +                       dev_dbg(dev->dev,
> +                               "SDA is down; clear bus using gpio\n");
> +                       i2c_recover_bus(&dev->adapter);
> +               }
>         }
> 
>         return ret;
> diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
> index f57a6cab96b4..7e7b4955ca7f 100644
> --- a/drivers/i2c/busses/i2c-at91.h
> +++ b/drivers/i2c/busses/i2c-at91.h
> @@ -36,6 +36,7 @@
>  #define        AT91_TWI_SVDIS          BIT(5)  /* Slave Transfer Disable */
>  #define        AT91_TWI_QUICK          BIT(6)  /* SMBus quick command */
>  #define        AT91_TWI_SWRST          BIT(7)  /* Software Reset */
> +#define        AT91_TWI_CLEAR          BIT(15) /* Bus clear command */
>  #define        AT91_TWI_ACMEN          BIT(16) /* Alternative Command Mode Enable */
>  #define        AT91_TWI_ACMDIS         BIT(17) /* Alternative Command Mode Disable */
>  #define        AT91_TWI_THRCLR         BIT(24) /* Transmit Holding Register Clear */
> @@ -69,6 +70,8 @@
>  #define        AT91_TWI_NACK           BIT(8)  /* Not Acknowledged */
>  #define        AT91_TWI_EOSACC         BIT(11) /* End Of Slave Access */
>  #define        AT91_TWI_LOCK           BIT(23) /* TWI Lock due to Frame Errors */
> +#define        AT91_TWI_SCL            BIT(24) /* TWI SCL status */
> +#define        AT91_TWI_SDA            BIT(25) /* TWI SDA status */
> 
>  #define        AT91_TWI_INT_MASK \
>         (AT91_TWI_TXCOMP | AT91_TWI_RXRDY | AT91_TWI_TXRDY | AT91_TWI_NACK \
> @@ -81,7 +84,8 @@
>  #define        AT91_TWI_THR            0x0034  /* Transmit Holding Register */
> 
>  #define        AT91_TWI_ACR            0x0040  /* Alternative Command Register */
> -#define        AT91_TWI_ACR_DATAL(len) ((len) & 0xff)
> +#define        AT91_TWI_ACR_DATAL_MASK GENMASK(15, 0)
> +#define        AT91_TWI_ACR_DATAL(len) ((len) & AT91_TWI_ACR_DATAL_MASK)
>  #define        AT91_TWI_ACR_DIR        BIT(8)
> 
>  #define AT91_TWI_FILTR         0x0044
> @@ -118,6 +122,7 @@ struct at91_twi_pdata {
>         bool has_dig_filtr;
>         bool has_adv_dig_filtr;
>         bool has_ana_filtr;
> +       bool has_clear_cmd;
>         struct at_dma_slave dma_slave;
>  };
> 
> --
> 2.20.1
> 
