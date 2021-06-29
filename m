Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186EB3B6CBB
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 05:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhF2DGQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 23:06:16 -0400
Received: from mga12.intel.com ([192.55.52.136]:50692 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231332AbhF2DGP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Jun 2021 23:06:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="187761273"
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; 
   d="scan'208";a="187761273"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 20:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; 
   d="scan'208";a="456601083"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2021 20:03:43 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@kernel.org>,
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
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <cdadf700-921b-7c61-210d-7aad355a3871@intel.com>
Date:   Tue, 29 Jun 2021 11:03:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/6/28 17:01, Arnd Bergmann wrote:

> On Mon, Jun 28, 2021 at 10:39 AM Wolfram Sang <wsa@kernel.org> wrote:
>> sorry for the long delay. I am not familiar with VFIO, so I had to dive
>> into the topic a little first. I am still not seeing through it
>> completely, so I have very high-level questions first.
> You probably know this already, but just in case for clarification
> these are two different things:
>
> VFIO: kernel feature to make raw (usually PCI) devices available
>             to user space drivers and virtual machines from a kernel
>             running on bare metal.
>
> virtio: transport protocol for implementing arbitrary paravirtualized
>            drivers in (usually) a virtual machine guest without giving the
>            guest access to hardware registers.
>
Thanks Arnd for clarification.

Let me add some more:


The native model is as follows: a specific native I2C driver operates a 
specific hardware.

A specific native I2C driver  <--> A specific hardware


The virtio paravirtualized model is something like:

virtio-i2c <--> virtio I2C interfaces <--> virtio-backend <--> Real hardware

virtio-i2c: is this driver, the frontend driver.

virtio I2C interfaces: which are described in the specification.

https://raw.githubusercontent.com/oasis-tcs/virtio-spec/master/virtio-i2c.tex.

     I had tried to mirror Linux I2C interfaces (like "i2c_msg") into 
virtio I2C interface directly. But

     when I was doing upstream for this specification, I understood the 
virtio TC had the design philosophy

     "VIRTIO devices are not specific to Linux so the specs design 
should avoid the limitations of the

     current Linux driver behavior." So we redefined a minimum virtio 
I2C interfaces to make a working POC.

     and we may extend it in the future according to the need.

virtio-backend: the backend driver communicate with virtio-i2c by 
following virtio I2C interfaces specs.

      The are already two backend drivers developed by Viresh, one in 
QEMU, another in rust-vmm.

      1. vhost-user: 
https://lore.kernel.org/qemu-devel/cover.1617278395.git.viresh.kumar@linaro.org/t/#m3b5044bad9769b170f505e63bd081eb27cef8db2

      2. rust-vmm I2C backend: 
https://github.com/rust-vmm/vhost-device/pull/1


Regards,

Jie







