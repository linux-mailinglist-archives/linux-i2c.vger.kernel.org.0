Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E7C32DFEA
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Mar 2021 04:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhCEDJW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Mar 2021 22:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhCEDJW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Mar 2021 22:09:22 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA83C061756
        for <linux-i2c@vger.kernel.org>; Thu,  4 Mar 2021 19:09:22 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id fu20so989099pjb.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Mar 2021 19:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kAsZWz7burJ9bPC37LxsIcNkEVa66bzvNmsosUZUHfs=;
        b=Swl+WPzAtNfGJSBs9xkI+jLQNZ+p1GomJvqEamdmWfhcEJ+w/7AkcH02QOneAWsE2R
         ooEv0wh9dmayaX/tzcUbOXypseGh3AqoFgKrFSVJjMJQquFZosBB8XRVsQ4IlDBBmncv
         6M4ZsxI8PoxIHMYtTpcX8/dVlPyQebYs2iIwrrGX8Tzwm1IuNH9bj6s0oyMU1ahv+LJw
         Hh+LfNqUK1xvG1nLJqOf/9S6hBIo4B6dkCWhZ+B0fpu1sTdZoy+3VmvchpYu3Cw+oziG
         PDxYPG14KMGZxXShdq0Pl/YCkmM8LxYmF6REXUp4Femc04SGbDPVoANFbOvVxGBdOB3O
         h7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kAsZWz7burJ9bPC37LxsIcNkEVa66bzvNmsosUZUHfs=;
        b=JTxGCZdRfX4VoeWPpP9z4pcSNG+GLKnPraFjNonLBsVN2IcHnZIGyMMJbQJ7GEtgEM
         cswfr7udYx+bRj9C5n60QLGDqAwe464RKDXBBpriTIOrROdJxTM/hfKhXm1/49par39Z
         Z/ISijc3MnriQROX43ZR208DrqFgUGJJMHSlV67O6c/xLoYwwEUD9yMoCLBaK+c+u/bm
         cOD6ipnCcSAwnw4nSPeHPc0WBq2pZKE9OYyYFEpDEFU1gtxvwxUpXXxztIryQOjkGUcl
         NoSApMNT/QrcboiCUvGnUsw1FHYR0/LQJLWtC+9fHpNmqBe367aYOWW74zfJQ2KMVyeW
         o3dQ==
X-Gm-Message-State: AOAM532HLBwxh6VEvrxfTLJrln3Ks9CeoT4lMxNe0jZOt0M4Gk58jmKO
        5xoqkzRan/5kHvUu37ZMuUvx5A==
X-Google-Smtp-Source: ABdhPJx5kHj0IvZMfgdLtG0xpOd2u0TRycOWG40Fo58M8I4gVdsSCyeb2pH1f46f7//vPd3q8FdiVw==
X-Received: by 2002:a17:90a:7f89:: with SMTP id m9mr7541847pjl.115.1614913761655;
        Thu, 04 Mar 2021 19:09:21 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id x190sm672623pfx.60.2021.03.04.19.09.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 19:09:20 -0800 (PST)
Date:   Fri, 5 Mar 2021 08:39:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210305030916.trb35i53rzwf6kyn@vireshk-i7>
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <20210304060638.7qes424vvdmptz5c@vireshk-i7>
 <f3f4aaf8-521c-3e9e-4757-97f2e33e44f6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3f4aaf8-521c-3e9e-4757-97f2e33e44f6@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-03-21, 09:46, Jie Deng wrote:
> On 2021/3/4 14:06, Viresh Kumar wrote:
> > depends on I2C as well ?
> No need that. The dependency of I2C is included in the Kconfig in its parent
> directory.

Sorry about that, I must have figured that out myself.

(Though a note on the way we reply to messages, please leave an empty line
before and after your messages, it gets difficult to find the inline replies
otherwise. )

> > > +		if (!(req && req == &reqs[i])) {
> > I find this less readable compared to:
> > 		if (!req || req != &reqs[i]) {
> 
> Different people may have different tastes.
> 
> Please check Andy's comment in this link.
> 
> https://lists.linuxfoundation.org/pipermail/virtualization/2020-September/049933.html

Heh, everyone wants you to do it differently :)

If we leave compilers optimizations aside (because it will generate the exact
same code for both the cases, I tested it as well to be doubly sure), The
original statement used in this patch has 3 conditional statements in it and the
way I suggested has only two.

Andy, thoughts ?

And anyway, this isn't biggest of my worries, just that I had to notice it
somehow :)

> > For all the above errors where you simply break out, you still need to free the
> > memory for buf, right ?
> Will try to use reqs[i].buf = msgs[i].buf to avoid allocation.

I think it would be better to have all such deallocations done at a single
place, i.e. after the completion callback is finished.. Trying to solve this
everywhere is going to make this more messy.

> > > +	mutex_lock(&vi->i2c_lock);
> > I have never worked with i2c stuff earlier, but I don't think you need a lock
> > here. The transactions seem to be serialized by the i2c-core by itself (look at
> > i2c_transfer() in i2c-core-base.c), though there is another exported version
> > __i2c_transfer() but the comment over it says the callers must take adapter lock
> > before calling it.
> Lock is needed since no "lock_ops" is registered in this i2c_adapter.

drivers/i2c/i2c-core-base.c:

static int i2c_register_adapter(struct i2c_adapter *adap)
{
        ...

        if (!adap->lock_ops)
                adap->lock_ops = &i2c_adapter_lock_ops;

        ...
}

This should take care of it ?

> > 
> > > +
> > > +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> > > +	if (ret == 0)
> > > +		goto err_unlock_free;
> > > +
> > > +	nr = ret;
> > > +
> > > +	virtqueue_kick(vq);
> > > +
> > > +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> > > +	if (!time_left) {
> > > +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> > > +		ret = -ETIMEDOUT;
> > You need to free bufs of the requests here as well..

Just want to make sure you didn't miss this comment.

> > > +static struct i2c_adapter virtio_adapter = {
> > > +	.owner = THIS_MODULE,
> > > +	.name = "Virtio I2C Adapter",
> > > +	.class = I2C_CLASS_DEPRECATED,
> > Why are we using something that is deprecated here ?
> Warn users that the adapter doesn't support classes anymore.

So this is the right thing to do? Or this is what we expect from new drivers?
Sorry, I am just new to this stuff and so...

> > > +struct virtio_i2c_out_hdr {
> > > +	__le16 addr;
> > > +	__le16 padding;
> > > +	__le32 flags;
> > > +};
> > It might be worth setting __packed for the structures here, even when we have
> > taken care of padding ourselves, for both the structures..
> Please check Michael's comment https://lkml.org/lkml/2020/9/3/339.
> I agreed to remove "__packed" .

When Michael commented the structure looked like this:

Actually it can be ignored as the compiler isn't going to add any padding by
itself in this case (since you already took care of it) as the structure will be
aligned to the size of the biggest element here. I generally consider it to be a
good coding-style to make sure we don't add any unwanted stuff in there by
mistake.

Anyway, we can see it in future if this is going to be required or not, if and
when we add new fields here.

-- 
viresh
