Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DD33BB730
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 08:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhGEGdm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 02:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhGEGdm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 02:33:42 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FB5C061760
        for <linux-i2c@vger.kernel.org>; Sun,  4 Jul 2021 23:31:06 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d12so15850605pfj.2
        for <linux-i2c@vger.kernel.org>; Sun, 04 Jul 2021 23:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wWMXmMCJoSZ9OCdipGCDRnC3WjS629PoEJ5rr2yZGV4=;
        b=DkNMSvM96dm/AcUPUGEq9JBeaCg2RBULAlZIqhkyanmq/ooofwovzz1sIYEjs873Hy
         hfEBAN6RtF0t5J86yneotbcmbmZzq0O3hj4ZljjxrqTM3IXpQJrnodt+Xb5GgW6QQe5p
         cIrHyv3lrAXb2qZ14efevI+sKddKGnFRJFyEpvM1+7pWINYIv2NA0Ce9O75/33njDL7i
         y99Glt8+3v+1ZCUoIR0bAnLi+lVKclqr98EkceNpSYW47BaMMJOf+0gM8qLTxP4qANrk
         0EmPbLfPMNYyqnfq7aL56vC+OAJzTbQezhjtY0qK4Plk1T8ysZclL44NmcpHZloPEw66
         ItJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wWMXmMCJoSZ9OCdipGCDRnC3WjS629PoEJ5rr2yZGV4=;
        b=pv7iLRXkR/OUtDKgta+ezvEVJ+de9Wxz+3eDsfbsW+fj8XbvXjNy8sR+BeKQuMac39
         ui4sunKqIMKQ4/JEFtlTIa725T4XlJRWFl1Tt6yoU2yE0Ux5YK3OshJgjy7AJvLywD2K
         OYXjaScei8NjI+/yAgPalEZkJn+bIQzhDCOULocgL6fKus/Gr8IwNkEd9npzbXDS0jpT
         hbfi8StyBoL+f6y7BMN/+5uD8chJwJpXp/XqKAJI95rmdJ2vC0hTjTyzuTPkEWm6RyRV
         XPLI+c5Yn2+M1xzXh/mG77kFUjJakim+Gmt3BSqPiDtSRi9+ZVg5mtlH7FeMxtg0JzzK
         G54A==
X-Gm-Message-State: AOAM5325QUoPNwdwM9h2XwXD2v/J+sLWdBHx3P3I9nwDIraXIqt4oUuv
        tX/0ZsPGAYlh7/xmB7jXtsJDGA==
X-Google-Smtp-Source: ABdhPJwjbeDpEwUGHX4wapdtd68i1JUGbnqyQuUWmDrUGIl18KntYn+5LqFO42LZddC9cRK1RvizQQ==
X-Received: by 2002:a63:5a5b:: with SMTP id k27mr1117953pgm.294.1625466665652;
        Sun, 04 Jul 2021 23:31:05 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id z20sm13337396pgk.36.2021.07.04.23.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 23:31:05 -0700 (PDT)
Date:   Mon, 5 Jul 2021 12:01:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, stefanha@redhat.com
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705063103.4gnrnx6qwheq37lp@vireshk-i7>
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
 <20210705024340.mb5sv5epxbdatgsg@vireshk-i7>
 <adb5a18f-cf48-3059-5541-fb6d7bafb8d2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adb5a18f-cf48-3059-5541-fb6d7bafb8d2@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-07-21, 14:21, Jie Deng wrote:
> 
> On 2021/7/5 10:43, Viresh Kumar wrote:
> > On 02-07-21, 12:58, Andy Shevchenko wrote:
> > > On Fri, Jul 02, 2021 at 04:46:47PM +0800, Jie Deng wrote:
> > > > +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> > > > +				    struct virtio_i2c_req *reqs,
> > > > +				    struct i2c_msg *msgs, int nr,
> > > > +				    bool fail)
> > > > +{
> > > > +	struct virtio_i2c_req *req;
> > > > +	bool failed = fail;
> > Jie, you can actually get rid of this variable too. Jut rename fail to failed
> > and everything shall work as you want.
> 
> 
> Oh, You are not right. I just found we can't remove this variable. The
> "fail" and "failed" have different
> 
> meanings for this function. We need fail to return the result.

Ahh, yes. You are right. Maybe rename fail to timedout, it would make it more
readable, else fail and failed look very similar.
 
> > > > +	unsigned int len;
> > > > +	int i, j = 0;
> > > > +
> > > > +	for (i = 0; i < nr; i++) {
> > > > +		/* Detach the ith request from the vq */
> > > > +		req = virtqueue_get_buf(vq, &len);
> > > > +
> > > > +		/*
> > > > +		 * Condition (req && req == &reqs[i]) should always meet since
> > > > +		 * we have total nr requests in the vq.
> > > > +		 */
> > > > +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
> > > > +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> > > > +			failed = true;
> > > ...and after failed is true, we are continuing the loop, why?
> > Actually this function can be called with fail set to true. We proceed as we
> > need to call i2c_put_dma_safe_msg_buf() for all buffers we allocated earlier.
> > 
> > > > +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> > > > +		if (!failed)
> > > > +			++j;
> > > Besides better to read j++ the j itself can be renamed to something more
> > > verbose.
> > > 
> > > > +	}
> > > > +	return (fail ? -ETIMEDOUT : j);
> > > Redundant parentheses.
> > > 
> > > > +}

-- 
viresh
