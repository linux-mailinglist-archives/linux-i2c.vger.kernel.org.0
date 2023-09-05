Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99680792780
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238253AbjIEQTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354473AbjIELzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 07:55:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1921AD;
        Tue,  5 Sep 2023 04:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693914933; x=1725450933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/cTDMMGwDXqGrvj5wts+NYLjOYzxjei9B4vYLZWvOR0=;
  b=m4MIBKoiPBgQTE54zvHPp8kcyxzD3ladLowAL+2VMTSqwzXvyzCZiZE+
   4wMKNY7aow/77tDEkZiL6cz0IgfSOwDrPNf24AJBUiaH521UuBLjIEkAf
   RBPUxbOcVXa+83u/cnbjU8WOawh+AkzUAXhVBeXcBcVYf1QGbcqK+QoQX
   qc2hwaE4DcQcr3SvFqKCGgLn5s97FfZVUFMtB/yspQhtx461pGa8uNL4+
   2FtmOL+JxtjxGHqKmo4Xtpt7nlLJoOLrfm6yiCUfD4iBs0HJ08bYTrEsL
   iwbl07w7f1RKIYB/a6Hq/97ZW2zPU7oBcCNzNKEnrP5hwBYzc5RqqBPUA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="440751289"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="440751289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 04:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="884290537"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="884290537"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 04:55:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qdUeN-006fwq-2t;
        Tue, 05 Sep 2023 14:55:19 +0300
Date:   Tue, 5 Sep 2023 14:55:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZPcXJ4adUNMv4LDr@smile.fi.intel.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 05, 2023 at 06:52:37AM +0000, Ryan Chen wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Friday, July 14, 2023 4:55 PM
> > On Fri, Jul 14, 2023 at 03:45:22PM +0800, Ryan Chen wrote:

...

> > > +#define AST2600_I2CC_GET_RX_BUFF(x)			(((x) >> 8) &
> > GENMASK(7, 0))
> > 
> > > +#define AST2600_I2CC_GET_RX_BUF_LEN(x)		(((x) >> 24) &
> > GENMASK(5, 0))
> > 
> > > +#define AST2600_I2CC_GET_TX_BUF_LEN(x)		((((x) >> 8) &
> > GENMASK(4, 0)) + 1)
> > 
> > With right shifts it's better to have GENMASK to be applied first, it will show
> > exact MSB of the bitfield.
> > 
> > (Ditto for other cases similar to these)

> It will update next version.
> #define AST2600_I2CC_GET_RX_BUF_LEN(x)      (((x) & GENMASK(29, 24)) >> 24)
> #define AST2600_I2CC_GET_TX_BUF_LEN(x)      ((((x) & GENMASK(12, 8)) >> 8) + 1)

Note, these were just an example, check _all_ of the similar cases.

In general any reviewer's comment should be considered for the entire code where
it makes sense.

...

> 			divisor = DIV_ROUND_UP(base_clk[3], i2c_bus->timing_info.bus_freq_hz);
> 			for_each_set_bit(divisor, &divisor, 32) {

This is wrong.

> 				if ((divisor + 1) <= 32)
> 					break;

> 				divisor >>= 1;

And this.

> 				baseclk_idx++;

> 			}

for_each_set_bit() should use two different variables.

> 		} else {
> 			baseclk_idx = i + 1;
> 			divisor = DIV_ROUND_UP(base_clk[i], i2c_bus->timing_info.bus_freq_hz);
> 		}
> 	}

...

> 	divisor = min_t(unsigned long, divisor, 32);

Can't you use min()? min_t is a beast with some subtle corner cases.

...

> Sorry I don't catch this split slave out to separate change?
> Do you mean go for another file name example ast2600_i2c_slave.c ?

No, I mean

 patch 1: Introduce the driver with only master support
 patch 2: Add slave capability (all what is under ifdeffery for I2C_SLAVE)

...

> static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus)
> {
> 	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];

> 	int ret;

This is not needed, you may return directly.

> 	/* send start */
> 	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
> 		i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
> 		msg->len, msg->len > 1 ? "s" : "",
> 		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);
> 
> 	i2c_bus->master_xfer_cnt = 0;
> 	i2c_bus->buf_index = 0;

> 	if (msg->flags & I2C_M_RD) {
> 		if (i2c_bus->mode == DMA_MODE)
> 			ret = ast2600_i2c_setup_dma_rx(i2c_bus);

			return ...;
		if ...


> 		else if (i2c_bus->mode == BUFF_MODE)
> 			ret = ast2600_i2c_setup_buff_rx(i2c_bus);
> 		else
> 			ret = ast2600_i2c_setup_byte_rx(i2c_bus);

> 	} else {
> 		if (i2c_bus->mode == DMA_MODE)
> 			ret = ast2600_i2c_setup_dma_tx(AST2600_I2CM_START_CMD, i2c_bus);
> 		else if (i2c_bus->mode == BUFF_MODE)
> 			ret = ast2600_i2c_setup_buff_tx(AST2600_I2CM_START_CMD, i2c_bus);
> 		else
> 			ret = ast2600_i2c_setup_byte_tx(AST2600_I2CM_START_CMD, i2c_bus);

Same way.

> 	}
> 
> 	return ret;
> }

...

> > Wrong memory accessors. You should use something from asm/byteorder.h
> > which includes linux/byteorder/generic.h.
> 
> Sorry, about these parts. I quit no idea.
> This is chip register limited, it only support dword write, not support byte write.
> So the only way I have is use get_unaligned_le32 function get the byte buffer to align dword write.
> Or I may need your help point me a good way.

>  	for (i = 0; i < xfer_len; i++) {
>  		wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
>  		if (i % 4 == 3) {
>  			wbuf_dword = get_unaligned_le32(wbuf);
>  			writel(wbuf_dword, i2c_bus->buf_base + i - 3);
>  		}
>  	}
>  
>  	if (--i % 4 != 3) {
>  		wbuf_dword = get_unaligned_le32(wbuf);
>  		writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
>  	} 

Something like that. The most problematic part in your original code is
dereferencing byte memory as 32-bit memory with all possible problems behind.
With this code it's gone. The code itself might be improved even more,
you can think about it, you still have time (we are now in v6.7 cycle).

-- 
With Best Regards,
Andy Shevchenko


