Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0403BB53B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 04:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhGECqU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 22:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhGECqU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jul 2021 22:46:20 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E83CC061762
        for <linux-i2c@vger.kernel.org>; Sun,  4 Jul 2021 19:43:43 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id d12so16949307pgd.9
        for <linux-i2c@vger.kernel.org>; Sun, 04 Jul 2021 19:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xuSwe/RfSoZsmqWmRxSCKHgdBKSJxFIJ1HP2k67JkNE=;
        b=TLV4gOuFn+VPLM41B7YR5L1wKfxLzcF6bpswN35lacqXklwXMThcUo1B9UxFGWGPbc
         6PBWQHbzjUGYKZ4JQhq1j45l5gCQTgzTlmgp5zMxaCGufDbwT4VFfkCk5bl+oqhW97Ta
         HRAnqvXotEJYQ7QiirWsTDMvf6wLaXM0XnMGWZcVZcUj6S8YkdKEuKBzvpucQF5ZHLJ4
         ZnDjDJKLK8jD2lgAz9H92+hFKOWObUF09q/ReTqmmbwTHHaaKBkkBPlY40wMnTHYpETJ
         m24o5HYwIKUPJz0kfdBUvF1aeIizRv8nbCZMwoJmD4y8bZAbDrmSb/tvRuiNfpb0wX3I
         V0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xuSwe/RfSoZsmqWmRxSCKHgdBKSJxFIJ1HP2k67JkNE=;
        b=Jw/kGTaaq3FPSlg8GRUEPhIy27FKA7pVGB7/3KPUyQgFuK7rIR/elnsBv1Ffyb4zwx
         38/JW3mnEKMtpVB3NXddGW5QyujACn9I21S/yo5VEQm/1Cs/rsywghbecssOt5mA1zmq
         Cj3seUlsyFTXa2o7LPJbbQ+z6XmhGlf0N+1pOTzVMYz0JS2cwRR7IOmplL4Rxh5r+rKr
         N/hoxuEBKjCNbxuTLp6sUrUeRaAJraDccfMqjQEd2UKtPdl1VgkT9/eN5SlxGaE7196C
         OrkJiuKvjIy2URXpghOxKvqv5cau84PG1mK2l9d8RDP5Cpehu66O1NbF6ko80pnpVUl+
         6IGg==
X-Gm-Message-State: AOAM532xTY4pnBcfDXhhLBV/W1w6atyYoHJik1X7iM3TqUbpOrnkSESu
        Xw7YQ9xKdLfO/UeKm31M3Xnc65O8TqioTA==
X-Google-Smtp-Source: ABdhPJwmAJLOYAES7tvc7lRmiTWlLmQtQ+z3LyBxTrAkUo6791EZO4D8kVO6bvovxidDnExrClJHKA==
X-Received: by 2002:a63:284:: with SMTP id 126mr13154170pgc.347.1625453022687;
        Sun, 04 Jul 2021 19:43:42 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id y127sm5987540pfg.96.2021.07.04.19.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 19:43:42 -0700 (PDT)
Date:   Mon, 5 Jul 2021 08:13:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, stefanha@redhat.com
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705024340.mb5sv5epxbdatgsg@vireshk-i7>
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-07-21, 12:58, Andy Shevchenko wrote:
> On Fri, Jul 02, 2021 at 04:46:47PM +0800, Jie Deng wrote:
> > +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> > +				    struct virtio_i2c_req *reqs,
> > +				    struct i2c_msg *msgs, int nr,
> > +				    bool fail)
> > +{
> > +	struct virtio_i2c_req *req;
> > +	bool failed = fail;

Jie, you can actually get rid of this variable too. Jut rename fail to failed
and everything shall work as you want.

> > +	unsigned int len;
> > +	int i, j = 0;
> > +
> > +	for (i = 0; i < nr; i++) {
> > +		/* Detach the ith request from the vq */
> > +		req = virtqueue_get_buf(vq, &len);
> > +
> > +		/*
> > +		 * Condition (req && req == &reqs[i]) should always meet since
> > +		 * we have total nr requests in the vq.
> > +		 */
> > +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
> > +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> > +			failed = true;
> 
> ...and after failed is true, we are continuing the loop, why?

Actually this function can be called with fail set to true. We proceed as we
need to call i2c_put_dma_safe_msg_buf() for all buffers we allocated earlier.

> > +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> > +		if (!failed)
> 
> > +			++j;
> 
> Besides better to read j++ the j itself can be renamed to something more
> verbose.
> 
> > +	}
> 
> > +	return (fail ? -ETIMEDOUT : j);
> 
> Redundant parentheses.
> 
> > +}

-- 
viresh
