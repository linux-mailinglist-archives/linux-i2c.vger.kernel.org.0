Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A985D4330CE
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 10:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhJSIL3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 04:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbhJSIL3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 04:11:29 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D690C061749
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 01:09:16 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r2so18618178pgl.10
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 01:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gj+IjdwtpSoU7uXOoxinPHHGnAi13nWqEOcSDstepQk=;
        b=F3ZWHZrZGIo4fL4XNTI5PKIk2fc+8OHzj4mZeLmgAUHn+40G6TRfdl2q2peQ5dX1d0
         boz4hwjWY4imzL3aipUGIUhwrTsMIoelvjqp2GMEret6+qnUsBIkXhnEFuWfcFViizgr
         7gmo1RJcAJPGc4HvDfxxjYTDiGnN79mSlhkSI0gB8HfT5T0rnkZW6STiavTMFf2hAyva
         u7/ZW8iRALoIpfm2vMxhveqHSO8N9PwWBMnc6k+tc4qEkE8sH4CkhmpF9n1NtgFzDwe6
         Ms9VJGvhA+4cJ97hJRAHKYgtghKmyVTJD563R2hhbAYD5bhImnMygnxjASZFmIu2niRi
         a4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gj+IjdwtpSoU7uXOoxinPHHGnAi13nWqEOcSDstepQk=;
        b=y/8w+cni9L9d9PtTl3oPqVRo/0LhhZIpV90aql6XFTwdV3uBhRed7VhrEQ3aHiNIxk
         tS6qCQOo/eDMV6AkHQO2De7jCFNCen0ghtK74qcStA5mYBZPUvHr5/X3Acf5HDWbCV0i
         j21d4NQ7OGCyBj581yXzUbcok9dDVpZ2cBvxAwKJrt1v+yES1sRW05yEpJqk1HcIdH3t
         mk1R8PxTEV3OGI73HN7SMJ2mE/t/wY0rfChZMt4lO4RGfnu5tVjbBgiNnQisrPCwv/Wz
         eyIi8dwDFGD3Wjp5JgJi9c4bivZk6MopfXUgO7ZRy8Yf++I7dTEOtzv0kKQlkFue+KuF
         w6EA==
X-Gm-Message-State: AOAM5330ZJysJLwFhrfK5t9cRsg133m/XsYzTS8hX6/pws2tx4HPh+JB
        j6NybEDOl/m/4FuTMv68fY45lQ==
X-Google-Smtp-Source: ABdhPJz5JKUnGVnJdr/vOWsWzz9hNwGVMVhXP2Wre7zIFrVbrX2b84fVwC13u/6EoqaE4W9pCK83xA==
X-Received: by 2002:a63:7b1e:: with SMTP id w30mr8237662pgc.464.1634630956083;
        Tue, 19 Oct 2021 01:09:16 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id ls7sm1831782pjb.16.2021.10.19.01.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 01:09:14 -0700 (PDT)
Date:   Tue, 19 Oct 2021 13:39:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        gregkh@linuxfoundation.org
Cc:     wsa@kernel.org, jie.deng@intel.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019074647.19061-2-vincent.whitchurch@axis.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Greg.

On 19-10-21, 09:46, Vincent Whitchurch wrote:
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

That is a very valid problem, and I have faced it too when my QEMU
setup is very slow :)

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

Doing this may not be a good thing based on the kernel rules I have
understood until now. Maybe Greg and Wolfram can clarify on this.

We are waiting here for an external entity (Host kernel) or a firmware
that uses virtio for transport. If the other side is hacked, it can
make the kernel hang here for ever. I thought that is something that
the kernel should never do.

-- 
viresh
