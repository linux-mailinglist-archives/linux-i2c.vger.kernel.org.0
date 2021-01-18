Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062082FA5B4
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 17:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406338AbhARQLI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 11:11:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41116 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405988AbhARQEm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 11:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610985796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FpH2fvvNBiSH7+LZf4kqHTix8ou/f0zVOc4swnogC40=;
        b=ca583sPbtBx5PL0ZT1hVujM7nO8W8S1pEsmzLho2bXQdz0ZiPnsJ+Zbodz/Jfe87jsOLfX
        WKAS7IcsrVk73SODAwD5Cn07f3wjNTmmIr5HLNLgWj1P1Gq2zbMPeLtxC0KU6CX9FgwVD+
        YVilTV1Ma6Bu1GiyNWTyo+0pUltQdQY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-TMTp9yueOt62DZ1q5L0fDA-1; Mon, 18 Jan 2021 11:03:12 -0500
X-MC-Unique: TMTp9yueOt62DZ1q5L0fDA-1
Received: by mail-ej1-f69.google.com with SMTP id dc21so3616093ejb.19
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jan 2021 08:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FpH2fvvNBiSH7+LZf4kqHTix8ou/f0zVOc4swnogC40=;
        b=oLBNIZv2shUn7gd9+1Us7B6+21vWR+nP8nwJe6o4BADRHGcX+WiAMA83YknD/jQxbK
         hGP1ApcvwtJZQDo5j7xGoR+l8VkTOvFktkyks6Y3y7vdPF8IooXT2XwwcB/VR4DbQmH+
         2PzvONymiGRKeJsnAp+45h2oDHufk2rg5nMvhdvxD15Ua9uT6VS0ZzcGO0lWVrXfrlCw
         pFMtoL8oHsE8Vu+EnTDR0fH9HIZPuYwVzGTLFEYyy+j6SU5rBIIMCAVH24zD7b2tfYTD
         rKD4afpI4tRHedfipcyIYnwTTqVb4oKWo+q0apcw0f0E3Bu1OeRHzEjubwJLrJxaLExa
         5Z3A==
X-Gm-Message-State: AOAM5332wfPP19O9Nroj/8EZ41OTkPBWcJubZRsmlPLD1NP/NYH2GOuW
        9Mx4NTn6sYgka1oasQ65BEFJ0cgNLXDVnvLdKZONGb/SWAdA+w8oIrKZIwQ8/kMLR9pUYZC6kH0
        n/ApiSObOOyroX0u5Pf9r
X-Received: by 2002:aa7:c84c:: with SMTP id g12mr104600edt.193.1610985791064;
        Mon, 18 Jan 2021 08:03:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxoBeWNVgS6qD7oqsR8mLDfnlxDvBu2ufUD/XP0BQo1iXg2+222x2MegLm1INYXknOJLnSSg==
X-Received: by 2002:aa7:c84c:: with SMTP id g12mr104590edt.193.1610985790944;
        Mon, 18 Jan 2021 08:03:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id hr31sm9312503ejc.125.2021.01.18.08.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 08:03:09 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Daniel Scally <djrscally@gmail.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
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
 <b152aca4-5870-d64b-c709-afb3e940d107@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bc7c49cf-fb72-99f8-402a-a9fd5a5f9a7f@redhat.com>
Date:   Mon, 18 Jan 2021 17:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b152aca4-5870-d64b-c709-afb3e940d107@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/18/21 5:00 PM, Daniel Scally wrote:
> 
> On 18/01/2021 15:48, andriy.shevchenko@linux.intel.com wrote:
>> On Mon, Jan 18, 2021 at 04:32:54PM +0100, Hans de Goede wrote:
>>> On 1/18/21 4:23 PM, andriy.shevchenko@linux.intel.com wrote:
>> ...
>>
>>> 1. Using a folder is fine, desirable even
>>> 2. I've some concerns about the name, but I'm not really objecting,
>>> just giving my 2 cents.
>> Let's get into compromised summary:
>>  - create a folder for these driver files
>>  - name it without _skl_ while leaving this in the file / driver names
>>
>> Does everybody agree on this approach?
>>
> 
> Works for me!

Also works for me.

Regards,

Hans

