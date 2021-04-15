Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53532360405
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 10:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhDOIPi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 04:15:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:41488 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231482AbhDOIPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 04:15:38 -0400
IronPort-SDR: iiqoOa+cX08z3b5jbQl0brSJ3C7BvBDxqbYclpkS5xbq3dJkQjD38AXIUBLdIBg5wYYtn7fgth
 dQauFgNdA1bA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174915143"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="174915143"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 01:15:15 -0700
IronPort-SDR: u7LQK+9Dd3Vu0zzlFRj1bFC9N57woWeAd5e0rKsvRAkrMxJp68n38NZRUdEA4akfAi0zamTkrT
 g3z2hPIKtBfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="421621064"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2021 01:15:09 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
 <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
 <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
 <20210415072131.GA1006@kunai> <20210415072431.apntpcwrk5hp6zg4@vireshk-i7>
 <20210415072823.GB1006@kunai>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <6849a8f0-204a-362a-ed97-e910065ab14f@intel.com>
Date:   Thu, 15 Apr 2021 16:15:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415072823.GB1006@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/15 15:28, Wolfram Sang wrote:

>> Now that we were able to catch you, I will use the opportunity to
>> clarify the doubts I had.
>>
>> - struct mutex lock in struct virtio_i2c, I don't think this is
>>    required since the core takes care of locking in absence of this.
> This is likely correct.


OK. Then I will remove the lock.


>> - Use of I2C_CLASS_DEPRECATED flag, I don't think it is required for
>>    new drivers.
> This is definately correct :)


Do you mean a new driver doesn't need to set the following ?

vi->adap.class = I2C_CLASS_DEPRECATED;

Just leave the class to be 0 ?


>
> Let's see if I will have more questions...


OK. Thank you.

