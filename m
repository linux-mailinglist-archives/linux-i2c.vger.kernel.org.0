Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A79494C9A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbiATLPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55477 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230268AbiATLPY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642677323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vQBpjT+kj6ZZxOkSDlCWAHrGVsW61JOlDxXM5602yq4=;
        b=Duh13BJ8uxG1Q9l+wmJrgbh/EtTre06VpUlPH7+8q32EC14T2Ca4YliObar04edrB4Z2bU
        aRYI+aobZUoYe6MUuv2Bn7P8UiT29ApSLuzHsGbnWxIu1t8nFPD+f0QIb5Dbh9QuZPI8IZ
        +k9ghu6kC2YyI7exRWEEZbTvDx0v3AA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-GwYG5kgrMSK7Pl4PVFmXuQ-1; Thu, 20 Jan 2022 06:15:21 -0500
X-MC-Unique: GwYG5kgrMSK7Pl4PVFmXuQ-1
Received: by mail-ed1-f72.google.com with SMTP id t11-20020aa7d70b000000b004017521782dso5540092edq.19
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 03:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vQBpjT+kj6ZZxOkSDlCWAHrGVsW61JOlDxXM5602yq4=;
        b=Bk02M6aG0t0MqgfIx/gzPNfukV4hHcOontrbCz6Be0oKG6EqLMvR1AupH8fQBMy0+Y
         gDnSisGumPLh3IcCnRBDdQr/Qlqi4IlKSDaVV53NJkrMvUOmF0HfaeBs9/t/Kr379iHP
         IAaJ4G5bO2x6/cf5/anSMlHHxZA4lwv2T7DO+G99KZpnrsVDnkAtX1OLheFCRQnKnnNU
         Azgggrf02VToNNdy3Fm5URFgamx4N4OtGHIGYBN6bes+VzpRwZozqGDVjhK4XL4JN1h9
         aLc5/VC0rzv5u+jbttQx39hyYzQQg3Cakr2gaYrA2vIF5dn+nps0xjgw4hTJwXcH+0Oa
         E6DQ==
X-Gm-Message-State: AOAM530jtdqX1/1s1y/F4QnUllWe94aor+NEBWgFdUWTuKP1ydU5YB/X
        JJq67gMCmmDKxnqs+ztJME6UL1yFshkaEEKQVNwR0tApRWWII+4B8LvkqurKXRHenB6rSULZI07
        /55pPvvoUrYfmxjZBjJOe
X-Received: by 2002:a17:906:5042:: with SMTP id e2mr29524816ejk.647.1642677320641;
        Thu, 20 Jan 2022 03:15:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgK8gHzHK+jDFpiYJdsSWiB1s995PwIhJdMkaqCFyhsbryno7/zVtgIK+VKB6b9RsLSmKlFw==
X-Received: by 2002:a17:906:5042:: with SMTP id e2mr29524795ejk.647.1642677320416;
        Thu, 20 Jan 2022 03:15:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id jt14sm884296ejc.32.2022.01.20.03.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 03:15:19 -0800 (PST)
Message-ID: <2f7610dc-ab57-ddbf-277f-e84680da71bd@redhat.com>
Date:   Thu, 20 Jan 2022 12:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/2] i2c-designware: Add support for AMD PSP semaphore
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com
References: <20220120001621.705352-1-jsd@semihalf.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120001621.705352-1-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jan,

On 1/20/22 01:16, Jan Dabros wrote:
> This patchset comprises support for new i2c-designware controller setup on some
> AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
> controller and acts as an i2c arbitrator there (x86 is leasing bus from it).
> 
> First commit aims to improve generic i2c-designware code by adding extra locking
> on probe() and disable() paths. I would like to ask someone with access to
> boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
> behavior of my changes on such setup.
> 
> Second commit adds support for new PSP semaphore arbitration mechanism.
> Implementation is similar to the one from i2c-designware-baytrail.c however
> there are two main differences:
> 1) Add new ACPI ID in order to protect against silent binding of the old driver
> to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
> new _HID allows to recognize setup with PSP.
> 2) Beside acquire_lock() and release_lock() methods we are also applying quirks
> to the lock_bus() and unlock_bus() global adapter methods. With this in place
> all i2c clients drivers may lock i2c bus for a desired number of i2c
> transactions (e.g. write-wait-read) without being aware of that such bus is
> shared with another entity.
> 
> This patchset is a follow-up to the RFC sent earlier on LKML [1], with review
> comments applied.
> 
> Looking forward to some feedback.
> 
> [1] https://lkml.org/lkml/2021/12/22/219


Thank you for your patch series.

As you may have seen I've done a lot of work on the Bay Trail semaphore
thing. I also own several Bay Trail and Cherry Trail based devices which
use this setup.

I'll add your patches to my personal WIP tree which I regularly run
on these devices and I'll report back if I notice any issues.

One remark, I notice that there are no AMD people in the Cc, it
would be good if you can find someone from AMD to look at this,
also see my remarks to the 2nd patch in my reply to that patch.

Regards,

Hans




> 
> Jan Dabros (2):
>   i2c: designware: Add missing locks
>   i2c: designware: Add AMD PSP I2C bus support
> 
>  MAINTAINERS                                  |   1 +
>  drivers/acpi/acpi_apd.c                      |   1 +
>  drivers/i2c/busses/Kconfig                   |  10 +
>  drivers/i2c/busses/Makefile                  |   1 +
>  drivers/i2c/busses/i2c-designware-amdpsp.c   | 357 +++++++++++++++++++
>  drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
>  drivers/i2c/busses/i2c-designware-common.c   |  12 +
>  drivers/i2c/busses/i2c-designware-core.h     |  18 +-
>  drivers/i2c/busses/i2c-designware-master.c   |   6 +
>  drivers/i2c/busses/i2c-designware-platdrv.c  |  61 ++++
>  10 files changed, 469 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
> 

