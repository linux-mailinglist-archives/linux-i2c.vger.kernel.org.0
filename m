Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076B71FB1F1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 15:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbgFPNWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 09:22:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:23602 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgFPNWe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Jun 2020 09:22:34 -0400
IronPort-SDR: /JREh8sxwFrhr5UJdflTdRIjB5qsrMvy3rj6B1rlu7+usPVTj7Z2THTeVTaEdehf+haWbKYC28
 30zlnn70N7tA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:22:34 -0700
IronPort-SDR: rc0fL3M4Ilanr8d/92/7cxTK3J/21xSMSVOltMUczT0GXTImMJ9ffimc8SjUpg/ZmvIB2ynlKo
 SfNnuIcQm/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="298900998"
Received: from mylly.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2020 06:22:30 -0700
Subject: Re: [PATCH 1/2] i2c: designware: Only check the first byte for SMBus
 block read length
To:     Sultan Alsawaf <sultan@kerneltoast.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Pavel Balan <admin@kryma.net>, Tin Huynh <tnhuynh@apm.com>,
        Wolfram Sang <wsa@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>
References: <20200614210255.4641-1-sultan@kerneltoast.com>
 <20200614210255.4641-2-sultan@kerneltoast.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <9782f44e-4e01-4e5d-cc50-ab9e2219085c@linux.intel.com>
Date:   Tue, 16 Jun 2020 16:22:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200614210255.4641-2-sultan@kerneltoast.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/15/20 12:02 AM, Sultan Alsawaf wrote:
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
> 
> Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index d6425ad6e6a3..16d38b8fc19a 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -398,7 +398,6 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>   	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
>   	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
>   	msgs[dev->msg_read_idx].len = len;
> -	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>   
>   	return len;
>   }

Please update the comment about masking the flag a few lines above this 
change.

> @@ -430,10 +429,11 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>   			u32 flags = msgs[dev->msg_read_idx].flags;
>   
>   			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
> -			/* Ensure length byte is a valid value */
> -			if (flags & I2C_M_RECV_LEN &&
> -			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
> -				len = i2c_dw_recv_len(dev, tmp);
> +			if (flags & I2C_M_RECV_LEN) {
> +				/* Ensure length byte is a valid value */
> +				if (tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0)
> +					len = i2c_dw_recv_len(dev, tmp);
> +				msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>   			}
>   			*buf++ = tmp;
>   			dev->rx_outstanding--;

With above comment change this looks good to me.

-- 
Jarkko
