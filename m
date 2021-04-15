Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E4B360254
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 08:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhDOG0L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 02:26:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:45226 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230366AbhDOG0L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 02:26:11 -0400
IronPort-SDR: 3M1ecVUBcJ83xrr9h0SXiRSX+QWmD8G0U+mig7csHqeN5PHoXV9mVJqX2fAFTVQnrJHaRnU1ZG
 pHxjF10/WzzA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="215297418"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="215297418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 23:25:47 -0700
IronPort-SDR: zY54dWZOt7m6OJWkJm9OClz48C/KRlYVNxj28nO9i1Ow2gAi24vZ3f0pwI7yaw5r46tPMikjTP
 74pQ++ZiUsUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="421587324"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga007.jf.intel.com with ESMTP; 14 Apr 2021 23:25:41 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, wsa@the-dreams.de
Cc:     wsa@kernel.org, wsa@the-dreams.de, mst@redhat.com,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <e93836c3-d444-0b8c-c9df-559de0d5f27e@intel.com>
 <20210414035229.7uqfdcd6dy2ryg3s@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <dc5d6f92-8f90-5731-5fce-4b2b6a72c81f@intel.com>
Date:   Thu, 15 Apr 2021 14:25:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210414035229.7uqfdcd6dy2ryg3s@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/4/14 11:52, Viresh Kumar wrote:
>
>> Is i2c/for-next the right tree to merge it
>> ?
> It should be.

Thanks Viresh.


Hi Wolfram,

Do you have any comments for this patch ? Your opinion will be important 
to improve this patch

since you are the maintainer of I2C.

Thanks,

Jie

