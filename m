Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65CD32CA36
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 02:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbhCDBxl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Mar 2021 20:53:41 -0500
Received: from mga11.intel.com ([192.55.52.93]:53136 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234496AbhCDBxg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Mar 2021 20:53:36 -0500
IronPort-SDR: yhfcXpu9hn6RsrmrqK/FJ8GDwD+NRvrb0HpNzEMU0FVg2wkCILi5hZxzOPbDOztY8LymGzX0y3
 Vwl0eA4SOLKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="183940685"
X-IronPort-AV: E=Sophos;i="5.81,221,1610438400"; 
   d="scan'208";a="183940685"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 17:52:56 -0800
IronPort-SDR: 9hg6fpsmucV/VDtjkzokIe8zB32Lhd6w4Hu1WfPRuU4C58Cgb7Z/bWUgeg5amMwkAM6oBHVdk+
 GVDCwulaHrMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,221,1610438400"; 
   d="scan'208";a="436167928"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2021 17:48:14 -0800
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210303075430.n7ewkots6cgbbabi@vireshk-i7>
 <876371c3-ba9a-5176-493b-5a883cba3b07@intel.com>
 <20210303093836.ftgq62yw7i6cd3q6@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <263160ce-50f0-a7a0-de18-ca10fee48bec@intel.com>
Date:   Thu, 4 Mar 2021 09:47:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303093836.ftgq62yw7i6cd3q6@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/3 17:38, Viresh Kumar wrote:
> On 03-03-21, 16:46, Jie Deng wrote:
>> This is not a problem. My original proposal was to mirror the struct
>> i2c_msg.
>> The code you looked at was based on that.
>> However, the virtio TC prefer not to mirror it. They have some concerns.
>> For example, there is a bit I2C_M_RD in i2c_msg.flag which has the same
>> meaning with
>> the R/W in virtio descriptor. This is a repetition which may cause problems.
>> So the virtio_i2c_out_hdr.flags is used to instead of i2c_msg.flags for
>> extension.
> So by default we don't support any of the existing flags except
> I2C_M_RD?
Yes. That's the current status.
> #define I2C_M_TEN		0x0010	/* this is a ten bit chip address */
> #define I2C_M_RD		0x0001	/* read data, from slave to master */
> #define I2C_M_STOP		0x8000	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_NOSTART		0x4000	/* if I2C_FUNC_NOSTART */
> #define I2C_M_REV_DIR_ADDR	0x2000	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_IGNORE_NAK	0x1000	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_NO_RD_ACK		0x0800	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_RECV_LEN		0x0400	/* length will be first received byte */
>
> How do we work with clients who want to use such flags now ?
My plan is to have a minimum driver get merged. Then we have a base and 
we can
update virtio_i2c_out_hdr.flags for the feature extensibility. Then, If 
you want to help to develop
this stuff, you can just follow the same flow. First, you can update the 
Spec by sending
comments to virtio-comment@lists.oasis-open.org. Once your Spec patch is 
acked by the
virtio TC, you can then send patches to update the corresponding drivers.

Thanks.

