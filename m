Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A00262B39
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 11:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgIIJC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 05:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36831 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725948AbgIIJC3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 05:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599642148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UwK/UCn7nj/bDtxyg3u6KBsLtSFGCtiaPO7yxlcqvrQ=;
        b=LQwbwBbDQTK1dJWqheR46LeuwQe+scys0zvUqDtk2SGjwlMMkXUvadMgC2ANOtf4aEzLv8
        +SVcyhiB1rysBlmjig9cs3Xr5VO4CMYt1vdtZJwDoqjBXNCxSmQOQffoIQYcfHZJwRqJ71
        0VWcNvVMTPEaZ66RggbTB6sGCP1lHkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-mdNZZnLJOlelVXruIZe3Xg-1; Wed, 09 Sep 2020 05:02:24 -0400
X-MC-Unique: mdNZZnLJOlelVXruIZe3Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C0BC801AE5;
        Wed,  9 Sep 2020 09:02:21 +0000 (UTC)
Received: from [10.72.12.24] (ovpn-12-24.pek2.redhat.com [10.72.12.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7BAC560C87;
        Wed,  9 Sep 2020 09:02:09 +0000 (UTC)
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <acf0e13d-3080-81e8-9cb1-82af6935d402@redhat.com>
Date:   Wed, 9 Sep 2020 17:02:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/3 下午1:34, Jie Deng wrote:
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -6,6 +6,9 @@
>   # ACPI drivers
>   obj-$(CONFIG_I2C_SCMI)		+= i2c-scmi.o
>   
> +# VIRTIO I2C host controller driver
> +obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
> +
>   # PC SMBus host controller drivers
>   obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535.o
>   obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> new file mode 100644
> index 0000000..47f9fd1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Virtio I2C Bus Driver
> + *
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/wait.h>
> +
> +#include <linux/virtio.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +
> +#define VIRTIO_I2C_MSG_OK	0
> +#define VIRTIO_I2C_MSG_ERR	1
> +
> +/**
> + * struct virtio_i2c_hdr - the virtio I2C message header structure
> + * @addr: i2c_msg addr, the slave address
> + * @flags: i2c_msg flags
> + * @len: i2c_msg len
> + */
> +struct virtio_i2c_hdr {
> +	__virtio16 addr;
> +	__virtio16 flags;
> +	__virtio16 len;
> +} __packed;


Btw, this part should belong to uAPI, and you need to define the status 
in uAPI.

Thanks

