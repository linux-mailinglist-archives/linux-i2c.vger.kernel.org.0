Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5540C347053
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 05:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCXECg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 00:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhCXECd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 00:02:33 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969BBC061763
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 21:02:32 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id q11so7232311pld.11
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 21:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l+oEqrPK4Jh5Yh1K1agFFtG8yqWY6RUsmzxm5BWQMh4=;
        b=rtu7m/MUwYEQhtZ3hvBoBY8BPSqNRTcUuwaVklp/Nh3hYVFTqYwUHXXMn/JJm5RVfb
         C5dsYrqQ9ZiiXgCHUg5W+QUPKbMopDA4Xz63sDtH0CLmOwZsvE/YwPHzLZ5SRutLArsM
         CFmGTEiA1CIewKzsLwd4eOvqL69IgMWA+cZ+zaIUex81ElsrrUxsTCuUG2rtep5RbFol
         wSDdaGFSV9TLFd4RK9yw0AHPrFz9iX2FESUZBBIF+ZwSd2N9Htc87mDSZpv0gKiiSJKN
         oBFgqbDUG3Twk8/uUCYRLdquR1+vockGgxLLsl91/ty08lFS0G4MH1uQ04LDY1zDjhLZ
         CZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l+oEqrPK4Jh5Yh1K1agFFtG8yqWY6RUsmzxm5BWQMh4=;
        b=FznUdLTK4g/l5JHoNlLwAngGotZjYa0ssRUitQ8mDdoX52KLF8I2iTaH53CxxonjR3
         sT31Vi3gN2ajmIlawfG3pKEwwiCWtt4p2qm7A3AmfmsGW4gufQm5kU7d5pXrGoWqJrjt
         Cw50SloGwJBYtHe4kxdWM4lXwnFuYQC8GjCKAiy+s/DBVEaGApPwmiaszrwikDZ0BHrW
         9ZV3xbwJ00Vueh5dtRUzexfhsTydPtEmShf/p4AODJ1pAw+W4jV98kxT4LIF2XYjC3Wm
         QQgp6G9O/5a1zVwj4Ds6UU+EKvCnpO01gEVhCParhBOVIHJgbxSmztrtQwzrmxm0vh5v
         jbrw==
X-Gm-Message-State: AOAM532jVzMj71z7XLr1VgyZxiJk6ASENcIUhpw+y4TamKpUPAe2WviA
        f29Lnc7Ziht4mlZLaVZEe8qFAw==
X-Google-Smtp-Source: ABdhPJwSA8y6J+5XjApUxlt5SYVAV3+L6fs7ph8TQwoIVsjtJUxOk39yGEtpPARocP0zeq24ABotog==
X-Received: by 2002:a17:90a:fa0b:: with SMTP id cm11mr1428854pjb.140.1616558551914;
        Tue, 23 Mar 2021 21:02:31 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id s19sm626312pfh.168.2021.03.23.21.02.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 21:02:31 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:32:29 +0530
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
Message-ID: <20210324040229.45gxaqfkfqjwleed@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323090108.ygx76exdgzudeeqi@vireshk-i7>
 <20210323093839.n7cq7f5poebqdwit@vireshk-i7>
 <5a415dbe-8e3b-2731-cc52-19aeadda1a17@intel.com>
 <20210324035225.skkllxexjl65gs6x@vireshk-i7>
 <70a2d0f7-ac48-b477-8368-7ef55696bff1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70a2d0f7-ac48-b477-8368-7ef55696bff1@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24-03-21, 12:00, Jie Deng wrote:
> 
> On 2021/3/24 11:52, Viresh Kumar wrote:
> > On 24-03-21, 08:53, Jie Deng wrote:
> > > On 2021/3/23 17:38, Viresh Kumar wrote:
> > > > On 23-03-21, 14:31, Viresh Kumar wrote:
> > > > > On 23-03-21, 22:19, Jie Deng wrote:
> > > > > > +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > > > > > +{
> > > > > > +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> > > > > > +	struct virtqueue *vq = vi->vq;
> > > > > > +	struct virtio_i2c_req *reqs;
> > > > > > +	unsigned long time_left;
> > > > > > +	int ret, nr;
> > > > > > +
> > > > > > +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> > > > > > +	if (!reqs)
> > > > > > +		return -ENOMEM;
> > > > > > +
> > > > > > +	mutex_lock(&vi->lock);
> > > > > > +
> > > > > > +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> > > > > > +	if (ret == 0)
> > > > > > +		goto err_unlock_free;
> > > > > > +
> > > > > > +	nr = ret;
> > > > > > +	reinit_completion(&vi->completion);
> > > > > I think I may have found a possible bug here. This reinit_completion() must
> > > > > happen before we call virtio_i2c_send_reqs(). It is certainly possible (surely
> > > > > in corner cases) that virtio_i2c_msg_done() may get called right after
> > > > > virtio_i2c_send_reqs() and before we were able to call reinit_completion(). And
> > > > > in that case we will never see the completion happen at all.
> > > > > 
> > > > > > +	virtqueue_kick(vq);
> > > > I may have misread this. Can the actually start before virtqueue_kick() is
> > > > called ?
> > I didn't write it properly here. I wanted to say,
> > 
> > "Can the _transfer_ actually start before virtqueue_kick() is called ?"
> 
> 
> It can't start until the virtqueue_kick() is called. Call virtqueue_kick
> then wait.

Great, thanks for the confirmation. The code is fine then.

-- 
viresh
