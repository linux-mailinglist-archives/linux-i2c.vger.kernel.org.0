Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9C22AB704
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Nov 2020 12:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbgKILdx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Nov 2020 06:33:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48491 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729840AbgKILdt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Nov 2020 06:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604921627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I0y9une9dAd7wKCzC7dDx1PwHSDOlK9hwWFCmkAMcfk=;
        b=dgr0GPgmP0Wv+1F/vifK7TmMVDkRYiC6m3SHLOgplo+BHHikEyu1paFTAmugXdT683g6x+
        Zfb3vcO5K/guR7y4O7S/0SZXiFk+fDl8H5We0Q4G+IuIMm/g2bB7GhooI6QGmURBprztuX
        6W+Yb/MPZheCcalr2EfJcH0yKV7YfWM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-pT2oAv6NOY2X-oEeCI30ZA-1; Mon, 09 Nov 2020 06:33:45 -0500
X-MC-Unique: pT2oAv6NOY2X-oEeCI30ZA-1
Received: by mail-ed1-f71.google.com with SMTP id f20so2573689edx.23
        for <linux-i2c@vger.kernel.org>; Mon, 09 Nov 2020 03:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I0y9une9dAd7wKCzC7dDx1PwHSDOlK9hwWFCmkAMcfk=;
        b=FHcuKFvfPuZ89btWr/rF4rYlrW+oIJl/r/JcXuQ9+AAiPCaWalMALRltXPooWSZots
         9kNKtjt/JyhFkIyi4/MlmVloD7D/9I55Cb9HKoia6Mlv/zU18TJy+/Z3RPHOp784wSl6
         RWVoCkBeQI0CPOWeGPynXGvrIXKuY4cFjp6elOQIKVV0JoC0mcJd2qPx2c1fvm6gokEB
         ryEV6A7nhEqu4bFwRGuhJRiPOx0+qMk+AvdMfxF//D+YcHwRqyeMeXKVrcOXODdvSw7j
         7S8A1VdNWDQdg+p1GIX2s4xXSDdpx9/J7rDnHdTxmYuXtXjkAdxJ9oOL567lYl9pvIPL
         yKAQ==
X-Gm-Message-State: AOAM530+5DxSDMFaZMM/IthdXsujdonc/aEse7MWkAXaXkGTtRUXk4dL
        eRHYE8EyOQ1XKC9zmjIHbwEDLJS84KaQ4DUp36DXkqs4oMYFqGuGdU7XjsXO13MgXNH57NnpolY
        V5X8B7FKAMqyabOJ/1MKD
X-Received: by 2002:a17:906:a856:: with SMTP id dx22mr15307614ejb.134.1604921624266;
        Mon, 09 Nov 2020 03:33:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv+LZ1UaVjw8uypylORNMXf0QJe+HVoYGs+pFH/saLwYr720RtVw2WF/1rp7jTJs08Uyvd3g==
X-Received: by 2002:a17:906:a856:: with SMTP id dx22mr15307602ejb.134.1604921624076;
        Mon, 09 Nov 2020 03:33:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id us11sm8710712ejb.91.2020.11.09.03.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 03:33:43 -0800 (PST)
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20201105080014.45410-1-hdegoede@redhat.com>
 <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <81343662-aaac-a5e8-af86-1370951ff646@redhat.com>
Date:   Mon, 9 Nov 2020 12:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/5/20 11:38 AM, Andy Shevchenko wrote:
> On Thu, Nov 5, 2020 at 10:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> As the subject says this series is mostly about passing the ACPI fwnode to
>> i2c-clients instantiated by the i2c-multi-instantiate code.
>>
>> As discussed here:
>> https://bugzilla.kernel.org/show_bug.cgi?id=198671
>>
>> BOSC0200 ACPI devices may sometimes describe 2 accelerometers in a single
>> ACPI device, while working on this I noticed that BOSC0200 ACPI nodes
>> contain ACCEL_MOUNT_MATRIX info (unlike all the other ACPI ids for bmc150
>> accelerometers). Which is why I wanted to pass the fwnode so that we
>> could use this info in the bmc150-accel driver.
>>
>> The plan was to use i2c-multi-instantiate for this, but doing so will
>> change the modalias and /lib/udev/hwdb.d/60-sensor.hwdb matches on
>> the modalias for various quirks setting ACCEL_MOUNT_MATRIX. So then the
>> plan became to first add support for the mount-matrix provided inside
>> the BOSC0200 ACPI node, making the udev info unnecessary. But for at
>> least 1 model (and probably more) the BOSC0200 ACPI node and hwdb info
>> does not match and since the hwdb info is added by users of the actual
>> devices we can assume it is correct, so it seems that we cannot always
>> trust the ACPI provided info.  This is ok, the hwdb info overrides it
>> (iio-sensor-proxy prefers the udev provided mount-matrix over the
>> one provided by the driver) but this means that we MUST keep the
>> existing hwdb matches working, which means that we cannot use
>> i2c-multi-instantiate for this.
>>
>> Instead I will dust of an old patch for this from Jeremy Cline:
>> https://patchwork.kernel.org/project/linux-iio/patch/010001602cf53153-39ad69f1-1b39-4e6d-a748-9455a16c2fbd-000000@email.amazonses.com/
>>
>> Which deals with there being 2 accelerometers inside the bmc150-accel
>> driver.
>>
>> But before coming to the conclusion that i2c-multi-instantiate
>> would not work I had already written this series. Since this might
>> be useful for some other case in the future I'm sending this out
>> as a RFC now, mostly so that it gets added to the archives.
> 
> I think they are in pretty good shape (only the 4th required a bit of
> attention).

FWIW I agree with the changes which you suggest for the 4th patch.

> Please, send as non-RFC and also Cc Heikki (just in case if he has
> comments wrt INT3515).

But do we really want to land these changes, while ATM we do not
really have any need for them ?  Esp. the

"platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated I2C-clients"

Change is not without a chance of regressions. The acpi_device_is_first_physical_node()
behavior surprised me a bit while working on the BOSC0200 changes. So I'm not
100% sure I have managed to see / think of all implications of this change.

Heikki do you now (or in the near future) need access to the fwnode for
the TypeC controllers handled by the i2c-multi-instantiate code ?

Note that if we do decide to move forward with this set, it should probably
be merged in its entirety by Wolfram as it also makes i2c-core changes
(or Wolfram could just merge the i2c-core change and provide an immutable
branch for me to merge into pdx86/for-next.

And then your (Andy's) cleanup series can be applied on top of this once merged.

Regards,

Hans


