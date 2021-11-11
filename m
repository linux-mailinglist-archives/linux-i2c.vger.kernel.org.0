Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3476B44DAB4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 17:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhKKQtB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 11:49:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25276 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233950AbhKKQtA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 11:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636649171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fA0i4I2sJQvNiM1THao7+ZG2wZ9nUHKTkW18M399t/8=;
        b=K+AWjPPazzGeEE2hLou/p9lG0eqm5Z+zS6E+JYq5ezCbBKS17FJUniZbY4ufGNxtwc3zEc
        kYAIWhnSwm8w2TJIS/gTL+RL3bPo4XCzedLu08NeZhyIxq/yQP6ODedsls90S0xcZyjycW
        fMN86icy5NqvIyRvlJ/y5Nvg+dRP/DI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-DGjjcRbdO3qWuqfJKshweg-1; Thu, 11 Nov 2021 11:46:09 -0500
X-MC-Unique: DGjjcRbdO3qWuqfJKshweg-1
Received: by mail-wr1-f72.google.com with SMTP id y4-20020adfd084000000b00186b16950f3so1116749wrh.14
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 08:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fA0i4I2sJQvNiM1THao7+ZG2wZ9nUHKTkW18M399t/8=;
        b=bpIWydLz0iv1tJz/GqrKzlsDBPXyQG5IlAf4yh9MUBpMXwgs1tObq7YJVNwWoBaJfk
         mhMixXX9gmewfmmTXZ/4s9R7DCe+IIyj55asSXCcY3YGFHOAWbrwN0fxJiQLRxnbW4M+
         3QinwFeVZ+7PvsI929PO0i6XNr0KqlwpSR2419kvLD41RD07KD2BGLqI/D9Pwkx2kvBB
         4x3qAZkDxmy9cAIT3gmVQ163K16Z9qdp2K8e7mPIsouLp0tMELtu3iADWXYVybIoq8tq
         uFT5VuB1gul/QgPyYF3fzhja+4hPd0sgHGH9ItWUyjWwtMxFHxoT/eFZdZKg6WlXNmuf
         iIlw==
X-Gm-Message-State: AOAM530BTu4l1tIPONvE4TRsCFU9uRKHeUrH+gNtu7oV+nmUxLhcodcm
        RE4zMA5tb44Q1CsfJ45kxxXq45NuZFXqshxhkFlxbyli5Ola6aIUYdY3RVcGhMH5ZFbQpFpkUIW
        UCau4QXwQro5UVESlOtW3
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr10340642wrx.173.1636649168169;
        Thu, 11 Nov 2021 08:46:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKRZDaiYOBTv5xC4SSYkhznLpliqsStYNu35LyQ+ZrmZjgf7f0+en9CTvLiG3noAEvPWA86w==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr10340607wrx.173.1636649167942;
        Thu, 11 Nov 2021 08:46:07 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
        by smtp.gmail.com with ESMTPSA id z12sm3408376wrv.78.2021.11.11.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:46:07 -0800 (PST)
Date:   Thu, 11 Nov 2021 11:46:03 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, jie.deng@intel.com, viresh.kumar@linaro.org,
        conghui.chen@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211111114434-mutt-send-email-mst@kernel.org>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-2-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111160412.11980-2-vincent.whitchurch@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 11, 2021 at 05:04:11PM +0100, Vincent Whitchurch wrote:
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

Acked-by: Michael S. Tsirkin <mst@redhat.com>

For an eventual fix, I think you'd have to reset the device,
then you can get free up the outstanding buffers.
This has to be done carefully to make sure it does
not race with interrupts and/or new requests, typically
not easy.

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
>  
> -	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count, !time_left);
> +	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count);
>  
>  err_free:
>  	kfree(reqs);
> -- 
> 2.28.0

