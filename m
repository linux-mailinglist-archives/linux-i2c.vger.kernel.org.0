Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3912D39BDB8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 18:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFDQ4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 12:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhFDQ4l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 12:56:41 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC77C061766;
        Fri,  4 Jun 2021 09:54:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i94so4932106wri.4;
        Fri, 04 Jun 2021 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=m4DWamzrJpNcRC1WPjIPsD8L2mRem89mY5fA4Nd+ULk=;
        b=t5u2c0mwkxgfoS6NKkyFJbF5f3TWaYLSRLjEicci+eTJZC9Mu1pCeTaLAFAx+VdYvY
         PsJtKelkb9MCgSa9CnFh6oWYRbZXAz7gM+Z7/PUOSOJSMetL0iTfIIBWMJoJXEzzZaBy
         ejDwxuK+yTQXSHneryD9VFJblja63rhqN4OdKUZ/+5AY8hog+4pod4bJ9MXYOtM1qjVT
         X8iEf41k1PlZbwLqcgX7kn9K92gC2O4Y9SleUoza+HXJG2Y+9p34GgQ5MyI4KANmawDj
         fPZdNwz55ZAB3xxWQoV9kBPlngTNILZ572BSirdZzgv7lvwIZwfWlFH5xKum3pHK4O4u
         /KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=m4DWamzrJpNcRC1WPjIPsD8L2mRem89mY5fA4Nd+ULk=;
        b=qTO2ClqYpX8GycITo8+cvMExZ/19OnUdpKhW95VfPV4pql9BlTB9abREm9FmlRt/Sp
         Nez2wRKJRctMVu+/2gj9jsVoU0/Cb4R31Hni7MHtEkjrmIyCQkn0O01PO9njECCndK0M
         rRt8rRmowY1zClcYIZN5PzrNnWXd9W/mXXklrJ2F9Oe1nbXcxNjMSlHH8FNctw7Chb0s
         /DId+YSF1flgh8qxLoiUXcsHov849NrfD4e4CcRLwlJo4Zq+m03vKK8Pn/Ls9/pwo7zm
         8EPxv3+6yJboGZvn73l5uQXjPU4PjCMTTmS7Wvmqan3vj9bCQ3nz0NteFmQmMllVP7/A
         6qPA==
X-Gm-Message-State: AOAM531f9D/FefbdDSxI0q68JqBCIbwa6b5sVMpbpBPnOtclmwp281r9
        Ri8wCvDacLjODEXDJV644Uc=
X-Google-Smtp-Source: ABdhPJztraQHbsi0RyhyeCva9V/la6nhX23MM/uivuamjqY1VY329VMjVr8tsIB/UFgsBv8a05pHKw==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr4878653wrv.165.1622825693283;
        Fri, 04 Jun 2021 09:54:53 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.84])
        by smtp.gmail.com with ESMTPSA id b7sm7107000wri.83.2021.06.04.09.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 09:54:52 -0700 (PDT)
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
 <ca51ab71-9cdd-0d00-959f-9e1b2df3588c@gmail.com>
 <YLo5wFds5JdE82P/@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <0e0f105c-b69d-dced-397b-a420e553b62b@gmail.com>
Date:   Fri, 4 Jun 2021 17:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLo5wFds5JdE82P/@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 04/06/2021 15:33, Andy Shevchenko wrote:
> On Fri, Jun 04, 2021 at 03:09:43PM +0100, Daniel Scally wrote:
>> On 04/06/2021 14:01, Andy Shevchenko wrote:
>>> On Thu, Jun 03, 2021 at 11:40:05PM +0100, Daniel Scally wrote:
>>>> Add a function to verify that a given acpi_resource represents an IO
>>>> type GPIO resource, and return it if so.
>>> I would rephrase this to something like:
>>>
>>> "Add a function to verify that a given ACPI resource represents a GpioIo() type
>>> of resource, and return it if so."
>>>
>>> I can amend when applying to my branch.
>>>
>> That wording is perfectly fine by me
> These two patches (with mentioned amendments) pushed to my review and testing
> queue, thanks!
>
> I'll send PR next week to all stakeholders.
>
Great - thanks very much!
