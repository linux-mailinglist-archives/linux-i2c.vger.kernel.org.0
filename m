Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6638725CFDD
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 05:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbgIDDjI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 23:39:08 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45823 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729554AbgIDDjG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 23:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599190744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EyAiC4eZwNkau3Y8SAq/5Z+4k7VTrQOqY9EtVuiJLAo=;
        b=V67Xi82e9Qwve0TwFj6v1onSQLStwniYDG+qUpcI3SVo9FIXUHyawSYEQfKVhJ+Cqg2s9h
        l3uKV7VQS78kMmG+iML/GVH/urpSQ6Qqx4QOs9Ju/KMw3Fv70VFKKxfjV37cGeV1Wwc60X
        BX1VoFmG6UIc2+li/Nf+dtS1N4v0xzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-O7FrjF36NT6sUEUv99XNOw-1; Thu, 03 Sep 2020 23:39:00 -0400
X-MC-Unique: O7FrjF36NT6sUEUv99XNOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A117B807344;
        Fri,  4 Sep 2020 03:38:57 +0000 (UTC)
Received: from [10.72.13.157] (ovpn-13-157.pek2.redhat.com [10.72.13.157])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 14FFC7EEBB;
        Fri,  4 Sep 2020 03:38:46 +0000 (UTC)
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
 <f3ab5d7d-cce5-b34c-5931-dd5d74f065e7@redhat.com>
 <6517879c-15d4-6265-761c-626cba9c95d6@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <009d829d-907d-8884-ca71-00f78e9d6e2b@redhat.com>
Date:   Fri, 4 Sep 2020 11:38:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6517879c-15d4-6265-761c-626cba9c95d6@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/3 下午3:19, Jie Deng wrote:
>
> On 2020/9/3 14:12, Jason Wang wrote:
>>
>> On 2020/9/3 下午1:34, Jie Deng wrote:
>>> Add an I2C bus driver for virtio para-virtualization.
>>>
>>> The controller can be emulated by the backend driver in
>>> any device model software by following the virtio protocol.
>>>
>>> This driver communicates with the backend driver through a
>>> virtio I2C message structure which includes following parts:
>>>
>>> - Header: i2c_msg addr, flags, len.
>>> - Data buffer: the pointer to the i2c msg data.
>>> - Status: the processing result from the backend.
>>>
>>> People may implement different backend drivers to emulate
>>> different controllers according to their needs. A backend
>>> example can be found in the device model of the open source
>>> project ACRN. For more information, please refer to
>>> https://projectacrn.org.
>>
>>
>> May I know the reason why don't you use i2c or virtio directly?
>>
> We don't want to add virtio drivers for every I2C devices in the guests.
> This bus driver is designed to provide a way to flexibly expose the 
> physical
> I2C slave devices to the guest without adding or changing the drivers 
> of the
> I2C slave devices in the guest OS.


Ok, if I understand this correctly, this is virtio transport of i2c 
message (similar to virtio-scsi).


>
>
>>
>>>
>>> The virtio device ID 34 is used for this I2C adpter since IDs
>>> before 34 have been reserved by other virtio devices.
>>
>>
>> Is there a link to the spec patch?
>>
>> Thanks
>>
> I haven't submitted the patch to reserve the ID in spec yet.
> I write the ID here because I want to see your opinions first.


It would be helpful to send a spec draft for early review.

Thanks


>
> Thanks
>
>

