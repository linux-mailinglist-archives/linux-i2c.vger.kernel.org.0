Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E6144DADB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 17:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhKKRA2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 12:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29643 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229710AbhKKRA2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 12:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636649858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4nnuPe2lK5wahIQd1KXZIXGUVFrD/7Ht6SqdOl/REkM=;
        b=bWXyNueY5iSgIihPm9Yyzun7t4nYazHRnALUZ/49Ey9W8JZxgjGWs0WxtpHn28lgsNfe+o
        9n5BPfqqnkRMfaqXGxVnx6QPtTPln9QohDVReVfXF2oTwn4E0OrGLZkhdnyTYTtpyozziw
        Y6hfZgwc39D9vl/SLfoYNm+45tRZI+g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-x5lwav-iNDK9N0WdyWMerw-1; Thu, 11 Nov 2021 11:57:37 -0500
X-MC-Unique: x5lwav-iNDK9N0WdyWMerw-1
Received: by mail-ed1-f72.google.com with SMTP id h18-20020a056402281200b003e2e9ea00edso5890677ede.16
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 08:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4nnuPe2lK5wahIQd1KXZIXGUVFrD/7Ht6SqdOl/REkM=;
        b=o2FpZvu5COYQWc/+/Ze8TDM4PK+ikJn13xv0HuyGo7ehdMbTKjxXjnjuZhP/lrPvKv
         iUrm2nCXdcibtfwUAOKPliTrYXm9ePqXtaQm5k55qIRZmwXtupqISTXGOJavlm/bMiT0
         W15+zLgCWCKgKgwUW0unR9EfoMHUmfN60MDQvGsJvUyNFvtXdmt59RLAdxkLU+O6qDGq
         +s3YceTfwl+8Gobzll7Knbp9Bry3L6s+8oUXAoGrn+/bS7tard/Dr+b48NF+q1GTaOsM
         wqDo8w+XUSNVEj4wSp/H6OwFngc54V81NuU2oZw2hoFgP6f4LuZRS/SnZvLpWbDyYAKV
         X1KQ==
X-Gm-Message-State: AOAM532xH3uwGGP77h3IXwOzRsHTR1CBuHBTi+jvt2M//iMpQqa3YMiK
        4nBMBpBaKigpCl/cCKYUDLO6Y9j0VN7coeNvh7yJJG7Ds9f1uqldxwxFcHFWPGS1nZQv+r0HFyb
        7Nuyiztuo6p0/0x9vDOxV
X-Received: by 2002:a05:6402:28e:: with SMTP id l14mr11582153edv.162.1636649855624;
        Thu, 11 Nov 2021 08:57:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7ECgB9KZKxo539pDYD4hDXKyd4DrqxPiQKOXusMT5WUd1v2H70mZt+EG9F2Disk7HjImsLg==
X-Received: by 2002:a05:6402:28e:: with SMTP id l14mr11582109edv.162.1636649855310;
        Thu, 11 Nov 2021 08:57:35 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
        by smtp.gmail.com with ESMTPSA id gt18sm1669994ejc.46.2021.11.11.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:57:34 -0800 (PST)
Date:   Thu, 11 Nov 2021 11:57:30 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, jie.deng@intel.com, viresh.kumar@linaro.org,
        conghui.chen@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 2/2] i2c: virtio: fix completion handling
