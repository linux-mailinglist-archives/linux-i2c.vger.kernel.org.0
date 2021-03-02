Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724D632B21C
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241972AbhCCBOw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344568AbhCBF0d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Mar 2021 00:26:33 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46265C06178A
        for <linux-i2c@vger.kernel.org>; Mon,  1 Mar 2021 21:25:36 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id t26so13139063pgv.3
        for <linux-i2c@vger.kernel.org>; Mon, 01 Mar 2021 21:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pjnIqWr4W5c6Rfpfq+1B4oObRaCw2aXuDrZPon0JAAw=;
        b=QDGCef49J+YEYWjt3GPyAryWMv4lwEf5kBZEzzM/dbIWG4gd9wu57ZJUFjlbFCZ5UL
         NB/GBOLvqyfQjS3RD/ocetVm6mSMDipqVXazooMCN47fHFY4xyHHQNpOOneTAxehas6n
         10li34CgfQXpAbo7r31CLx5apAdX4p1TRUwf+q2JDkZWoUt0gdnL2hDunCmFPsJT2PiC
         QEDkisfE+MmRrbfxAEDtZVBiaxy7umr0gGpU6mIhG/PJVhSdFUceQ5avScWq79Pu5qX8
         M+zhjhN4uO9tZCd6aBGN5ZXC8xp0sueOqemkv/5PBqyDN62DlaydxwyZ9JxRaVy951IF
         q5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pjnIqWr4W5c6Rfpfq+1B4oObRaCw2aXuDrZPon0JAAw=;
        b=uLuALMoeXTwuLT0GZ7LWBIXnXWVLRybb1Cz8VBQrfZx+XFiNOlGRQ0fLUwyIOhcGdy
         pQNayHWnPgeCGLHM7HxXs02nVpBgZU4l84WdMnJa9kR+sEYqkMVldkTgWFZQwVT+Y1Kh
         ygVNlKenXKo8pgTvMwlAQSg/eVsyCeaejNnKPhw9dkDQo9VJ9Oc99xf6tWQhL+z+8ovF
         lM9CqTFowRROAAWip9cy3/6l7af1FTq9rYdi0EHoUS7M+bJjpA4n5gu82r873DuTIP7T
         NuxqboSu9SEns/UUwSXXQqOZNNpK7IxWcistUHrYLhdMSXIfY/0mpMDWqE0DaqKeM0xl
         iAkA==
X-Gm-Message-State: AOAM530OrGAg+U4kZgv6hFkYHlNVOVSVr9JSaDsnZiCHs61gyqN8FIvB
        RTwnpQSD3F0mXAPoh9xkr59Lfw==
X-Google-Smtp-Source: ABdhPJwKpZ7suTk61XskKgNbSXO/rLU1BT7eJSqyuOfbUaVz+DIW5sZQGdY3MkGgzlDoGuLAI+c/fw==
X-Received: by 2002:a05:6a00:1693:b029:1ec:b0af:d1d with SMTP id k19-20020a056a001693b02901ecb0af0d1dmr18206446pfc.42.1614662735639;
        Mon, 01 Mar 2021 21:25:35 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id a136sm19383970pfa.66.2021.03.01.21.25.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 21:25:35 -0800 (PST)
Date:   Tue, 2 Mar 2021 10:55:33 +0530
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
        yu1.wang@intel.com, shuo.a.liu@intel.com
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210302052533.syriswm7gmainpnb@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210302044214.gnnce5ptwehrsnpc@vireshk-i7>
 <1e01448f-52f6-3d39-6794-d140637fdcc3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e01448f-52f6-3d39-6794-d140637fdcc3@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-03-21, 13:21, Jie Deng wrote:
> 
> On 2021/3/2 12:42, Viresh Kumar wrote:
> > On 01-03-21, 14:41, Jie Deng wrote:
> > > +static int virtio_i2c_send_reqs(struct virtqueue *vq,
> > > +				struct virtio_i2c_req *reqs,
> > > +				struct i2c_msg *msgs, int nr)
> > > +{
> > > +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
> > > +	int i, outcnt, incnt, err = 0;
> > > +	u8 *buf;
> > > +
> > > +	for (i = 0; i < nr; i++) {
> > > +		if (!msgs[i].len)
> > > +			break;
> > > +
> > > +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
> > And this won't work for 10 bit addressing right? Don't we support that
> > in kernel ?
> > 
> >  From Spec:
> > 
> > \begin{tabular}{ |l||l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l| }
> > \hline
> > Bits           & 15 & 14 & 13 & 12 & 11 & 10 & 9  & 8  & 7  & 6  & 5  & 4  & 3  & 2  & 1  & 0 \\
> > \hline
> > 7-bit address  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & 0  & A6 & A5 & A4 & A3 & A2 & A1 & A0 & 0 \\
> > \hline
> > 10-bit address & A7 & A6 & A5 & A4 & A3 & A2 & A1 & A0 & 1  & 1  & 1  & 1  & 0  & A9 & A8 & 0 \\
> > \hline
> > \end{tabular}
> Currently, to make things simple, this driver only supports 7 bit mode.
> It doesn't declare "I2C_FUNC_10BIT_ADDR" in the functionality.
> We may add in the future according to the need.

Okay, fair enough. Please add such details somewhere in the code so
people can understand it. You can very well add these at the top of
the file as well, in the general header.

-- 
viresh
