Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D075C307293
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbhA1JYv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhA1JWp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 04:22:45 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C031C0613ED;
        Thu, 28 Jan 2021 01:22:04 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c12so4630174wrc.7;
        Thu, 28 Jan 2021 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=z7EPhmIjo+KbSUa0ut+cvBYxFBb4G2Nq2zdf32V7DIw=;
        b=RS9c9N/woOhHsYLuIyAo3ZCyrceqxPD9puelQl+Ux2gcIYHT+h0nF6LnWBQhKlNIFe
         SYGowDMkQ8i6vcvKjEjeHTQqRxSpSnkagwvunMX4A/MiCAq6uMMnQVKAlosqiDLcqPdb
         LamejcXkRIX7a6ZTBrJ4FwWOe/J4EjirrCvU2daAnprG3z2h2sQJjTxiv2FZ71qQYibE
         NRuCVbX0lcJWIGjuiCcxz1nbWNYuEhqAR0NvlMkZ1S7uPbmfasMicoRpMurR6+T5J/vH
         lxdlLpBr/SLMlNhBpNGGql5DMl93KJQha0gRqgQTZdPNfQfetFILrBqiUFVr0gFKB/Gq
         6YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=z7EPhmIjo+KbSUa0ut+cvBYxFBb4G2Nq2zdf32V7DIw=;
        b=jCNQlwMrMIfI+OBddITFwYY5VMf5hVorbctm0nitDLaOZjRjIE5cyVHFgjJ+OznyBZ
         Nx2wBIXkuedWrwizMT2DnUTMx4/Kv1oug8EbI6CSkOIB/r6k1gOzYKs+FCko7LkGfzwK
         KTR6MZ9DXu7bfdewG1mg7bzaeQWD/D1Fv//TCcqCgHdW7H5dgkuT6r1Cva0Y/LbCn7rC
         1JF/wxOB4q042OvqS1JsjSyf26h/MyXEl5F3Ir1Y/eycNLVWIv6YOl+WwlOGRU4lqRRe
         adbVZ7vkoi09idkaAxS1yzVseJb/SeYmjia2ragogy6tMbvT7tTKEXuTgysR7GF7lxXG
         JR9w==
X-Gm-Message-State: AOAM532m3Afs7vuLfk+r7+vRob+KJtEGIPisCH94+1xRS0+cm8yPJAbI
        M8k0EeUu9kdG3wabWeUSJYk=
X-Google-Smtp-Source: ABdhPJwce8ZO5zFUH5o60/Ig3Ntkd6tK0EKoFiA7rMWRnTY5ZjwwXNIznsCFiVN27FZjcUzyfeIT1w==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr15379796wrs.194.1611825723322;
        Thu, 28 Jan 2021 01:22:03 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o12sm6137583wrx.82.2021.01.28.01.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 01:22:02 -0800 (PST)
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 <7e7a8614-3cdb-e160-b10f-8aa0e11b15e5@gmail.com>
 <20210128091741.GJ963@ninjato>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <5423f70e-2bab-7f6a-a9b2-97a058c0eb20@gmail.com>
Date:   Thu, 28 Jan 2021 09:22:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128091741.GJ963@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 28/01/2021 09:17, Wolfram Sang wrote:
>> Just to clarify; "open-code" meaning inline it in the caller like
>> Laurent said, right?
> Yes.
>
Thanks - will do that and drop this one then
