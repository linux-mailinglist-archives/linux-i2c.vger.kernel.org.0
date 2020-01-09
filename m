Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA601353D9
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 08:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgAIHsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 02:48:02 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:21655 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgAIHsC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 02:48:02 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: bWlFSeDW8nza6EHS6ZKDGqzEBeVWt8PfOpZ1P0KFfyVmA2I+3DlTM2CZwCwTMxL8gXoF+DytV4
 PZsEESUhROUp5fw3cK1C4QkQ8qUnOxmCOf4h1FTGWolpdMrfvtAQTDvDK5sm38zb2uloV3qe2E
 WxqeXswRMIp+O/MIT5pkCRReJu3B/fdNJ83ljMm8BcDxaGa2F3pOjCrnKVYHDxrPceimdrf2V/
 X1RmD8scsFtok4SWaCY5KPdBLL9119KJEyiUYHGCYjKsWqM8EOpt9835xfd7UMRLHejY0YyhW1
 jzk=
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; 
   d="scan'208";a="64145399"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jan 2020 00:48:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 9 Jan 2020 00:47:59 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 9 Jan 2020 00:47:58 -0700
Date:   Thu, 9 Jan 2020 08:47:29 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kamel.bouhara@bootlin.com" <kamel.bouhara@bootlin.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "Nicolas Ferre - M43238" <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 3/6] i2c: at91: Send bus clear command if SCL is down
Message-ID: <20200109074729.zare4va5ugbq62f3@M43218.corp.atmel.com>
Mail-Followup-To: Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kamel.bouhara@bootlin.com" <kamel.bouhara@bootlin.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh@kernel.org" <robh@kernel.org>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
 <20200103094821.13185-4-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200103094821.13185-4-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 03, 2020 at 09:49:07AM +0000, Codrin Ciubotariu - M19940 wrote:
> After a transfer timeout, some faulty I2C slave devices might hold down
> the SCL pin. We can generate a bus clear command, hoping that the slave
> might release the pins.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

This patch may conflict with another one removing the explicit set to
false.

