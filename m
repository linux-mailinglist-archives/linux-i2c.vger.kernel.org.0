Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FFD25D0DD
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 07:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgIDF3F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 01:29:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:43992 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbgIDF3F (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 01:29:05 -0400
IronPort-SDR: 40elwJC6EzJ6KiEMhW6LCL/pHwDsFmPyt3FEqd/MkuNGBHJSQtyGCqat2JyCcCfIwz3jdtUBV0
 rwhvv3fLxzWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="219250518"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; 
   d="scan'208";a="219250518"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 22:29:04 -0700
IronPort-SDR: Q86+RsKjWPVnlFWVlO8qPU3DAeUdjybbx+mzk7VzMm6HiRSQhhrw17/F9xhnDahn9QE2WWDCah
 8bksgMuCCPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; 
   d="scan'208";a="502779266"
Received: from unknown (HELO [10.239.154.46]) ([10.239.154.46])
  by fmsmga006.fm.intel.com with ESMTP; 03 Sep 2020 22:29:00 -0700
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
 <20200903055633-mutt-send-email-mst@kernel.org>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <158c9601-d38c-47b4-9493-43fd89a85398@intel.com>
Date:   Fri, 4 Sep 2020 13:28:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <20200903055633-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/3 17:58, Michael S. Tsirkin wrote:
> On Thu, Sep 03, 2020 at 01:34:45PM +0800, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> This driver communicates with the backend driver through a
>> virtio I2C message structure which includes following parts:
>>
>> - Header: i2c_msg addr, flags, len.
>> - Data buffer: the pointer to the i2c msg data.
>> - Status: the processing result from the backend.
>>
>> People may implement different backend drivers to emulate
>> different controllers according to their needs. A backend
>> example can be found in the device model of the open source
>> project ACRN. For more information, please refer to
>> https://projectacrn.org.
>>
>> The virtio device ID 34 is used for this I2C adpter since IDs
>> before 34 have been reserved by other virtio devices.
> Please reserve the ID with the virtio tc so no one conflicts.
>
Sure. I will send a patch to request the ID.


>
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
> virtio16 is for legacy devices, modern ones should be __le.
> and  we don't really need to pack it I think.

Right. I will fix these. Thanks.




