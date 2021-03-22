Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CDC343B0B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 08:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhCVH5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 03:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhCVH5D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 03:57:03 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29633C061756
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 00:57:03 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id l1so8075790pgb.5
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M+2HFgW2jdtORIhlyVvl5rL4yI8zxgxaI/oq1YFfvHs=;
        b=Sd3qglXwSuRLTMwBSVfK2iULoJm7Z+RpLKgnsODcxzKbCRyQKwUXbShX4bvlVvvTQV
         MbzrK2wtPyLSgTnvJ0GGwq1uLy5s3sFRfUYVZoF5CPpJahHiFMhJuxAoKj4NsmkRuJH1
         HWsV8mJDs0WsDh+TszBCSHsPJov6jv1XJgSlN7FPJF4SOoeUWk8AOnSyTTQgyd0uMdWV
         A6hkDREsIW2r8s+5xR4meFZOw9Dj0ta9Tw3wqRRSFPg+XpF2ED6E0tNchNOKqTGF3PdF
         0KxlOmYFoqKE8FtE5OTD/EkUF2LD5loR8GpoAnd3FhMWncINdch+Fo4iI0S6i6xt1FyY
         7u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M+2HFgW2jdtORIhlyVvl5rL4yI8zxgxaI/oq1YFfvHs=;
        b=K+bIfzhzZvZ5Q13AMuZZDUXnGN0zsTWpXiJfX/6r+1uwsLeXeoxGLBcHziTtOxzKpt
         G4YveqWwdVQ53JdYlIbXzgPjTvPbUiElxRhj3KIk7HfQiei06uSjIuz/gUgq07JVwadu
         3IVGLPvAAVDckG00M3nWc1o1qOrkHiol2GW8C+tTjKK3pR2jYevpzkOGVQ+CqKYbyOih
         NmRPoaf2+8OuFtaAdW32bVZBC8pf467N1JzrbnqUYa8aVDuZibFpFZ2g+gHwccstXvcV
         0ndi6dJZVeljCR+y3Yeo2r3FpFRMMt0511mKKPj1RKkmcHoVezYVftA49xAvEuVEAwF5
         FQmQ==
X-Gm-Message-State: AOAM531bx2D6X6uvZtsXEgHGe1eaEGWrpZzSJzRJRKFk8ZyR7LZ6FkdV
        4U0WQS3UjYuFG3FXP/g6ZH7JOmpoYDs8zQ==
X-Google-Smtp-Source: ABdhPJzuiciLTGYWRea94KBh93YsOSeq9vB+/9f6I88HY0JTUWaYHO6T2nzIAq7AXnv3sqiO9Wkyug==
X-Received: by 2002:aa7:96cc:0:b029:202:6873:8ab4 with SMTP id h12-20020aa796cc0000b029020268738ab4mr20445357pfq.42.1616399822659;
        Mon, 22 Mar 2021 00:57:02 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id gt22sm13328631pjb.35.2021.03.22.00.57.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 00:57:02 -0700 (PDT)
Date:   Mon, 22 Mar 2021 13:27:00 +0530
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
Subject: Re: [PATCH v9] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210322075700.gzxx6s3jrkv3sfai@vireshk-i7>
References: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
 <20210322064144.y6kpajolwh2kd3lj@vireshk-i7>
 <dbb5dfe9-8ee6-e3f8-3681-d0ec83282930@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbb5dfe9-8ee6-e3f8-3681-d0ec83282930@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-03-21, 15:53, Jie Deng wrote:
> On 2021/3/22 14:41, Viresh Kumar wrote:
> I think your optimization has problems...
> 
> 
> > 	bool err_found = timeout;
> > 
> > 	for (i = 0; i < nr; i++) {
> > 		/* Detach the ith request from the vq */
> > 		req = virtqueue_get_buf(vq, &len);
> > 
> > 		/*
> > 		 * Condition (req && req == &reqs[i]) should always meet since
> > 		 * we have total nr requests in the vq.
> > 		 */
> > 		if (!err_found &&
> >                      (WARN_ON(!(req && req == &reqs[i])) ||
> > 		     (req->in_hdr.status != VIRTIO_I2C_MSG_OK))) {
> > 			err_found = true;
> > 			continue;
> 
> 
> Just continue here, the ith buf leaks ?

Ahh, this needs to be dropped. You are fight.
 
> > 		}
> > 
> > 		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], err_found);
> 
> 
> i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !err_found); ?

Yes again, my mistake :)

-- 
viresh
