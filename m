Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23D42C4D02
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Nov 2020 03:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbgKZCAY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Nov 2020 21:00:24 -0500
Received: from mga05.intel.com ([192.55.52.43]:59686 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730060AbgKZCAY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Nov 2020 21:00:24 -0500
IronPort-SDR: KKYAvdoM9cBOKO8v9NMBXTcA2bbLuMAqw6+zdGwosjHGSlhPY7AUPzNx8srWg/rUq4yPJaJEOX
 uMLmZTVDXSrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="256933778"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
   d="scan'208";a="256933778"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 18:00:23 -0800
IronPort-SDR: 913kfw8Ec+NcvFxFD6m4Gu+rguSGuI/s3mXDR8Y+FHviKD1VfSUOTp2Swp1GI+aSrMDp9DlIXS
 tviKmatTO/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
   d="scan'208";a="359379959"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.51]) ([10.239.154.51])
  by orsmga008.jf.intel.com with ESMTP; 25 Nov 2020 18:00:18 -0800
Subject: Re: [PATCH v4] i2c: virtio: add a virtio i2c frontend driver
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
References: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
 <20201125043422-mutt-send-email-mst@kernel.org>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <6cbea83e-04fa-8d5a-bba7-d80afabe8a5d@intel.com>
Date:   Thu, 26 Nov 2020 10:00:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201125043422-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020/11/25 17:35, Michael S. Tsirkin wrote:

> On Mon, Oct 12, 2020 at 09:55:55AM +0800, Jie Deng wrote:
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
>>
>> The virtio device ID 34 is used for this I2C adpter since IDs
>> before 34 have been reserved by other virtio devices.
>>
>> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
>> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
>> Signed-off-by: Jie Deng <jie.deng@intel.com>
>> Reviewed-by: Shuo Liu <shuo.a.liu@intel.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> I assume this will be updated once the specification is acked
> by the virtio tc. Holding off on this one for now since
> we know there will be host/guest ABI changes.

Yeah. I will update this driver once the specification is acked by the 
virtio tc.

Thanks.

