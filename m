Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9353318BD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 21:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhCHUkm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 15:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCHUk3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 15:40:29 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88303C06174A;
        Mon,  8 Mar 2021 12:40:29 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id w11so12869930wrr.10;
        Mon, 08 Mar 2021 12:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=o+/dpOFXV6mbnRPaa86MvmeRPVIsGW4+sgQ7UqPkyUk=;
        b=i9q0Gzq3zGFl6wNaPAxhQ1Wi0FqVf60X5CcXgP3rKsQuOfxkx7dC5sbgciNwGXNAD2
         9lSVAS1HtuurSJGNxFkKy/NrOdlKx9DxexPyh6b5Eamjih382ibC6pov5WJJ8/PwLtR9
         3dbFcZf3lG46L+ZNmCcahce/Hke41wBD0bJ66qtBWd1Qtl1H8Gu+TRjuwhmH7Ey6H2B8
         uJO1kl97PTebKz2Hser77wWtXMskadF+55O/B2eAz7v/UWLs0EPB95T9QZNbXqIPQGtn
         EMj50GGV1UopVKp/QcKlplfCV3vJs3OpJ3HpOF1FPAN5HiUcFogt7DDcP8h+O+ivUItd
         wV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=o+/dpOFXV6mbnRPaa86MvmeRPVIsGW4+sgQ7UqPkyUk=;
        b=kkMIugTaudqprGq5fL06K1R/BQ3gflS6cRE+ohDdrfFUQM8C70vrL+AFDS60oOiVW8
         i9GmVdrIuGFDUgdCfqNTl/kt7kSl1tQb8phlxtDsSA8I6gFCz+4Gv2Jjfa8nK9ZFbpif
         Pgg7gmx8+batyZHXOgzzxXGKiHu1MWYc9CEUaRFJRPPYpmvRbCtCpgYzpMXqVYGuIHSJ
         PuuB/OwiI96TKc+LhJZwf9vR+FKq8L3Vxrt+74/jO6mAHIzaNb3AuHmxMLV4GtX/8doU
         snHj81oCfEzSNDjXThsg0RI5hkt+1Ghwgi8AtOLuGr1Z9cXDcO1CV/dHY/+fFsY9vkE+
         9ouw==
X-Gm-Message-State: AOAM530s9hpQpdXiYsGoRj8Pant+0jWCBN72wZmn7CWCpvSBPJZrJxp9
        xopChfvsffD7KuHGQJyijtM=
X-Google-Smtp-Source: ABdhPJxhGvSvYgGNZNFtcF5uW2ZNoDAv+znKgthZfkcniHOKbaebYxXoanzndIP4HxAd/l8+6kXvxg==
X-Received: by 2002:a05:6000:1546:: with SMTP id 6mr24364251wry.398.1615236028247;
        Mon, 08 Mar 2021 12:40:28 -0800 (PST)
Received: from [192.168.1.211] ([2.26.187.30])
        by smtp.gmail.com with ESMTPSA id w6sm21630328wrl.49.2021.03.08.12.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 12:40:27 -0800 (PST)
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        andy.shevchenko@linux.intel.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-2-djrscally@gmail.com>
 <CAJZ5v0ib+3oScz2CuFNQdTvo16_fGYgfppZjpVZbtMC-2FK-2w@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <74e27b1f-b1aa-de84-7832-e76b3207bddc@gmail.com>
Date:   Mon, 8 Mar 2021 20:40:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0ib+3oScz2CuFNQdTvo16_fGYgfppZjpVZbtMC-2FK-2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael

On 08/03/2021 17:46, Rafael J. Wysocki wrote:
>> +void acpi_walk_dep_device_list(acpi_handle handle,
>> +                              int (*callback)(struct acpi_dep_data *, void *),
>> +                              void *data)
>> +{
>> +       struct acpi_dep_data *dep, *tmp;
>> +       int ret;
>> +
>>         mutex_lock(&acpi_dep_list_lock);
>>         list_for_each_entry_safe(dep, tmp, &acpi_dep_list, node) {
>>                 if (dep->supplier == handle) {
>> -                       acpi_bus_get_device(dep->consumer, &adev);
>> -                       if (!adev)
>> -                               continue;
>> -
>> -                       adev->dep_unmet--;
>> -                       if (!adev->dep_unmet)
>> -                               acpi_bus_attach(adev, true);
> The above code in the mainline has changed recently, so you need to
> rebase the above and adjust for the change of behavior.


Yeah, I'll rebase onto 5.12-rc2 before next submission.

>
>> -
>> -                       list_del(&dep->node);
>> -                       kfree(dep);
>> +                       ret = callback(dep, data);
>> +                       if (ret)
>> +                               break;
>>                 }
>>         }
>>         mutex_unlock(&acpi_dep_list_lock);
>>  }
>>  EXPORT_SYMBOL_GPL(acpi_walk_dep_device_list);
>>
>> +/**
>> + * acpi_dev_flag_dependency_met() - Inform consumers of @handle that the device
>> + *                                 is now active
> No parens here, please, and make it fit one line.
>
> Also the description should be something like "Clear dependencies on
> the given device."


OK - no problem

