Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F354E3D5662
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 11:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbhGZIkf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 04:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbhGZIke (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jul 2021 04:40:34 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C42BC061760
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 02:21:04 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id a20so11049851plm.0
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q2bTbIzuNR8Z17qVedSx5UTI8m+JO41tvc9PLnzRbyY=;
        b=tWadrVNRyXQFNGcdGTy5ELi21BrWtCSXF2pYOfvz+nc3S8H4LMjdd+tv3d9Iys2qJK
         SYG89iS7msEv/oK+ffbBpjZEHWbSeeY4HvxrGgxVSTOUK169+A80wnQpUgxCljEy3Ayi
         f9n2Va62XCW/Pa67igB8NGzQMZlwvacjQYsMoP48fBsyZTsBfOCqOAj0wRsSyXLsp42D
         UyJU0z+F8truVI1Z8B912kOWtfKVLodOQhu8TYxU54UqXaU+UPfwcpWHoEy+wE3z/LgZ
         zTdqlJc0ZXc7wnAcNK4B7l2I+MpZTAwE3ji0W1lO9yRGvNaCjeH1Jt34qVToIz4XAX9X
         00lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q2bTbIzuNR8Z17qVedSx5UTI8m+JO41tvc9PLnzRbyY=;
        b=O4S+v4++tZjoWrYzSbNRJXQ9JTv9Yb8vX/3ywrjLd7tWJ2HqXLU0+ZD4uEupANi6qq
         q0iWYgwCBO/wy1Vt0tb2IFDORjVveqVTpcxpWPuPnx+HBKCCZdLbzR7Ph1saoDWL+jSK
         opB6gUDeip02jRh1yhVcCyUPo12Lhw/l2UKPmQx7cpns/Mmdtmlcb2VnCKLQhWphHDC0
         aYdLgwnks5wAQRlxRk+Nj1wYceyjUkUcStaBTpLORR7p8a0K7zE1jXF1fehBUsZfEtVn
         4yETsPI8MVmjTMpwpJrZ8pZ2ee9dAg650t9L6tbajcNE+DbxyFzAcP9A7vSJw9EqRkR2
         LoKg==
X-Gm-Message-State: AOAM53008IgiptWKxGxX3c6g35xAv5Ja6X3PCfXThSdF0Yv/FLh2ctKw
        AaYE96pphwRUWyhOyXF1T870bw==
X-Google-Smtp-Source: ABdhPJzmUDnTNUKbWGwqSdm7aMIzCwtdu9YyEc3FRNxnsh53o+Wpv+9lXdE9a+3TxmU5FRPAMdta1A==
X-Received: by 2002:a17:90a:940e:: with SMTP id r14mr25446503pjo.41.1627291263269;
        Mon, 26 Jul 2021 02:21:03 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id t9sm49619360pgc.81.2021.07.26.02.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 02:21:02 -0700 (PDT)
Date:   Mon, 26 Jul 2021 14:51:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH V3 2/5] dt-bindings: i2c: Add bindings for i2c-virtio
Message-ID: <20210726092100.y4kuwzgzb2dhcwpf@vireshk-i7>
References: <cover.1627273794.git.viresh.kumar@linaro.org>
 <4182aff2d1437b30025f3d17d11e5fdc21845239.1627273794.git.viresh.kumar@linaro.org>
 <CAK8P3a3FniCgQJ0UCvrwZ8F=f11mLAwe7XH5CcrqxL8TTMUvVg@mail.gmail.com>
 <CAK8P3a2m3BB2=4gkHXZD+=y1C47Og0QvfTWuA7e28oAonMyvzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2m3BB2=4gkHXZD+=y1C47Og0QvfTWuA7e28oAonMyvzw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26-07-21, 10:11, Arnd Bergmann wrote:
> On Mon, Jul 26, 2021 at 10:06 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Mon, Jul 26, 2021 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > This patch adds binding for virtio I2C device, it is based on
> > > virtio-device bindings.
> > >
> > > Acked-by: Wolfram Sang <wsa@kernel.org>
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Too quick, after seeing the same issue in the gpio binding I saw it here too:
> 
> > +        i2c-virtio {
> > +            compatible = "virtio,22";
> 
> The node name "i2c-virtio" looks wrong. According to
> https://github.com/devicetree-org/dt-schema/blob/master/schemas/i2c/i2c-controller.yaml,
> this needs to be plain "i2c".

Okay, I will move back to simple node names then.

Thanks.

-- 
viresh
