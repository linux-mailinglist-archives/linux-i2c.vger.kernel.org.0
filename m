Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DAE325BB7
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 03:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhBZCqv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 21:46:51 -0500
Received: from mga05.intel.com ([192.55.52.43]:20339 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhBZCqv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Feb 2021 21:46:51 -0500
IronPort-SDR: +CYwmrmbvMnQuqmZznONf+aTcqMaejUSBL9lPO5AnZfevIdrN52yNnEOGYZubW8uu6hwQ34W+p
 TWe5z4ySUXHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="270727212"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; 
   d="scan'208";a="270727212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2021 18:46:09 -0800
IronPort-SDR: w314YCxjSH0H8ZlyfaKP5R8op3fGNv6mqVTzXc/AYy9Uw5jSvYiWZXzg+of4kSdh9M3WdQXHFS
 U+iy9egrEs1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; 
   d="scan'208";a="381839855"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga002.jf.intel.com with ESMTP; 25 Feb 2021 18:46:04 -0800
Subject: Re: [PATCH v4] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
 <20210225072114.iwmtaexl3dkihlba@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <a580de35-787e-4024-3c80-0a101b1a6d3b@intel.com>
Date:   Fri, 26 Feb 2021 10:46:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225072114.iwmtaexl3dkihlba@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/2/25 15:21, Viresh Kumar wrote:
> On 12-10-20, 09:55, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> This driver communicates with the backend driver through a
>> virtio I2C message structure which includes following parts:
>>
>> - Header: i2c_msg addr, flags, len.
>> - Data buffer: the pointer to the I2C msg data.
>> - Status: the processing result from the backend.
>>
>> People may implement different backend drivers to emulate
>> different controllers according to their needs. A backend
>> example can be found in the device model of the open source
>> project ACRN. For more information, please refer to
>> https://projectacrn.org.
>> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
>> new file mode 100644
>> index 0000000..7413e45
>> --- /dev/null
>> +++ b/include/uapi/linux/virtio_i2c.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
>> +/*
>> + * Definitions for virtio I2C Adpter
>> + *
>> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/virtio_ids.h>
>> +#include <linux/virtio_config.h>
>> +
>> +/**
>> + * struct virtio_i2c_hdr - the virtio I2C message header structure
>> + * @addr: i2c_msg addr, the slave address
>> + * @flags: i2c_msg flags
>> + * @len: i2c_msg len
>> + */
>> +struct virtio_i2c_hdr {
>> +	__le16 addr;
>> +	__le16 flags;
>> +	__le16 len;
>> +};
> Hi Jie,
>
> I am a bit confused about the header and the format in which data is being
> processed here. When I look at the specification present here:
>
> https://lists.oasis-open.org/archives/virtio-comment/202009/msg00021.html
>
> it talks about
>
> struct virtio_i2c_out_hdr {
>          le16 addr;
>          le16 padding;
>          le32 flags;
> };
> struct virtio_i2c_in_hdr {
>          u8 status;
> };
>
> struct virtio_i2c_req {
>          struct virtio_i2c_out_hdr out_hdr;
>          u8 write_buf [];
>          u8 read_buf [];
>          struct virtio_i2c_in_hdr in_hdr;
> };
>
> while what we have above is completely different. What am I missing ?

This v4 was the old version before the specification was acked by the 
virtio tc.

Following is the latest specification.

https://raw.githubusercontent.com/oasis-tcs/virtio-spec/master/virtio-i2c.tex

I will send the v5 since the host/guest ABI changes.

Thanks.

