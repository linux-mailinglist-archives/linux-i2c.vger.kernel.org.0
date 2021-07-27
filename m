Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1103D6BD7
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 04:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbhG0Bey (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 21:34:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:48089 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233727AbhG0Bey (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Jul 2021 21:34:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192629016"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="192629016"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 19:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="505286256"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2021 19:15:17 -0700
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, conghui.chen@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        gregkh <gregkh@linuxfoundation.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        jiedeng@alumni.sjtu.edu.cn
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
 <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <a65f32f6-6068-951c-c080-9ae27915b288@intel.com>
Date:   Tue, 27 Jul 2021 10:15:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/23 17:03, Arnd Bergmann wrote:
> On Fri, Jul 23, 2021 at 7:44 AM Jie Deng <jie.deng@intel.com> wrote:
>
>> +
>> +       ret = virtio_i2c_setup_vqs(vi);
>> +       if (ret)
>> +               return ret;
>> +
>> +       vi->adap.owner = THIS_MODULE;
>> +       snprintf(vi->adap.name, sizeof(vi->adap.name),
>> +                "i2c_virtio at virtio bus %d", vdev->index);
>> +       vi->adap.algo = &virtio_algorithm;
>> +       vi->adap.quirks = &virtio_i2c_quirks;
>> +       vi->adap.dev.parent = &vdev->dev;
>> +       i2c_set_adapdata(&vi->adap, vi);
>> +
>> +       /*
>> +        * Setup ACPI node for controlled devices which will be probed through
>> +        * ACPI.
>> +        */
>> +       ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> Since there is now a generic way for virtio drivers to link up with OF
> device nodes, maybe this should be handled the same way in the
> virtio core rather than the driver?


I'm currently based on the I2C tree. Has that patch been already merged ？

Anyway, I think we can send an additional patch to remove this line once 
that

"generic way" patch is merged.

Regards,

Jie



