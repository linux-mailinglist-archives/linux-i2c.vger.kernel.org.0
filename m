Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A5D3D6D3D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 06:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhG0EXp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 00:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhG0EXo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 00:23:44 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD12C061757
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 21:23:44 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ca5so3639642pjb.5
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 21:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2lFU0EJSr+c97aVBle4VB/B7T7Mb5W4uKZCNWRPuq7Q=;
        b=ZxnWj84Xu1lB0yka22jOJxWl8L8MjqlR5szrFWfFBIRzI5tjDZiWkNuP5s5Q/n+YCn
         d+mPe7dDasojYuuNEwm4JT8rm9fDQfpsvOzpwnjpdbltWtk2MYO5OCgXShCkhjZp5w3Q
         uU+POGsE4WaX/L02jgHmQzlnYmD/iklsLS1rC9vo4gI6Ct2Q0AwlwE6r03qDY+AKh53H
         XLWADZvkvDMHLerwllWgpANE2Cp0UkVyy5S5n58/85aafW53VxUY8pDDej8F//WlJ1TE
         Vyn1Alfar2H2xxCF1L+kNXkwdD8EAFSgk5A4Nzkvw90x4EdIpfOq4OOAZW4YgDNyKMCe
         R5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2lFU0EJSr+c97aVBle4VB/B7T7Mb5W4uKZCNWRPuq7Q=;
        b=c96U9b8sx5jVDbLL/9gl6Mk/5Ag94ZVCnJrvjbX6KSxiLWdGAvv1JNKFRgwc4DC9fq
         APJT2uPxT7LAK9n83iEocKoipse29bZUphznZnNTPubauMZZrGCHiYdvb8H6kxe5K1Uq
         0Ys2zDXBHUzVxNkV8sAOKks3W8TnUNLlIsoDj0vld43l0ZKLL00q+07X1K+TdT9NrB7M
         qhwOzpn2fU1FHKmdK4YqACmPCiXO0aS4JlRwutBS+AVSyZnIaO0gEb7D+Txd5mSpmYeA
         SKmrPFAKp9nuQ6PrTGhfHI6XkSLvEIwBvHI1JN5oPI8Wf8I/+BvzAYdVqOWfQwL5dVlp
         pxgA==
X-Gm-Message-State: AOAM532wgAdvU+seD1WLGskkxQq+8nlD55kJtdf7gIpbGb4FMeBFrxP5
        gvs0jD/sgN5jnvS7kSwybYRSHQ==
X-Google-Smtp-Source: ABdhPJxFPX6K1CjkSFimIvFBCnuEo7Olfo38zVA0TCIOJDemhKbb8s/ncbuSD14f++dxEw0RFjmhKQ==
X-Received: by 2002:a17:90a:f198:: with SMTP id bv24mr20262309pjb.171.1627359823619;
        Mon, 26 Jul 2021 21:23:43 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id h17sm1619223pfh.192.2021.07.26.21.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 21:23:43 -0700 (PDT)
Date:   Tue, 27 Jul 2021 09:53:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        gregkh <gregkh@linuxfoundation.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        jiedeng@alumni.sjtu.edu.cn
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210727042335.lyzhkboh55aaqpy2@vireshk-i7>
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
 <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
 <a65f32f6-6068-951c-c080-9ae27915b288@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a65f32f6-6068-951c-c080-9ae27915b288@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27-07-21, 10:15, Jie Deng wrote:
> 
> On 2021/7/23 17:03, Arnd Bergmann wrote:
> > On Fri, Jul 23, 2021 at 7:44 AM Jie Deng <jie.deng@intel.com> wrote:
> > 
> > > +
> > > +       ret = virtio_i2c_setup_vqs(vi);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       vi->adap.owner = THIS_MODULE;
> > > +       snprintf(vi->adap.name, sizeof(vi->adap.name),
> > > +                "i2c_virtio at virtio bus %d", vdev->index);
> > > +       vi->adap.algo = &virtio_algorithm;
> > > +       vi->adap.quirks = &virtio_i2c_quirks;
> > > +       vi->adap.dev.parent = &vdev->dev;
> > > +       i2c_set_adapdata(&vi->adap, vi);
> > > +
> > > +       /*
> > > +        * Setup ACPI node for controlled devices which will be probed through
> > > +        * ACPI.
> > > +        */
> > > +       ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> > Since there is now a generic way for virtio drivers to link up with OF
> > device nodes, maybe this should be handled the same way in the
> > virtio core rather than the driver?
> 
> 
> I'm currently based on the I2C tree. Has that patch been already merged ？
> 
> Anyway, I think we can send an additional patch to remove this line once
> that
> 
> "generic way" patch is merged.

I agree, we need to get this merged and do stuff on top of it. We are
already on v15 :)

-- 
viresh
