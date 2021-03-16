Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F9833CEC0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 08:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhCPHjx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 03:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhCPHjm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 03:39:42 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C48C06174A
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 00:39:42 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n17so12983018plc.7
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C2y5Iw5ESFpmOhVIIBBfVA713BIV/DXf7nx/Yk9qryA=;
        b=IMxh9B0QEN6VnTEulVLGXIJ4PtFAhlT6EWrZMRKNKLXFgpBmunW7Yy8fE+mdZ/1p7B
         pCNZirC5J+bLGooedKB52qBx7f5ZEyT/drI4Hj91hjT9cVGmq4cGfuy7tzBNMZLrdo/w
         zE+WIMM84IWV7pa9AMF5/4tfZNag/S97TqVDyf5ppjsKMLqe92oYv2WKreLsbb213b0I
         MqfgsVDNgASWgPeYvC9iibNrxpd5W38K6Ox1pLN481Piga0Ib7610cPSyGFuIxtWCGxF
         gNRaypY4u5uk4MoQuICI+X5BFGujAqqBjrLGlxw8JQxcTKGb5WwC8PBBKKK2oJ6ErRDJ
         +LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C2y5Iw5ESFpmOhVIIBBfVA713BIV/DXf7nx/Yk9qryA=;
        b=ZKVPBLSPzwLSqxYN+ZHijM9Y5h5PzTzF5l2eGAEZXXdOUwIPGN9MWsqrRu+WKAAct9
         8I7s3xlijIqruOSzBf8RgARxiDVbQBdHozZxQAhBo6BA1aMBYskqa4V7sld6L62ip0Nx
         ACPV6ZwQ+tuvTLA1sfK7cG7VDalospPJyIsciKo/ETo1lPy7yUkHrYsJdGhoOUSROW2R
         dSyfLmZ8n6eexvsP0Q2IGlbsqVSk6N1Yi/9cs6z2PMNJv3iAQNqa5CmbAOG09HAQ0C/L
         lemNCGrzJg5BC4QTNxVk51Jfj4Si1oOoKYJrL7pHNL0fGuPoGh6XWDaq1EmqeYVj6zYf
         51SQ==
X-Gm-Message-State: AOAM530omgGcwZJ3piZAwRH6455q28gmaae1VyCNJ3NDp7i3o50WUIWD
        FdAv3svAyrE/P2+IOU+QORNFUg==
X-Google-Smtp-Source: ABdhPJzJTLMvzqGksne9xcNgXpA7uaR61ghvRWGyysAhPbG12/fYY5nbE8hrTPil3jrvpcql8C4C8A==
X-Received: by 2002:a17:90a:9b18:: with SMTP id f24mr3369683pjp.96.1615880382152;
        Tue, 16 Mar 2021 00:39:42 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id w28sm15065286pfi.119.2021.03.16.00.39.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Mar 2021 00:39:41 -0700 (PDT)
Date:   Tue, 16 Mar 2021 13:09:39 +0530
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
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210316073939.mwevcsnitcvxtdcu@vireshk-i7>
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
 <20210312061012.slmfnhxe6y5kgrnv@vireshk-i7>
 <a97c64ea-773a-133b-c37c-cd02493e0230@intel.com>
 <20210312081108.fvqrvb75byurt3lo@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312081108.fvqrvb75byurt3lo@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12-03-21, 13:41, Viresh Kumar wrote:
> > > > +static struct i2c_adapter virtio_adapter = {
> > > > +	.owner = THIS_MODULE,
> > > > +	.name = "Virtio I2C Adapter",
> > > > +	.class = I2C_CLASS_DEPRECATED,
> > > What happened to this discussion ?
> > > 
> > > https://lore.kernel.org/lkml/20210305072903.wtw645rukmqr5hx5@vireshk-i7/
> > 
> > My understanding is that new driver sets this to warn users that the adapter
> > doesn't support classes anymore.
> 
> I think the warning is relevant for old drivers who used to support
> classes and not for new ones.
> 
> > I'm not sure if Wolfram can explain it more clear for you.
> 
> Okay, lemme dig in a bit then.
> 
> $ git grep -l i2c_add_adapter drivers/i2c/busses/ | wc -l
> 77
> 
> $ git grep -l I2C_CLASS_DEPRECATED drivers/i2c/busses/
> drivers/i2c/busses/i2c-at91-core.c
> drivers/i2c/busses/i2c-bcm2835.c
> drivers/i2c/busses/i2c-davinci.c
> drivers/i2c/busses/i2c-designware-platdrv.c
> drivers/i2c/busses/i2c-mv64xxx.c
> drivers/i2c/busses/i2c-nomadik.c
> drivers/i2c/busses/i2c-ocores.c
> drivers/i2c/busses/i2c-omap.c
> drivers/i2c/busses/i2c-rcar.c
> drivers/i2c/busses/i2c-s3c2410.c
> drivers/i2c/busses/i2c-tegra.c
> drivers/i2c/busses/i2c-virtio.c
> drivers/i2c/busses/i2c-xiic.c
> 
> i.e. only 13 of 77 drivers are using this flag.
> 
> The latest addition among these drivers is i2c-bcm2835.c and it was
> added back in 2013 and the flag was added to it in 2014:
> 
> commit 37888f71e2c9 ("i2c: i2c-bcm2835: deprecate class based instantiation")
> 
> FWIW, I also checked all the new drivers added since kernel release
> v4.0 and none of them set this flag.

What happened with this ? I didn't get a reply to it and the new
version still has it.

-- 
viresh
