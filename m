Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F71028AC64
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 05:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgJLDSn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Oct 2020 23:18:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:57761 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbgJLDSn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 11 Oct 2020 23:18:43 -0400
IronPort-SDR: +hXr4u+CiRKMFnzk1uYJ2ZBnTPVzsn3BPIYOXNVjlvAH5UZf/CGu49AH/SkwLQEGGieJ0te6b4
 HierYXXSUYHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="162218378"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="162218378"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 20:18:42 -0700
IronPort-SDR: wn48UUCHyPIxAShK90rpdGM5jdgvNx/lyisOggpdFq0ZFLb41WfVBNv3nnz9YTrKAyFr9USUj6
 MmAUQUFbr+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="299153675"
Received: from unknown (HELO [10.239.154.47]) ([10.239.154.47])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2020 20:18:39 -0700
Subject: Re: [PATCH v3] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <1350309657ab0c7b9f97e7a5c71d084f88caa549.1600743079.git.jie.deng@intel.com>
 <20201008140151.GE897@ninjato>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <4b4cd16b-5930-008f-1139-0dae2825f717@intel.com>
Date:   Mon, 12 Oct 2020 11:18:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201008140151.GE897@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/10/8 22:01, Wolfram Sang wrote:
> Hi,
>
> some super high level questions:
>
>> different controllers according to their needs. A backend
>> example can be found in the device model of the open source
>> project ACRN. For more information, please refer to
>> https://projectacrn.org.
> Could you provide a link directly to the backend, please?
Sure. Here is the link.
https://raw.githubusercontent.com/projectacrn/acrn-hypervisor/master/devicemodel/hw/pci/virtio/virtio_i2c.c
>> The device ID request:
>>          https://github.com/oasis-tcs/virtio-spec/issues/85
> Shall we wait for this to be approved? Or will it get only approved once
> the driver here is upstream?
That's what I want to know also.
So hi Michael, what's the upstream flow for this patch ?

Thanks.


>> +	  If you say yes to this option, support will be included for the virtio
>> +	  I2C adapter driver. The hardware can be emulated by any device model
>> +	  software according to the virtio protocol.
> That means stuff like "limiting which devices on a given bus can be
> accessed" will be handled by the backends, or?
>
> What kind of testing has been done with this on which setup?
>
> Thanks and happy hacking,
>
>     Wolfram
Yes, you can configure what devices can be seen by the guest.
This provides a way to flexibly organize and manage I2C slave devices 
from the guest.

We tested it on Intel APL MRB. There are some docs for you reference.
https://projectacrn.github.io/latest/developer-guides/hld/virtio-i2c.html?highlight=i2c

Regards.

