Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019822FE74D
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 11:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbhAUKPW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 05:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbhAUJrt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 04:47:49 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998C9C061575;
        Thu, 21 Jan 2021 01:47:31 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id b5so1050428wrr.10;
        Thu, 21 Jan 2021 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yKc5i0pAM0tVHvQhN0nKtZMVSNkJgO1BmOAhXjVUe9U=;
        b=jIYHon01Ye/54nu5CwPQAQ1eytx++CbmX92yv5dAYqEzAk0u6CSuQBswvAjb0XZdjc
         /OS/PSaOUHTY1TJq6dp1oPKEGQeCSRw6NJw73BzzcQqQep3Xbru5wnL0mRUjYcB2nd2M
         HUC7yB3w6wJFnLcFHlIbh7Ppm8ILeqye9tIFD2kFAyi9xIhMwUwk/1FJ7AtsJxeEnO72
         FO+HTjnEz/9GUR1c8OwVuO04P54NRbYIkws+lqSHxuyBPIz2Doi6LlBDJadZnb8RHkML
         xfkza48hXgIx5aVxKUAIBrgKqzPCK47T8+XgbVSqQo7zftiSAtInnyeaZ1JbVTsl9DJT
         mRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yKc5i0pAM0tVHvQhN0nKtZMVSNkJgO1BmOAhXjVUe9U=;
        b=bWHH2iFPNcPCMju5nj88bv4k8A9wCNEg3F3bZx2ywYjijEfVRYP1OHjpOPmK/W733W
         CwOJiJ+AOrUfyKgkUO/QO0ZD3op0ddBnhHucs6XmHEuDq+LjoyJhiacw+fgev8H6Nlbs
         Ch9milkC5dJ4nAB4hfmWXOePbrYwJTuJc6TIl1/HC9qNiqwYvFFY8Bon9+36eMymr2e6
         bdLvyCu/dX08Y9VGDa0CCgtvOUCW+z5aICrhtn/L7twxZo+KZ4OvB78p/zAHblQ7F2ed
         YCYAzX+mLpl7KYsyf57esTcoNBnSyIeAfvJBVa8m3ruNq8AM/P5jEvODeaXMhxXD+5M8
         5bRw==
X-Gm-Message-State: AOAM530wFjzXsY3SHlgz85modexMT00GJ25fHhXWWjDE5RgKibDoY6V3
        jKd1Mmk7sa9/w8ESl4MNj/U=
X-Google-Smtp-Source: ABdhPJwjt1eJ+KrHwe5acgIBFhZjuKePkobn9OcmLVCO2pB2kKBCZs08qinTPDkGKYdcEneH3v0nqA==
X-Received: by 2002:adf:902a:: with SMTP id h39mr13230023wrh.147.1611222450386;
        Thu, 21 Jan 2021 01:47:30 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id u5sm8350654wmg.9.2021.01.21.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 01:47:29 -0800 (PST)
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
 <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com>
 <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com>
Date:   Thu, 21 Jan 2021 09:47:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael

On 19/01/2021 13:15, Rafael J. Wysocki wrote:
> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
>>>> specification intends. We need to be able to find those devices "from"
>>>> the dependee, so add a function to parse all ACPI Devices and check if
>>>> the include the handle of the dependee device in their _DEP buffer.
>>> What exactly do you need this for?
>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
>> refer to those INT3472's in their _DEP method. The driver binds to the
>> INT3472 device, we need to find the sensors dependent on them.
>>
> Well, this is an interesting concept. :-)
>
> Why does _DEP need to be used for that?  Isn't there any other way to
> look up the dependent sensors?
>
>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
>>>
>>> Note that supplier drivers may remove entries from there, but does
>>> that matter for your use case?
>> Ah - that may work, yes. Thank you, let me test that.
> Even if that doesn't work right away, but it can be made work, I would
> very much prefer that to the driver parsing _DEP for every device in
> the namespace by itself.


This does work; do you prefer it in scan.c, or in utils.c (in which case
with acpi_dep_list declared as external var in internal.h)?



