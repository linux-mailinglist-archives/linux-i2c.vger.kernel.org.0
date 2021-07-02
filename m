Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBA63B9A67
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 03:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbhGBBH7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 21:07:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:31373 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234529AbhGBBH7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Jul 2021 21:07:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188339261"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="188339261"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 18:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="409132402"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by orsmga006.jf.intel.com with ESMTP; 01 Jul 2021 18:05:23 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <YN2cs0H+5C892kM4@smile.fi.intel.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <a0ee5b05-0316-2529-143f-7da42ed56994@intel.com>
Date:   Fri, 2 Jul 2021 09:05:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YN2cs0H+5C892kM4@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/1 18:45, Andy Shevchenko wrote:
> On Thu, Jul 01, 2021 at 11:24:46AM +0800, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> The device specification can be found on
>> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>>
>> By following the specification, people may implement different
>> backend drivers to emulate different controllers according to
>> their needs.
>> 	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".
> Why is that?


Please refer to https://lkml.org/lkml/2021/3/23/285.


