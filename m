Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACF548AB7E
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 11:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349306AbiAKKe5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 05:34:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46044 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349276AbiAKKeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 05:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641897289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=37dXUpdzkIbiA2gBAZJxitixVVJbpdeFZbjZh9/Jmo4=;
        b=RZR61fBF5hs+Nxd9T7A7GLQmLHVsMzGZHrWe9cbRUEmUMJxMUlIda0uUm7XBHTwW/GkULy
        B+WAKNJncQX74g/HknbyBU1bWUaVACNH7JBsGGC4/t/M41/HFSGj9ug++SNsV1ZHy68umN
        X/AUP1HOuW0ztiWAtRIIpsp8mi9sDnI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-ooUu6lNeM-G_zZoehctKuA-1; Tue, 11 Jan 2022 05:34:48 -0500
X-MC-Unique: ooUu6lNeM-G_zZoehctKuA-1
Received: by mail-ed1-f70.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso1975487edb.10
        for <linux-i2c@vger.kernel.org>; Tue, 11 Jan 2022 02:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=37dXUpdzkIbiA2gBAZJxitixVVJbpdeFZbjZh9/Jmo4=;
        b=UWPbF1uey80v+NxWXVHClYB0gold67bg3/dybWDOflgtz3zVmDSKRJcTFXsVrWE2nX
         MQdwbhPE9iaYuqQ23Gc1mfKqhECgFTwOKzT9heE9+LkBPSTCg2yVMtbYIJPOcDF7tDOx
         3RsinNDOnRQ1Zwep6NW2CM/lOMqqzGR9pRsInTMr/hhiUBHxeo+AmF0Hw/2Y5T1uMcYd
         SJ/0bQJ57sG3O2TjUYcbXgd0+QcKMJlDtL9IMympUd371NQTRLN+oG0SpacmRfxq7zqn
         CJ+9gIe1CuKwb3RabJoBwctjfptbn3RqfEg3yJFyCaW1R/FW1NVSRCjYg/Y+OIDXqRGm
         iPZw==
X-Gm-Message-State: AOAM530bUbdnKe/GvZ6LlfrKh9wezV1sdAa9UhiPJ/QEW9YrB4wzaxJ8
        lVI9vvz44eWzC4pic0DN9d839KRZCE37nYF5u4PCB3OymQbBmj1ro3L5+J1x/rrvqFwJhhKkiaQ
        mNQ1/XuhKxekLNXxJ1PIx
X-Received: by 2002:a50:ef11:: with SMTP id m17mr3604253eds.77.1641897287097;
        Tue, 11 Jan 2022 02:34:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxytfC/4zVyaFEZyJkFMGdlhFnoSEUk7DE69obyXqdBB41oob5wEcvL0/bGVUh6V84FVmzg0w==
X-Received: by 2002:a50:ef11:: with SMTP id m17mr3604237eds.77.1641897286890;
        Tue, 11 Jan 2022 02:34:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 26sm3464078ejk.166.2022.01.11.02.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 02:34:46 -0800 (PST)
Message-ID: <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
Date:   Tue, 11 Jan 2022 11:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        dmitry.torokhov@gmail.com, Alex Hung <alex.hung@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Benjamin Tissoires <btissoir@redhat.com>,
        Mario Limonciello <mario.limonciello@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YdbrLz3tU4ohANDk@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 1/6/22 14:14, Wolfram Sang wrote:
> Hi Hans,
> 
> bumping this old thread because there might be some progress and it
> still affects quite some people.
> 
>> But I must be honest here, I don't see much progress being made
>> on this until someone with a significant amount of kernel / hw-enablement
>> experience gets it hands on one of these models. Either because some
> 
> So, I am quite optimistic that Andrea's issue is the same one which
> Miroslav Bendik dived into [1]. I will surely try to help with part of
> the PIIX I2C driver, but I lack the experience with the RMI4 driver. I
> wonder if you could have a look and maybe share your thoughts?
> 
> Thanks and all the best,
> 
>    Wolfram
> 
> [1] https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com

Benjamin Tissoires really is the export on the synaptics PS/2 -> switch to
smbus mode devices, he did all the initial hw-enablement for them.

Benjamin, see the email Wolfram linked above. It seems that on AMD
laptops we have synaptics intertouch devices connected to a plain
PIIX4 compatible I2C controller.

So we need to either add support for SMBUS host-notify to the
PIIX4 smbus driver (at least for AMD parts) or we need to support
OOB IRQ signalling in the rmi4 code, assuming there is an OOB IRQ
at all.

I've also added Mario Limonciello from AMD's client group to the Cc,

Mario, we can really use some help / insight from AMD here, both with
the problem to detect the IO addresses of the AMD PIIX4 compatible
smbus controller as well as with smbus host-notify support, see:

https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com

Regards,

Hans

