Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44DEC4CBBA3
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 11:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiCCKph (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 05:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbiCCKpg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 05:45:36 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D5B4707D;
        Thu,  3 Mar 2022 02:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646304291; x=1677840291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVD9z92VH43KxwwjXiWGXRu7osivdsQyI2JqeG5AhT4=;
  b=c+os0yg8l1HErMjKTbPs9ZO3Qo1AdWDUvSywRr7KAUtbS7eFpJJ1bhpe
   ewKhv/eTaH9N/3AQMwMPNTS8g3MHMj8UYoFWRU8cSTHkDvLtDQl1r921/
   eAqHFdGePvoKm412oJmHja/q349O7sjGHw9xUFyQk5Lf3Grj3eJCm8eo3
   HzRQIUpmOC7j9deDLyqcMKlK1W6MBGbabtRbDI+DAdBRGx3vhn8zuBn1G
   bh2YpwzRernus65UocaXL1srpikZRVbPhyB+Xsnf8DoDnRQyMpyQq7lrj
   TDCfelSEBzRNRyISgxy7MD8mb1pve8l9BxAgRM+Hv0+f1he0piFJBbR0T
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253373147"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253373147"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:44:50 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576447018"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:44:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nPiw8-00AkCJ-VT;
        Thu, 03 Mar 2022 12:43:56 +0200
Date:   Thu, 3 Mar 2022 12:43:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
Message-ID: <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-12-warp5tw@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 03, 2022 at 04:31:41PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add NPCM8XX I2C support.
> The NPCM8XX uses a similar i2c module as NPCM7XX.
> The internal HW FIFO is larger in NPCM8XX.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Wrong SoB chain.

...

> +static const struct npcm_i2c_data npxm7xx_i2c_data = {
> +	.fifo_size = 16,
> +	.segctl_init_val = 0x0333F000,
> +	.txf_sts_tx_bytes = GENMASK(4, 0),
> +	.rxf_sts_rx_bytes = GENMASK(4, 0),
> +	.rxf_ctl_last_pec = BIT(5)

+ Comma.

> +};
> +
> +static const struct npcm_i2c_data npxm8xx_i2c_data = {
> +	.fifo_size = 32,
> +	.segctl_init_val = 0x9333F000,
> +	.txf_sts_tx_bytes = GENMASK(5, 0),
> +	.rxf_sts_rx_bytes = GENMASK(5, 0),
> +	.rxf_ctl_last_pec = BIT(7)

Ditto.

> +};

...

> -	left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
> -				 ioread8(bus->reg + NPCM_I2CTXF_STS));
> +	left_in_fifo = (bus->data->txf_sts_tx_bytes &
> +			ioread8(bus->reg + NPCM_I2CTXF_STS));

Besides too many parentheses, this is an interesting change. So, in different
versions of IP the field is on different bits? Perhaps it means that you need
something like internal ops structure for all these, where you will have been
using the statically defined masks?

...

> +	match = of_match_device(npcm_i2c_bus_of_table, dev);
> +	if (!match) {
> +		dev_err(dev, "OF data missing\n");
> +		return -EINVAL;
> +	}
> +	bus->data = match->data;

This is NIH of_device_get_match_data().

...

> -static const struct of_device_id npcm_i2c_bus_of_table[] = {
> -	{ .compatible = "nuvoton,npcm750-i2c", },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
> -

Redundant change, leave this as is.

-- 
With Best Regards,
Andy Shevchenko


