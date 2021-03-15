Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1126F33A9D2
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 04:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhCODNv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Mar 2021 23:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42744 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229599AbhCODN3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Mar 2021 23:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615778008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1KQvhWT/uEAJYmXyLme3QfbVxRoW/9wvj83xMof6nwU=;
        b=QLsjr49YHYQ34Z7dtvI2Sez0SMf3hbPuNpimDG3srBs9lT/x/c/OI2QeAOFN9v+GpT59tD
        /AeQ7H3XbHqhYpGAx7GKYnyJ542D6iB9KBOVityD2XDJv2vGUQc1TW3/EJqdwwTfx5KQYC
        5bIHvdQd8VRd6LMP3W2/7F4zLfr3gNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-rc4aCGvfNxeJ8CCy2hzIpg-1; Sun, 14 Mar 2021 23:13:25 -0400
X-MC-Unique: rc4aCGvfNxeJ8CCy2hzIpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9F5A107B02A;
        Mon, 15 Mar 2021 03:13:21 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-199.pek2.redhat.com [10.72.13.199])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A0A3A1C4;
        Mon, 15 Mar 2021 03:13:07 +0000 (UTC)
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
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
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
 <CAK8P3a0zQG3pH91emqAUsaRx4AZeuOEvSrPzXP9w_XhjU6w3ng@mail.gmail.com>
 <8070f03d-8233-636b-5ea9-395e723f7a2c@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <503b88c9-1e82-a3a3-0536-d710ddc834a5@redhat.com>
Date:   Mon, 15 Mar 2021 11:13:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8070f03d-8233-636b-5ea9-395e723f7a2c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/15 9:14 上午, Jie Deng wrote:
>
> On 2021/3/12 16:58, Arnd Bergmann wrote:
>> On Fri, Mar 12, 2021 at 2:33 PM Jie Deng <jie.deng@intel.com> wrote:
>>
>>> +
>>> +/**
>>> + * struct virtio_i2c_req - the virtio I2C request structure
>>> + * @out_hdr: the OUT header of the virtio I2C message
>>> + * @buf: the buffer into which data is read, or from which it's 
>>> written
>>> + * @in_hdr: the IN header of the virtio I2C message
>>> + */
>>> +struct virtio_i2c_req {
>>> +       struct virtio_i2c_out_hdr out_hdr;
>>> +       uint8_t *buf;
>>> +       struct virtio_i2c_in_hdr in_hdr;
>>> +};
>> The simpler request structure clearly looks better than the previous 
>> version,
>> but I think I found another problem here, at least a theoretical one:
>>
>> When you map the headers into the DMA address space, they should
>> be in separate cache lines, to allow the DMA mapping interfaces to
>> perform cache management on each one without accidentally clobbering
>> another member.
>>
>> So far I think there is an assumption that virtio buffers are always
>> on cache-coherent devices, but if you ever have a virtio-i2c device
>> backend on a physical interconnect that is not cache coherent (e.g. a
>> microcontroller that shares the memory bus), this breaks down.
>>
>> You could avoid this by either allocating arrays of each type 
>> separately,
>> or by marking each member that you pass to the device as
>> ____cacheline_aligned.
>>
>>        Arnd
> The virtio devices are software emulated.


This is not correct. There're already a brunch hardware virtio devices.

Thanks


> The backend software may need to
> consider this since it may exchange data with physical devices. But I 
> don't think
> we need it for this interface, because no DMA operation is involved 
> between the
> frontend driver and backend driver.
>
> Regards,
>
> Jie
>
>

