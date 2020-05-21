Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14ADA1DD021
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 16:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgEUOgh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 10:36:37 -0400
Received: from mga05.intel.com ([192.55.52.43]:63186 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729844AbgEUOgh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 May 2020 10:36:37 -0400
IronPort-SDR: ae5p9ncrVuiXxW5wezmyun+odlx5FOb3wtTOjd9rhwM+LRRF2Cm3OrWj0XBMmnuFwu3uTM+IPY
 ROiaoZN4x5CQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 07:36:36 -0700
IronPort-SDR: 7b8ROu2A3A9XEgh3Fs2Y+Q285e1ifd91EOCucSW4KwbQ1BCx/+VNxN++j7SoDTWYquT7uYB9YF
 J8sQKRBNJxAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; 
   d="scan'208";a="343862381"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 21 May 2020 07:36:32 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jbmJH-0082yZ-GB; Thu, 21 May 2020 17:36:35 +0300
Date:   Thu, 21 May 2020 17:36:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     ofery@google.com, brendanhiggins@google.com,
        avifishman70@gmail.com, tmaimon77@gmail.com, kfting@nuvoton.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, wsa@the-dreams.de,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/3] i2c: npcm7xx: Add support for slave mode for
 Nuvoton
Message-ID: <20200521143635.GN1634618@smile.fi.intel.com>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-4-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521110910.45518-4-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 21, 2020 at 02:09:10PM +0300, Tali Perry wrote:
> Add support for slave mode for Nuvoton
> NPCM BMC I2C controller driver.

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +/*
> + * npcm_i2caddr array:
> + * The module supports having multiple own slave addresses.
> + * Since the addr regs are sprinkled all over the address space,
> + * use this array to get the address or each register.
> + */
> +#define I2C_NUM_OWN_ADDR 10
> +const int  npcm_i2caddr[I2C_NUM_OWN_ADDR] = {NPCM_I2CADDR1, NPCM_I2CADDR2,

Extra spaces.
On top. please start assignment from the new line.

> +					     NPCM_I2CADDR3, NPCM_I2CADDR4,
> +					     NPCM_I2CADDR5, NPCM_I2CADDR6,
> +					     NPCM_I2CADDR7, NPCM_I2CADDR8,

> +					     NPCM_I2CADDR9, NPCM_I2CADDR10};

Split }; to new line and leave comma with the last member.

> +#endif

...

> +static int  npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
> +				  u8 addr, bool enable)

Extra spaces. Check entire patch for that and fix accordingly.

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (bus->slave)

> +		npcm_i2c_slave_enable(bus, I2C_SLAVE_ADDR1, bus->slave->addr,
> +				      true);

I would leave this on one line.

> +#endif

...

> +static void npcm_i2c_write_fifo_slave(struct npcm_i2c *bus, u16 max_bytes)
> +{
> +	u8 size_free_fifo;

+ blank line.

> +	/*
> +	 * Fill the FIFO, while the FIFO is not full and there are more bytes
> +	 * to write
> +	 */
> +	npcm_i2c_clear_fifo_int(bus);
> +	npcm_i2c_clear_tx_fifo(bus);
> +	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);

> +	size_free_fifo = I2C_HW_FIFO_SIZE - npcm_i2c_fifo_usage(bus);

Dup, move into loop.

> +	while (max_bytes-- && size_free_fifo) {
> +		if (bus->slv_wr_size > 0) {
> +			bus->slv_wr_ind = bus->slv_wr_ind % I2C_HW_FIFO_SIZE;
> +			npcm_i2c_wr_byte(bus, bus->slv_wr_buf[bus->slv_wr_ind]);
> +			bus->slv_wr_ind++;
> +			bus->slv_wr_ind = bus->slv_wr_ind % I2C_HW_FIFO_SIZE;
> +			bus->slv_wr_size--;
> +			size_free_fifo = I2C_HW_FIFO_SIZE -
> +					 npcm_i2c_fifo_usage(bus);
> +		} else {
> +			break;
> +		}
> +	}

	while (...) {
		if (...)
			break;
		...
	}

> +}

...

> +static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
> +{
> +	int i;

> +	u8 value = 0;

Redundant assignment.

> +	int ind;
> +	int ret = bus->slv_wr_ind;
> +
> +	/* fill a cyclic buffer */
> +	for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
> +		if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
> +			break;
> +		i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +		ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
> +		bus->slv_wr_buf[ind] = value;
> +		bus->slv_wr_size++;
> +		i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
> +	}
> +	return I2C_HW_FIFO_SIZE - ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