> ---
> 
> Changes in v2:
>  - use CLEAR command only if SDA is down; update patch subject to
>    reflect this;
>  - CLEAR command is no longer used for sama5d2, only sam9x60;
> 
>  drivers/i2c/busses/i2c-at91-core.c   |  9 ++++++++
>  drivers/i2c/busses/i2c-at91-master.c | 32 +++++++++++++++++++++++-----
>  drivers/i2c/busses/i2c-at91.h        |  7 +++++-
>  3 files changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index e13af4874976..128eafc05adb 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -71,6 +71,7 @@ static struct at91_twi_pdata at91rm9200_config = {
>  	.has_dig_filtr = false,
>  	.has_adv_dig_filtr = false,
>  	.has_ana_filtr = false,
> +	.has_clear_cmd = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9261_config = {
> @@ -82,6 +83,7 @@ static struct at91_twi_pdata at91sam9261_config = {
>  	.has_dig_filtr = false,
>  	.has_adv_dig_filtr = false,
>  	.has_ana_filtr = false,
> +	.has_clear_cmd = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9260_config = {
> @@ -93,6 +95,7 @@ static struct at91_twi_pdata at91sam9260_config = {
>  	.has_dig_filtr = false,
>  	.has_adv_dig_filtr = false,
>  	.has_ana_filtr = false,
> +	.has_clear_cmd = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9g20_config = {
> @@ -104,6 +107,7 @@ static struct at91_twi_pdata at91sam9g20_config = {
>  	.has_dig_filtr = false,
>  	.has_adv_dig_filtr = false,
>  	.has_ana_filtr = false,
> +	.has_clear_cmd = false,
>  };
>  
>  static struct at91_twi_pdata at91sam9g10_config = {
> @@ -115,6 +119,7 @@ static struct at91_twi_pdata at91sam9g10_config = {
>  	.has_dig_filtr = false,
>  	.has_adv_dig_filtr = false,
>  	.has_ana_filtr = false,
> +	.has_clear_cmd = false,
>  };
>  
>  static const struct platform_device_id at91_twi_devtypes[] = {
> @@ -148,6 +153,7 @@ static struct at91_twi_pdata at91sam9x5_config = {
>  	.has_dig_filtr = false,
>  	.has_adv_dig_filtr = false,
>  	.has_ana_filtr = false,
> +	.has_clear_cmd = false,
>  };
>  
>  static struct at91_twi_pdata sama5d4_config = {
> @@ -159,6 +165,7 @@ static struct at91_twi_pdata sama5d4_config = {
>  	.has_dig_filtr = true,
>  	.has_adv_dig_filtr = false,
>  	.has_ana_filtr = false,
> +	.has_clear_cmd = false,
>  };
>  
>  static struct at91_twi_pdata sama5d2_config = {
> @@ -170,6 +177,7 @@ static struct at91_twi_pdata sama5d2_config = {
>  	.has_dig_filtr = true,
>  	.has_adv_dig_filtr = true,
>  	.has_ana_filtr = true,
> +	.has_clear_cmd = false,	/* due to errata, CLEAR cmd is not working */

In this case it's probably worth keeping it.

Ludovic

>  };
>  
>  static struct at91_twi_pdata sam9x60_config = {
> @@ -181,6 +189,7 @@ static struct at91_twi_pdata sam9x60_config = {
>  	.has_dig_filtr = true,
>  	.has_adv_dig_filtr = true,
>  	.has_ana_filtr = true,
> +	.has_clear_cmd = true,
>  };
>  
>  static const struct of_device_id atmel_twi_dt_ids[] = {
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index c55e8ff35201..8c4f20317847 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -480,7 +480,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
>  	unsigned long time_left;
>  	bool has_unre_flag = dev->pdata->has_unre_flag;
>  	bool has_alt_cmd = dev->pdata->has_alt_cmd;
> -	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> +	bool has_clear_cmd = dev->pdata->has_clear_cmd;
>  
>  	/*
>  	 * WARNING: the TXCOMP bit in the Status Register is NOT a clear on
> @@ -641,10 +641,32 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
>  			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
>  	}
>  
> -	if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
> -		dev_dbg(dev->dev,
> -			"SDA is down; clear bus using gpio\n");
> -		i2c_recover_bus(&dev->adapter);
> +	/*
> +	 * some faulty I2C slave devices might hold SDA down;
> +	 * we can send a bus clear command, hoping that the pins will be
> +	 * released
> +	 */
> +	if (has_clear_cmd) {
> +		if (!(dev->transfer_status & AT91_TWI_SDA)) {
> +			dev_dbg(dev->dev,
> +				"SDA is down; sending bus clear command\n");
> +			if (dev->use_alt_cmd) {
> +				unsigned int acr;
> +
> +				acr = at91_twi_read(dev, AT91_TWI_ACR);
> +				acr &= ~AT91_TWI_ACR_DATAL_MASK;
> +				at91_twi_write(dev, AT91_TWI_ACR, acr);
> +			}
> +			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_CLEAR);
> +		}
> +	} else {
> +		struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> +
> +		if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
> +			dev_dbg(dev->dev,
> +				"SDA is down; clear bus using gpio\n");
> +			i2c_recover_bus(&dev->adapter);
> +		}
>  	}
>  
>  	return ret;
> diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
> index eb335b71e775..80f77d523346 100644
> --- a/drivers/i2c/busses/i2c-at91.h
> +++ b/drivers/i2c/busses/i2c-at91.h
> @@ -36,6 +36,7 @@
>  #define	AT91_TWI_SVDIS		BIT(5)	/* Slave Transfer Disable */
>  #define	AT91_TWI_QUICK		BIT(6)	/* SMBus quick command */
>  #define	AT91_TWI_SWRST		BIT(7)	/* Software Reset */
> +#define	AT91_TWI_CLEAR		BIT(15) /* Bus clear command */
>  #define	AT91_TWI_ACMEN		BIT(16) /* Alternative Command Mode Enable */
>  #define	AT91_TWI_ACMDIS		BIT(17) /* Alternative Command Mode Disable */
>  #define	AT91_TWI_THRCLR		BIT(24) /* Transmit Holding Register Clear */
> @@ -69,6 +70,8 @@
>  #define	AT91_TWI_NACK		BIT(8)	/* Not Acknowledged */
>  #define	AT91_TWI_EOSACC		BIT(11)	/* End Of Slave Access */
>  #define	AT91_TWI_LOCK		BIT(23) /* TWI Lock due to Frame Errors */
> +#define	AT91_TWI_SCL		BIT(24) /* TWI SCL status */
> +#define	AT91_TWI_SDA		BIT(25) /* TWI SDA status */
>  
>  #define	AT91_TWI_INT_MASK \
>  	(AT91_TWI_TXCOMP | AT91_TWI_RXRDY | AT91_TWI_TXRDY | AT91_TWI_NACK \
> @@ -81,7 +84,8 @@
>  #define	AT91_TWI_THR		0x0034	/* Transmit Holding Register */
>  
>  #define	AT91_TWI_ACR		0x0040	/* Alternative Command Register */
> -#define	AT91_TWI_ACR_DATAL(len)	((len) & 0xff)
> +#define	AT91_TWI_ACR_DATAL_MASK	GENMASK(15, 0)
> +#define	AT91_TWI_ACR_DATAL(len)	((len) & AT91_TWI_ACR_DATAL_MASK)
>  #define	AT91_TWI_ACR_DIR	BIT(8)
>  
>  #define AT91_TWI_FILTR		0x0044
> @@ -118,6 +122,7 @@ struct at91_twi_pdata {
>  	bool has_dig_filtr;
>  	bool has_adv_dig_filtr;
>  	bool has_ana_filtr;
> +	bool has_clear_cmd;
>  	struct at_dma_slave dma_slave;
>  };
>  
> -- 
> 2.20.1
