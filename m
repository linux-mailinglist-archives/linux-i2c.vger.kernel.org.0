Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDDF1D253B
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 04:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgENCzW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 22:55:22 -0400
Received: from mga05.intel.com ([192.55.52.43]:10928 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgENCzV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 13 May 2020 22:55:21 -0400
IronPort-SDR: NQNrmx0sDv8RVwlpT6dkFjC26Wf1Vuj6TDIZ/qHTgeCIHOio3Uyk+1+P0dby2evyhz77MeziBR
 nsJaUVETgm2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 19:55:21 -0700
IronPort-SDR: q3DOtKyhK/3ul4Sn1MDFeKh26DphVj8CZdRPQnOHTo/wGjl/wp9QSTQFv3mnsxW+A0u8N5aNhS
 iVCMI2FE2B3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="464166948"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2020 19:55:21 -0700
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 2/2] i2c: altera: cleanup spinlock
To:     Atsushi Nemoto <atsushi.nemoto@sord.co.jp>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     tomonori.sakita@sord.co.jp
References: <20200508.221436.2027916415032712449.atsushi.nemoto@sord.co.jp>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <fe7813ed-22fa-e5d6-a22c-c93e0e0d1791@linux.intel.com>
Date:   Wed, 13 May 2020 21:55:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508.221436.2027916415032712449.atsushi.nemoto@sord.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/8/20 8:14 AM, Atsushi Nemoto wrote:
> Protect altr_i2c_int_enable() by the mutex and remove unneeded spinlock.
> 
> Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
> ---
>   drivers/i2c/busses/i2c-altera.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 16ddc26..997434f 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -69,7 +69,6 @@
>    * @fifo_size: size of the FIFO passed in.
>    * @isr_mask: cached copy of local ISR enables.
>    * @isr_status: cached copy of local ISR status.
> - * @lock: spinlock for IRQ synchronization.
>    * @isr_mutex: mutex for IRQ thread.
>    */
>   struct altr_i2c_dev {
> @@ -86,18 +85,14 @@ struct altr_i2c_dev {
>   	u32 fifo_size;
>   	u32 isr_mask;
>   	u32 isr_status;
> -	spinlock_t lock;	/* IRQ synchronization */
>   	struct mutex isr_mutex;
>   };
>   
>   static void
>   altr_i2c_int_enable(struct altr_i2c_dev *idev, u32 mask, bool enable)
>   {
> -	unsigned long flags;
>   	u32 int_en;
>   
> -	spin_lock_irqsave(&idev->lock, flags);
> -
>   	int_en = readl(idev->base + ALTR_I2C_ISER);
>   	if (enable)
>   		idev->isr_mask = int_en | mask;
> @@ -105,8 +100,6 @@ altr_i2c_int_enable(struct altr_i2c_dev *idev, u32 mask, bool enable)
>   		idev->isr_mask = int_en & ~mask;
>   
>   	writel(idev->isr_mask, idev->base + ALTR_I2C_ISER);
> -
> -	spin_unlock_irqrestore(&idev->lock, flags);
>   }
>   
>   static void altr_i2c_int_clear(struct altr_i2c_dev *idev, u32 mask)
> @@ -346,6 +339,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
>   
>   	time_left = wait_for_completion_timeout(&idev->msg_complete,
>   						ALTR_I2C_XFER_TIMEOUT);
> +	mutex_lock(&idev->isr_mutex);
>   	altr_i2c_int_enable(idev, imask, false);
>   
>   	value = readl(idev->base + ALTR_I2C_STATUS) & ALTR_I2C_STAT_CORE;
> @@ -358,6 +352,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
>   	}
>   
>   	altr_i2c_core_disable(idev);
> +	mutex_unlock(&idev->isr_mutex);
>   
>   	return idev->msg_err;
>   }
> @@ -415,7 +410,6 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   
>   	idev->dev = &pdev->dev;
>   	init_completion(&idev->msg_complete);
> -	spin_lock_init(&idev->lock);
>   	mutex_init(&idev->isr_mutex);
>   
>   	ret = device_property_read_u32(idev->dev, "fifo-size",
> @@ -453,7 +447,9 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	mutex_lock(&idev->isr_mutex);
>   	altr_i2c_init(idev);
> +	mutex_unlock(&idev->isr_mutex);
>   
>   	i2c_set_adapdata(&idev->adapter, idev);
>   	strlcpy(idev->adapter.name, pdev->name, sizeof(idev->adapter.name));
> 

Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
