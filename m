Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A254498BC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 16:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241084AbhKHPvX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 10:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51099 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241079AbhKHPvW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 10:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636386518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FtwGeQksANjxXUD8kTJkumxHFxaoo+uKZKYpwUro+u0=;
        b=c4djzusbLEg2gGZhMOvt6fPvnJLyKJTC4Ai2NWCK85yD1yKcBvUa05oyYKjxS2sinKUyR4
        2coyO4kHVDMwzZpx8XJ3XwZNzBNJHyW8ZK0nePmbxbuHQfsTzBSbvBVkC3XjtkCnhJ8pp2
        eoQ9VEkcWIrXoWIqkTAPhknSJt+uY90=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-6FyFHroXOR2MeuHlAfUuxg-1; Mon, 08 Nov 2021 10:48:36 -0500
X-MC-Unique: 6FyFHroXOR2MeuHlAfUuxg-1
Received: by mail-ed1-f72.google.com with SMTP id z21-20020a05640240d500b003e3340a215aso4316833edb.10
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 07:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FtwGeQksANjxXUD8kTJkumxHFxaoo+uKZKYpwUro+u0=;
        b=DnUHVoNl1frUSTpX4mWs0xjcsYSwUKsoiZek5/sss5D6iawG8gC9QgXbKc/O30C5Xn
         HHWYUwSAbAS8k2aP32fwcq9T5DI+MaCnldnTDJe2wf3hSJGtQTlfEYaLpxAlct9nXKKj
         Jta/vOVfBWaFy/gYzTE97BWBvn8ZcBX4++erPDp12nIhzApqVf2Ia9CrHuaReYlS6QNd
         67ShOnKRXFcNV0jkcs7gQC6RlF2EIFCChCrYaO4ChmXr0BEK2c1TdC5S/AuiHoiGkX7I
         9Z7S8K6L2lyg90f8IpX/M6cQjK/PzM5IQ7d68Hbfy8ivVquXL/0YJrLF15L/I8ThK2FN
         uQMQ==
X-Gm-Message-State: AOAM532tPloHxUpIQP3WgDuht6K4hSEcnPMg0mLo+awnH6NVrEayMt91
        Sv8TkBTiOaM3uSCQhnmL+IVqpQkdw4NqesgSlTqWxZvic717CURP5TYGa3y/kTpNLjLznKh/wwB
        ntEtJaTMVQ+2ddCqG24aw
X-Received: by 2002:a17:906:d196:: with SMTP id c22mr284006ejz.231.1636386514997;
        Mon, 08 Nov 2021 07:48:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtb9YLNfiqr9xl8w+/gcHV4f+pRqMHXso6LnfoUbKlBGUIXkI0Lyz6aADTJ+R2wXEPO4HdEg==
X-Received: by 2002:a17:906:d196:: with SMTP id c22mr283967ejz.231.1636386514765;
        Mon, 08 Nov 2021 07:48:34 -0800 (PST)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id hp3sm8468706ejc.61.2021.11.08.07.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:48:34 -0800 (PST)
Message-ID: <a9cdcaa6-e933-2859-04f7-21392a9ac5ce@redhat.com>
Date:   Mon, 8 Nov 2021 16:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 02/13] platform/x86: dmi_device_properties: Add setup info
 for boards with a CHT Whiskey Cove PMIC
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org
References: <20211030182813.116672-1-hdegoede@redhat.com>
 <20211030182813.116672-3-hdegoede@redhat.com>
 <CAHp75VeXJauH1YQZxYvRWucDwsP_RF5T5yiwpMcB-r4O60ZPJQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeXJauH1YQZxYvRWucDwsP_RF5T5yiwpMcB-r4O60ZPJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thank you for your feedback.

On 10/30/21 23:56, Andy Shevchenko wrote:
> On Sat, Oct 30, 2021 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add a new "intel,cht-wc-setup" string property to the "INT34D3:00"
>> i2c_client for the Whiskey Cove PMIC found on several Cherry Trail
>> based devices. At least 3 setups are known:
>>
>> 1. The WC PMIC is connected to a TI BQ24292i charger, paired with
>>    a Maxim MAX17047 fuelgauge + a FUSB302 USB Type-C Controller +
>>    a PI3USB30532 USB switch, for a fully functional Type-C port
>>
>> 2. The WC PMIC is connected to a TI BQ25890 charger, paired with
>>    a TI BQ27520 fuelgauge, for a USB-2 only Type-C port without PD
>>
>> 3. The WC PMIC is connected to a TI BQ25890 charger, paired with
>>    a TI BQ27542 fuelgauge, for a micro-USB port
>>
>> Which setup is in use cannot be determined reliably from the ACPI tables
>> and various drivers (extcon-intel-cht-wc.c, i2c-cht-wc.c, ...) need
>> to know which setup they are dealing with.
> 
> If it's internal property only, I would rather expect it to start with
> 'linux,' as DWC3 does. And it's also USB related.
> 
> ...
> 
>> +       PROPERTY_ENTRY_STRING("intel,cht-wc-setup", "bq24292i,max17047,fusb302,pi3usb30532"),
> 
>> +       PROPERTY_ENTRY_STRING("intel,cht-wc-setup", "bq25890,bq27520"),
> 
>  Besides that I'm not sure about the name of the property, maybe
> 'linux,cht-wc-usb-chips' or alike? And since it's a list, can we make
> it a string array?
> 

So now that I also have a yogabook to test on it has become clear that
we really need to treat each device-model/board with a cht-wc PMIC
differently in the various cht-wc MFD cell drivers.

So instead of using device-properties (patch 1 + 2 from this series)
I've chosen to add a intel_cht_wc_get_model( helper to:
drivers/mfd/intel_soc_pmic_chtwc.c

Which uses DMI matching (in a shared place so that we need the DMI
table only once) and returns an enum value which represents all
known boards.

Regards,

Hans

