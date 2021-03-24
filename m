Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA9B347040
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 04:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235121AbhCXDwp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 23:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbhCXDwc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 23:52:32 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E884C061763
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 20:52:32 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id h3so16373602pfr.12
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 20:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3j5OyUrftEzcDXX4MpjT7fR+wbe3Yv5y5R6X/vBZjJQ=;
        b=SLpHyYmHPpBuZfgEnc7aIx8GyYHbTlCdViwxtR0TEFAqoH6Co57I5/GH6Ghv7gYREK
         YoZDyi6GiHTtQirA7XKDDFL6oucRys/mzhTATHl/jQnCC/9Z59VS64azThymSHNOyOAP
         uk2USEmA7qpWhxfDT7ZVH/cevwiBf6lKq1YXy+yqSZKaJuaZi35Gh0IInr5qiVUrru9a
         LIOLJpqdf9SembDFDJhCW4jZJYj0Jtz4bBpv77+ypTAQlRTOv/ALj+tE1y+ghdzk9nRB
         t5Y7kdYGbTGolx/nZa15DGpe1a4G7dg9FQyIKVRC4elRXJCdoMr5EuY3ennhf90B5fVr
         010w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3j5OyUrftEzcDXX4MpjT7fR+wbe3Yv5y5R6X/vBZjJQ=;
        b=haoujK9aSNUfdC8XK/S58K2kcSATOarhcygflDrddSw5JmgHmV/I7gvFqpJTreHOPV
         8vcHVJeuWtuV1N1YZXX7p7M58MjaK/Mqqz4fnlIYUA3aDYgAhLtKk5LQX+ao7cTuOThl
         GBkNsICzYidYOIcqoXtZ5rZzSEnG8eA8X47aB1T6zbLS0yRgRvcOYwb13kLgp616gZoK
         r9aQRZAkiz85jdq5bADpakH9JRDBZR3psvhQBAWBv7KvmO5aKVZihQoShTxswsrwMdNO
         1UjjODILLWPZgPC9ZO/H/OgfOTz9q4ITvPl+CnVbD4Hz9SrFSMSQnK3CUn9ysyNB2PKn
         dpxg==
X-Gm-Message-State: AOAM5311k8tfHsCKz9wNYp4sVq+shLVrKOGKX+X2yye8d52ztQvn9gED
        qUbqz8TdmHBko+cBvmDbweegjg==
X-Google-Smtp-Source: ABdhPJwS7CzKG1KeSya4Uww0J2B7VcOU1nBY8jh4mVwy8qnnMCjeW6O7tPjhMNgQ2e7moAaEbcW9CA==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id c3-20020a6235030000b02901aa6f15b9femr1061153pfa.65.1616557951696;
        Tue, 23 Mar 2021 20:52:31 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id m5sm623171pfd.96.2021.03.23.20.52.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 20:52:28 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:22:25 +0530
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
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210324035225.skkllxexjl65gs6x@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323090108.ygx76exdgzudeeqi@vireshk-i7>
 <20210323093839.n7cq7f5poebqdwit@vireshk-i7>
 <5a415dbe-8e3b-2731-cc52-19aeadda1a17@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a415dbe-8e3b-2731-cc52-19aeadda1a17@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24-03-21, 08:53, Jie Deng wrote:
> 
> On 2021/3/23 17:38, Viresh Kumar wrote:
> > On 23-03-21, 14:31, Viresh Kumar wrote:
> > > On 23-03-21, 22:19, Jie Deng wrote:
> > > > +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > > > +{
> > > > +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> > > > +	struct virtqueue *vq = vi->vq;
> > > > +	struct virtio_i2c_req *reqs;
> > > > +	unsigned long time_left;
> > > > +	int ret, nr;
> > > > +
> > > > +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> > > > +	if (!reqs)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	mutex_lock(&vi->lock);
> > > > +
> > > > +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> > > > +	if (ret == 0)
> > > > +		goto err_unlock_free;
> > > > +
> > > > +	nr = ret;
> > > > +	reinit_completion(&vi->completion);
> > > I think I may have found a possible bug here. This reinit_completion() must
> > > happen before we call virtio_i2c_send_reqs(). It is certainly possible (surely
> > > in corner cases) that virtio_i2c_msg_done() may get called right after
> > > virtio_i2c_send_reqs() and before we were able to call reinit_completion(). And
> > > in that case we will never see the completion happen at all.
> > > 
> > > > +	virtqueue_kick(vq);
> > I may have misread this. Can the actually start before virtqueue_kick() is
> > called ?

I didn't write it properly here. I wanted to say,

"Can the _transfer_ actually start before virtqueue_kick() is called ?"
 
> No. It starts when wait_for_completion_timeout is called.

No, the transfer doesn't have anything to do with wait_for_completion_timeout().
And if complete() gets called before wait_for_completion_timeout() is called,
then wait_for_completion_timeout() will simply return back.

> So it should be fine here.
> 
> 
> >   If not, then completion may be fine where it is.
> > 

-- 
viresh
