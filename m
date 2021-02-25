Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87453324B26
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 08:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhBYHV6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 02:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbhBYHV6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Feb 2021 02:21:58 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09928C061756
        for <linux-i2c@vger.kernel.org>; Wed, 24 Feb 2021 23:21:17 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id j12so3002713pfj.12
        for <linux-i2c@vger.kernel.org>; Wed, 24 Feb 2021 23:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sUB9b8mLBADiFLajYbNzAcV1Flm8kvOKL0eDsmGOshw=;
        b=rRxk3WXAnemwR8JSd7hgJ+KgPv/k+ig/DP9xx2/NLcKoaaoeKX1pxbb6hIEE386jJJ
         PO48+Dg14MKVC6lLs/ofDX2rnvlLiA/aVqGj82xqxmNwENOmEvaz7BQQ/82oRM2MpRBP
         Hp0c5j+YpMgsV24eMJFJX9TMfhWdtcCPfpFIkWp8Z1lohgC8m1SmCT0qh4zYDldUZeEY
         TnylPwDFMED3Pm/M36PBg0t5saa8RuTO6yftzssmVtmumLuJCV1r3D7ei9iq/TeygPwD
         jlhKF51ZMA7pj3M87TLoclEfbf7ulX0zA38a87Ef8OPMYNYepr4fNfrbLzr2X7RGiO9c
         6EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sUB9b8mLBADiFLajYbNzAcV1Flm8kvOKL0eDsmGOshw=;
        b=gd8B0iWqG6Ipzju9oAzE0CZAqlWkwJescIwNZSXqp8sZOSwaADYOggjPwFmOG1Olus
         1VxjyHRhuh8yWQaryAVEV2zcfsPhkxXivayTVs+UvlhR/yWXUB+XYB9M500hyIaEHUyO
         KjAen6CqsuS7DQXjKHzt5Mdu1AzBlUhVNyaTlfYW5EK31GBzXaaZl0ttw8R6lX7NIMqm
         I+8NXC4sJQxCcUAbtPiPgRh1EMb4/46xb9xBDB7Sww7lNKbLpZjRHgwyXW/IOzouDjks
         8O8v9D3BxXJXiJTckGylXW/mr4gjzQAIKREZ+UAWR0xJnH0cu4z4pRcaSZ7elaGqPsU9
         R4Jw==
X-Gm-Message-State: AOAM530duF1fbhZQDUGelY9czjq9W6YxpM90VGi3aPU1HdwK2rtoyzUq
        IEbVKXDMajpXYnojV6lXt9A0IA==
X-Google-Smtp-Source: ABdhPJx8oZkU+Og5AYLAfH4LU1jGQ2+q2vOqBTUuB5deo/hQq51ChcRbg6JbCFV86TRA8rkaSKyNWg==
X-Received: by 2002:aa7:9e04:0:b029:1ed:996a:abb4 with SMTP id y4-20020aa79e040000b02901ed996aabb4mr1950169pfq.5.1614237677470;
        Wed, 24 Feb 2021 23:21:17 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id k9sm4639497pji.8.2021.02.24.23.21.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Feb 2021 23:21:16 -0800 (PST)
Date:   Thu, 25 Feb 2021 12:51:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v4] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210225072114.iwmtaexl3dkihlba@vireshk-i7>
References: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12-10-20, 09:55, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> This driver communicates with the backend driver through a
> virtio I2C message structure which includes following parts:
> 
> - Header: i2c_msg addr, flags, len.
> - Data buffer: the pointer to the I2C msg data.
> - Status: the processing result from the backend.
> 
> People may implement different backend drivers to emulate
> different controllers according to their needs. A backend
> example can be found in the device model of the open source
> project ACRN. For more information, please refer to
> https://projectacrn.org.

> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
> new file mode 100644
> index 0000000..7413e45
> --- /dev/null
> +++ b/include/uapi/linux/virtio_i2c.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
> +/*
> + * Definitions for virtio I2C Adpter
> + *
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> +#define _UAPI_LINUX_VIRTIO_I2C_H
> +
> +#include <linux/types.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +
> +/**
> + * struct virtio_i2c_hdr - the virtio I2C message header structure
> + * @addr: i2c_msg addr, the slave address
> + * @flags: i2c_msg flags
> + * @len: i2c_msg len
> + */
> +struct virtio_i2c_hdr {
> +	__le16 addr;
> +	__le16 flags;
> +	__le16 len;
> +};

Hi Jie,

I am a bit confused about the header and the format in which data is being
processed here. When I look at the specification present here:

https://lists.oasis-open.org/archives/virtio-comment/202009/msg00021.html

it talks about 

struct virtio_i2c_out_hdr {
        le16 addr;
        le16 padding;
        le32 flags;
};
struct virtio_i2c_in_hdr {
        u8 status;
};

struct virtio_i2c_req {
        struct virtio_i2c_out_hdr out_hdr;
        u8 write_buf [];
        u8 read_buf [];
        struct virtio_i2c_in_hdr in_hdr;
};

while what we have above is completely different. What am I missing ?

-- 
viresh
