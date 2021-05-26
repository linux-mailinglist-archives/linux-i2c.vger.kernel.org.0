Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A4439136F
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 11:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhEZJMO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 05:12:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:32989 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233436AbhEZJMO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 05:12:14 -0400
IronPort-SDR: rTKMNcU1b/aB3duY0LlvEk+xIeEus5xbMOeYkNJOtyGMfq6t/eM21nWaVr7/kZb7Pdt9bjcuz7
 mVczUmaHChJA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182746737"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="182746737"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 02:10:40 -0700
IronPort-SDR: 21hucD7LU7piWmZ5MTtBTUaX3W3XwXa4eoJY8/nAwvGT0XTnA1UwAFDCZ0ShizrIXr/wqkPfwE
 WP2pg+of906w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="409164137"
Received: from mylly.fi.intel.com (HELO [10.237.72.166]) ([10.237.72.166])
  by fmsmga007.fm.intel.com with ESMTP; 26 May 2021 02:10:38 -0700
Subject: Re: [PATCH] i2c: i801: Don't generate an interrupt on bus reset
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20210525170336.213a19b4@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <0d540f23-14a7-4812-d94b-bd344879b3d9@linux.intel.com>
Date:   Wed, 26 May 2021 12:10:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525170336.213a19b4@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/25/21 6:03 PM, Jean Delvare wrote:
> Now that the i2c-i801 driver supports interrupts, setting the KILL bit
> in a attempt to recover from a timed out transaction triggers an
> interrupt. Unfortunately, the interrupt handler (i801_isr) is not
> prepared for this situation and will try to process the interrupt as
> if it was signaling the end of a successful transaction. In the case
> of a block transaction, this can result in an out-of-range memory
> access.
> 
> This condition was reproduced several times by syzbot:
> https://syzkaller.appspot.com/bug?extid=ed71512d469895b5b34e
> https://syzkaller.appspot.com/bug?extid=8c8dedc0ba9e03f6c79e
> https://syzkaller.appspot.com/bug?extid=c8ff0b6d6c73d81b610e
> https://syzkaller.appspot.com/bug?extid=33f6c360821c399d69eb
> https://syzkaller.appspot.com/bug?extid=be15dc0b1933f04b043a
> https://syzkaller.appspot.com/bug?extid=b4d3fd1dfd53e90afd79
> 
> So disable interrupts while trying to reset the bus. Interrupts will
> be enabled again for the following transaction.
> 
> Fixes: 636752bcb517 ("i2c-i801: Enable IRQ for SMBus transactions")
> Reported-by: syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-i801.c |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
I hope I managed to test this properly. At least I was able to trigger 
KASAN quite easily and after your patch not anymore.

My test was to run "i2cdump -y 0 0x50 i" a few times with this hack:

--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -653,6 +653,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
  	struct i801_priv *priv = dev_id;
  	u16 pcists;
  	u8 status;
+	static int count = 0;

  	/* Confirm this is our interrupt */
  	pci_read_config_word(priv->pci_dev, SMBPCISTS, &pcists);
@@ -676,8 +677,10 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
  	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
  	if (status) {
  		outb_p(status, SMBHSTSTS(priv));
-		priv->status = status;
-		wake_up(&priv->waitq);
+		if ((count++ % 10)) {
+				priv->status = status;
+				wake_up(&priv->waitq);
+		}
  	}

  	return IRQ_HANDLED;

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
