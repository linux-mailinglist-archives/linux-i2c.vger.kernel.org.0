Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B5638CE1E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 21:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238931AbhEUT07 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 15:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238069AbhEUT0x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 15:26:53 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CB5C0613ED;
        Fri, 21 May 2021 12:25:27 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id y14so20000433wrm.13;
        Fri, 21 May 2021 12:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fvwuU0+MYSgCo2emo2mby8YwzIh20quN69i/jewcdqk=;
        b=uXhcuBR1rBX6+MjsTw0TttQu0s+mWQ+TkbkdxdvMgpVoTsU5jWPM4XDOWSAGyBZAM+
         +mGE+1jHobO7W5yTECWFblJoy+3WfO4YzExgPDTPW0OHZGSZIHDmHD8KwW9GxFOdhVWZ
         V0YIVPm3xtpYmmCvjGyF7NsG8LnSvGLqfd42R3GjSMxy2d8u3y4CtyHvuOcVpFy65Qnt
         KZfwVM87W/hrfMctwAu8iji4Aj2RnDCzLPU4Pi3JiAW/JDgwCCU1KD7EYBECc3abuDWY
         XSKfiKyOTkNTTZ9wlXY+6ENtOi6sjDk3eM/ZhxHWO3QhXGlVGsyBB1hc/eLuvIzMAUv8
         9JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fvwuU0+MYSgCo2emo2mby8YwzIh20quN69i/jewcdqk=;
        b=t/btbDa6seYaJTqPFM/VYPKfPxzGF2UcijqgvfQSB9pW6W/ar6WNTw3dK8pyqyFSqa
         ZEPaTMc/P5uUraO98mOvrU9ca905EYgUJlieqLkSY0+n5L/0Ek3S6ED5RAezHwCQOJvD
         zKUnr2Vc6p2FIxD+RBExQv3/ZYbZbGCbseNsKDRJezUtLdPlqZI+1HhAJ4Ss9d70U+hT
         iCy4LZR889BCrnNizPGAjgCS2xb/MJmxEV/+oF4jWYJs/zE7OdLt1hOM7Xx3aVMrY56L
         w/KqBYTEANrJalhdRoNjFLJlGckFvzJMQw0ZF0XamdcGbFBYWZDN17coKI7Smhak04Ym
         kjwQ==
X-Gm-Message-State: AOAM531nW0WC7Hk2KYp0kxcK3V7301AXp1FFYbTv9zcMgfx1JLx5hMjt
        zyMW9/beneJGioHAwPqJWNM=
X-Google-Smtp-Source: ABdhPJzk0TMRNGjlrE+WNMAkhVgrZq75o/VspCW4P5mv6PHAMeJDLibI7fK/d+i0DIafevp/iQ/fKA==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr10800827wrs.303.1621625125977;
        Fri, 21 May 2021 12:25:25 -0700 (PDT)
Received: from [192.168.1.211] ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id r2sm3233190wrv.39.2021.05.21.12.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 12:25:25 -0700 (PDT)
Subject: Re: [PATCH v4 2/8] ACPI: scan: Add function to fetch dependent of
 acpi device
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <20210520140928.3252671-3-djrscally@gmail.com>
 <CAJZ5v0hoDswjr+7r4uf6jZvV3t+-UDtEA0V7A_MvdT_34XrbJA@mail.gmail.com>
 <CAJZ5v0hdSi4BcZvhkyrtcBQqRL8CHtOtwUeYW7EnWL2zvKhDZw@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <f92cf223-9cd4-9ea5-0152-d3a3d012cc31@gmail.com>
Date:   Fri, 21 May 2021 20:25:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0hdSi4BcZvhkyrtcBQqRL8CHtOtwUeYW7EnWL2zvKhDZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael

On 20/05/2021 19:55, Rafael J. Wysocki wrote:
> On Thu, May 20, 2021 at 8:33 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>> On Thu, May 20, 2021 at 4:11 PM Daniel Scally <djrscally@gmail.com> wrote:
>>> In some ACPI tables we encounter, devices use the _DEP method to assert
>>> a dependence on other ACPI devices as opposed to the OpRegions that the
>>> specification intends. We need to be able to find those devices "from"
>>> the dependee, so add a callback and a wrapper to walk over the
>>> acpi_dep_list and return the dependent ACPI device.
>>>
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>> ---
>>> Changes since v3:
>>>
>>>         Both new functions were renamed.
>>>
>>>  drivers/acpi/scan.c     | 38 ++++++++++++++++++++++++++++++++++++++
>>>  include/acpi/acpi_bus.h |  1 +
>>>  2 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>>> index 195635c3462b..1a76fbdfa669 100644
>>> --- a/drivers/acpi/scan.c
>>> +++ b/drivers/acpi/scan.c
>>> @@ -2105,6 +2105,21 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
>>>                 device->handler->hotplug.notify_online(device);
>>>  }
>>>
>>> +static int acpi_return_dep_dev(struct acpi_dep_data *dep, void *data)
>> What about calling this acpi_get_first_consumer_cb()?
> Or acpi_dev_get_first_consumer_dev_cb() if you want to be super-precise?


Sure; fine by me, and same for the other function

