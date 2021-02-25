Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341F4324F0D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 12:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbhBYLVu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 06:21:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:33867 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234548AbhBYLVr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Feb 2021 06:21:47 -0500
IronPort-SDR: cqu2pBjhKfPwu1nKe9s1CD/ZuZH3X9b+gwSp3I3q8y/v/TKJxVpgaqTyAbTGJ5Yu/mtH1tLC21
 85GDt6+3mwgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="184790291"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; 
   d="scan'208";a="184790291"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2021 03:20:00 -0800
IronPort-SDR: 1P/mJl6SAnf563iICc4wL5539Tioyys6RloOQ/05gFhu6+njg154KlieXPQ+bAHxn0oo866GVn
 p46NldlC2HpA==
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; 
   d="scan'208";a="442531676"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2021 03:19:58 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lFEgV-0080Jh-Of; Thu, 25 Feb 2021 13:19:55 +0200
Date:   Thu, 25 Feb 2021 13:19:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Liguang Zhang <zhangliguang@linux.alibaba.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Get right data length
Message-ID: <YDeH27Vgble8FetC@smile.fi.intel.com>
References: <20210225023528.121135-1-zhangliguang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225023528.121135-1-zhangliguang@linux.alibaba.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 25, 2021 at 10:35:28AM +0800, Liguang Zhang wrote:
> IC_DATA_CMD[11] indicates the first data byte received after the address
> phase for receive transfer in Master receiver or Slave receiver mode,
> this bit was set in some transfer flow. IC_DATA_CMD[7:0] contains the
> data to be transmitted or received on the I2C bus, so we should use the
> lower 8 bits to get the right data length.

Thanks for the report and fix!
My comments below.

> Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index d6425ad6e6a3..c3cf76f6c607 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -432,7 +432,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>  			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>  			/* Ensure length byte is a valid value */
>  			if (flags & I2C_M_RECV_LEN &&
> -			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
> +			    (tmp & 0xff) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {

Can we rather describe this as

#define DW_IC_DATA_CMD_DAT   GENMASK(7, 0)

in *.h file and...

			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
...here?

>  				len = i2c_dw_recv_len(dev, tmp);
>  			}
>  			*buf++ = tmp;
> -- 
> 2.19.1.6.gb485710b
> 

-- 
With Best Regards,
Andy Shevchenko


