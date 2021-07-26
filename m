Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094933D5502
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 10:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbhGZH0K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 03:26:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:36572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231778AbhGZH0J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Jul 2021 03:26:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1B9460F53;
        Mon, 26 Jul 2021 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627286798;
        bh=N+wlJsy4GAKrIINv/w8H1NHXEA0AtiFjo4AvgF3fsDQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LilKKglcL9bWEkz2pGvJiWYdBZtbRgsYIbtN0/H51SaDd9tLnKGogMyqkFvpty/gD
         CKC1DNevRcMA97K1fgz3hcXT5xgA1Dlyj2cNI83mSNvHS8RpXIsze4nMIIFqIwqxug
         42jRJYTJSkPwybgbxzS5iDngwC+0iNXbxjs0btbTlripEeSHBiGlu0KEG4ngSS4D2K
         8DD5GuxL2aYD78u8ZFKYxa73ZCwTo7I2Pu1pM1BRmJLaTjl6vR7L36JIOe3uqj41/w
         DJarcT2jwxsx5e0JmfLMVr/V9lejrIb/PzeDmFBRNy2+lxlnI9N7ga7E7AQZkfXsCm
         6jkE0B8TpNDPw==
Received: by mail-wm1-f48.google.com with SMTP id m19so883261wms.0;
        Mon, 26 Jul 2021 01:06:38 -0700 (PDT)
X-Gm-Message-State: AOAM5315rTk0y2B1tX6nOtJjlBf2b0T+ccUqKtoDB2T1wZq+Ya0KPGp7
        XrZH12f3QXR7b875gdaQ4i0clqCMCMWUt7RLS84=
X-Google-Smtp-Source: ABdhPJwcOdFhOsjnYf+WxL7ESQbys8kr2V7TRIk/gIgktuoMlOyr2SsKRO0kd1SrjaU7tPyWep45kuoTATurYxmdr44=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr6587786wmc.75.1627286797299;
 Mon, 26 Jul 2021 01:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627273794.git.viresh.kumar@linaro.org> <4182aff2d1437b30025f3d17d11e5fdc21845239.1627273794.git.viresh.kumar@linaro.org>
In-Reply-To: <4182aff2d1437b30025f3d17d11e5fdc21845239.1627273794.git.viresh.kumar@linaro.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 26 Jul 2021 10:06:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3FniCgQJ0UCvrwZ8F=f11mLAwe7XH5CcrqxL8TTMUvVg@mail.gmail.com>
Message-ID: <CAK8P3a3FniCgQJ0UCvrwZ8F=f11mLAwe7XH5CcrqxL8TTMUvVg@mail.gmail.com>
Subject: Re: [PATCH V3 2/5] dt-bindings: i2c: Add bindings for i2c-virtio
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 26, 2021 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This patch adds binding for virtio I2C device, it is based on
> virtio-device bindings.
>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
