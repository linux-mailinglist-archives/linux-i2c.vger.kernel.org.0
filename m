Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6092345B0A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 10:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhCWJir (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 05:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCWJim (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 05:38:42 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A914C061756
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 02:38:42 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id l123so13727622pfl.8
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 02:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xOvBavSnacobKGo+kw6twfWO3MtChZQ04YkTIEe1M94=;
        b=HISSMh9TBur1wFl5ZLmfc3+KHE5YQVvifXLz4vAOQ/RuTfSWIRc/+hJOtV1qAeRy0S
         LgEDLD1/j7Y6rx4L4vBedsmW+gRCopsbmarhSCdXfm4lJzOLl5sCLpL/ZDyZEwjyO7VM
         7yLNQ8b1uX1x016F2STebxxpL+xsWM+8qZIPx41SQh/HvsBnspxiDq8MNWvxVmcRvaQw
         5t961Stw4pfOeZemjlRiYlj7DS1ck4l325CJ0bGqOyLd2hnZA/xjPgmfwNocY7CaVOhE
         G0VVlRMoQJ5kMoUmBfZKG/0zztilcaC1VXAz9D7Ze7UPfhedRKf5aGbd3r+COW830HQV
         CRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xOvBavSnacobKGo+kw6twfWO3MtChZQ04YkTIEe1M94=;
        b=PfsWqlYzVWLPBXlXmBCKfvopyFIeFQf0TTATwLDkzpXgA9Ng2jyrL8evE47VlWHtUK
         4fQdWVSwNEQJSMZfBkLrjsjV+X2TnhuVZ/AJWUZSlqFnbhBfEz4JIeaNBNslw9EctGvp
         RHAL7HQDbFoUkTaEVXWGcsjPYdWNtZkDo3pgxCCIgxFEBse+2MZd3Z32QXG7xf+/qiXr
         IkjV5PMLqdUHAQIZBP3Sv5+wPFQqsnAwN/CCtbvamgoggqCNrFSQdp2hb9tSC4dEyTBE
         eo3qOnkryJoECFICDamWiwNQShkFrsGryFOgTel4e/tNPxuft9eh0OJxuewVPR3TdewS
         efwA==
X-Gm-Message-State: AOAM533kZmOFYN026GyDs/sBj6T8x/PsyZ55VLiWpeGAtwYOA2MhqVFG
        5bHr/f03NhXjY0RDu3kDpmvfzA==
X-Google-Smtp-Source: ABdhPJwR1oX+E6hpUxRWNtnoOQ94lUS52Bsnd7WLvzDi9msLPbGDaofmbxrMaiYzI5TWr0WOhcYF4Q==
X-Received: by 2002:a63:6744:: with SMTP id b65mr3219875pgc.314.1616492321521;
        Tue, 23 Mar 2021 02:38:41 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id f135sm16170938pfa.102.2021.03.23.02.38.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 02:38:41 -0700 (PDT)
Date:   Tue, 23 Mar 2021 15:08:39 +0530
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
Message-ID: <20210323093839.n7cq7f5poebqdwit@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323090108.ygx76exdgzudeeqi@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323090108.ygx76exdgzudeeqi@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23-03-21, 14:31, Viresh Kumar wrote:
> On 23-03-21, 22:19, Jie Deng wrote:
> > +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > +{
> > +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> > +	struct virtqueue *vq = vi->vq;
> > +	struct virtio_i2c_req *reqs;
> > +	unsigned long time_left;
> > +	int ret, nr;
> > +
> > +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> > +	if (!reqs)
> > +		return -ENOMEM;
> > +
> > +	mutex_lock(&vi->lock);
> > +
> > +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> > +	if (ret == 0)
> > +		goto err_unlock_free;
> > +
> > +	nr = ret;
> > +	reinit_completion(&vi->completion);
> 
> I think I may have found a possible bug here. This reinit_completion() must
> happen before we call virtio_i2c_send_reqs(). It is certainly possible (surely
> in corner cases) that virtio_i2c_msg_done() may get called right after
> virtio_i2c_send_reqs() and before we were able to call reinit_completion(). And
> in that case we will never see the completion happen at all.
> 
> > +	virtqueue_kick(vq);

I may have misread this. Can the actually start before virtqueue_kick() is
called ? If not, then completion may be fine where it is.

-- 
viresh
