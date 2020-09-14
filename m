Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F71326833D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 05:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgINDnc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 23:43:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:54548 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbgINDnb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 13 Sep 2020 23:43:31 -0400
IronPort-SDR: /A7Z9X7uB64Xe+pNS3qXXWLNT1cUtu37m6j7V2mHz2P6xP2MAzjCPq7KLJEst2tE/NUOMBGGnn
 npHGnVe5xEnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="138529071"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="138529071"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2020 20:43:28 -0700
IronPort-SDR: lGgbCcMEZ4sdx2FC0HRh5wiQW5m18WKxyFO3dMxM1/hhtLs19Vrgz/VTij1piExuLa8iDKFOb3
 WQXBdxBkXZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="330567584"
Received: from unknown (HELO [10.239.154.46]) ([10.239.154.46])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2020 20:43:24 -0700
Subject: Re: [PATCH v2] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <c4bd4fd56df36864ed34d3572f00b2b838fd833a.1599795029.git.jie.deng@intel.com>
 <ce6b55d9-dfda-4387-0e04-0d50437355f0@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <9b18d14b-af69-eb12-34a3-83feb124083f@intel.com>
Date:   Mon, 14 Sep 2020 11:43:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <ce6b55d9-dfda-4387-0e04-0d50437355f0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/14 10:46, Jason Wang wrote:
>
>> +
>> +#define VIRTIO_I2C_MSG_OK    0
>> +#define VIRTIO_I2C_MSG_ERR    1
>> +
>> +/**
>> + * struct virtio_i2c_hdr - the virtio I2C message header structure
>> + * @addr: i2c_msg addr, the slave address
>> + * @flags: i2c_msg flags
>> + * @len: i2c_msg len
>> + */
>> +struct virtio_i2c_hdr {
>> +    __le16 addr;
>> +    __le16 flags;
>> +    __le16 len;
>> +};
>
>
> As said in v1, this should belong to uapi.
>
That's right. I missed this.
I will move these things to uapi. Thanks.


>
>> +
>> +/**
>> + * struct virtio_i2c_msg - the virtio I2C message structure
>> + * @hdr: the virtio I2C message header
>> + * @buf: virtio I2C message data buffer
>> + * @status: the processing result from the backend
>> + */
>> +struct virtio_i2c_msg {
>> +    struct virtio_i2c_hdr hdr;
>> +    u8 *buf;
>> +    u8 status;
>> +};
>
>
> I'm not quite sure this is the best layout.
>
> E.g virtio scsi differ in buffer out of out one:
>
> structvirtio_scsi_req_cmd{
> ...
> u8 dataout[];
> ...
> u8 datain[];
>
> }
>
> And I would like to have a look at the spec patch.
>
> Thanks
>
Sure. I will send the v3 along with the spec patch.
Thanks.


