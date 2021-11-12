Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE3B44E058
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 03:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhKLCiY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 21:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbhKLCiY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 21:38:24 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0FEC061767
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 18:35:33 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x64so7247487pfd.6
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 18:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RNXnFaFa6OypiY8cUDEXU0f6wOrYgTchSCvRvlsTQj8=;
        b=CnEygtn/QYnOuEWrZ0Wl5Dq0XzaDKRMuFrim3itrSjv7xN6Md8/Q8/GeNreaH2Ukx/
         ur0hfbc3FsY/A8ZfQxcgY4WuJroVKRGVeIhKy+mXt5/Op4g1sOk2uhHrBQOROoMSL3B/
         tTygpiM+ZPkd1EWmCL9GAkH5P/yIq8cRWQUEjh9AoMopyvZQqZv6bmacTPJqvRPgwFTl
         ibh6AgT+dUIAhN2acEIbLXW9wvYQdkVoZ6c27bOcjA+ZiGl6fgvZ7szAzkjlgKV3f5rP
         7P5VvViXMiQpnSfugdpuKo8RKeQLhodgOogeuPcDgcV2MORcYusqtKDGV5i7WCyAseCn
         jgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RNXnFaFa6OypiY8cUDEXU0f6wOrYgTchSCvRvlsTQj8=;
        b=5ltNhrhqUGv/FHAYQnaQ2T3rCNsEfkPEEz+VGdCd5dnNiuEn5DwPHQoHuXxKsDQZ25
         /F65L6M0Tyyrsz1igwb0sQlock1Oq96PDZAWi7bNSgSAvZyPL+hd+/jgDWqqfKFqQfFU
         qHKifFN5DpbooK4Ommyr5nROWkNvxaMRzlAckLM/5VX52fNTYWPAA5J0s19HLaYc4st8
         AvNrfa4Jyg2iC0GW59GXrVq1+xI+DI9xLOFmWN6jASiDpLwMyiIgI/axemebU9k1SzC8
         9Ld3BesdF6TYNS/V+c+5PTW/sagL/6HqTuPL/mR2XL1k/VpdOswbZTBLIyViYaCS8BxX
         VuLg==
X-Gm-Message-State: AOAM5317HsixQGNG+wPO6ABwm6n64hPMStlnn+kK+koKc0JsZb7fifgA
        9CCFyNq++/kxGuIWcOwrAeDSuDQQRGyfSQ==
X-Google-Smtp-Source: ABdhPJyRkgNSq1OMU0V6NixxdtfxUcHIEtVk0YRczILs2+A+RXr19abyAyxkFmUenAaIGjShRy9EAw==
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr7927614pgd.444.1636684532167;
        Thu, 11 Nov 2021 18:35:32 -0800 (PST)
Received: from localhost ([223.226.77.81])
        by smtp.gmail.com with ESMTPSA id a8sm3347968pgh.84.2021.11.11.18.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 18:35:31 -0800 (PST)
Date:   Fri, 12 Nov 2021 08:05:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, jie.deng@intel.com, conghui.chen@intel.com,
        mst@redhat.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211112023529.2nypmrnm6mufcpjt@vireshk-i7>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-2-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111160412.11980-2-vincent.whitchurch@axis.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11-11-21, 17:04, Vincent Whitchurch wrote:
> If a timeout is hit, it can result is incorrect data on the I2C bus
> and/or memory corruptions in the guest since the device can still be
> operating on the buffers it was given while the guest has freed them.
> 
> Here is, for example, the start of a slub_debug splat which was
> triggered on the next transfer after one transfer was forced to timeout
> by setting a breakpoint in the backend (rust-vmm/vhost-device):
> 
>  BUG kmalloc-1k (Not tainted): Poison overwritten
>  First byte 0x1 instead of 0x6b
>  Allocated in virtio_i2c_xfer+0x65/0x35c age=350 cpu=0 pid=29
>  	__kmalloc+0xc2/0x1c9
>  	virtio_i2c_xfer+0x65/0x35c
>  	__i2c_transfer+0x429/0x57d
>  	i2c_transfer+0x115/0x134
>  	i2cdev_ioctl_rdwr+0x16a/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
>  Freed in virtio_i2c_xfer+0x32e/0x35c age=244 cpu=0 pid=29
>  	kfree+0x1bd/0x1cc
>  	virtio_i2c_xfer+0x32e/0x35c
>  	__i2c_transfer+0x429/0x57d
>  	i2c_transfer+0x115/0x134
>  	i2cdev_ioctl_rdwr+0x16a/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
> 
> There is no simple fix for this (the driver would have to always create
> bounce buffers and hold on to them until the device eventually returns
> the buffers), so just disable the timeout support for now.
> 
> Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
> Acked-by: Jie Deng <jie.deng@intel.com>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  drivers/i2c/busses/i2c-virtio.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index f10a603b13fb..7b2474e6876f 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -106,11 +106,10 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
>  
>  static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>  				    struct virtio_i2c_req *reqs,
> -				    struct i2c_msg *msgs, int num,
> -				    bool timedout)
> +				    struct i2c_msg *msgs, int num)
>  {
>  	struct virtio_i2c_req *req;
> -	bool failed = timedout;
> +	bool failed = false;
>  	unsigned int len;
>  	int i, j = 0;
>  
> @@ -132,7 +131,7 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>  			j++;
>  	}
>  
> -	return timedout ? -ETIMEDOUT : j;
> +	return j;
>  }
>  
>  static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> @@ -141,7 +140,6 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	struct virtio_i2c *vi = i2c_get_adapdata(adap);
>  	struct virtqueue *vq = vi->vq;
>  	struct virtio_i2c_req *reqs;
> -	unsigned long time_left;
>  	int count;
>  
>  	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> @@ -164,11 +162,9 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	reinit_completion(&vi->completion);
>  	virtqueue_kick(vq);
>  
> -	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> -	if (!time_left)
> -		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> +	wait_for_completion(&vi->completion);

I thought we decided on making this in insanely high value instead ?

-- 
viresh
