Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68B3441A39
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 11:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhKAKw1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 06:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23233 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231673AbhKAKw0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 06:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635763793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=umwT30SvHFgjwEnDiNsuyAufu0Qh656Y9Z7Z2E4XBQQ=;
        b=UqpoULZg9ILlPO3jspeK51i4NC56NpE+LoqUsCQp8UMW+deBN1Zrj57DY9mnmQ14Z9XVqt
        BXT336klt0huofMrpZxesZ/g6SdVeAG9DkYP6+F5EM4JEPIq9S6conAmiyQYpz//yWfzCK
        K9Zr3+bheVWvdyrocQ4uZ2Uv9bG5FlU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-CHPcSB3sNh-hNaDDE1Rctg-1; Mon, 01 Nov 2021 06:49:52 -0400
X-MC-Unique: CHPcSB3sNh-hNaDDE1Rctg-1
Received: by mail-ed1-f72.google.com with SMTP id w11-20020a05640234cb00b003e0cd525777so10477720edc.12
        for <linux-i2c@vger.kernel.org>; Mon, 01 Nov 2021 03:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=umwT30SvHFgjwEnDiNsuyAufu0Qh656Y9Z7Z2E4XBQQ=;
        b=3kSND6pBkrIKhoH4PETUzBUSnKtu8hNPiuD6YouB2XkqD8CVmagfxq6h6WUa6aPfUQ
         8YMAC1hwPVQN0jjssRWli16mAa4bOtdZGpAiueSAkwpJiklIag3lTjqQPrehJ73+Oyv5
         nmxhARgAr6L8KM4o+mdZdglVDciZ56HtebjiCXDaIO8dnwzlP51CDMutDGu9yva5xUj8
         6auGRi71Mu0nSURU98ydXr4QZGhgYImI8ujd007jOvyEqiSMgpyWBGMGDdMsxR7aaOPg
         t7g4UuWnPy48mnD+zwxaXjE1rD2P1wLXz/GPJsJzvChozqRv6RfkvsE/5vGqkR8hRi6v
         h45g==
X-Gm-Message-State: AOAM530g9EIXozPhViHCIaB56kU4GzNR9Cp4bTyNylwJ8rzLDSxB6Fw+
        0oQ75XrRSQg2QiaiB3zcLTN8YRpPUZU7WsB5Zjfmy2jRfW5zxDnzpEduTZbCxqycdl85Up0q4DW
        FxZf6R62LK0IGz5NmNJOQ
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr4019600edd.279.1635763791079;
        Mon, 01 Nov 2021 03:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCSDOudba19n9s6P62tt/L8YmrKVyHCQhLJz3S2m5E7In4cF+zd5h+zq6clNPm6ocvlJ7nsw==
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr4019542edd.279.1635763790718;
        Mon, 01 Nov 2021 03:49:50 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id sd28sm594119ejc.37.2021.11.01.03.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 03:49:50 -0700 (PDT)
Message-ID: <d36e8cd5-3421-e057-1148-3b8a7769d696@redhat.com>
Date:   Mon, 1 Nov 2021 11:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 08/11] platform/x86: int3472: Add
 get_sensor_adev_and_name() helper
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-9-hdegoede@redhat.com>
 <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com>
 <8804fa29-d0d9-14a9-e48e-268113a79d07@redhat.com>
 <CAHp75VcdZV7NLEgQnEbsG951Mo2s_eRwfijgjSConXGF2SaSGA@mail.gmail.com>
 <CAHp75Vd6CNkys7E3P_hKAoZ29hA2dpFEqzFWxrSkS8GbC_ivGw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd6CNkys7E3P_hKAoZ29hA2dpFEqzFWxrSkS8GbC_ivGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/1/21 11:46, Andy Shevchenko wrote:
> On Mon, Nov 1, 2021 at 12:44 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Mon, Nov 1, 2021 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 10/25/21 13:31, Andy Shevchenko wrote:
>>>> On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>>> +       if (ret == 0 && sensor_adev_ret)
>>>>> +               *sensor_adev_ret = sensor;
>>>>> +       else
>>>>> +               acpi_dev_put(sensor);
>>>>> +
>>>>> +       return ret;
> 
> ...
> 
>>>>        if (sensor_adev_ret)
>>>>                *sensor_adev_ret = sensor;
>>>>
>>>>        return 0;
>>>>
>>>> ?
>>>
>>> That misses an acpi_dev_put(sensor) when sensor_adev_ret == NULL.
>>
>> else
>>   acpi_dev_put(...);
>>
>> ?
> 
> Hmm... But then in the original code and with this proposal the
> acpi_dev_put() seems a bit strange to me.
> If we are fine (no error code returned) why would the caller (note
> _er_) go different paths?

We always need to get the dev to get the name, but some callers are
only interested in the name, so they pass NULL for sensor_adev_ret,
this helps to keep the code calling this clean, which is the whole
idea of having a helper for this.

Regards,

Hans




