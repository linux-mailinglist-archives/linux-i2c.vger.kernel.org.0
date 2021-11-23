Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D252459F93
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 10:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbhKWJ5l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 04:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhKWJ5j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Nov 2021 04:57:39 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D52BC061714
        for <linux-i2c@vger.kernel.org>; Tue, 23 Nov 2021 01:54:31 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so1661591pju.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Nov 2021 01:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QSCZCVIM5tro7T7torOdfwmS3vTxofOoggZZ/saqbOU=;
        b=dv4lkXZuDXaNbEHrE2JqIa+zynhkxLOVE+c2MdRNeWLH/gsLT1pUoR6aZMXcChVTbB
         Gi2MEo9otlCa9TI1uVIvKEV8rAv3d5Ge/qKl9s6pXRkchmosDcXHg7ZEjqF+rOGz9AOS
         68gMFp1eXrcx6zTfrZP7V+LFKIAZ0jz6ctV6AgCvrZcrjUtQbDSW0a0MHptEeqNZPyhd
         lAdRajDBuGmdwJCgjwtzVEEjqVMHDWm6+yfUCfcUrYSHtd2vo7VU6HxPPYMtozcSGvFJ
         JWZbJWbGIIeiPDj+SdlxcmCqvFVAKJJDz4csPvZWli5j2UH3qDCqji26dlM1XaBL/5NC
         hYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QSCZCVIM5tro7T7torOdfwmS3vTxofOoggZZ/saqbOU=;
        b=D9tjh5yESp85ziGx+S65/xnKTBY86o9osqTWAMcmASrN+Ee4c/gxRkvI9OybNZz6lH
         2d4CRmVHXlfoZmE5Dz3UqgwDh+lsgQ2R1LENg/kV9DqgDd99pi9HllihKVdGFN+AfgTA
         8gQI9BhFSgr2nf8/zI03wVK2I3+nqEd45qJu5Zi7XKcdo7bFnhi9OBb209kpUmicDTS9
         1nYvj61ja2OT7sYnvnHvJZv1MqAL7NRfuOofPwlg0u65Hp2ubhSCJTmNZfq0jdm5HnCZ
         ud5gBYV/zmSt82Mcb2W5vF0gmZht1bFnQJ70jGjVnZ8knXXy9SlC4SpHd/nKF6yfdENe
         MXNw==
X-Gm-Message-State: AOAM530CDJsSGCr4dvI2YW6PN82lffzsXQHyBxlDfjS+sD5A66Mt4VnK
        BsVQkxQD5CdGo98UpF9RDfh2jg==
X-Google-Smtp-Source: ABdhPJwdbNswCrtvOdTklSGcl6W911admnD+WhCQoNtyWIgfzuZqHJUqyKRHgoe7ig4Trjt4mbT0eg==
X-Received: by 2002:a17:902:a40f:b0:143:d470:d66d with SMTP id p15-20020a170902a40f00b00143d470d66dmr5481723plq.52.1637661271149;
        Tue, 23 Nov 2021 01:54:31 -0800 (PST)
Received: from localhost ([122.181.57.99])
        by smtp.gmail.com with ESMTPSA id h6sm13770515pfh.82.2021.11.23.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 01:54:30 -0800 (PST)
Date:   Tue, 23 Nov 2021 15:24:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, conghui.chen@intel.com, mst@redhat.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211123095428.ke63esylaldgrfus@vireshk-i7>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-2-vincent.whitchurch@axis.com>
 <YZy5xVU4XHEaz+EL@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZy5xVU4XHEaz+EL@kunai>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23-11-21, 10:52, Wolfram Sang wrote:
> On Thu, Nov 11, 2021 at 05:04:11PM +0100, Vincent Whitchurch wrote:
> > If a timeout is hit, it can result is incorrect data on the I2C bus
> > and/or memory corruptions in the guest since the device can still be
> > operating on the buffers it was given while the guest has freed them.
> > 
> > Here is, for example, the start of a slub_debug splat which was
> > triggered on the next transfer after one transfer was forced to timeout
> > by setting a breakpoint in the backend (rust-vmm/vhost-device):
> > 
> >  BUG kmalloc-1k (Not tainted): Poison overwritten
> >  First byte 0x1 instead of 0x6b
> >  Allocated in virtio_i2c_xfer+0x65/0x35c age=350 cpu=0 pid=29
> >  	__kmalloc+0xc2/0x1c9
> >  	virtio_i2c_xfer+0x65/0x35c
> >  	__i2c_transfer+0x429/0x57d
> >  	i2c_transfer+0x115/0x134
> >  	i2cdev_ioctl_rdwr+0x16a/0x1de
> >  	i2cdev_ioctl+0x247/0x2ed
> >  	vfs_ioctl+0x21/0x30
> >  	sys_ioctl+0xb18/0xb41
> >  Freed in virtio_i2c_xfer+0x32e/0x35c age=244 cpu=0 pid=29
> >  	kfree+0x1bd/0x1cc
> >  	virtio_i2c_xfer+0x32e/0x35c
> >  	__i2c_transfer+0x429/0x57d
> >  	i2c_transfer+0x115/0x134
> >  	i2cdev_ioctl_rdwr+0x16a/0x1de
> >  	i2cdev_ioctl+0x247/0x2ed
> >  	vfs_ioctl+0x21/0x30
> >  	sys_ioctl+0xb18/0xb41
> > 
> > There is no simple fix for this (the driver would have to always create
> > bounce buffers and hold on to them until the device eventually returns
> > the buffers), so just disable the timeout support for now.
> > 
> > Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
> > Acked-by: Jie Deng <jie.deng@intel.com>
> > Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> 
> Applied to for-current, thanks!
> 

Thanks, I completely forgot replying to the last email from Vincent.

FWIW,

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
