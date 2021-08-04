Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85A43DFA24
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 05:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbhHDD4i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 23:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhHDD4h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Aug 2021 23:56:37 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD5FC061798
        for <linux-i2c@vger.kernel.org>; Tue,  3 Aug 2021 20:56:26 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j1so1121399pjv.3
        for <linux-i2c@vger.kernel.org>; Tue, 03 Aug 2021 20:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0ZHYwmuwBB2HtOoKEULFjho6JxP6yZHRiPr37fJbra4=;
        b=hl3XdlB4jYy+wT1mdMb8yurr9oZXxti9oqh96q80dPuJJF/Yq+NLcAsFU04oNDtSkD
         /YyxOcvDDixL+wIRumzrx/wtV7hbWudOPV0de0xzY7Ci3OgQYTmX3aby0hACRe7JMytr
         MAIx2lvf/rhNZ4/sGTlxWkPnjhkDmnPgnprTf/1AQRV12jGmQ0GGTq8zhewY4fGlrpu0
         s92TpMZXI3V9KbWV1SFxIvMvXpIKcNRfD1EZ133zkkhq7K9S39ejxti1vTlneWC5H4uG
         dro0H3VInrzzA+lFf4NAm7rJrV9K4PM7/doxeiBvy4E+IE145vm3So/6OVwP7mtlzDY1
         3Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0ZHYwmuwBB2HtOoKEULFjho6JxP6yZHRiPr37fJbra4=;
        b=L+pBhbQGBUlGZbCIEOUe04jiQKudXAzy58ATwcebHFWQCLC8BhbJ761A/14BWliCRV
         xS7bc/Ud2RDRtJZUXhjUUej4qdI45/Djj2VITsg6du1LG2MnaQ8c4YNvjA/VrsqXa+Tx
         2zvwJmaDgsA3xBdviI1P6YW1a05CWvvyOpjv+oqkV+Vs3Mr944U1k8NnQh6CDXXo/atQ
         V/idezwohGHqqH9IE+tbSBI90V6h8nqRz8HwtoELoIOxdOUm+qCEMHEu3Dwye0oCbqIa
         95MrwUIqwuTtreEHoNjRCqHjiPa2DpoA89W8sjtbRaWi+WdnFZoCCElypKXtrmdzopLx
         rYJw==
X-Gm-Message-State: AOAM533lXEwCKCL6V2495Ai8G5lzbepPG+INYXbeXwNTA6tK70cPJsuM
        JStdEbqEddd3mV13C4UR12XBEw==
X-Google-Smtp-Source: ABdhPJyWbX7rhBTYZkB+2/CNdO7HVuodEfPZIWRtTfENeVnwx7K5DDQjjk4B2l/Qr4+ABKbp6VpteQ==
X-Received: by 2002:a17:902:6a82:b029:12c:58c0:1af3 with SMTP id n2-20020a1709026a82b029012c58c01af3mr39186plk.50.1628049385534;
        Tue, 03 Aug 2021 20:56:25 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id j15sm736558pfu.171.2021.08.03.20.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 20:56:25 -0700 (PDT)
Date:   Wed, 4 Aug 2021 09:26:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH V4 0/5] virtio: Add virtio-device bindings
Message-ID: <20210804035623.flacrogemvjina3o@vireshk-i7>
References: <cover.1627362340.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1627362340.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27-07-21, 10:53, Viresh Kumar wrote:
> Hi,
> 
> Currently the DT only provides support for following node types for virtio-mmio
> nodes:
> 
>         virtio_mmio@a000000 {
>                 dma-coherent;
>                 interrupts = <0x00 0x10 0x01>;
>                 reg = <0x00 0xa000000 0x00 0x200>;
>                 compatible = "virtio,mmio";
>         };
> 
> Here, each virtio-mmio corresponds to a virtio-device. But there is no way for
> other users in the DT to show their dependency on virtio devices.
> 
> This patchset provides that support.
> 
> The first patch adds virtio-device bindings to allow for device sub-nodes to be
> present and the second patch updates the virtio core to update the of_node.
> 
> Other patches add bindings for i2c and gpio devices.
> 
> Tested on x86 with qemu for arm64.

Michael,

I hope you will be picking this series (Now that it is reviewed by
others) ? Just so you know, Wolfram needs the 4th patch, 4/5, to base
the virtio-i2c driver over it and has requested an immutable branch
for the same.

Thanks.

-- 
viresh
