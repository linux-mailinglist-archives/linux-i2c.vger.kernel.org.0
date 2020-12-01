Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E3C2CAE0D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 22:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388868AbgLAVFz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 16:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388142AbgLAVFy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 16:05:54 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748D3C0613CF;
        Tue,  1 Dec 2020 13:05:14 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 64so4966734wra.11;
        Tue, 01 Dec 2020 13:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4KgTs8jnwN2jfqEMWyUikko75i7S4hns0UPALYVCRbQ=;
        b=klOBt8lu1fx6++B+g5lFFB9tN2am/IxzxgY9KzHNEd/hYt8IewlmBANcpDgUkrJIII
         NWrcV0G0Kwdjnlnrcs7vmY4MzMnPp5IJ9JjR/7c4FxXdpRbeKKoWE9orEhjx9m1yfxXl
         CaxXTuUdgJursIK7EghosSml38Bq9kNrZYhSeI9tBOONZHaxPVRU4GhtrYgv0UsXkpiq
         +az7ABlLWJByJPz7NXo/33egdZDBwQJxD4nX1gaCcUrbXS3puWaY+UXn/zq0U29CzLSM
         PYkM9N/CLrXsvp0skI61qbai8AlJYnnQWDrnzf0AdXH+TLJ5+MdOHdSRp1FmMdVxfEh9
         EMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4KgTs8jnwN2jfqEMWyUikko75i7S4hns0UPALYVCRbQ=;
        b=HmEpt8CvFpcFDVoyxFvWySnYzbaBD7sAViNPLlF12M5Esm+27w8OMRQ3ufVk6v9zeG
         8M5j2nBPoUaZhnVDmoPhfRh1xFeJIz1Jqsi5LcDBgpGAWHeM9AIYs4qbvB6mOoVSKleM
         ALAmsCFOtocbeKvxwFbrUt/71xcoHipDov02qIiZ3fgN1e1sddOl6QscMM6zQe02OFOd
         /an7DgcHJDghYd1FdyVwWCTGtozrx/yyQGTtpZUe5DuqV80C/+7e98RQZE95GSmEZM0t
         TaWCYYony8JGAshItBUvf8fjMPkSZdWHpf5ZECPBEF+ahTUuIYgjUx/qy+06Gh22cMQ9
         lJnw==
X-Gm-Message-State: AOAM5337OCPF5/i8R3YBeC/PR2WZE3GmKpidFvCuiS86kfQGM6zMAHSi
        1DpJmikdlN++pPQT9k8lEDo=
X-Google-Smtp-Source: ABdhPJxLxptbrOQ6EiMpKv4g4Ist5XMogyCDOIsnIgLwl6ax28Q9xYGsYCFYdo3ZDR/FoGrRD02uNQ==
X-Received: by 2002:adf:8030:: with SMTP id 45mr6309395wrk.407.1606856713225;
        Tue, 01 Dec 2020 13:05:13 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id s4sm1232751wru.56.2020.12.01.13.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 13:05:12 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Hans de Goede <hdegoede@redhat.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com>
 <20201201185548.GV4569@pendragon.ideasonboard.com>
 <20201201190523.GO4077@smile.fi.intel.com>
 <20201201190638.GZ4569@pendragon.ideasonboard.com>
 <20201201192137.GR4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <efd0ae7a-4ba2-e02e-6111-7f3d382d1eac@gmail.com>
Date:   Tue, 1 Dec 2020 21:05:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201192137.GR4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 01/12/2020 19:21, Andy Shevchenko wrote:
> On Tue, Dec 01, 2020 at 09:06:38PM +0200, Laurent Pinchart wrote:
>> On Tue, Dec 01, 2020 at 09:05:23PM +0200, Andy Shevchenko wrote:
>>> On Tue, Dec 01, 2020 at 08:55:48PM +0200, Laurent Pinchart wrote:
>>>
>>>> Do you think the Windows driver would use DMI ?
>>> Linux is using DMI for quirks.
>>>
>>>> That seems quite
>>>> unlikely to me, given how they would have to release a new driver binary
>>>> for every machine. I'm pretty sure that a different mechanism is used to
>>>> identify camera integration, and I think it would make sense to follow
>>>> the same approach. That would allow us to avoid large tables of DMI
>>>> identifiers that would need to be constently updated, potentially making
>>>> user experience better.
>>> All Surface family can be matched in a way as Apple machines [1].
>>>
>>> [1]: https://lkml.org/lkml/2020/4/15/1198
>> But not all Surface machines necessarily have the same camera
>> architecture. My point is that there seems to be identifiers reported in
>> ACPI for the exact purpose of identifying the camera architecture. If we
>> used DMI instead, we would have to handle each machine individually.
> With help of DMI we may narrow down the search.
>
> But again, we are talking about uncertainity. It may be your way (a lot of
> platforms that have different settings), or mine (only a few with more or less
> standard sets of settings).
>
> DMI is simply standard in Linux (people usually easier can grep for quirks for
> a specific platform).
>
> I would rather ask Hans' opinion since he has quite an expertise with DMI for
> good and bad.
>
I have no real preference as to the current method or DMI, but thoughts
that come to mind are:


1. given your info that low byte 0x0c means clock enable, we need to
register a clock too. Do we need to extend this device specific section
to map a clock name, or is it acceptable for them to be nameless (ISTR
that the API will let you fetch a clock using devm_clock_get(dev, NULL);)

2. Given only 0x0b pin is actually a regulator and it's controlling
multiple devices, my plan when we got round to adding the VCM / EEPROM
support was simply to extend those mapping tables so that those
supplementary devices were also able to get that regulator...and the two
would share it. I think, from reading the regulator code and
documentation, that that's all fine - and it won't actually be disabled
until both drivers disable it. Does that sound about right?

