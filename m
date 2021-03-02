Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589B032B1BE
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241779AbhCCBOA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:14:00 -0500
Received: from mga07.intel.com ([134.134.136.100]:22924 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234985AbhCBFMx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Mar 2021 00:12:53 -0500
IronPort-SDR: M0+QNDo5E75z1snl2cJZlheux0PeRoI59l1YYSQWVE+OzduezhoALizsyEF9Htz/CSd8EdYiC1
 JgNyF4Pn2uTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="250737284"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="250737284"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 21:06:56 -0800
IronPort-SDR: wC2bDyBmi0EgPUh2mckEVJcTi1BVjhN/kpCXBscfpu7q505k7SZLIfh0tJa+QWXTl/V4r+wymJ
 DqZBizKNO+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="444591095"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga001.jf.intel.com with ESMTP; 01 Mar 2021 21:06:50 -0800
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
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
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <CAK8P3a1ZXbodV07TTErnQunCLWOBnzRiVdLCxBD743fn-6FbXg@mail.gmail.com>
 <20210302040114.rg6bb32g2bsivsgf@vireshk-i7>
 <20210302042233.7ppagwjk3rah3uh3@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <5e66fc1b-81d3-341e-4864-adb021e9ce1e@intel.com>
Date:   Tue, 2 Mar 2021 13:06:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302042233.7ppagwjk3rah3uh3@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/2 12:22, Viresh Kumar wrote:
> On 02-03-21, 09:31, Viresh Kumar wrote:
>> On 01-03-21, 16:19, Arnd Bergmann wrote:
>>> On Mon, Mar 1, 2021 at 7:41 AM Jie Deng <jie.deng@intel.com> wrote:
>>>
>>>> --- /dev/null
>>>> +++ b/include/uapi/linux/virtio_i2c.h
>>>> @@ -0,0 +1,56 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
>>>> +/*
>>>> + * Definitions for virtio I2C Adpter
>>>> + *
>>>> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
>>>> + */
>>>> +
>>>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>>>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>>> Why is this a uapi header? Can't this all be moved into the driver
>>> itself?
>>>
>>>> +/**
>>>> + * struct virtio_i2c_req - the virtio I2C request structure
>>>> + * @out_hdr: the OUT header of the virtio I2C message
>>>> + * @write_buf: contains one I2C segment being written to the device
>>>> + * @read_buf: contains one I2C segment being read from the device
>>>> + * @in_hdr: the IN header of the virtio I2C message
>>>> + */
>>>> +struct virtio_i2c_req {
>>>> +       struct virtio_i2c_out_hdr out_hdr;
>>>> +       u8 *write_buf;
>>>> +       u8 *read_buf;
>>>> +       struct virtio_i2c_in_hdr in_hdr;
>>>> +};
>>> In particular, this structure looks like it is only ever usable between
>>> the transfer functions in the driver itself, it is shared with neither
>>> user space nor the virtio host side.
>> Why is it so ? Won't you expect hypervisors or userspace apps to use
>> these ?
> This comment applies only for the first two structures as the third
> one is never exchanged over virtio.
Yeah. Actually, the backend only needs "struct virtio_i2c_out_hdr out_hdr"
and "struct virtio_i2c_in_hdr in_hdr" for communication. So we only need 
to keep
the first two in uapi and move "struct virtio_i2c_req" into the driver.

But Jason wanted to include "struct virtio_i2c_req" in uapi. He 
explained in this link
https://lists.linuxfoundation.org/pipermail/virtualization/2020-October/050222.html.
Do you agree with that explanation ?
