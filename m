Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8021026CD41
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 22:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgIPU5C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 16:57:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:3712 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgIPQwh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Sep 2020 12:52:37 -0400
IronPort-SDR: gJC9KQrGz7PNLfiRC6j6+O5xRPn2eAsOz2+Ubns7jvVjezTjWDXLx4gYMVSKDI6BDw+u3be1Vj
 FxG6LtUuZoGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="160395369"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="160395369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 07:09:23 -0700
IronPort-SDR: f6lEK6rr61QfJLrKixbHM2tY184hPKA3gqXtKYIaZE5f5CnutmwPYL/Q6k3e7bQNOdG3KM3B+e
 IkN1W1Swyaug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="331700580"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2020 07:09:19 -0700
Subject: Re: [PATCH v3] i2c: Squash of SMBus block read patchset to save power
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
References: <b3b751fc-668d-91e2-220b-0d7edd231e01@linux.intel.com>
 <20200914001523.3878-1-sultan@kerneltoast.com>
 <bcf9cd02-13d1-8f87-8ef9-2f05f0b54808@linux.intel.com>
 <20200915174844.GA16807@sultan-box.localdomain>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <796a23d2-cb98-c431-3494-b59044189468@linux.intel.com>
Date:   Wed, 16 Sep 2020 17:09:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915174844.GA16807@sultan-box.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/15/20 8:48 PM, Sultan Alsawaf wrote:
> On Tue, Sep 15, 2020 at 02:55:48PM +0300, Jarkko Nikula wrote:
>> I tested this on top of fc4f28bb3daf ("Merge tag 'for-5.9-rc5-tag' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux") and seems to be
>> working fine. What was the key change compared to previous version that was
>> regressing for me?
> 
> This change fixed your issue (and my issue with 5.8):
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -395,8 +395,9 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>   	 * Adjust the buffer length and mask the flag
>   	 * after receiving the first byte.
>   	 */
> -	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
> -	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
> +	if (flags & I2C_CLIENT_PEC)
> +		len++;
> +	dev->tx_buf_len = len - min_t(u8, len - 1, dev->rx_outstanding);
>   	msgs[dev->msg_read_idx].len = len;
>   	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
> 
> I've attributed this change with the following commit message:
> "i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads
> 
> The point of adding a byte to len in i2c_dw_recv_len() is to make sure
> that tx_buf_len is nonzero, so that i2c_dw_xfer_msg() can let the i2c
> controller know that the i2c transaction can end. Otherwise, the i2c
> controller will think that the transaction can never end for block
> reads, which results in the stop-detection bit never being set and thus
> the transaction timing out.
> 
> Adding a byte to len is not a reliable way to do this though; sometimes
> it lets tx_buf_len become zero, which results in the scenario described
> above. Therefore, just directly ensure tx_buf_len cannot be zero to fix
> the issue."
> 
Ok, nice that you found it.

> Does the patch series look good to submit?
> 
Yes, go ahead.

Jarkko
