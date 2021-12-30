Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB71A481F37
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 19:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241699AbhL3Sbm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 13:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30128 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241707AbhL3Sbl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 13:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640889100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K8Yh71yQj/rlCeet/ch59p/SlKhDeTS1cwWU/SHwgM8=;
        b=SRzfDJ0Ko+9POu8Ktrnz3sp9M2LCNDTXUmTZ1Ea6Zr5m0Au5ZJkS9g5GyX+cHgAUghFXoo
        CD4UkUHjQCR+QwHMBQuxD37koIAQePduKi2KJvgH29AKvZHynzZYaRAOVvBXyNezCwL6Hz
        v00nicC24l26HF7YvlIM8z/O5RrcifE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-rdhUO1aNPk-dyHJ7xE_lDw-1; Thu, 30 Dec 2021 13:31:38 -0500
X-MC-Unique: rdhUO1aNPk-dyHJ7xE_lDw-1
Received: by mail-ed1-f69.google.com with SMTP id dz8-20020a0564021d4800b003f897935eb3so17576848edb.12
        for <linux-i2c@vger.kernel.org>; Thu, 30 Dec 2021 10:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K8Yh71yQj/rlCeet/ch59p/SlKhDeTS1cwWU/SHwgM8=;
        b=jzxBqnDWivptXWyvvQLzRmHG+9BgRy2HIOcOhxJgUb+9N8kYLN8ehFFY+/YXsynWFC
         jlaHef2+hsrAw6xlu5+ZoFO/ztCOLLfF6JJRZDW7QY7PP8Twa+ynWwjBzpHCzT3pRjkN
         MeQIolQ35meqR8+Fa5bqdHNBg9Kkw1aUx8APwPltYzyWzNZewXlVgPjijvpG1bNEUWgT
         /jIMzquCLxcv5+p870dcPaBvfyUNfyAQimqKOD2Nq/5XEq0HszsSgfZtKFfGka9o2mYN
         JPOn0QAG0Mu9rWHrq4LZFlr+biCseF/W+snBPkglnv9fh8WT0HLaimpRnQOpXD4RGqFX
         GvKA==
X-Gm-Message-State: AOAM5322CIguZMnxn1dlhVvF3fGc1hw868456BiL7MQlDefiP9ffOMA3
        ar19ChmNQ1eyHmxlQZTVWHPqP/mdF9sSZMz4Ie9N35z0iejUevc5EQUicvFiLy00h6pbVLT6wV0
        HE09Fl6nwFW5ClfC5GMXc
X-Received: by 2002:a17:907:728a:: with SMTP id dt10mr25855275ejc.160.1640889097807;
        Thu, 30 Dec 2021 10:31:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFafWulmtFpt6yeA64rh12a20RXIhENEMnG56xff8H78U98MjjCl0EiY6fPKWAOIEpYtx3nQ==
X-Received: by 2002:a17:907:728a:: with SMTP id dt10mr25855261ejc.160.1640889097681;
        Thu, 30 Dec 2021 10:31:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b1sm7460567ejb.51.2021.12.30.10.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 10:31:37 -0800 (PST)
Message-ID: <974029e7-011e-3c49-ee32-d4a9191b0c8d@redhat.com>
Date:   Thu, 30 Dec 2021 19:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/3] ACPI / x86: Add
 acpi_quirk_skip_[i2c_client|serdev]_enumeration() helpers
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
References: <20211230141722.512395-1-hdegoede@redhat.com>
 <20211230141722.512395-2-hdegoede@redhat.com>
 <CAJZ5v0jw7jNq8FgMFcF9p=YYiuYj=RuV2MTPqGu62QoaG_O1MQ@mail.gmail.com>
 <Yc3ytI/NxnGT0aVf@kunai>
 <CAJZ5v0jyHamePb+J-5JGFPOErzV0Vq1TCD=Yq83hC6eSccCFOg@mail.gmail.com>
 <8043413d-c61a-458b-c81f-dd6e98c05b48@redhat.com>
 <CAJZ5v0ijK17Mff1GLP+QtFN6hJ_E4bFXVr=A2Z0WSHJMvGZnww@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0ijK17Mff1GLP+QtFN6hJ_E4bFXVr=A2Z0WSHJMvGZnww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 12/30/21 19:19, Rafael J. Wysocki wrote:
> On Thu, Dec 30, 2021 at 7:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 12/30/21 19:00, Rafael J. Wysocki wrote:
>>> On Thu, Dec 30, 2021 at 6:56 PM Wolfram Sang <wsa@kernel.org> wrote:
>>>>
>>>> Hi Rafael,
>>>>
>>>>> or please let me know if you want me to take this series.
>>>>
>>>> Yes, see cover-letter :)
>>>
>>> Oh well.
>>>
>>> I'll take it now, thanks!
>>
>> Thank you.
>>
>> I see this in your bleeding-edge branch now. I was wondering what this
>> means wrt this making it into 5.17, or if you consider this 5.18
>> material?
> 
> 5.17

Nice, then it probably is best to also get the matching x86-android-tablets
changes merged for 5.17. I'll give it a couple of days for people to review
those and then merge those into pdx86/for-next.

Regards,

Hans

