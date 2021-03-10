Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E22633340B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 05:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhCJD7z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 22:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36800 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229485AbhCJD7e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 22:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615348773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zqvaTm0YYGfnIq7+2390v7zCd44rG+1I8H0HRw9yO+w=;
        b=Rfv47xLLNaBg035BBcXudLYlgavZkHiqwKl5EtxfL5fjoGpyRfn+OTW+pg2jmZYYrkeKj9
        m5Boz9Dfvz/ZLMEns3EVm1T5qOqMsYI65NQeZsc6sYsElreiv8rU7ps7ISnlJHEKaM52SN
        7hj+iW0bSqSIZ5mJ6c5RITKNROn81Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-kucxnTcWNDy5a7PZoL9CWw-1; Tue, 09 Mar 2021 22:59:32 -0500
X-MC-Unique: kucxnTcWNDy5a7PZoL9CWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 839FA80432D;
        Wed, 10 Mar 2021 03:59:29 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-88.pek2.redhat.com [10.72.12.88])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 356E65D9DB;
        Wed, 10 Mar 2021 03:59:10 +0000 (UTC)
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa@kernel.org, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
 <db9350b3-b847-8f54-546f-9a0bdec425d4@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <a3d4ce55-db25-5f96-ff44-5b76edfe9e08@redhat.com>
Date:   Wed, 10 Mar 2021 11:59:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <db9350b3-b847-8f54-546f-9a0bdec425d4@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/10 10:22 上午, Jie Deng wrote:
>
> On 2021/3/4 17:15, Jason Wang wrote:
>>
>>
>>> +        }
>>> +
>>> +        if (msgs[i].flags & I2C_M_RD)
>>> +            memcpy(msgs[i].buf, req->buf, msgs[i].len);
>>
>>
>> Sorry if I had asked this before but any rason not to use msg[i].buf 
>> directly?
>>
>>
> The msg[i].buf is passed by the I2C core. I just noticed that these 
> bufs are not
> always allocated by kmalloc. They may come from the stack, which may 
> cause
> the check "sg_init_one -> sg_set_buf -> virt_addr_valid"  to fail. 
> Therefore the
> msg[i].buf is not suitable for direct use here.
>
> Regards.


Right, stack is virtually mapped.

Thanks

