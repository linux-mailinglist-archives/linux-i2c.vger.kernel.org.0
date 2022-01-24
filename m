Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED5B49821E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 15:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238299AbiAXO1v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 09:27:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32759 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238290AbiAXO1v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 09:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643034469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9k340GVErxn1t0TlYLSwG/7hBEZLmvh82s//i58t0Cw=;
        b=JmDwuV2i44ZbMwHg7rP+EGP5cgY1rga1+qJG59N/ztg71v4DklaIrYEFtYYxxizbkgyT+o
        76OtFLVB+ymVG1B5HZm1wYTTcGtoo+xrw2OsiadIxl7P4XbRhBdA6tyntmwc7B5yD42lOv
        Z8MWmeiYKYz7W9EmkbbBGBRb5RwSp60=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-dYcGKX0HNf2wl2_DSti-Qw-1; Mon, 24 Jan 2022 09:27:48 -0500
X-MC-Unique: dYcGKX0HNf2wl2_DSti-Qw-1
Received: by mail-ej1-f69.google.com with SMTP id gb4-20020a170907960400b0069d1ebc4538so2141527ejc.2
        for <linux-i2c@vger.kernel.org>; Mon, 24 Jan 2022 06:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9k340GVErxn1t0TlYLSwG/7hBEZLmvh82s//i58t0Cw=;
        b=Dzo7Qr6VbfXvU97jKZEVFxgkmIAFnXz3NsrL6WJhIrBkM3THEw0fKewGnRokBs5PSI
         ksluzNgT3O7I+MWa9qKFg34fGsSt2/LT/EJk/ibVPzLDpLoa8Cpn1EEcWRyugjFH0S26
         FcmDLaEs5eIigPMXqy3P0EWM1N5KtEzEuzzxp8q18+2CDOfZOg8IB0RxlL4aKT76aQlR
         52GQUx0chhDH+d9kBol1RYRAb27AqVd0VjgXaTdry1WN6Rc3Tv0h0btKL2Thh6/RQX8k
         DQNRVzhP1CuULMQPKBbanVHzkCg/NK3DDKeDsDnKoTr28Hx28/L14gNP6kTt+GoVCtem
         mo6Q==
X-Gm-Message-State: AOAM530Gu+071lSxc60YP4E5DhG7TGwB5grCXhlVtLbtUMA4pBebtWru
        XUD8c0erQX47MdY3cCcsAXUGRQOCWkG/DImiZKOndug7C9zrp9VR12nUzvNvqsKTqozGakWHesS
        z/1tAdXxtBaUit/aJVHHd
X-Received: by 2002:a17:906:4998:: with SMTP id p24mr12189417eju.131.1643034467145;
        Mon, 24 Jan 2022 06:27:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWOurFSSeIeQAhUSKWF98C8kAh7B+QNdoDL7iJF6pF9xcHVzODXrWVBS416HHEpJ35NfukTw==
X-Received: by 2002:a17:906:4998:: with SMTP id p24mr12189392eju.131.1643034466892;
        Mon, 24 Jan 2022 06:27:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id zm17sm3390653ejb.213.2022.01.24.06.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 06:27:46 -0800 (PST)
Message-ID: <ca28b3eb-c06d-f8e3-c930-95da631e9a93@redhat.com>
Date:   Mon, 24 Jan 2022 15:27:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Content-Language: en-US
To:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        mario.limonciello@amd.com
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
 <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
 <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
 <b30a212f-643d-c85d-6301-d92ee0adf098@redhat.com>
 <CAOtMz3Om=R-mFbi-PRkB4zwO_j1Dc4QRH-Z0HDCk_XwWif7Pog@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOtMz3Om=R-mFbi-PRkB4zwO_j1Dc4QRH-Z0HDCk_XwWif7Pog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/24/22 13:35, Jan Dąbroś wrote:
> pt., 21 sty 2022 o 11:32 Hans de Goede <hdegoede@redhat.com> napisał(a):
>>
>> Hi Jan,
>>
>> On 1/21/22 10:59, Jan Dąbroś wrote:

<snip>

>>>> Also I don't think you are allowed to use the bus_locking code
>>>> like this. The i2c bus-locking code is intended to deal with
>>>> busses which have muxes in them, where the mux must be set
>>>> to the right branch of the bus to reach the client and then
>>>> not be changed during the transfer to that client.
>>>>
>>>> So i2c-client drivers are never supposed to directly call
>>>> the bus-locking functions.
>>>
>>> I think you are not correct here. There are examples of i2c-clients
>>> which are using i2c bus_locking for the purpose of locking adapter for
>>> the bunch of i2c transactions.
>>>
>>> As an example let's take drivers/char/tpm/tpm_tis_i2c_cr50.c. It
>>> operates in write-wait-read model and there is i2c_lock_bus() call
>>> used to ensure that bus won't be released -
>>> https://github.com/torvalds/linux/blob/master/drivers/char/tpm/tpm_tis_i2c_cr50.c#L202.
>>>
>>> Similar model is followed in drivers/char/tpm/tpm_i2c_infineon.c and
>>> couple of other i2c-client drivers.
>>
>> Ah I see, interesting (live and learn).
>>
>> But this is then combined with using the special __i2c_transfer()
>> function for the actual i2c reads/writes, since using the regular
>> i2c_transfer() function after already taking the lock would deadlock.
> 
> Correct. In other words, if i2c-client wants to block the bus/adapter
> for more than one transaction it must use some special methods. This
> isn't changed with my patchset. If one is using "normal"
> i2c_transfer(), we should be on the safe side, nothing will change
> from the i2c-client point of view. The same if one is using
> __i2c_transfer().
> 
>>
>> There is a similar unlocked raw __i2c_smbus_xfer(), but as the
>> comment in include/linux/i2c.h above the locked i2c_smbus_xfer() says:
>>
>> /* This is the very generalized SMBus access routine. You probably do not
>>    want to use this, though; one of the functions below may be much easier,
>>    and probably just as fast.
>>    Note that we use i2c_adapter here, because you do not need a specific
>>    smbus adapter to call this function. */
>> s32 i2c_smbus_xfer(...);
>>
>> So in this case a driver cannot use the usual
>> i2c_smbus_read_byte/word/byte_data/word_data() helpers and
>> the same for writes. Also using an i2c_regmap (which is used
>> in a ton of places like PMIC drivers) will not work this way.
> 
> Right, however this behavior is not altered by my patch. I just wanted
> to ensure that drivers which are already using i2c bus_locking will
> still work as expected.

Ah I see, I thought that maybe you wanted to add extra i2c bus-locking
calls to some drivers which don't have them yet to ensure that the
AMD PSP semaphore would be hold over multiple transfers in
drivers which don't do this yet.

>> So yes you can use i2c_bus_lock() for this; but only if all the
>> drivers where you want to do that limit themselves to
>> __i2c_transfer() and __i2c_smbus_xfer() calls and/or are
>> rewritten to only use those.
> 
> My goal is to not modify current behavior, that is - we don't need to
> modify clients' drivers and extra quirks applied by amdpsp semaphore
> will be "transparent" for them. IOW, switch from generic
> i2c-designware to i2c-designware-amdpsp should be invisible from the
> i2c bus perspective for i2c-clients.

Ok, I believe everything is fine as is then. My worries where about
extending the i2c bus-locking to more drivers, but if there are no
plans for that then everything is good.

Regards,

Hans

