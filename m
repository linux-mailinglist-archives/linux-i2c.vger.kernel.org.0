Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D486437284
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 09:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhJVHL3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 03:11:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230332AbhJVHL3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Oct 2021 03:11:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33ABA610D2;
        Fri, 22 Oct 2021 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634886552;
        bh=aMe1vDCT3CDtWlXkvqsaubG8OPmwUEDHwrKNgQHwV/8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mT82WQfzmwdv2zluT4Magkikw+AEmy8rXLwRvFsMu+PQ8NRFZ/uyW1qADWaL9hW27
         4MkIVtKGDaGFvESWRz04ZZ9+c/zLLKjrST+6Kynmf+EDGHRTxogEcbhAvTQ2PhQrZI
         XVPMxRBOVZPHBKetH+yqMDUkJFwQVcd2gEbCIghcK0/h3wx5mHhM7Z0FqEPZnga6tx
         L7THUm+ZWAeBYzHffEIClptzHe86EOc/Z5cZ0mJZhBpmO4Yv1GZnSKHjE8ftE16aAR
         TbSwg9iWqoeNxJeXrYgkhtr5TGIoCYQXHul9DtAVjJleO7nRgCj5OZx3Pn3Eg28z7w
         6ur0uS3PavC1g==
Received: by mail-wr1-f49.google.com with SMTP id e12so2420213wra.4;
        Fri, 22 Oct 2021 00:09:12 -0700 (PDT)
X-Gm-Message-State: AOAM5315wvCMF1fHwnVvuK9UJZ44H5k+onWv3HkD77YKtAFPPX8wTPhq
        54cyYDGLOd6MTRgnplaorXidom4FOyiTA/KVqrk=
X-Google-Smtp-Source: ABdhPJxvADH+w34D6rnd8a3QkGypVDg/M1da7J3dzGFcxTFYqHN3pF/BO+EW9BJ6qYjfpdrLlhLMHdWzCFYGPa1YQOQ=
X-Received: by 2002:adf:d0c6:: with SMTP id z6mr11834861wrh.336.1634886550652;
 Fri, 22 Oct 2021 00:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <7c58868cd26d2fc4bd82d0d8b0dfb55636380110.1634808714.git.viresh.kumar@linaro.org>
 <0adf1c36-a00b-f16f-e631-439148c4f956@intel.com> <20211022065808.2rvbr6nvollz5mz6@vireshk-i7>
In-Reply-To: <20211022065808.2rvbr6nvollz5mz6@vireshk-i7>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 22 Oct 2021 09:08:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Zt-4goCHWEWcEqwDVwHYp_T=w3rX5pf81Jz_818=Nkw@mail.gmail.com>
Message-ID: <CAK8P3a1Zt-4goCHWEWcEqwDVwHYp_T=w3rX5pf81Jz_818=Nkw@mail.gmail.com>
Subject: Re: [PATCH] i2c: virtio: Add support for zero-length requests
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, Wolfram Sang <wsa@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        conghui.chen@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 22, 2021 at 8:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 22-10-21, 14:51, Jie Deng wrote:
> > > +   if (!virtio_has_feature(vdev, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST)) {
> > > +           dev_err(&vdev->dev, "Zero-length request feature is mandatory\n");
> > > +           return -EINVAL;
> >
> >
> > It might be better to return -EOPNOTSUPP ?
>
> Maybe that or one of these:
>
> #define EBADE           52      /* Invalid exchange */
> #define EPROTO          71      /* Protocol error */
> #define EPFNOSUPPORT    96      /* Protocol family not supported */
> #define ECONNREFUSED    111     /* Connection refused */
>
> Arnd, any suggestions ? This is about the mandatory feature not being offered by
> the device.

These are mostly used for network operations, I'd stick with either EINVAL
or ENXIO in this case.

        Arnd
