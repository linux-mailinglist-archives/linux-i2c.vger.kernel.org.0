Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C477A3251F5
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 16:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhBYPHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 10:07:19 -0500
Received: from mga11.intel.com ([192.55.52.93]:55245 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231591AbhBYPHS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Feb 2021 10:07:18 -0500
IronPort-SDR: tWPNzI4iSHctuHePv9IZPGq5MctOoQsgemyA93Od3kuGnGMnj6D48iFgTYhWb7Y2Oh7t3+NVgS
 pp59mcnFJ3OA==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="182122428"
X-IronPort-AV: E=Sophos;i="5.81,206,1610438400"; 
   d="scan'208";a="182122428"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2021 07:05:31 -0800
IronPort-SDR: UlEjrfLqOxhB2QPygFOqEgSk5foRtoa+ThCF3tAG2RJgwTwU0Tzyg6Uoo9Fd9zKTg5A5ov6/ed
 YDyPqnxSJ07Q==
X-IronPort-AV: E=Sophos;i="5.81,206,1610438400"; 
   d="scan'208";a="433989020"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2021 07:05:15 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lFICU-0082q2-CR; Thu, 25 Feb 2021 17:05:10 +0200
Date:   Thu, 25 Feb 2021 17:05:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Liguang Zhang <zhangliguang@linux.alibaba.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Get right data length
Message-ID: <YDe8pq/NoMTlNNut@smile.fi.intel.com>
References: <20210225142631.1882-1-zhangliguang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225142631.1882-1-zhangliguang@linux.alibaba.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 25, 2021 at 10:26:31PM +0800, Liguang Zhang wrote:
> IC_DATA_CMD[11] indicates the first data byte received after the address
> phase for receive transfer in Master receiver or Slave receiver mode,
> this bit was set in some transfer flow. IC_DATA_CMD[7:0] contains the
> data to be transmitted or received on the I2C bus, so we should use the
> lower 8 bits to get the real data length.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>
> ---
>  drivers/i2c/busses/i2c-designware-core.h   | 2 ++
>  drivers/i2c/busses/i2c-designware-master.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 85307cfa7109..5392b82f68a4 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -38,6 +38,8 @@
>  #define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
>  #define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
>  
> +#define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
> +
>  /*
>   * Registers offset
>   */
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index d6425ad6e6a3..dd27b9dbe931 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -432,7 +432,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>  			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>  			/* Ensure length byte is a valid value */
>  			if (flags & I2C_M_RECV_LEN &&
> -			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
> +			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
>  				len = i2c_dw_recv_len(dev, tmp);
>  			}
>  			*buf++ = tmp;
> -- 
> 2.19.1.6.gb485710b
> 

-- 
With Best Regards,
Andy Shevchenko


