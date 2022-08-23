Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F12659E991
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 19:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbiHWR2u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 13:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbiHWR0x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 13:26:53 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C850B7E02F;
        Tue, 23 Aug 2022 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661267107; x=1692803107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rF5eoaSIGYmn4QFAPCwYIkB4658jTD+/02hldzxJt6Y=;
  b=ni/JD5MZoJjObhdtXr/d4Bx7kO9WxhX2APqfpoNT5P1zb/48ssg0QofT
   9vFGdzqx2mxLHSDImSbcO/0CW+QcDJ8zlms7C1fztR3cUtaIP+BU3T/o2
   dwx/OtSjEPVXdaEOgO4ZW4h93gNqleOWuyw7vEbbKINGdf1qtDT6idT0m
   hsUF4s+iUZZ/gscE8UG88DoYWCWsDmBWBtEElipnYbQ0mioxSJ1Hh93RK
   gZtGzaElGyW1ehrJJ0scxKjonAt6CNiipb94dNre+N8l7K2+NrbO+bBeD
   2l0GE2D/dwEJzwVun021CsEHZC9br/817coFu7xS/jAinSjDjTJTRZBGY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="292457136"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="292457136"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 08:05:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="751714934"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 08:05:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oQVSe-002UKx-28;
        Tue, 23 Aug 2022 18:05:00 +0300
Date:   Tue, 23 Aug 2022 18:05:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, krzk@kernel.org, jarkko.nikula@linux.intel.com,
        robh@kernel.org, semen.protsenko@linaro.org, sven@svenpeter.dev,
        jsd@semihalf.com, rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 23, 2022 at 08:26:03PM +0530, Tharun Kumar P wrote:
> Microchip PCI1XXXX is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C endpoint
> of the switch.

...

> @@ -1290,6 +1290,16 @@ config I2C_VIPERBOARD
>  	  River Tech's viperboard.h for detailed meaning
>  	  of the module parameters.
>  
> +config I2C_PCI1XXXX

Looks unsorted.

> +	tristate "PCI1XXXX I2C Host Adapter support"
> +	depends on PCI
> +	help
> +	  Say yes here to enable the I2C Host adapter support for the PCI1xxxx card
> +	  This is a PCI to I2C adapter
> +
> +	  This driver can be built as a module. If so, the module will be
> +	  called as i2c-mchp-pci1xxxx

English grammar and punctuation while keeping lines shorter (~76) please.

...

>  obj-$(CONFIG_I2C_VIPERBOARD)	+= i2c-viperboard.o
> +obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o

Why unsorted?

...

> + * Author: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
> + *         Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>

Single or many?

...

> +/*SMB register space*/

Style.

...

> +#define SMB_CORE_CTRL_ESO	0x40
> +#define SMB_CORE_CTRL_FW_ACK	0x10

Are they bits or numbers?

...

> +#define SMB_CORE_CMD_READM		0x10
> +#define SMB_CORE_CMD_STOP		0x04
> +#define SMB_CORE_CMD_START		0x01

Ditto.

...

> +#define SMB_CORE_CMD_M_PROCEED	0x02
> +#define SMB_CORE_CMD_M_RUN		0x01

Ditto.

...

> +#define SR_HOLD_TIME_100KHZ		0x85
> +#define SR_HOLD_TIME_400KHZ		0x14
> +#define SR_HOLD_TIME_1000KHZ	0x0B

These has to be decimal, and why the ACPI / DT does not provide them?

Also, do they have units or are they proportional coefficients?

...

> +#define COMPLETION_MDONE	0x40
> +#define COMPLETION_IDLE		0x20
> +#define COMPLETION_MNAKX	0x01

Bits? Same Q for the rest similar stuff.

...

> +#define SMB_IDLE_SCALING_100KHZ		0x03E803C9
> +#define SMB_IDLE_SCALING_400KHZ		0x01F4009D
> +#define SMB_IDLE_SCALING_1000KHZ	0x01F4009D

Shouldn't these magics be decimals?
Ditto for the rest similar stuff.

...

> +#define I2C_DIR_WRITE		0
> +#define I2C_DIR_READ		1

Namespace collision. Doesn't I²C core provide these?

...

> +#define PCI1XXXX_I2C_TIMEOUT	1000

Units? Same to the rest similar cases.

...

> +#define SMBUS_PERI_LOCK		BIT(3)

BIT() out of a sudden. See above.

...

> +/*
> + * struct pci1xxxx_i2c - private structure for the I2C controller

> + *

Redundant blank line.

> + * @adap:	I2C adapter instance
> + * @dev:	pointer to device struct
> + * @i2c_base:	pci base address of the I2C ctrler
> + * @i2c_xfer_done: used for synchronisation between foreground & isr
> + * @freq:	frequency of I2C transfer
> + * @flags:	internal flags to store transfer conditions
> + * @irq:	irq number
> + */

> +

Ditt.

> +struct pci1xxxx_i2c {
> +	struct completion i2c_xfer_done;
> +	bool i2c_xfer_in_progress;
> +	struct i2c_adapter adap;
> +	void __iomem *i2c_base;
> +	u32 freq;
> +	u32 flags;
> +};

I have lack of time to finish review, but you already have enough for the next
version.

...

> +			transferlen = min((u16)(SMBUS_MAST_BUF_MAX_SIZE - 1),
> +					  remainingbytes);

min_t()

...

> +		if (remainingbytes <= transferlen && (i2c->flags &
> +							I2C_FLAGS_STOP))

Strange indentation.

...

> +		/*
> +		 * wait for the DMA_TERM interrupt and if the timer expires, it means
> +		 * the transaction has failed due to some bus lock as we dint get
> +		 * the interrupt
> +		 */

You really have to go through all comments and fix grammar, etc.

...

> +		time_left = wait_for_completion_timeout
> +				(&i2c->i2c_xfer_done, msecs_to_jiffies(PCI1XXXX_I2C_TIMEOUT));

Strange indentation.

...

> +	i2c_del_adapter(&i2c->adap);

Can't you use devm_ variant?

...

> +	pci1xxxx_i2c_shutdown(i2c);

Do you really need this in ->remove()? I would expect something in
the ->suspend() / ->shutdown().

-- 
With Best Regards,
Andy Shevchenko


