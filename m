Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F8A3FC9AD
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Aug 2021 16:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbhHaO0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Aug 2021 10:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58146 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230135AbhHaO0X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Aug 2021 10:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630419927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OA/jhyLAYtK1tYZ39fbir6HGMf0iZmNE8/Rh8O+Ui3Q=;
        b=Ee2oFBqiEdBsw45OB+cwbDyOThwixg1+zYqbSLlcixvOiukyHna+tFznnPYbnt1oNAbCLi
        H3oru32Wn3CgT13dWzkPPOm/De7il63fxbWn8OhCVMEgmI9gAIC5zyhBO5UwnmpPN3arfn
        jSyf4QsNVPHRleLsZtim4xiSHblXjpU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-RWsbJG1AOBmWzJuw1Xuhkw-1; Tue, 31 Aug 2021 10:25:26 -0400
X-MC-Unique: RWsbJG1AOBmWzJuw1Xuhkw-1
Received: by mail-ej1-f70.google.com with SMTP id v19-20020a170906b013b02905b2f1bbf8f3so1200880ejy.6
        for <linux-i2c@vger.kernel.org>; Tue, 31 Aug 2021 07:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OA/jhyLAYtK1tYZ39fbir6HGMf0iZmNE8/Rh8O+Ui3Q=;
        b=Gpv2wXozXukINIO8prtDbD1Fy2DXONkKPPBFq2mq4/qOFIxOGdKjxyC0FuKhG8lrCq
         TGmwZptlk2y9MNXZA11HPqL6gKpXTzXd2H1VMxTgrqQc8N4IFZjPEbL+DxRjVdDSLmi2
         KDXY499LKIQzACHXEwt3RJIBh7fVIOkV3Uw5ehKaxeFz4MzfF3mf/9y85iHLxlAhTbRT
         rjVnorYGq/MnM21WpEy7opotwlISQiNAN9bkJD/5zW+sdB3BmkpVRw9K3h2b/34xZ6mK
         4OHge/TRWB2U4EjXQGcEjnPuDv9Xtjs4kP7Ia2sLWyyRaZ+BwrXFQ/RP5KistO1lU4C5
         PrFA==
X-Gm-Message-State: AOAM531jlBzEGS/0uFJxXq1I8McOHWr6rXmBE90UFNywIqSMYCNdc7aA
        9TI2PVjqNbjbniVcmd0yGXfsBezqa1weYNFUuRpEwnG1Vlh88ilrT/QhNzM/2F6nsjgYslAkHMK
        AHYEiKbaUCY0TEgg4Sm5E
X-Received: by 2002:a17:906:70b:: with SMTP id y11mr31329821ejb.274.1630419925019;
        Tue, 31 Aug 2021 07:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSzD9zkr7wPpktKq9Ktr39dANS1nu+utRyQ0BSDOUx3yoPFWOxowvAJPabM1ziUJDcXh+Mmg==
X-Received: by 2002:a17:906:70b:: with SMTP id y11mr31329801ejb.274.1630419924831;
        Tue, 31 Aug 2021 07:25:24 -0700 (PDT)
Received: from redhat.com ([2.55.138.60])
        by smtp.gmail.com with ESMTPSA id b2sm8403019ejj.124.2021.08.31.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:25:24 -0700 (PDT)
Date:   Tue, 31 Aug 2021 10:25:19 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>, Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH V4 0/5] virtio: Add virtio-device bindings
Message-ID: <20210831102514-mutt-send-email-mst@kernel.org>
References: <cover.1627362340.git.viresh.kumar@linaro.org>
 <20210831053105.ut73bmvxcop65nuv@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831053105.ut73bmvxcop65nuv@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 31, 2021 at 11:01:05AM +0530, Viresh Kumar wrote:
> On 27-07-21, 10:53, Viresh Kumar wrote:
> > Hi,
> > 
> > Currently the DT only provides support for following node types for virtio-mmio
> > nodes:
> > 
> >         virtio_mmio@a000000 {
> >                 dma-coherent;
> >                 interrupts = <0x00 0x10 0x01>;
> >                 reg = <0x00 0xa000000 0x00 0x200>;
> >                 compatible = "virtio,mmio";
> >         };
> > 
> > Here, each virtio-mmio corresponds to a virtio-device. But there is no way for
> > other users in the DT to show their dependency on virtio devices.
> > 
> > This patchset provides that support.
> > 
> > The first patch adds virtio-device bindings to allow for device sub-nodes to be
> > present and the second patch updates the virtio core to update the of_node.
> > 
> > Other patches add bindings for i2c and gpio devices.
> > 
> > Tested on x86 with qemu for arm64.
> 
> Michael, are you picking these up for 5.15 ?

Okay.

> -- 
> viresh

