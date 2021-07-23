Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D08D3D3755
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 11:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhGWIXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jul 2021 04:23:22 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35605 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhGWIXV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jul 2021 04:23:21 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLQl3-1lp3EH0EfT-00IRVL; Fri, 23 Jul 2021 11:03:54 +0200
Received: by mail-wr1-f48.google.com with SMTP id z7so1492059wrn.11;
        Fri, 23 Jul 2021 02:03:53 -0700 (PDT)
X-Gm-Message-State: AOAM532H1ppmufJs80cq9R517KKVB6crrQl8TBH4DDUvnZkBbVbdee8p
        sPJGyWG9nPzJ57ZLVkhBMY870k3NFUa97Sln96I=
X-Google-Smtp-Source: ABdhPJy3ItUq0sRuqlziECSTpnqgqAEwiUMYe9CtHrcLjroCnJUUgu4nyS6Li21tNISMIRuRGBH3im1Ow2SeuHqPtvs=
X-Received: by 2002:adf:e107:: with SMTP id t7mr4168842wrz.165.1627031033699;
 Fri, 23 Jul 2021 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
In-Reply-To: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 23 Jul 2021 11:03:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
Message-ID: <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, conghui.chen@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        gregkh <gregkh@linuxfoundation.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        jiedeng@alumni.sjtu.edu.cn
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kEplOMaUqVzJBv/AHt0lDnTUCf+kykaXARzxFMZ6hdYx/uda5gQ
 8XQudr/poHSIOdicNbn/kjPV3f13Sr920VbWraVIl2I0UbwQMvBZtmddYpjWDYKSG/IBVbi
 IjsuuKE79yjcNswucQoyXjrPxxG3/t9WcCL9L/bNfDJoLNtBtxukFSAjqGzViJc1s4rB3NO
 ICWrdPaYdzXmdqj0a5a2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:54dWuqyBZ3A=:lQ9lVQz1vrrr4ZCkg5Qzb0
 YS3BYopTtGGCW1xAKHITf5XcPXj80Hi8UdvQyNa+n2jTC8DNCj5MTyQDcUsbFLF0PA49tKgK8
 xNHkOH1nI+0ZneTTzUjVBgLRy81zg77VKFKEmWWW4a3tccIEGyl8N8eqoMlIfC6jCGfNGHLLm
 vdTbeyApVrivwWvjFuRZrNmppFbpKXYibpZYaHuJ3MaDcJ5UOrykURITtK/t203JDKHlO90x7
 7Z8apU8IN+Xl/6gjymz0LXViYWXPbN5i6eAr1tJ3R4kGbhK3ckL5e3+h2EwTpBhncq5IKAA6+
 MbTr0xQK5R4lyvVYtYRYj+SRDPatiUDTFfPyrUZIvgJG6/FxE5n03OYNOT0sJR+CD8pHOBvxf
 OB21f2TxvS21PkU37F/yHZ1egcbFaGKOYLPSwKL2cQ/fVFF1jswNT40FZB49QqPtGeJoGXC3O
 CBga5qJk+C0qnD+xUTuvJUWqgGqKN0hlrPdusXv8ClnCPsUpkBGdAB7ypauZ95Wjn5D279LkS
 97Gq/Waa+qCCPhtBqbg/EZ1StCBrNGLTaQhMUMf3EQu3iR06MLDFCAXcypzW7TnLx6lXoUbkL
 UTeydh3Sc5XUZKCQKQpzR4dIG4puD+/sB6Sdcc1+J/LjfR8zZxv3xH+jUgcZD4z64i+S/zFZ9
 xGrBU9xPACpRufNyf/MomhIC4zq/9lz8qhGbFfzDJ4bWbw7rMM6XLRQHfmq4sprKT4nx0IOpJ
 zboggphIyeMkG+XJE42dOJWqA907EV7UCHtCbCuFZHkes36Kr+e3164pIShV7mYw57kFVdRIE
 oyY8CGb+Un2nLSqs2ZOqqjCkqogS1ywqVPm3wN1+Xm2V4JdZi4K7YwBpi72KzNO51q3ccsP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 23, 2021 at 7:44 AM Jie Deng <jie.deng@intel.com> wrote:

> +
> +       ret = virtio_i2c_setup_vqs(vi);
> +       if (ret)
> +               return ret;
> +
> +       vi->adap.owner = THIS_MODULE;
> +       snprintf(vi->adap.name, sizeof(vi->adap.name),
> +                "i2c_virtio at virtio bus %d", vdev->index);
> +       vi->adap.algo = &virtio_algorithm;
> +       vi->adap.quirks = &virtio_i2c_quirks;
> +       vi->adap.dev.parent = &vdev->dev;
> +       i2c_set_adapdata(&vi->adap, vi);
> +
> +       /*
> +        * Setup ACPI node for controlled devices which will be probed through
> +        * ACPI.
> +        */
> +       ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));

Since there is now a generic way for virtio drivers to link up with OF
device nodes, maybe this should be handled the same way in the
virtio core rather than the driver?

> index 70a8057a..99aa27b 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -55,6 +55,7 @@
>  #define VIRTIO_ID_FS                   26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM                 27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM       29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADAPTER          34 /* virtio i2c adapter */
>  #define VIRTIO_ID_BT                   40 /* virtio bluetooth */

This will now conflict with Viresh's patch that adds all the other IDs.
Not sure if there is anything to be done about that.

       Arnd
