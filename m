Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71616330140
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Mar 2021 14:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhCGNge (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 08:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbhCGNgd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 08:36:33 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFB2C06174A;
        Sun,  7 Mar 2021 05:36:32 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l12so8544290wry.2;
        Sun, 07 Mar 2021 05:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yi0ZEk8deovytENaEvDCthUQeLN5wMyV9czNFYkt5v8=;
        b=TW2g+FuofdVpBTKZbgcw7UKt9/oClRY56f0UVE9xgNtjCBHogr2CzWpaXjjoD05OYh
         phK5IWT+dSSm3LAgHAX9g20Oz3GAXeRw8Xbae4QR1VSiwyHJYK9yqCRH9+liu1vAiMmw
         dYbQ3wwWE7gQaXjMQQZt10qiwMdI2syLNxVgxP5o9XipAlb8hfmO6VJHOhvLWpdstCHF
         gdB2ubkT3mLtZCFCrsVNZn0k794MUwlEtH2DI0MN2BkQYV1mzPsBF8L5uoWXEfp7mxcG
         0gMRBOkNACZYYQ+SfSW1u1Jcpopa57a30U71lA5co9aEsbrmMmllQbqWOtpO53LB9UaM
         LENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yi0ZEk8deovytENaEvDCthUQeLN5wMyV9czNFYkt5v8=;
        b=DCcqMqq0f+CYMinqH4aMBwNclvmNpBQei4GKekCm7Ht2i7M5gSxkAYEUwmEO+f2wM9
         6VZEc3Yjk2IskEVgraQu1GdgtWNifP9Ayl3Z8bhViZamHPiFAEb7AhHPf9M7hInkfAJ1
         bLNBC6Kblx4EcLA3JJBA5X/Z7GKc/5rzL9V5dqjNwVr0clOK6+oLo/om2XMuuv6oEXam
         TXQ0JsHovRvcPVuLfQnpOcuThOM8D7ZbwFLB8rBSYa3XurSiICyzYItu8jbd9DIlfRj5
         aKdSyqkFCpGQN2wca4ZwnFbc0/fI6KaXqNA3rEsqAHQ8Um4SdSk+woCS71dJ2062DRSF
         YNnQ==
X-Gm-Message-State: AOAM532X7iA+5C6pnDEMmaf5QitQUiZEixc/el9F8o0yr09gOeD1twzm
        uWzY4RoYtUqDBNh8ZqFaaZU=
X-Google-Smtp-Source: ABdhPJwVhpx/6GHUWljlYteLFeB2XDkyHEIXoHp6ywzSmetUGMVD69EzoZpf743suloxyGthWzmtWg==
X-Received: by 2002:adf:f851:: with SMTP id d17mr18290310wrq.267.1615124191313;
        Sun, 07 Mar 2021 05:36:31 -0800 (PST)
Received: from [192.168.1.211] ([2.26.187.30])
        by smtp.gmail.com with ESMTPSA id v1sm12702800wmj.31.2021.03.07.05.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 05:36:30 -0800 (PST)
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        devel@acpica.org, "Rafael J . Wysocki" <rafael@kernel.org>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-2-djrscally@gmail.com>
 <CAHp75VfPuDjt=ZfHkwErF7_6Ks6wpqXO8mtq-2KjV+mU_PXFtg@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <615bad5e-6e68-43c9-dd0b-f26d2832d52f@gmail.com>
Date:   Sun, 7 Mar 2021 13:36:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfPuDjt=ZfHkwErF7_6Ks6wpqXO8mtq-2KjV+mU_PXFtg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 22/02/2021 13:34, Andy Shevchenko wrote:
> On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
>> The acpi_walk_dep_device_list() is not as generalisable as its name
>> implies, serving only to decrement the dependency count for each
>> dependent device of the input. Extend the function to instead accept
>> a callback which can be applied to all the dependencies in acpi_dep_list.
>> Replace all existing calls to the function with calls to a wrapper, passing
>> a callback that applies the same dependency reduction.
> The code looks okay to me, if it was the initial idea, feel free to add
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


Thank you!


>> + */
>> +void acpi_dev_flag_dependency_met(acpi_handle handle)
>> +{
> Since it's acpi_dev_* namespace, perhaps it should take struct acpi_device here?


I can do this, but I avoided it because in most of the uses in the
kernel currently there's no struct acpi_device, they're just passing
ACPI_HANDLE(dev) instead, so I'd need to get the adev with
ACPI_COMPANION() in each place. It didn't seem worth it...but happy to
do it if you'd prefer it that way?

