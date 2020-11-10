Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063AD2AD481
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 12:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgKJLON (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 06:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51390 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726827AbgKJLON (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Nov 2020 06:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605006851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KSRgJhJ11sB2/cPXZUjjpmXqMXC4MjGNNoT6xUrnnGo=;
        b=AKVXWSt+EcvEffVHn/qgikeQeFRxDBEmEtnVS1XGrWe0ZA5YwonZr91ufemboJNA0qwcsg
        gmYJArHbYtg+IK+AyarHKFOeXK3B8q/hYp2gjrbnE51JdGCDCHyHRSUK22iFRT8Y1gBa/M
        VVEkoILplcNWmeUIn0l3f6DFXKBE/8s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-3cgzdKZ6PUulq3oxsBIfqw-1; Tue, 10 Nov 2020 06:14:10 -0500
X-MC-Unique: 3cgzdKZ6PUulq3oxsBIfqw-1
Received: by mail-ed1-f69.google.com with SMTP id b13so4037932edy.8
        for <linux-i2c@vger.kernel.org>; Tue, 10 Nov 2020 03:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KSRgJhJ11sB2/cPXZUjjpmXqMXC4MjGNNoT6xUrnnGo=;
        b=Y1Qcl7ujFTP6az6pZnebZfsXEGkU4LYgNdp//zfcdnUP06jotLqL/vUwAGnmWDrloU
         IqBBTV7UGDD1CcQeUOJtd5OFCasrN8AnStF5mAc3HgtpgoZPiCCz9+EJg6x15eKb/nVF
         2ewiUDma5nbkF5OcyBwZvQo7RXnEa6bkhAc4+7IXv9hZzZwwp0rtQyvM5hHpLn/ataJQ
         3u+G++kvydQorBt1HLdq9qc23Za41DFRKVQJ7j+G/GVWC7xVGP060HooHq7x8iW8gFDx
         MKXZhuXR/RloIBxLfjQNK/XW76ihg2cTaPLewBeIu64tBQ3dxCm3IZ88wQqnUisDrmag
         9Dig==
X-Gm-Message-State: AOAM530Tjhnomv9V02nZdUjj8QNRJtzRU3aMrRlFdmkF2/Ksz5m1lsMP
        FlkgpFnAf+GT2yx4wTGLHjywDXhJlJVVbst3w1bO7KVdtpjCprLOpo0c3pVU9Uo/yWBXDIpCQ9u
        a6Mhl3fiCcO5oWvI8UpX1
X-Received: by 2002:a17:906:a011:: with SMTP id p17mr19275583ejy.119.1605006849005;
        Tue, 10 Nov 2020 03:14:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNFy44Mt7CgCugrOz/HHD+C1M8/EzbalGRpxP8nbod7NlLvFWdFQfShKqtm1bpvQoSbFdYQQ==
X-Received: by 2002:a17:906:a011:: with SMTP id p17mr19275567ejy.119.1605006848827;
        Tue, 10 Nov 2020 03:14:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id l16sm10213992ejd.70.2020.11.10.03.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 03:14:08 -0800 (PST)
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20201105080014.45410-1-hdegoede@redhat.com>
 <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
 <81343662-aaac-a5e8-af86-1370951ff646@redhat.com>
 <CAHp75VdbHPwnOAUWjSN+HuVsWVb=8EUwfWNR1onL9QNrX8yU0w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6345eeb9-8416-3e7c-e619-632b5d4abbbd@redhat.com>
Date:   Tue, 10 Nov 2020 12:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdbHPwnOAUWjSN+HuVsWVb=8EUwfWNR1onL9QNrX8yU0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/10/20 11:10 AM, Andy Shevchenko wrote:
> On Mon, Nov 9, 2020 at 1:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/5/20 11:38 AM, Andy Shevchenko wrote:
>>> On Thu, Nov 5, 2020 at 10:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> But before coming to the conclusion that i2c-multi-instantiate
>>>> would not work I had already written this series. Since this might
>>>> be useful for some other case in the future I'm sending this out
>>>> as a RFC now, mostly so that it gets added to the archives.
>>>
>>> I think they are in pretty good shape (only the 4th required a bit of
>>> attention).
>>
>> FWIW I agree with the changes which you suggest for the 4th patch.
>>
>>> Please, send as non-RFC and also Cc Heikki (just in case if he has
>>> comments wrt INT3515).
>>
>> But do we really want to land these changes, while ATM we do not
>> really have any need for them ?  Esp. the
>>
>> "platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated I2C-clients"
>>
>> Change is not without a chance of regressions. The acpi_device_is_first_physical_node()
>> behavior surprised me a bit while working on the BOSC0200 changes. So I'm not
>> 100% sure I have managed to see / think of all implications of this change.
> 
> I think in general the direction to switch to fwnode is a good one. I
> was thinking about moving i2c core to use swnodes in which case they
> will utilize fwnode pointer. But it might have complications, you are
> right.

So do you agree to just keep this series in the archives (in case we need
it later) for now ? Or would you still like me to post a non RFC version ?

Regards,

Hans

