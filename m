Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8638437446
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 11:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbhJVJGD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 05:06:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38177 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232412AbhJVJGB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 05:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634893424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vlS6aml8LL1qZe5zkUk/1HXVoXarBD/8NvPesYzireA=;
        b=JjSU7VqLTxHRMXz4jdOzd2RB0ohb8+PE0CfwEfsxwmuCRE+eQEVRcT8XGBTNdS/poZ83OL
        u+/N9tV1vx4Vl2fGMyyqJgaXkdUzwjfcF+tA+KChHD7Tqxnb9C0Exze+KqKUExSj8+xeSi
        lMkPmkU5ukt7VkJ6W66c91uGdgSsHto=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-jMiQBV7jO4Cz9Y6ob_P4AQ-1; Fri, 22 Oct 2021 05:03:42 -0400
X-MC-Unique: jMiQBV7jO4Cz9Y6ob_P4AQ-1
Received: by mail-wm1-f72.google.com with SMTP id c5-20020a05600c0ac500b0030dba7cafc9so739438wmr.5
        for <linux-i2c@vger.kernel.org>; Fri, 22 Oct 2021 02:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vlS6aml8LL1qZe5zkUk/1HXVoXarBD/8NvPesYzireA=;
        b=F/l3XEjGED1qL0sx/TUUI/76fr43PPYMqQ8mOa1nYrEbdM2BkBOgmMGUr7lXYroHP0
         kAtNKu6hLRi7TEnR+YaP8uommBLjT57Jz6mxHIMOIs+2ILIGpAsL+InoOtL/5awy9ytv
         G3aZYm2taQg3Xlh0d9onQ7CwIwvlvotyokv09nR7nekO7JC7FlnWCTjsedELwFA/aWe/
         HviZi5/HMiIt0hqZptxqurJ0dFO/KPg7dHEeQT2pzNeWlF6IeK17atpwunwsiJDrufZB
         1NJn21yHK3B98C9BjFLTQgPep7KkfX7+1oPMGxAZNWKDRc/QBTqJd09bDjGNgHWIMCj8
         Qgug==
X-Gm-Message-State: AOAM533i6vHteq2oUzL+3nl2hkP2VA6r3jCyNnSA/Ppd3iQljeqxrL9j
        CIV7S8u/72MeJPMHfUZg20aInjXPx/Ybn7hEwzzlPZsA/bhEzgZgQ1vEGRoq7jAU/mci9OC0tDu
        8+1xOzKiueUjQxvW5LS6+
X-Received: by 2002:a1c:191:: with SMTP id 139mr12823375wmb.186.1634893421625;
        Fri, 22 Oct 2021 02:03:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgz69ZOr6NDfBcGs5kRzntTTBb/m5Ee6/7befhnYjWUjj9wGNPtMHwP34fX3HbNswLKjwtYg==
X-Received: by 2002:a1c:191:: with SMTP id 139mr12823362wmb.186.1634893421493;
        Fri, 22 Oct 2021 02:03:41 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
        by smtp.gmail.com with ESMTPSA id p188sm3376289wmp.30.2021.10.22.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:03:40 -0700 (PDT)
Date:   Fri, 22 Oct 2021 05:03:36 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        stratos-dev@op-lists.linaro.org,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        cohuck@redhat.com,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, conghui.chen@intel.com
Subject: Re: [PATCH] i2c: virtio: Add support for zero-length requests
Message-ID: <20211022050222-mutt-send-email-mst@kernel.org>
References: <7c58868cd26d2fc4bd82d0d8b0dfb55636380110.1634808714.git.viresh.kumar@linaro.org>
 <0adf1c36-a00b-f16f-e631-439148c4f956@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0adf1c36-a00b-f16f-e631-439148c4f956@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 22, 2021 at 02:51:10PM +0800, Jie Deng wrote:
> 
> On 2021/10/21 17:47, Viresh Kumar wrote:
> > The virtio specification received a new mandatory feature
> > (VIRTIO_I2C_F_ZERO_LENGTH_REQUEST) for zero length requests. Fail if the
> > feature isn't offered by the device.
> > 
> > For each read-request, set the VIRTIO_I2C_FLAGS_M_RD flag, as required
> > by the VIRTIO_I2C_F_ZERO_LENGTH_REQUEST feature.
> > 
> > This allows us to support zero length requests, like SMBUS Quick, where
> > the buffer need not be sent anymore.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > Hi Wolfram,
> > 
> > Please do not apply this until the spec changes [1] are merged, sending it early
> > to get review done. I will ping you later once the spec is merged.
> > 
> > [1] https://lists.oasis-open.org/archives/virtio-dev/202110/msg00109.html
> > 
> >   drivers/i2c/busses/i2c-virtio.c | 56 ++++++++++++++++++---------------
> >   include/uapi/linux/virtio_i2c.h |  6 ++++
> >   2 files changed, 36 insertions(+), 26 deletions(-)
> > 
> 
> Acked-by: Jie Deng<jie.deng@intel.com>  once the spec is merged.


There's supposed to be space before < btw. and one puts # before any
comments this way tools can process the ack automatically:

Acked-by: Jie Deng<jie.deng@intel.com> # once the spec is merged.

> 
> 
> > +	if (!virtio_has_feature(vdev, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST)) {
> > +		dev_err(&vdev->dev, "Zero-length request feature is mandatory\n");
> > +		return -EINVAL;
> 
> 
> It might be better to return -EOPNOTSUPP ?
> 

