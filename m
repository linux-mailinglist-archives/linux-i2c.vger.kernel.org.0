Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3396C343BCC
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 09:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhCVI2o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 04:28:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:11146 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230040AbhCVI2i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 04:28:38 -0400
IronPort-SDR: PHWMEBfO6tyGokH0FhaGvqjcKkx21ntI2UjFJAEE100i4PvkySWWG8cyD+zN2+3lJkT2NxTPoj
 c/zorXn1CNiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="210291437"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="210291437"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 01:28:37 -0700
IronPort-SDR: B4r06u5gEarLdb3pVnUy1PVeMTpmrYqd8XYUNiKF5/HB8KAV+XHWfMu96lCnaN4TZykDLrFMaW
 rGBQ89h+itBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="414390082"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga008.jf.intel.com with ESMTP; 22 Mar 2021 01:28:32 -0700
Subject: Re: [PATCH v9] i2c: virtio: add a virtio i2c frontend driver
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
 <20210322041857-mutt-send-email-mst@kernel.org>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <5f4aec88-3131-ca20-e28e-383642c9a2ad@intel.com>
Date:   Mon, 22 Mar 2021 16:28:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322041857-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/22 16:19, Michael S. Tsirkin wrote:
> On Mon, Mar 22, 2021 at 09:35:59PM +0800, Jie Deng wrote:
>> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
>> index bc1c062..6ae32db 100644
>> --- a/include/uapi/linux/virtio_ids.h
>> +++ b/include/uapi/linux/virtio_ids.h
>> @@ -54,5 +54,6 @@
>>   #define VIRTIO_ID_FS			26 /* virtio filesystem */
>>   #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>>   #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
>> +#define VIRTIO_ID_I2C_ADPTER		34 /* virtio i2c adpter */
> ADPTER -> ADAPTER?
> adpter -> adapter?


Good catch. Thanks Michael.


