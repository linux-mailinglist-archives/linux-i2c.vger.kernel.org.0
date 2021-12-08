Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E3E46DCB0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 21:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhLHULM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 15:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25952 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234110AbhLHULM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Dec 2021 15:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638994060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AqVrYQB6IYThObwYsN3Ysnelbtxn76UrY966KqMR9l4=;
        b=DZrgJVksP/3HY3P6v9XsYFMuAFCBjaMo1SrSU4h9BjzjZG2iVO7erSnSDA+v4/fZikI6zA
        e5pV3+wir+yC41CKjCPPBtH/8vYm5rLtbmZaeJReG1cbU+gXI1+xKVpweWWjodEBXJVEX+
        C8xiIyx9GOvh/H2j7Hb/yshK5uAChkg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-P45n4v4UOryUu73Oap22_A-1; Wed, 08 Dec 2021 15:07:39 -0500
X-MC-Unique: P45n4v4UOryUu73Oap22_A-1
Received: by mail-wr1-f72.google.com with SMTP id d3-20020adfa343000000b0018ed6dd4629so677577wrb.2
        for <linux-i2c@vger.kernel.org>; Wed, 08 Dec 2021 12:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AqVrYQB6IYThObwYsN3Ysnelbtxn76UrY966KqMR9l4=;
        b=AdEFwKufhXSMFLZLfwllPagdqAs2zB92RZ0WYvMuECOZpbQyKYk9rkPNDbtv151lgP
         MQ9rH2+4/eKZ76qV9K7f+Lfn8nJefpmolDgzchtMsXCl8RkczlWENxNA6VfsdDnEap8e
         3YdC0H13e3MOXfRpbTIJTTuNBLCFLFdofqMyjAQBw0N3gdX5QGu6rnnk72AT5N10Q1qg
         lGK4r4dup9O9HgxBespqR9/BE/dsoTBjUAfCk0O1vQBwCRhI0rz/jgXbGUDSIoiB8qUq
         6cIJY5NhJidY1+Zy8p0e2lqaghFfQuOu5pOmGcfcCKsRQJ7Qmew5K0EwJPDPXnAiQ2PU
         zFAw==
X-Gm-Message-State: AOAM531YVR95aOr5IE1QYTvOUt3xjEQ34f0Aelnc6egM68GcThLnYV24
        KzCi3lUTECmKzEWVhZ1SuggugH186NY459UZysAc4Ivk72ziWs06l6sg8rHu9WePReT0cXa5mMo
        Tq/whq3pgjH+8apdhlwYZ
X-Received: by 2002:a05:6000:1862:: with SMTP id d2mr991539wri.251.1638994056995;
        Wed, 08 Dec 2021 12:07:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMe+OzBN7ps64fhjV4As/puLs1aM8Ikcm/yhU0jchXPrem/2NmGhLT+fDCWXYyROGgDBpnPA==
X-Received: by 2002:a05:6000:1862:: with SMTP id d2mr991498wri.251.1638994056674;
        Wed, 08 Dec 2021 12:07:36 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
        by smtp.gmail.com with ESMTPSA id t8sm3824236wrv.30.2021.12.08.12.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:07:36 -0800 (PST)
Date:   Wed, 8 Dec 2021 15:07:31 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>, kernel@axis.com,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: virtio: fix completion handling
Message-ID: <20211208150710-mutt-send-email-mst@kernel.org>
References: <20211202153215.31796-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202153215.31796-1-vincent.whitchurch@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 02, 2021 at 04:32:14PM +0100, Vincent Whitchurch wrote:
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

Acked-by: Michael S. Tsirkin <mst@redhat.com>

who's queueing this?

> ---
> 
> Notes:
>     v3: Wait for all completions instead of only the last one.
>     v2: Add Acked-by and Fixes tags.
> 
>  drivers/i2c/busses/i2c-virtio.c | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index 95378780da6d..41eb0dcc3204 100644
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
> @@ -62,6 +64,8 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
>  	for (i = 0; i < num; i++) {
>  		int outcnt = 0, incnt = 0;
>  
> +		init_completion(&reqs[i].completion);
> +
>  		/*
>  		 * Only 7-bit mode supported for this moment. For the address
>  		 * format, Please check the Virtio I2C Specification.
> @@ -106,21 +110,15 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
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
> +		wait_for_completion(&req->completion);
> +
> +		if (!failed && req->in_hdr.status != VIRTIO_I2C_MSG_OK)
>  			failed = true;
>  
>  		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> @@ -156,12 +154,8 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	 * remote here to clear the virtqueue, so we can try another set of
>  	 * messages later on.
>  	 */
> -
> -	reinit_completion(&vi->completion);
>  	virtqueue_kick(vq);
>  
> -	wait_for_completion(&vi->completion);
> -
>  	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count);
>  
>  err_free:
> @@ -210,8 +204,6 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
>  	vdev->priv = vi;
>  	vi->vdev = vdev;
>  
> -	init_completion(&vi->completion);
> -
>  	ret = virtio_i2c_setup_vqs(vi);
>  	if (ret)
>  		return ret;
> -- 
> 2.33.1

