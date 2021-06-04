Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44F639BAB1
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 16:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFDOLn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 10:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhFDOLm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 10:11:42 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAD7C061767;
        Fri,  4 Jun 2021 07:09:46 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso5711326wmq.1;
        Fri, 04 Jun 2021 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Cv3AoU/Qne3R+pDAUBp+7K/h07fGByZilOe5eXOw1P8=;
        b=SjlE5dKFCHdrYfDLCyo5GweaLxQ5ZhXX0GvAB058F8V17qk2/JTS5NfNoKNo5BmPsI
         +6/f04LMM6TXon0ciy/7tAXOJlFdZpl5FoysGW4Y/Bad3p7N/da4rWoiu+4/x4UG8JlW
         Du8/WLdOADAhX0+0xeJ0STiqohpk9gsEB3vCxB4aTsGKyXvBrWUjjggq4I4b7Maq5nrk
         gr9EXwPs7aKP0BFbzqrmVK5j7T9leJRkw6ryC+yvCJfnA3r+6/R4t0l0IRBljIFsk19X
         MpbwQuecHbnwJoGAXybvqZS4Pc8CpvZcsUQR3St4hvYdbAuR9a0SZZQwPUBbY3XKGGA1
         HCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Cv3AoU/Qne3R+pDAUBp+7K/h07fGByZilOe5eXOw1P8=;
        b=Kk9Vy1/lnFroiTAw4VbNZlo9q06GdeCoBZ6JT0eHCnELpAX6MP989sKP3sdVdhSCzw
         M2Dt5Bx0lRiTbvCRER/zASEgPRFR/5s8LQimkjM6wz8Hhhy2Z1QmsCXrcdsOpFzMGERx
         OemnxJPzMhvxBkkz5QZ5jnkPquxAg69qjrYFxY0cGelP/3J8OnTNAnUEYseBAzpaBlP6
         Xt/s83lafpgI0AMZ2H93iENj/XRcOhrh9BbsCWsVhtWW5vPuLFX9Pv5XeAlWbdAmeSdk
         GLUhOCybd14i3BmDWpEE7/UQ5pxt5dQO8DH01Sve/QWq/65LmzMGAj8CDYrxQOocrbG7
         AcBw==
X-Gm-Message-State: AOAM5318zXCO74yGwZNa6Pc8DpHS/TWvnQYcRY4Cuqyt6x2W0CMyunUJ
        bfMLctNH9Yw7LHKK/Wh+T9U=
X-Google-Smtp-Source: ABdhPJy+WE4mGUJmQPq33OL/qXM8L3e9qUu+NeOV2Ug4e2SKgw9CLJVJ3YHBc2xmv/1XqnIQ0yJRvA==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr3898490wmb.118.1622815785194;
        Fri, 04 Jun 2021 07:09:45 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.84])
        by smtp.gmail.com with ESMTPSA id v18sm7631514wrb.10.2021.06.04.07.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 07:09:44 -0700 (PDT)
Subject: Re: [PATCH v5 4/6] gpiolib: acpi: Add acpi_gpio_get_io_resource()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210603224007.120560-1-djrscally@gmail.com>
 <20210603224007.120560-5-djrscally@gmail.com>
 <YLokNQCJ7WXKZepR@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <ca51ab71-9cdd-0d00-959f-9e1b2df3588c@gmail.com>
Date:   Fri, 4 Jun 2021 15:09:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLokNQCJ7WXKZepR@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 04/06/2021 14:01, Andy Shevchenko wrote:
> On Thu, Jun 03, 2021 at 11:40:05PM +0100, Daniel Scally wrote:
>> Add a function to verify that a given acpi_resource represents an IO
>> type GPIO resource, and return it if so.
> I would rephrase this to something like:
>
> "Add a function to verify that a given ACPI resource represents a GpioIo() type
> of resource, and return it if so."
>
> I can amend when applying to my branch.
>
That wording is perfectly fine by me
