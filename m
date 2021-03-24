Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37371346E8E
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 02:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhCXBS2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 21:18:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:54152 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233880AbhCXBSE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Mar 2021 21:18:04 -0400
IronPort-SDR: FBDSabMShZ1LlcrlPeJFbHv7RbG281OoolWQ0A3ZGqSmBA5hUsa33qJg9ZHHyc4dknGTdKvwTX
 6wWVjo6XYqeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187285497"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="187285497"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 18:18:03 -0700
IronPort-SDR: zAlVZ9yHmWlD4rtt/9FoVQjk34tigwDEmDonNYtYPOpKDIpnEJojpLYTTQ3KhEgBo45gVMFNs+
 fySOsJvqCaIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="441971978"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2021 18:17:58 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
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
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <3a671a0a-b0d0-be1a-5463-8124ff63684d@intel.com>
Date:   Wed, 24 Mar 2021 09:17:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/23 17:27, Arnd Bergmann wrote:
> On Tue, Mar 23, 2021 at 9:33 AM Jie Deng <jie.deng@intel.com> wrote:
>> On 2021/3/23 15:27, Viresh Kumar wrote:
>>
>>> On 23-03-21, 22:19, Jie Deng wrote:
>>>> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
>>>> +{
>>>> +    virtio_i2c_del_vqs(vdev);
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
>>>> +{
>>>> +    return virtio_i2c_setup_vqs(vdev->priv);
>>>> +}
>>> Sorry for not looking at this earlier, but shouldn't we enclose the above two
>>> within #ifdef CONFIG_PM_SLEEP instead and drop the __maybe_unused ?
>>
>> I remembered I was suggested to use "__maybe_unused" instead of "#ifdef".
>>
>> You may check this https://lore.kernel.org/patchwork/patch/732981/
>>
>> The reason may be something like that.
> I usually recommend the use of __maybe_unused for the suspend/resume
> callbacks for drivers that use SIMPLE_DEV_PM_OPS() or similar helpers
> that hide the exact conditions under which the functions get called.
>
> In this driver, there is an explicit #ifdef in the reference to the
> functions, so
> it would make sense to use the same #ifdef around the definition.
>
> A better question to ask is whether you could use the helpers instead,
> and drop the other #ifdef.
>
>         Arnd


I didn't see the "struct virtio_driver" has a member "struct dev_pm_ops *pm"

It defines its own hooks (freeze and restore) though it includes "struct 
device_driver"

which has a "struct dev_pm_ops *pm".

I just follow other virtio drivers to directly use the hooks defined in 
"struct virtio_driver".

For this driver, Both __maybe_unused and #ifdef are OK to me.


