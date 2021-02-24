Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3A0323A6C
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 11:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbhBXKVK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 05:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhBXKVG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Feb 2021 05:21:06 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0C9C06174A;
        Wed, 24 Feb 2021 02:20:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v1so1325509wrd.6;
        Wed, 24 Feb 2021 02:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+ynFYq7eMGJx1ln+zWV+b0o9T/BW44U3HpTLuEIXEk4=;
        b=gVKwmps2YnnodY5iuPpamwE87ADKZx3WagV/HVFdp48iAk8XKWQKGiE4GnZUjCIbA1
         ajN2Kgjt/0T8bUxPm/xy3wqPOlgpagzfQoXrDWRYFlkddJH9yCMMfrPxdt7+cr3CO1yN
         WxSCjeK9sIl3dk1LcxsaQuL2p+D8MxDNL2LjvjH1DwKoxFQ7LYfmkbYH8aStnJNLNJHf
         M8bzLOToMI6fdSkCTRVeKHSg8ZDAiS+HjbA9NptzWYvnKvrAj2Qgn2b8OqBqFdxU4UKU
         qqrcYhVyzvgsMUtKiigu8FcPhByLH9+lgpPC5BN00J6XtJ15JRhPhpXrKkpRTWxa2R6q
         iW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+ynFYq7eMGJx1ln+zWV+b0o9T/BW44U3HpTLuEIXEk4=;
        b=YluFOCGeEHGAuOF8Ax3rkwPnGrI43HIDUI9lJWtt9kTaXauXL1iQF3B9Vh0pDSLc54
         vcujbN4J3UxUxIobnZlJzQ6lUDkGNE395HmdLzKMK7Ent75S4cICKqguaO6AM8KYbuk9
         gkkcJnoxkUlLQdOC5GSYaiot+AudIdPtefpb3HXekfGlkUOm/1gQhH35/3a8XzVEX47O
         iUvZZjTv0fnMmQ6PujDUlB1RhsgNoBXz4685SR57UcNdMZo5nb9hG+aRQVL6MSNNuNt4
         JsdiHca8F4kesm72MZOF6Zg+JCv6S73MaF1Lk5EygddKa4DVvTuCcauC/JfeIlNp8kA6
         ykgw==
X-Gm-Message-State: AOAM533X8Uo2sQtlBItoED8/bjm4/IRKUReCBedTK44/3s6Myll4gxhA
        bSpvoiemsAmZejCtM75byK0=
X-Google-Smtp-Source: ABdhPJxyz7gcbh1gakgOpaIkF6ifM7VuSjfCg5KjKbVjLf5UVR1vPE/QJelLB3m3OXr8qA8tTfbJoA==
X-Received: by 2002:adf:bc01:: with SMTP id s1mr1122726wrg.240.1614162023821;
        Wed, 24 Feb 2021 02:20:23 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id o129sm2117043wme.21.2021.02.24.02.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 02:20:23 -0800 (PST)
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-6-djrscally@gmail.com>
 <YDVfyt2d2Nhsa7l3@pendragon.ideasonboard.com>
 <1360fc85-3f39-1dce-eee9-c4e76c2087ae@gmail.com>
 <YDYmv0PpSndAlnDC@pendragon.ideasonboard.com>
 <CAHp75VcKUjnwh4fi-mofooBuBYiqXjXOspU4twKg6-Lfvzf=QA@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <fff9d990-53b0-0bdb-5127-5d118bfd7e13@gmail.com>
Date:   Wed, 24 Feb 2021 10:20:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcKUjnwh4fi-mofooBuBYiqXjXOspU4twKg6-Lfvzf=QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy, Laurent

On 24/02/2021 10:18, Andy Shevchenko wrote:
> On Wed, Feb 24, 2021 at 12:16 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Tue, Feb 23, 2021 at 10:36:18PM +0000, Daniel Scally wrote:
>>> On 23/02/2021 20:04, Laurent Pinchart wrote:
> ...
>
>>>>> +  get_device(&int3472->sensor->dev);
>>>> I see no corresponding put_device(), am I missing something ? I'm also
>>>> not sure why this is needed.
>>> The put is acpi_dev_put() in skl_int3472_discrete_remove(); there seems
>>> to be no acpi_dev_get() for some reason. We use the sensor acpi_device
>>> to get the clock frequency, and to fetch the sensor module string, so I
>>> thought it ought to hold a reference on those grounds.
>> Shouldn't acpi_dev_get_dependent_dev() increase the reference count
>> then, instead of doing it manually here ?
> That's what I expected as well.
> We have plenty of acpi_dev_get_*() and they do increase the reference
> counter one way or the other.
>
Okedokey, I'll move the get() to that function and drop it from here.
