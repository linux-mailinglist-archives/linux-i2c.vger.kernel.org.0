Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CF73D5511
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 10:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhGZHbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 03:31:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232346AbhGZHbV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Jul 2021 03:31:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EEF160F4A;
        Mon, 26 Jul 2021 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627287110;
        bh=x9BfLt21eI+bS8doUSvOI3N0Cb/8WZxlnko7Fk5mChY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Mmwv1I9HuLDrkWE1iwdzYaxKnNykSm6bPuX1vgCqsY6tQOYrVjLG20i2W5jEBxrdd
         egZ6Uh68mDM58KhM5sgD+h13jcsJvwdJKZGkC4iJ4WR6L26Bi8QANFAGH4rBqPHoxS
         Hk5udWcuIfvJDvtxIe537hr1IMasPms5s/l27DGX7fPj66roOzYs2Asx5ueGtPmKQq
         Ip3RX63svpfmm4OrSOdWXkS/7IlREwACWuvwSA5zGlGTC2gPLhQKVP36oLNqjZ9l5n
         Yy+Cs27DRckXLgJIpLKBWUjouZrLNCqmxl3J7mG1Y4+r4b08VyCItlwhZh4QMoh/rk
         jla3snJ8Pm3+A==
Received: by mail-wr1-f42.google.com with SMTP id n12so6422186wrr.2;
        Mon, 26 Jul 2021 01:11:50 -0700 (PDT)
X-Gm-Message-State: AOAM533ZCVQfgBTRJ2ge682HyjzJldgN5n3VHBO0uFe3fVMzr2AtJl2L
        3EjiWhpp+aEMDkVu78od/q8Bgi3O151rA2YdUd0=
X-Google-Smtp-Source: ABdhPJxG7BvoCYsqUtkwdHizGdjcpK4OiCLglI/wh62vI4zXHtiEnOj0MvxoAE1MXYgl87VRCwNn5nPTCFq2f6cG5bo=
X-Received: by 2002:adf:e107:: with SMTP id t7mr17820045wrz.165.1627287108986;
 Mon, 26 Jul 2021 01:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627273794.git.viresh.kumar@linaro.org> <4182aff2d1437b30025f3d17d11e5fdc21845239.1627273794.git.viresh.kumar@linaro.org>
 <CAK8P3a3FniCgQJ0UCvrwZ8F=f11mLAwe7XH5CcrqxL8TTMUvVg@mail.gmail.com>
In-Reply-To: <CAK8P3a3FniCgQJ0UCvrwZ8F=f11mLAwe7XH5CcrqxL8TTMUvVg@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 26 Jul 2021 10:11:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2m3BB2=4gkHXZD+=y1C47Og0QvfTWuA7e28oAonMyvzw@mail.gmail.com>
Message-ID: <CAK8P3a2m3BB2=4gkHXZD+=y1C47Og0QvfTWuA7e28oAonMyvzw@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 10:06 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jul 26, 2021 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > This patch adds binding for virtio I2C device, it is based on
> > virtio-device bindings.
> >
> > Acked-by: Wolfram Sang <wsa@kernel.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Too quick, after seeing the same issue in the gpio binding I saw it here too:

> +        i2c-virtio {
> +            compatible = "virtio,22";

The node name "i2c-virtio" looks wrong. According to
https://github.com/devicetree-org/dt-schema/blob/master/schemas/i2c/i2c-controller.yaml,
this needs to be plain "i2c".

       Arnd
