Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C193E2BCA
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 15:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344375AbhHFNov (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 09:44:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24277 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344411AbhHFNot (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 09:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628257473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LUNCaljoh6zNjohyhM8u6lXSLeXe2hyYUThfCWY505I=;
        b=KqY9RmX4+ljommeFqdQwC5T+xZt+izV1rTISlDb5FDhyiLgVV9lb3QLWaVj4tx3zzHTAKD
        2UPgdpGeaiTTqQWGTGkm3hQ1A89G8XxMMSFYVO8UC1GH1rwIIbrHG06eWQ7noq8gS/BJOk
        zM0kxh7nn8ieceSFIltMDXBXVUTIQHo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-6uzKQd68OjKgndHjIjnVHA-1; Fri, 06 Aug 2021 09:44:32 -0400
X-MC-Unique: 6uzKQd68OjKgndHjIjnVHA-1
Received: by mail-ed1-f70.google.com with SMTP id c16-20020aa7d6100000b02903bc4c2a387bso492694edr.21
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 06:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LUNCaljoh6zNjohyhM8u6lXSLeXe2hyYUThfCWY505I=;
        b=FKK9LeSK8+jiNq4g9nMO833rKy/m0jTPQpnRwPcvcN804cWZDP0e2HTWAWgwcVPuNT
         JMHIeLPFDLr1ixAxR3wrLNdInW7+Qe6ciZkEA+fx6YSUVub4c+tm879z7pRR7tPn765c
         yIIVO6UbTdIjV8YKobHyAqxu4PyqIuUEqd9M14mwoQm02zNpsGBfHST0yIuFXAleHfAq
         ydpPuKWOXAPZBvbsNpOPwGnZihUGGlV7ZhAb+2ve0ocZlIjm4Hb26wyBYPDuLdCwYFNM
         ABIFxIhNZe0gzQkKFQJu5WQ0QuXRkMBh1XT8zzzeuOFv0azMmvc5LGB8GMxBLdKg0fZj
         1wIw==
X-Gm-Message-State: AOAM530A0G4QTzxMQ/l50YWIAE/FJWqLXJIVRy4Z4FoH0KnpaBmBMfuB
        3gKJevvmzCsuJJF6z3xPf2cWPqiiY4hevdxfNHXGTNCmxUlvKOFLx7Xp5CgvBzdguBHWBecL8VK
        1cakmdO0OLLOq6K16QiHm
X-Received: by 2002:a05:6402:d7:: with SMTP id i23mr13112207edu.291.1628257471157;
        Fri, 06 Aug 2021 06:44:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL7vlaTOy3c5YZFIfiw2sjAwyw1MSYfWQwVF2pH8QLK/4mhX/K1TBAPijCqcDV0hx7gFIzdw==
X-Received: by 2002:a05:6402:d7:: with SMTP id i23mr13112187edu.291.1628257471004;
        Fri, 06 Aug 2021 06:44:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f9sm3693201edy.57.2021.08.06.06.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 06:44:30 -0700 (PDT)
Subject: Re: [PATCH 1/4] i2c: acpi: Add an i2c_acpi_client_count() helper
 function
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20210803160044.158802-1-hdegoede@redhat.com>
 <20210803160044.158802-2-hdegoede@redhat.com> <YQlzzy933V9XMHqt@lahna>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9fbf0d6a-2df3-4765-ccf5-788b86994d71@redhat.com>
Date:   Fri, 6 Aug 2021 15:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQlzzy933V9XMHqt@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 8/3/21 6:50 PM, Mika Westerberg wrote:
> On Tue, Aug 03, 2021 at 06:00:41PM +0200, Hans de Goede wrote:
>> We have 3 files now which have the need to count the number of
>> I2cSerialBus resources in an ACPI-device's resource-list.
>>
>> Currently all implement their own helper function for this,
>> add a generic helper function to replace the 3 implementations.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thank you, Wolfram are you also ok with me merging this
patch through the pdx86 tree?

Regards,

Hans

