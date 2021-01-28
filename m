Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E493072A6
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhA1JUs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:20:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbhA1JQe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 04:16:34 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA92DC061573;
        Thu, 28 Jan 2021 01:15:53 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id z6so4561034wrq.10;
        Thu, 28 Jan 2021 01:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sze6ftSu2R04b/pFQqFUbK9JRo3vVs8lhsThJVykhuU=;
        b=Kz1SzCcFxFfU/+p7TVw0lYH2n1/3LdPdJMZo2I/giUbu+VAum/FsN3FYEWubn7Nj2n
         mjuVaW/JTmGnzcNKPEgwglMvDWY+5bM+kFWjE8+yDntfkNLJ28vZ7JXopo6eSxJqjMqS
         u4X1KFYEFgf5QM4Gt9zhb568oVr43cUM2OHBtUwr13Gm39clVVCUHariJVrO0bjlrV4u
         Q3MTNYYIkbpG3NkVmFTeOnYqoIT2pEQw9jpx7RC+8TiSNXmmxQv9CMPGA/CehNUObV3Y
         aSIoU0g4u52c0BAKgG1oRoY3SkI+wVux/vikrZBf6jfzCv91EVs5GjJI8JnLjEUcj3xE
         YHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sze6ftSu2R04b/pFQqFUbK9JRo3vVs8lhsThJVykhuU=;
        b=aPAYDX+xYyjOq15AKLICs8V/44V4VBgkWtmViPhJtng909RNmSck1Eyt4RPXhNV3UY
         TxAreacd1iC4bLb1R1D+pPd5r3KAm+TF7ZMXOO30PXSYO1Otc4bXAuNBngZI1FNs/Fnx
         Z1EnoNb6hrQtx89Rn6PE30G/PwECX9asCbuz5EE/9M2KKQwN/i4pVXirDG8qXp3vCtO6
         2RwnI2sf9Qo1mp/oQgxVwwjiWyA1Sv3oTrnnHdRmj5F5n/fkaUVaG9kI3/1Yf66VF2Yb
         mpfFt0I1hsQC3sbdLetWvzSSBrEGiuWgpDs05q/XdWYP7zk68wztn2X6yK0NMN0nAB5v
         t0Gg==
X-Gm-Message-State: AOAM531FMbkZ0KSRkAoadSvVvfFXHUFMps8dJC+y/q90BfWy0BP6E5xu
        rMU3G/1RkOMOjiqNG2FLNKk=
X-Google-Smtp-Source: ABdhPJyuYcZGQH1R98zFUCdwbLKku7gcClCnDjmmhPRmoU1i9/BT5M24RJfDdh3etoEAER2Sbpu4YQ==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr16132993wrw.244.1611825352697;
        Thu, 28 Jan 2021 01:15:52 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id k131sm5481598wmb.37.2021.01.28.01.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 01:15:52 -0800 (PST)
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
To:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
 <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
 <CAJZ5v0hUELtKc9CK=z47XQvSAAx=wTWvoVwP-PaMqugaXaCgZQ@mail.gmail.com>
 <20210128090053.GE963@ninjato>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <7e7a8614-3cdb-e160-b10f-8aa0e11b15e5@gmail.com>
Date:   Thu, 28 Jan 2021 09:15:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128090053.GE963@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/01/2021 09:00, Wolfram Sang wrote:
>>> There's a real danger of a memory leak, as the function name sounds very
>>> similar to dev_name() or acpi_dev_name() and those don't allocate
>>> memory. I'm not sure what a better name would be, but given that this
>>> function is only used in patch 6/7 and not in the I2C subsystem itself,
>>> I wonder if we should inline this kasprintf() call in the caller and
>>> drop this patch.
>> IMO if this is a one-off usage, it's better to open-code it.
> Sounds reasonable to me, too.
>
Just to clarify; "open-code" meaning inline it in the caller like
Laurent said, right?
