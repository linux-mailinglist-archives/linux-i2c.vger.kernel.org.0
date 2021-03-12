Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1990B338818
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 09:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbhCLI63 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 03:58:29 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:54957 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbhCLI62 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Mar 2021 03:58:28 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJV9S-1l0tqr2mls-00JnZX; Fri, 12 Mar 2021 09:58:25 +0100
Received: by mail-ot1-f41.google.com with SMTP id n23so3197499otq.1;
        Fri, 12 Mar 2021 00:58:25 -0800 (PST)
X-Gm-Message-State: AOAM530PkZzpcsEQPnFctjd5G+eWcxsgDN+vpL2QvHTHgB2paMF/mS+7
        umn13OL9KD1HWeLrOdmFpd9wEziBbEaAFp3i4iw=
X-Google-Smtp-Source: ABdhPJwYs59n0VylMOhIElZBVkf0QrYdjO1x9NuhV8bORxTjcrcJXdCea/1IKmHztL8VndEu2T79aN56RsYQecgZr2I=
X-Received: by 2002:a9d:6341:: with SMTP id y1mr2560459otk.210.1615539504308;
 Fri, 12 Mar 2021 00:58:24 -0800 (PST)
MIME-Version: 1.0
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
In-Reply-To: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 12 Mar 2021 09:58:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zQG3pH91emqAUsaRx4AZeuOEvSrPzXP9w_XhjU6w3ng@mail.gmail.com>
Message-ID: <CAK8P3a0zQG3pH91emqAUsaRx4AZeuOEvSrPzXP9w_XhjU6w3ng@mail.gmail.com>
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
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
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RFyjTb3yaqun4nVUoXXV5W+LErsIErLmJYY3Y7kXrAWUlL86sq8
 NS8jaexwP6V/Q6iMD9AKDLCo5I+GYzLvfxDwYOflhdX55/syaQJioKnrKZ+l0USpDlzja/d
 PMhvIGNv0u5uWX92eucVtqnZoZTfkcPwIUnPCZlq934QYg8G1dG2YdYKJaLVTeCfQduOg7s
 ucfXQGKnJEf/mlGa02XSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xskgHq0dlKc=:SZWjWYx31qMPnqLDOIhkVe
 pl0TJSlk7dsk/psFwYStbxnYRLuW7P2nKOQvkhacj3ZYXoW3k994KhZtSSGA38B1JP0mmnM5E
 pFO6P5tthpX4PGSnrON242AW9HOvxQwzH9zjRaKOz4TUeWXWcnCpW1FdsWtiCYsimNu6vEUIu
 ROkL5CW6lqtHW3pF2WKgwMWwpEhwsjTYiSZkwR9g6/rDGFYc68PU04LSWFN6M7H03gzlbHFTV
 KhzmcDh0kd50/EbnGkTLycdeUm0OBJsOskraZTi6/n8fAdenTx8axvv2+QGymZXr7OHeJ7csg
 pBkSdD8+yVhFs7ktCHcHSiqnlQyyJqhZs0Zz9h7R5dqtOEaw/TQ520hIK3gz4JMdu28tmIcti
 7wm2E++H6zallzdwWsyvMMuGp5hi3yVm4pTakm2GOLTv/9iE73fkGfhjoXunh/D8/3nCtvEX2
 Z/m2pO930gPVlM9+Aa017gXLz6P7L1ugj3ApfynDPieg3m6xviJ8v4bnZV9hB/te3FD3SpF8f
 iLwhkuKUomywP35hLPE5dGWLJpofIzn5H32U5+L18zMmRI5mUYuxt3e6PJFlniauA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 12, 2021 at 2:33 PM Jie Deng <jie.deng@intel.com> wrote:

> +
> +/**
> + * struct virtio_i2c_req - the virtio I2C request structure
> + * @out_hdr: the OUT header of the virtio I2C message
> + * @buf: the buffer into which data is read, or from which it's written
> + * @in_hdr: the IN header of the virtio I2C message
> + */
> +struct virtio_i2c_req {
> +       struct virtio_i2c_out_hdr out_hdr;
> +       uint8_t *buf;
> +       struct virtio_i2c_in_hdr in_hdr;
> +};

The simpler request structure clearly looks better than the previous version,
but I think I found another problem here, at least a theoretical one:

When you map the headers into the DMA address space, they should
be in separate cache lines, to allow the DMA mapping interfaces to
perform cache management on each one without accidentally clobbering
another member.

So far I think there is an assumption that virtio buffers are always
on cache-coherent devices, but if you ever have a virtio-i2c device
backend on a physical interconnect that is not cache coherent (e.g. a
microcontroller that shares the memory bus), this breaks down.

You could avoid this by either allocating arrays of each type separately,
or by marking each member that you pass to the device as
____cacheline_aligned.

      Arnd
