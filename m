Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74443467132
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 05:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235629AbhLCEmp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 23:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbhLCEmp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 23:42:45 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECB1C061757
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 20:39:21 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id f125so1924312pgc.0
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 20:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OcPdj+R92LM+0ZI0wmyCsSW46rzlUsrsE3LQQ/iEpLE=;
        b=dBx99xt9ShaVFEHeymStBpp3iQP2Pd4gcfLkcVUqJ51OiRwy283uuc+wXxjnuh5TRT
         XLuB2ZOWRzZJc1rFq/U1CatDfpn2yM5dM9335x3YCeZgZuRYxBwXnkOI7mdCi+j9iv3/
         st8uatwl7bGGU6kchQ+vpyziRshakjMSllwWn2P8cEvHnB/aikDe6LFq0As/ZyclNFS+
         DfUUTOvq0O9a6o4qxfONFuqK81srsX+D6BeQ8PvfxMdCGmd4+0HWDeC3c146CsUigE6G
         S9aFXC7vr1ETdAAbooJxFIebB8dXtZo1z587/GVTcd0vOTeuZxtnNrMOSeO0gJ+HiBA/
         RUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OcPdj+R92LM+0ZI0wmyCsSW46rzlUsrsE3LQQ/iEpLE=;
        b=rn4jDA44Px1BJb5Rc9jJ1OXqIF1La1eKzqTJVHMD9QcDpfSRcv3URGPyPaf4BRg2jw
         C4x9fFbHE2hTfwNNf1BG83KDziatt+eehVfO1ywN5tsJQwGg9RpDRQSVudR4Z/UwmymP
         u5iU8yK3oJMYUB9x+ptD5adKbN1WXHZzip8kkcvflnOPysrSFE+PWr6uPZr7PB6iI1Oe
         97aEGAoFvggGOAyACu9mLy21F7K1EiIl4yRxxzku/eUAbdO0NiR/Huo0fghVX6TH4B4c
         WNKGXk+C+5neZqo+nqKACfPsReMUs7uqH6MD/iMdkjobNFzwr3EY5ZID9ZflhwTz1GhC
         HyuQ==
X-Gm-Message-State: AOAM53138Ta6rdQQmaST1Md3DWRpn2+eRee8WCEeryXo16ZPp84TmQ4b
        SLfMgucXJMT9xUwLRtAiQdJZrQ==
X-Google-Smtp-Source: ABdhPJx3r5/a3LSEpyJfO3oVjqbl62c8FXOn/xd99G1hXtUmAXrpEYkc/n2bP7s/+FAWNOZxxXXI9A==
X-Received: by 2002:aa7:9d81:0:b0:49f:e072:bfc7 with SMTP id f1-20020aa79d81000000b0049fe072bfc7mr16975671pfq.48.1638506360976;
        Thu, 02 Dec 2021 20:39:20 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id p2sm924575pja.55.2021.12.02.20.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 20:39:20 -0800 (PST)
Date:   Fri, 3 Dec 2021 10:09:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, Conghui Chen <conghui.chen@intel.com>,
        kernel@axis.com, Jie Deng <jie.deng@intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: virtio: fix completion handling
Message-ID: <20211203043917.z4njhql4y43tcbew@vireshk-i7>
References: <20211202153215.31796-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202153215.31796-1-vincent.whitchurch@axis.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-12-21, 16:32, Vincent Whitchurch wrote:
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
> 
> Notes:
>     v3: Wait for all completions instead of only the last one.

LGTM, thanks.

-- 
viresh
