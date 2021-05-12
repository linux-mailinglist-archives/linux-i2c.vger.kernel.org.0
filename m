Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00A537B39E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 03:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhELBlY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 21:41:24 -0400
Received: from mga03.intel.com ([134.134.136.65]:48562 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230145AbhELBlS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 May 2021 21:41:18 -0400
IronPort-SDR: JGDGf3q1ISYuaIR3o7nfin9MwTwWDFl+jQBXPkB/91LTV2Ud+Q+vsAXzaQ1zHR9S26cHHv/Veb
 ALkrUO942GbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199643705"
X-IronPort-AV: E=Sophos;i="5.82,292,1613462400"; 
   d="scan'208";a="199643705"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 18:37:34 -0700
IronPort-SDR: 007IjHf4WiwPqoxuEtwNyMbvc+/ux94zViP2xJeFry1Btbsi5mIj4XZeHY0rTK00U0YS+61Yr8
 8B5C6Pk0Sjig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,292,1613462400"; 
   d="scan'208";a="609708586"
Received: from unknown (HELO [10.239.154.58]) ([10.239.154.58])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2021 18:37:29 -0700
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
        Stefan Hajnoczi <stefanha@redhat.com>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
 <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
 <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
 <20210415072131.GA1006@kunai>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <9a51ed24-c6cd-cafd-73d3-6ed165594b49@intel.com>
Date:   Wed, 12 May 2021 09:37:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210415072131.GA1006@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/15 15:21, Wolfram Sang wrote:

>> I didn't forget this. It is a very small change. I'm not sure if the
>> maintainer Wolfram
>>
>> has any comments so that I can address them together in one version.
> Noted. I'll have a look in the next days.

Hi Wolfram,

Kindly reminder. Hope this patch hasn't been forgotten. :)

Thanks.

