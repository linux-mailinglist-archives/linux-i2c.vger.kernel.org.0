Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1571F93AC
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 11:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729303AbgFOJk0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 05:40:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:28925 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728411AbgFOJk0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 05:40:26 -0400
IronPort-SDR: MEy6tbFepUDj348cFVI4zdq+A2doPimbzZmpWRjWjw6vgo/k0snuPDunjRAGHvs+7cH6AXdKec
 Jo9xc/WvPJWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 02:40:23 -0700
IronPort-SDR: LHQqZ76Fn7bIbBFT7Zn7EpEOpc4QRKtaF80t6uGidUtlRfn4y7YzJbrBh+rgoQ+f/DrYLdkEsI
 sbi6SZmcyNeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="276501595"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2020 02:40:17 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jklbH-00DXN0-GZ; Mon, 15 Jun 2020 12:40:19 +0300
Date:   Mon, 15 Jun 2020 12:40:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     Aaron Ma <aaron.ma@canonical.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Pavel Balan <admin@kryma.net>, Tin Huynh <tnhuynh@apm.com>,
        Wolfram Sang <wsa@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>
Subject: Re: [PATCH 1/2] i2c: designware: Only check the first byte for SMBus
 block read length
Message-ID: <20200615094019.GP2428291@smile.fi.intel.com>
References: <20200614210255.4641-1-sultan@kerneltoast.com>
 <20200614210255.4641-2-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200614210255.4641-2-sultan@kerneltoast.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 14, 2020 at 02:02:54PM -0700, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
> 
> SMBus block reads can be broken because the read function will just skip
> over bytes it doesn't like until reaching a byte that conforms to the
> length restrictions for block reads. This is problematic when it isn't
> known if the incoming payload is indeed a conforming block read.
> 
> According to the SMBus specification, block reads will only send the
> payload length in the first byte, so we can fix this by only considering
> the first byte in a sequence for block read length purposes.

I'm wondering if this overlaps with [1]. AFAIU that one is also makes sure that
the length is not a garbage.

[1]: https://lore.kernel.org/linux-i2c/20200613104109.2989-1-mans@mansr.com/T/#u

> Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index d6425ad6e6a3..16d38b8fc19a 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -398,7 +398,6 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>  	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
>  	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
>  	msgs[dev->msg_read_idx].len = len;
> -	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>  
>  	return len;
>  }
> @@ -430,10 +429,11 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>  			u32 flags = msgs[dev->msg_read_idx].flags;
>  
>  			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
> -			/* Ensure length byte is a valid value */
> -			if (flags & I2C_M_RECV_LEN &&
> -			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
> -				len = i2c_dw_recv_len(dev, tmp);
> +			if (flags & I2C_M_RECV_LEN) {
> +				/* Ensure length byte is a valid value */
> +				if (tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0)
> +					len = i2c_dw_recv_len(dev, tmp);
> +				msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>  			}
>  			*buf++ = tmp;
>  			dev->rx_outstanding--;
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