Message-ID: <20211111114630-mutt-send-email-mst@kernel.org>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-3-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111160412.11980-3-vincent.whitchurch@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 11, 2021 at 05:04:12PM +0100, Vincent Whitchurch wrote:
> The driver currently assumes that the notify callback is only received
> when the device is done with all the queued buffers.
> 
> However, this is not true, since the notify callback could be called
> without any of the queued buffers being completed (for example, with
> virtio-pci and shared interrupts) or with only some of the buffers being
> completed (since the driver makes them available to the device in
> multiple separate virtqueue_add_sgs() calls).
> 
> This can lead to incorrect data on the I2C bus or memory corruption in
> the guest if the device operates on buffers which are have been freed by
> the driver.  (The WARN_ON in the driver is also triggered.)
> 
>  BUG kmalloc-128 (Tainted: G        W        ): Poison overwritten
>  First byte 0x0 instead of 0x6b
>  Allocated in i2cdev_ioctl_rdwr+0x9d/0x1de age=243 cpu=0 pid=28
>  	memdup_user+0x2e/0xbd
>  	i2cdev_ioctl_rdwr+0x9d/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
>  Freed in i2cdev_ioctl_rdwr+0x1bb/0x1de age=68 cpu=0 pid=28
>  	kfree+0x1bd/0x1cc
>  	i2cdev_ioctl_rdwr+0x1bb/0x1de
>  	i2cdev_ioctl+0x247/0x2ed
>  	vfs_ioctl+0x21/0x30
>  	sys_ioctl+0xb18/0xb41
> 
> Fix this by calling virtio_get_buf() from the notify handler like other
> virtio drivers and by actually waiting for all the buffers to be
> completed.
> 
> Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  drivers/i2c/busses/i2c-virtio.c | 34 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index 7b2474e6876f..2d3ae8e238ec 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -22,24 +22,24 @@
>  /**
>   * struct virtio_i2c - virtio I2C data
>   * @vdev: virtio device for this controller
> - * @completion: completion of virtio I2C message
>   * @adap: I2C adapter for this controller
>   * @vq: the virtio virtqueue for communication
>   */
>  struct virtio_i2c {
>  	struct virtio_device *vdev;
> -	struct completion completion;
>  	struct i2c_adapter adap;
>  	struct virtqueue *vq;
>  };
>  
>  /**
>   * struct virtio_i2c_req - the virtio I2C request structure
> + * @completion: completion of virtio I2C message
>   * @out_hdr: the OUT header of the virtio I2C message
>   * @buf: the buffer into which data is read, or from which it's written
>   * @in_hdr: the IN header of the virtio I2C message
>   */
>  struct virtio_i2c_req {
> +	struct completion completion;
>  	struct virtio_i2c_out_hdr out_hdr	____cacheline_aligned;
>  	uint8_t *buf				____cacheline_aligned;
>  	struct virtio_i2c_in_hdr in_hdr		____cacheline_aligned;
> @@ -47,9 +47,11 @@ struct virtio_i2c_req {
>  
>  static void virtio_i2c_msg_done(struct virtqueue *vq)
>  {
> -	struct virtio_i2c *vi = vq->vdev->priv;
> +	struct virtio_i2c_req *req;
> +	unsigned int len;
>  
> -	complete(&vi->completion);
> +	while ((req = virtqueue_get_buf(vq, &len)))
> +		complete(&req->completion);
>  }
>  
>  static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
> @@ -69,6 +71,8 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
>  		if (!msgs[i].len)
>  			break;
>  
> +		init_completion(&reqs[i].completion);
> +
>  		/*
>  		 * Only 7-bit mode supported for this moment. For the address
>  		 * format, Please check the Virtio I2C Specification.
> @@ -108,21 +112,13 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>  				    struct virtio_i2c_req *reqs,
>  				    struct i2c_msg *msgs, int num)
>  {
> -	struct virtio_i2c_req *req;
>  	bool failed = false;
> -	unsigned int len;
>  	int i, j = 0;
>  
>  	for (i = 0; i < num; i++) {
> -		/* Detach the ith request from the vq */
> -		req = virtqueue_get_buf(vq, &len);
> +		struct virtio_i2c_req *req = &reqs[i];
>  
> -		/*
> -		 * Condition req == &reqs[i] should always meet since we have
> -		 * total num requests in the vq. reqs[i] can never be NULL here.
> -		 */
> -		if (!failed && (WARN_ON(req != &reqs[i]) ||
> -				req->in_hdr.status != VIRTIO_I2C_MSG_OK))
> +		if (!failed && req->in_hdr.status != VIRTIO_I2C_MSG_OK)
>  			failed = true;
>  
>  		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> @@ -158,11 +154,13 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	 * remote here to clear the virtqueue, so we can try another set of
>  	 * messages later on.
>  	 */
> -
> -	reinit_completion(&vi->completion);
>  	virtqueue_kick(vq);
>  
> -	wait_for_completion(&vi->completion);
> +	/*
> +	 * We only need to wait for the last one since the device is required
> +	 * to complete requests in order.
> +	 */

Hmm the spec only says:

    A device MUST guarantee the requests in the virtqueue being processed in order
    if multiple requests are received at a time.

it does not seem to require using the buffers in order.
In any case, just waiting for all of them in a loop
seems cleaner and likely won't take longer ...


> +	wait_for_completion(&reqs[count - 1].completion);
>  
>  	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count);
>  
> @@ -211,8 +209,6 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
>  	vdev->priv = vi;
>  	vi->vdev = vdev;
>  
> -	init_completion(&vi->completion);
> -
>  	ret = virtio_i2c_setup_vqs(vi);
>  	if (ret)
>  		return ret;
> -- 
> 2.28.0

