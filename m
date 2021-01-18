Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64C22FA57B
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 17:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390935AbhARQBr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 11:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406285AbhARQBk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 11:01:40 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96051C061574;
        Mon, 18 Jan 2021 08:00:59 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id h17so13858432wmq.1;
        Mon, 18 Jan 2021 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NW1iIoeHWjGtkXcMPgktKDuPDLakc04ai1UeSujIYJg=;
        b=VfoaCcdDYl0BbpelqnGEKUanoKq5mm4JOV357PAHF9BFXbAsJ1mmab31CyvCJIULcq
         mwVCQDqvcBW63nJzk96kyhJxBXxsiVepTj59DkF8ec/4p/HuDJdlEDwmC7SAp+YVS+Vo
         E6+A+4SkpJ5Uh/vrtz1AB4FZPjBE29DlTgM0H0TF0se0DnFnaBdIqapYJUXGxPwNx30N
         YCVJe+U5bZ1oSRlqmcnJuJwu4XqxZAyle+h4Dfs1GIRyYIt6eR0we1TKXxf7HosDXJOa
         k0GV6aR8rss15t6oj0US/PziIOF7/c12aTAGFKtQcLqT/crlBxmyE1IEoAyeGrpPp8o3
         YZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NW1iIoeHWjGtkXcMPgktKDuPDLakc04ai1UeSujIYJg=;
        b=tUeDZ5VyzUiBU0bVrlZ1KO8ZtE2RWk4cFVdh82AbcfHiGeZ7QHVqUP9bZqEBR35LQ6
         Gkp02n3WFYCTMZhrp3/bxZyMVZMsdXrIiOUyZfNg/U+QCpjH3IeYk7ZgdBFyf4ekF2JI
         bsbf5caY4QDm1vQAWerEA6FsTIhhdZSf2l5GbOjmZnYG6xFfRPkSeyUEBOEdOU7npBDH
         HAJuWNi2Pp5PPKsBF8bqs3l3xQczzjSz2iXE7SJhAVXEknhJoGQCdkwRQ/bBD3M6/Feu
         Q+CfBXWpERK9HH528ShkSB+I7x9esQfnb8d/diEcAIzKLRzQIB5H1rf+uVxu+QFLUI85
         yaWA==
X-Gm-Message-State: AOAM530z6VyfPdGsEj+KZOem9Yi95ypACI7XnxlG4obfFAYrnmy+gKBu
        lqd0Gmf5G/2bzZVX+gc0lHM=
X-Google-Smtp-Source: ABdhPJzaYH9/sfyD1Sk0DEU3VyX4kq3lfGOKZfvoVu/6o0Hw7D62cPz6+Vew6gJRM0PdpHc0rHFgUQ==
X-Received: by 2002:a05:600c:21d8:: with SMTP id x24mr45435wmj.27.1610985658387;
        Mon, 18 Jan 2021 08:00:58 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id m5sm31151558wrz.18.2021.01.18.08.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 08:00:57 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "lenb@kernel.org" <lenb@kernel.org>,
        "andy@kernel.org" <andy@kernel.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "robert.moore@intel.com" <robert.moore@intel.com>,
        "erik.kaneda@intel.com" <erik.kaneda@intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <-GKrxu8GJvGe-PlKkLpblw9N-DtVtS7i87BOCLgJR72yf4hUFpUgiOlGcFero_gqgUxJrX2gxtLOnz_31hJugfam0SXXmXxIzGIhS162mhI=@protonmail.com>
 <20210118135121.GM4077@smile.fi.intel.com>
 <w3qrFtorGLZ_wMnr_Mi7cltli9g8jsMtiQ7Z1Usnj2IKfJ1MJz6-wxlIAEQ-ErgU1x6IBxdAIHBHtQ3OOT_FJOuUYheILlUc20ysNL_zroo=@protonmail.com>
 <20210118152323.GV4077@smile.fi.intel.com>
 <e1032328-c5e8-0bfa-4b87-64207d283d17@redhat.com>
 <20210118154852.GY4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <b152aca4-5870-d64b-c709-afb3e940d107@gmail.com>
Date:   Mon, 18 Jan 2021 16:00:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118154852.GY4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 18/01/2021 15:48, andriy.shevchenko@linux.intel.com wrote:
> On Mon, Jan 18, 2021 at 04:32:54PM +0100, Hans de Goede wrote:
>> On 1/18/21 4:23 PM, andriy.shevchenko@linux.intel.com wrote:
> ...
>
>> 1. Using a folder is fine, desirable even
>> 2. I've some concerns about the name, but I'm not really objecting,
>> just giving my 2 cents.
> Let's get into compromised summary:
>  - create a folder for these driver files
>  - name it without _skl_ while leaving this in the file / driver names
>
> Does everybody agree on this approach?
>

Works for me!

