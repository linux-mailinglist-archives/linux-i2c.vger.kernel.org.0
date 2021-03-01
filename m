Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257DB32825A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Mar 2021 16:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbhCAPWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Mar 2021 10:22:08 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:44559 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237132AbhCAPV4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 10:21:56 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N6KQZ-1ls8Jr3MRl-016eCx; Mon, 01 Mar 2021 16:19:19 +0100
Received: by mail-ot1-f43.google.com with SMTP id v12so15663142ott.10;
        Mon, 01 Mar 2021 07:19:18 -0800 (PST)
X-Gm-Message-State: AOAM531hTDen9I+wvfB1ixhTeDGplzbEd6g4P7W003HD4F/5E6Ghxxc3
        nsHu4r1ve4K+/OSmsivHTUw+RlOH6J2Q2ef+urQ=
X-Google-Smtp-Source: ABdhPJzyiLnOL1kROt9+jRnTIwJeOV/uCEnyhesvyVqUv7WZRVsJ+KCvh3/BmgI42/Bl2bUQmuVo20Np1fETHnPswk4=
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr14016983otq.210.1614611957367;
 Mon, 01 Mar 2021 07:19:17 -0800 (PST)
MIME-Version: 1.0
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
In-Reply-To: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 1 Mar 2021 16:19:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
Message-ID: <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SVS3nVbn0yvwNxAD3RoUHGcyiT14MMxcybwij23FDQSIt9BDyRh
 CVEyN79SQVFICVdW3gX1ZpL592MFegkI0WhelhfVAOXjCCpjJyo2PMLd+VVDC8NwhH7neGq
 FsK0lOUtk4N7KXnGztICBs1rGUgYJovzXfkH2EEFpBAEOBHo/+xXj6djevkZjOUb9UWoy3r
 q8YKew3oC6GyRbn4MqTGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c/JIOkSAk9M=:10WxeBHJ7/mruTy/4FiE/F
 IzC3UXUubt8o3WYETJIyFlIunwP/J+U2Kn9HViU530R52RFfphImEUh+yoVhiYFEWfWx9n8yT
 whNbEf2l3s/ptfMigLDlWQIHGW/0mSPrhQwZi9ZAtjC2Y5Jz5p7CyvDNatSeSOj4kwSe75/8V
 XEsBjCIrm34J+VKfN5Gcv9xhwQge64GDIzhXaOsb7IZXv+d33HsLhRVXLS4GDSNtn8xSukGB7
 bBn4o4kpCpSXSKHg084I/fVWX87kDlcqGk12cLQ011Z6FfnJZPM+UUL9EIh2/sigNK5n0a/Lw
 aGDwgUIpQkS8cSEqerfKXbB8AKOauF+IEdmWrTJkkLajwUUXufdU4Xk4mOcmWDPIshTfzSz5z
 4lI9XT7NQ3FclVry51u0l3/THmFkHnFMLpynpR+2+Y0rn3UyI62CmBUYKmepF
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 1, 2021 at 7:41 AM Jie Deng <jie.deng@intel.com> wrote:

> --- /dev/null
> +++ b/include/uapi/linux/virtio_i2c.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
> +/*
> + * Definitions for virtio I2C Adpter
> + *
> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> +#define _UAPI_LINUX_VIRTIO_I2C_H

Why is this a uapi header? Can't this all be moved into the driver
itself?

> +/**
> + * struct virtio_i2c_req - the virtio I2C request structure
> + * @out_hdr: the OUT header of the virtio I2C message
> + * @write_buf: contains one I2C segment being written to the device
> + * @read_buf: contains one I2C segment being read from the device
> + * @in_hdr: the IN header of the virtio I2C message
> + */
> +struct virtio_i2c_req {
> +       struct virtio_i2c_out_hdr out_hdr;
> +       u8 *write_buf;
> +       u8 *read_buf;
> +       struct virtio_i2c_in_hdr in_hdr;
> +};

In particular, this structure looks like it is only ever usable between
the transfer functions in the driver itself, it is shared with neither
user space nor the virtio host side.

       Arnd
