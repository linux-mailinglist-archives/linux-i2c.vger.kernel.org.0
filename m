Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BB63EA78A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 17:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238025AbhHLP2A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 11:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25687 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237682AbhHLP17 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Aug 2021 11:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628782053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TA43mTMVbiIVQ6dhmdTyeMp0SQjli5MTAeYmJDtnicw=;
        b=BPrkcfqKeXlyf3EX8nPQ7RolHXPV7j5FAFKiPV0itaEs9NLZkO7RwN6y1j0gAQpA/Z0fiM
        5oO1C53tzuc38UUX+v7syIi5Kkl2wgEXKHhPIZbKWwrJh2P4No8sZckJJM/NTEqSCptfpc
        iaDcztX1nzQINjh4pH8Of5797Fwu9ks=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-lS5bg5-pP5m3krfIr6tiKg-1; Thu, 12 Aug 2021 11:27:31 -0400
X-MC-Unique: lS5bg5-pP5m3krfIr6tiKg-1
Received: by mail-ed1-f71.google.com with SMTP id u4-20020a50eac40000b02903bddc52675eso3217742edp.4
        for <linux-i2c@vger.kernel.org>; Thu, 12 Aug 2021 08:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TA43mTMVbiIVQ6dhmdTyeMp0SQjli5MTAeYmJDtnicw=;
        b=jm4HrMY9iFuvCEzE9JpbWAyV+VZiCt1/8dPaKKGvG2S0el3yNZI2NghYIubQjXx6MZ
         GBgtTgiUdCw5ws8y3qrqFjqtpiPyXUyKW89V5XDN0s1ig5NO13Mk/69JuM4hdn6pLcrp
         FBI+VsqjcvQzSEzww2eNbq23APzXk+jEyzbChzFlPDTK5NL+SRSiESIsfiT6HYSkxhZ6
         Yl3ZtJ6NeuV2DjVSbz3MIM6OIFmeP2544jxxuL/EVFdIz7kvpLMK6wzh/ZuHkfjbZjy8
         kt2AevLxHhJrFhkLABNIpUC7NNVln1a0rhPcoSIC5u0WRe/SXY1t0vc3KzxhQzOxzWfh
         kwng==
X-Gm-Message-State: AOAM531YC9a4bMweJ3VgFZTEltEr88I6nZstM8G0vhALoF6V7dTfBP1c
        doqy5M+JixvumDLi2N5UE99Mah7R+Q0+iZiXH8SQ3Kfsgz6EhPo4rTCn7Kptpxnn2KL0TgF9Lct
        V5SF0kjdT90+xnlszFYoX
X-Received: by 2002:a17:906:3699:: with SMTP id a25mr4172173ejc.452.1628782050571;
        Thu, 12 Aug 2021 08:27:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpILZdmucUro1fJ64BfQNPV6SuGjTwtVbrBbBvEFyx8GHmFvspoTgFJocAtBVCS59l9cOYWQ==
X-Received: by 2002:a17:906:3699:: with SMTP id a25mr4172160ejc.452.1628782050459;
        Thu, 12 Aug 2021 08:27:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h8sm1293286edv.30.2021.08.12.08.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 08:27:30 -0700 (PDT)
Subject: Re: [PATCH 1/4] i2c: acpi: Add an i2c_acpi_client_count() helper
 function
To:     Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20210803160044.158802-1-hdegoede@redhat.com>
 <20210803160044.158802-2-hdegoede@redhat.com> <YQlzzy933V9XMHqt@lahna>
 <9fbf0d6a-2df3-4765-ccf5-788b86994d71@redhat.com> <YRLlNh4MrHyVobvR@kunai>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8b624c87-21dd-e051-d3f5-400212ed590c@redhat.com>
Date:   Thu, 12 Aug 2021 17:27:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRLlNh4MrHyVobvR@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 8/10/21 10:44 PM, Wolfram Sang wrote:
> 
>>>> We have 3 files now which have the need to count the number of
>>>> I2cSerialBus resources in an ACPI-device's resource-list.
>>>>
>>>> Currently all implement their own helper function for this,
>>>> add a generic helper function to replace the 3 implementations.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>> Thank you, Wolfram are you also ok with me merging this
>> patch through the pdx86 tree?
> 
> Sure!
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>

Thank you. I've added this series to my review-hans branch now.

I'll push it out to pdx86/for-next after some (build) testing.

Regards,

Hans

