Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1C03414F3
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhCSFks (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbhCSFki (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 01:40:38 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F306C06175F
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 22:40:38 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so3895607pjb.4
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 22:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5x5odp979WLlXOJ6f4tJdUumqOt4vIxvWJ/PSurH5YU=;
        b=O5MoIDuBIiaRpqaMmMntsxJHfiJlwp/xwuI0glHnfA7PqqqmUaH4ttcw53qTWVbwAo
         biZg2EXn7OtYFAK8R8GeA7nOGZpX4H1Dz3epp+PYQvcQIszCTaWoXyKQD4WFBNKpvVw3
         KmU/hDS7/LfdlDl5JXKVS9UTvbQg0BylSZ8Of2GplJaaU1LEu73ks0DTAiOTuisLzNLQ
         r/jQ6hqXhS5tnyD6Wj84LbwwdbLg+jqSLaOzK0YEflxycdPxUwhXRLxC18ScUGuMZypT
         mmRv/TLOo0ZuNQVOi4Dit8C9UXWoB13NnrERnyV8bQgzYiu0Pk0Ske0i6WTn7o4ivQPq
         5PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5x5odp979WLlXOJ6f4tJdUumqOt4vIxvWJ/PSurH5YU=;
        b=XIZ8EjAjcD40oJskOZl0rua9SI9TT54dfppzkZgR4N5MaXmg9wDXXyKup6vbhBpQ19
         pBHYzU3311LxvoWASf7mfwgViER/+K6U5tN7b8f/c4ARbbbREvAseg3O3izm33kG6HNI
         rsaJ7sS+DNF1G0GaY8ZoyJktzh0WfTD4Jo6p77k8Snruh8pnxbXVgzyNRa9cxohilvtc
         fHIPcID4yf379RUNSUEHUBlhiobl4WBk828KYFfCUuCbihsBEzo5XZUdTFeCb7PVJD/L
         2tMBpxOMepXwzfOvwykYJEF7PD6psFUcUHeQy0lrLaWjTkdiursBPO9JPiGEvfjWZGaE
         rGZg==
X-Gm-Message-State: AOAM532e18bDx17hrKwVlts6s5GyLJaLZOnhYzMvMW2cBUYh6jdQ6ew4
        1UiQ658iiSxF9PXqB+vX5xVZ7Q==
X-Google-Smtp-Source: ABdhPJxAo7Q7H3ZY6NJki9+yMkvvdRRONgQNnTam9TUlspQeSDpavDAOXtycALGM+DAQmaEOiJ8LAA==
X-Received: by 2002:a17:90a:f40c:: with SMTP id ch12mr8055908pjb.176.1616132437613;
        Thu, 18 Mar 2021 22:40:37 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id j3sm4187463pjf.36.2021.03.18.22.40.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 22:40:36 -0700 (PDT)
Date:   Fri, 19 Mar 2021 11:10:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210319054035.47tn747lkagpip6v@vireshk-i7>
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7>
 <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
 <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
 <20210319035435.a4reve77hnvjdzwk@vireshk-i7>
 <b135b474-b167-67ad-588c-b0cfe8dc2998@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b135b474-b167-67ad-588c-b0cfe8dc2998@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19-03-21, 13:31, Jie Deng wrote:
> 
> On 2021/3/19 11:54, Viresh Kumar wrote:
> > On 18-03-21, 15:52, Arnd Bergmann wrote:
> > > Allowing multiple virtio-i2c controllers in one system, and multiple i2c
> > > devices attached to each controller is clearly something that has to work.
> > Good.
> > 
> > > I don't actually see a limitation though. Viresh, what is the problem
> > > you see for having multiple controllers?
> > I thought this would be a problem in that case as we are using the global
> > virtio_adapter here.
> > 
> > +       vi->adap = &virtio_adapter;
> > +       i2c_set_adapdata(vi->adap, vi);
> > 
> > Multiple calls to probe() will end up updating the same pointer inside adap.
> > 
> > +       vi->adap->dev.parent = &vdev->dev;
> > 
> > Same here, overwrite.
> > 
> > +       /* Setup ACPI node for controlled devices which will be probed through ACPI */
> > +       ACPI_COMPANION_SET(&vi->adap->dev, ACPI_COMPANION(pdev));
> > +       vi->adap->timeout = HZ / 10;
> > 
> > These may be fine, but still not ideal I believe.
> > 
> > +       ret = i2c_add_adapter(vi->adap);
> > i
> > This should be a problem as well, we must be adding this to some sort of list,
> > doing some RPM stuff, etc ?
> > 
> > Jie, the solution is to allocate memory for adap at runtime in probe and remove
> > the virtio_adapter structure completely.
> 
> 
> If you want to support that. Then I think we don't need to change the
> following at all.
> 
> > +    .algo = &virtio_algorithm,
> > +
> > +        return ret;
> > +
> > +    vi->adap = virtio_adapter;
> This is strange, why are you allocating memory for adapter twice ?
> Once for virtio_adapter and once for vi->adap ? Either fill the fields
> directly for v->adap here and remove virtio_adapter or make vi->adap a
> pointer.

Yes, your previous version was partly okay but you don't need the
virtio_algorithm structure to be allocated. There are only 4 fields you are
updating here, just fill them directly in vi->adap.

(FWIW, I also suggested the same when I said
"Either fill the fields directly for v->adap here and remove virtio_adapter".
)

See how drivers/i2c/busses/i2c-versatile.c and most of the other drivers have
done it.

-- 
viresh
