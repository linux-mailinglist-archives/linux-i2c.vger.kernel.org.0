Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC233BB676
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 06:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhGEElW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 00:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhGEElV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 00:41:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3A8C061574
        for <linux-i2c@vger.kernel.org>; Sun,  4 Jul 2021 21:38:44 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l11so10966706pji.5
        for <linux-i2c@vger.kernel.org>; Sun, 04 Jul 2021 21:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9P2iB/sAd1xmJMgbCZUej24RLFJsagtt1uS0tyR4q8M=;
        b=w2USAZ+ILD7DA3N5p2ftBJv8i0VXUjV8GESTg1sd/GdNGz+szkvOBjCkqy4uieeacq
         yuHsKRxPBIfIuNdpT9RHjEcwAlVMrrBeDSXZOcXLwoYnQ2q00DBngXc8dKIP/tE7R+Cl
         ql5k6+AyoWcCAEa/PdZWeI4ReVBr8J0bXlZBpZaChM3YI3jQ00sU3WRyU5xwSWAUPdv8
         FA0cuLoHurAmzUXeKsIqWjlcR3Z3mSYDgM1+TaHxgmc7ZQK3su9Y2A9/SNzG1b7283hi
         8+WcSc0ow4mNoffPvJFFgyvCVhdMqpBdp8np/3HfPnVBWqCgU8GxOuvBf/53g2p9QeOD
         LWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9P2iB/sAd1xmJMgbCZUej24RLFJsagtt1uS0tyR4q8M=;
        b=cIwuJSIgXQL2bT1XnTakEZCIOcYLKocAfHHR+BRjg51hhyi+XRxAzIU3GLs5UonLj/
         A4zdwSqeZZxPjAhYUqHr8jJQp1jpGXQxwfovpCpkBryHQPHXytlPvvApC2yzGMSK+ORj
         /vGXcrsH7fp3kX+5mZAVlxV0csl3MB0+RVToW9myK+OUJaW1uTXbOF3RVdlFyQHpUeWv
         ByFhEoEWjO+ct4slzoyEwznwQ2HzMu08b5zCHM3ov9bE5qfmiOaANtTSGVWM6Ti9vLTh
         lFjABpX6DXTa6tY8g/NRdh2Tm/N7t+w49WEVnXLBWgo9Dh5iptCSrn7bXH07rlR2/vq6
         GJsg==
X-Gm-Message-State: AOAM531kEKVr1vVKsbPUTIYZzemYeeWA76AS1dFcG4DODNwzvqg7bUBe
        tRdGtIMLCqfqolTQ+78RnwIroQ==
X-Google-Smtp-Source: ABdhPJwEBRMtpmK0GGKvqO/i6O1rTEesHaW5t2Hr81oWZpzVJ53bBl9mHEGFdTTK+WdlprJcqIzZcQ==
X-Received: by 2002:a17:90a:8e82:: with SMTP id f2mr13568598pjo.177.1625459924145;
        Sun, 04 Jul 2021 21:38:44 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id l12sm10902491pff.105.2021.07.04.21.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 21:38:43 -0700 (PDT)
Date:   Mon, 5 Jul 2021 10:08:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705043841.zujwo672nfdndpg2@vireshk-i7>
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <20210705024056.ndth2bwn2itii5g3@vireshk-i7>
 <332af2be-0fb0-a846-8092-49d496fe8b6b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <332af2be-0fb0-a846-8092-49d496fe8b6b@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-07-21, 11:45, Jie Deng wrote:
> On 2021/7/5 10:40, Viresh Kumar wrote:
> > On 02-07-21, 16:46, Jie Deng wrote:
> > The right way of doing this is is making this function return - Error on failure
> > and 0 on success. There is no point returning number of successful additions
> > here.
> 
> 
> We need the number for virtio_i2c_complete_reqs to do cleanup. We don't have
> to
> 
> do cleanup "num" times every time. Just do it as needed.

If you do full cleanup here, then you won't required that at the caller site.

> > Moreover, on failures this needs to clean up (free the dmabufs) itself, just
> > like you did i2c_put_dma_safe_msg_buf() at the end. The caller shouldn't be
> > required to handle the error cases by freeing up resources.
> 
> 
> This function will return the number of requests being successfully prepared
> and make sure
> 
> resources of the failed request being freed. And virtio_i2c_complete_reqs
> will free the
> 
> resources of those successful request.

It just looks cleaner to give such responsibility to each and every function,
i.e. if they fail, they should clean stuff up instead of the caller. That's the
normal philosophy you will find across kernel in most of the cases.
 
> > > +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> > > +				    struct virtio_i2c_req *reqs,
> > > +				    struct i2c_msg *msgs, int nr,
> > > +				    bool fail)
> > > +{
> > > +	struct virtio_i2c_req *req;
> > > +	bool failed = fail;
> > > +	unsigned int len;
> > > +	int i, j = 0;
> > > +
> > > +	for (i = 0; i < nr; i++) {
> > > +		/* Detach the ith request from the vq */
> > > +		req = virtqueue_get_buf(vq, &len);
> > > +
> > > +		/*
> > > +		 * Condition (req && req == &reqs[i]) should always meet since
> > > +		 * we have total nr requests in the vq.
> > > +		 */
> > > +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
> > > +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> > What about writing this as:
> > 
> > 		if (!failed && (WARN_ON(req != &reqs[i]) ||
> > 		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> > 
> > We don't need to check req here since if req is NULL, we will not do req->in_hdr
> > at all.
> 
> 
> It's right here just because the &reqs[i] will never be NULL in our case.
> But if you see
> 
> "virtio_i2c_complete_reqs" as an independent function, you need to check the
> 
> req. From the perspective of the callee, you can't ask the caller always
> give you
> 
> the non-NULL parameters.

We need to keep this driver optimized in its current form. If you see your own
argument here, then why don't you test vq or msgs for a valid pointer ? And even
reqs.

If we know for certain that this will never happen, then it should be optimized.
But if you see a case where reqs[i] can be NULL here, then it would be fine.

> And some tools may give warnings.

I don't see why a tool will raise an error here and if it does, then the tool is
buggy and not the driver. And we don't need to take care of that.

-- 
viresh
