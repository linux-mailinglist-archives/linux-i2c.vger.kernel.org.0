Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5811AD098
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 21:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgDPTth (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 15:49:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:57767 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727886AbgDPTtg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Apr 2020 15:49:36 -0400
IronPort-SDR: 4CgSil85FYRkVsTZDe2jbtT3F2s8oR5aZSfQ8TCNBasEam03OIFzVF+3TxEQczpe9yQnywyfPj
 D56ODeg5K4Ww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 12:49:36 -0700
IronPort-SDR: MLryOXQKq0Z6yWk5ZS0AYhp5ESBc3RJPaCQvN5ugJU8lD1Wi6a9HiDp/fB32y5hLvrY8UTn+4Y
 KpKcO5aMPnCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; 
   d="scan'208";a="454454609"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga005.fm.intel.com with ESMTP; 16 Apr 2020 12:49:35 -0700
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] i2c: altera: Fix race between xfer_msg and isr thread
To:     Atsushi Nemoto <atsushi.nemoto@sord.co.jp>,
        linux-i2c@vger.kernel.org
Cc:     tomonori.sakita@sord.co.jp
References: <20200410.100640.1949609603287475131.atsushi.nemoto@sord.co.jp>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <4f874ee2-3828-047a-78b1-ccbe674c0ff3@linux.intel.com>
Date:   Thu, 16 Apr 2020 14:49:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200410.100640.1949609603287475131.atsushi.nemoto@sord.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/9/20 8:06 PM, Atsushi Nemoto wrote:
> Use a mutex to protect access to idev->msg_len, idev->buf, etc. which
> are modified by both altr_i2c_xfer_msg() and altr_i2c_isr().
> 
> Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
> ---

Acked-by: Thor Thayer <thor.thayer@linux.intel.com>

>   drivers/i2c/busses/i2c-altera.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 20ef63820c77..3db7d77c5a1e 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -70,6 +70,7 @@
>    * @isr_mask: cached copy of local ISR enables.
>    * @isr_status: cached copy of local ISR status.
>    * @lock: spinlock for IRQ synchronization.
> + * @mutex: mutex for IRQ thread.
>    */
>   struct altr_i2c_dev {
>   	void __iomem *base;
> @@ -86,6 +87,7 @@ struct altr_i2c_dev {
>   	u32 isr_mask;
>   	u32 isr_status;
>   	spinlock_t lock;	/* IRQ synchronization */
> +	struct mutex mutex;
>   };
>   
>   static void
> @@ -245,10 +247,11 @@ static irqreturn_t altr_i2c_isr(int irq, void *_dev)
>   	struct altr_i2c_dev *idev = _dev;
>   	u32 status = idev->isr_status;
>   
> +	mutex_lock(&idev->mutex);
>   	if (!idev->msg) {
>   		dev_warn(idev->dev, "unexpected interrupt\n");
>   		altr_i2c_int_clear(idev, ALTR_I2C_ALL_IRQ);
> -		return IRQ_HANDLED;
> +		goto out;
>   	}
>   	read = (idev->msg->flags & I2C_M_RD) != 0;
>   
> @@ -301,6 +304,8 @@ static irqreturn_t altr_i2c_isr(int irq, void *_dev)
>   		complete(&idev->msg_complete);
>   		dev_dbg(idev->dev, "Message Complete\n");
>   	}
> +out:
> +	mutex_unlock(&idev->mutex);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -312,6 +317,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
>   	u32 value;
>   	u8 addr = i2c_8bit_addr_from_msg(msg);
>   
> +	mutex_lock(&idev->mutex);
>   	idev->msg = msg;
>   	idev->msg_len = msg->len;
>   	idev->buf = msg->buf;
> @@ -336,6 +342,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
>   		altr_i2c_int_enable(idev, imask, true);
>   		altr_i2c_fill_tx_fifo(idev);
>   	}
> +	mutex_unlock(&idev->mutex);
>   
>   	time_left = wait_for_completion_timeout(&idev->msg_complete,
>   						ALTR_I2C_XFER_TIMEOUT);
> @@ -410,6 +417,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   	idev->dev = &pdev->dev;
>   	init_completion(&idev->msg_complete);
>   	spin_lock_init(&idev->lock);
> +	mutex_init(&idev->mutex);
>   
>   	val = device_property_read_u32(idev->dev, "fifo-size",
>   				       &idev->fifo_size);
> 

