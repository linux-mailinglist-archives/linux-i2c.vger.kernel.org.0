Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C741118F925
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 17:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbgCWQCB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 12:02:01 -0400
Received: from mga02.intel.com ([134.134.136.20]:32341 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727202AbgCWQCB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 12:02:01 -0400
IronPort-SDR: TvtmP/Q0fha7U9o6c0qGRituI6dHQ7XK4V9zApEYEE/05K5MWsaf6tovA+3url+ImvYXOi5NCz
 Ytsq6ycqWMrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 09:02:00 -0700
IronPort-SDR: phtAgXXYbKsiJe/zuUmNdIE1gUiEZCE8YR7T4VrWwwkSIrwsF2/9wxBJwxSQMlx+2lPFi5ZkMR
 RMlpw1k/n3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; 
   d="scan'208";a="264820911"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2020 09:01:56 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGPWY-00CHV3-M7; Mon, 23 Mar 2020 18:01:58 +0200
Date:   Mon, 23 Mar 2020 18:01:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     brendanhiggins@google.com, avifishman70@gmail.com,
        tmaimon77@gmail.com, kfting@nuvoton.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        wsa@the-dreams.de, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/3] i2c: npcm7xx: Add support for slave mode for
 Nuvoton
Message-ID: <20200323160158.GR1922688@smile.fi.intel.com>
References: <20200323134437.259210-1-tali.perry1@gmail.com>
 <20200323134437.259210-4-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200323134437.259210-4-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 23, 2020 at 03:44:37PM +0200, Tali Perry wrote:
> Add support for slave mode for Nuvoton
> NPCM BMC I2C controller driver.

Same comments apply as per previous patch.

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

Perhaps create a separate module and compile it when user selects?
See I²C DesignWare split.

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (bus->slave) {
> +		npcm_i2c_slave_enable_l(bus, I2C_SLAVE_ADDR1, bus->slave->addr,
> +					true);
> +	}

Put it on one line and drop {} -- it will be much better to read.

> +#endif

...

> +static void npcm_i2c_write_to_fifo_slave(struct npcm_i2c *bus,
> +					 u16 max_bytes_to_send)
> +{
> +	// Fill the FIFO, while the FIFO is not full and there are more bytes to
> +	// write
> +	npcm_i2c_clear_fifo_int(bus);
> +	npcm_i2c_clear_tx_fifo(bus);
> +	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
> +
> +	while ((max_bytes_to_send--) && (I2C_HW_FIFO_SIZE -
> +					 npcm_i2c_get_fifo_fullness(bus))) {
> +		if (bus->slv_wr_size > 0) {
> +			npcm_i2c_wr_byte(bus,
> +					 bus->slv_wr_buf[bus->slv_wr_ind %
> +					 I2C_HW_FIFO_SIZE]);
> +			bus->slv_wr_ind = (bus->slv_wr_ind + 1) %
> +					   I2C_HW_FIFO_SIZE;
> +			bus->slv_wr_size--; // size indicates the # of bytes in
> +					    // the SW FIFO, not HW.
> +		} else {
> +			break;
> +		}

This looks ugly. Can you redo the style.

> +	}
> +}

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +			if (bus->slave) {
> +				bus->slv_rd_buf[bus->slv_rd_ind %
> +						I2C_HW_FIFO_SIZE] = data;
> +				bus->slv_rd_ind++;
> +				if (bus->slv_rd_ind == 1 && bus->read_block_use)
> +					// 1st byte is length in block protocol
> +					bus->slv_rd_size = data +
> +							   (u8)bus->PEC_use +
> +							(u8)bus->read_block_use;
> +			}
> +#endif

Ditto.

...

>  		   I2C_FUNC_SMBUS_EMUL |
>  		   I2C_FUNC_SMBUS_BLOCK_DATA |
>  		   I2C_FUNC_SMBUS_PEC
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		   | I2C_FUNC_SLAVE
> +#endif

Completely inconsistent style.

>  		   ;

-- 
With Best Regards,
Andy Shevchenko


