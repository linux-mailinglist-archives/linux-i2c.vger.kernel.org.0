Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C17E3602CD
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 08:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhDOG4u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 02:56:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:61848 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231217AbhDOG4s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 02:56:48 -0400
IronPort-SDR: wlPK8LC7MEzJP45FvSXsHhoUjzfjZ4WGktWWr4MNmlOXoYNcxPfZqar9WgbvjQ/r++1UnoNwyK
 57ITdyR4AmLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="191612089"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="191612089"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 23:56:25 -0700
IronPort-SDR: IwNtvxqKG63G2Vyzj1z8gOzo293FGZE5KxdLe37XiCPZJxNVvEdCvfuLv0RPGJtDm3JpTVBr92
 Rdj06eOGq6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="421596188"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga007.jf.intel.com with ESMTP; 14 Apr 2021 23:56:19 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
Date:   Thu, 15 Apr 2021 14:56:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/4/15 14:45, Viresh Kumar wrote:
> On 23-03-21, 10:27, Arnd Bergmann wrote:
>> I usually recommend the use of __maybe_unused for the suspend/resume
>> callbacks for drivers that use SIMPLE_DEV_PM_OPS() or similar helpers
>> that hide the exact conditions under which the functions get called.
>>
>> In this driver, there is an explicit #ifdef in the reference to the
>> functions, so
>> it would make sense to use the same #ifdef around the definition.
> Jie,
>
> I was talking about this comment when I said I was expecting a new
> version. I think you still need to make this change.


I didn't forget this. It is a very small change. I'm not sure if the 
maintainer Wolfram

has any comments so that I can address them together in one version.

Thanks.


