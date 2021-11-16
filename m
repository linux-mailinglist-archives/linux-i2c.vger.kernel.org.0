Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2EE45315B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 12:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbhKPLy3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Nov 2021 06:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45824 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235656AbhKPLyV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Nov 2021 06:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637063482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AhivTIOpjPA1rMsW7/cjbVF1w7BJWhc6FOerNF9l7U0=;
        b=QbcFUndmKu6XV+yLt2+Ew+KG3cExw7CQ+E0A8KQeoMppJvtXAlBg0p9UM0SHwgzB28S5KM
        cypwZSJHAcflTmRwl1jQeMyiYx+y5stmFH3pBupcO+9fJ+q87YafWtzmJPGBFA1WdCerFi
        L9IgIkwalI5fdxW/7YX7Dca0pY4T1rM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-gL0u0vkZPg-i0w6qcgWMRw-1; Tue, 16 Nov 2021 06:51:20 -0500
X-MC-Unique: gL0u0vkZPg-i0w6qcgWMRw-1
Received: by mail-ed1-f69.google.com with SMTP id g3-20020a056402424300b003e2981e1edbso17056988edb.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Nov 2021 03:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AhivTIOpjPA1rMsW7/cjbVF1w7BJWhc6FOerNF9l7U0=;
        b=x+w9O0zlb0fVtZlWmgP38vYlETWtJ6DAB5NQdLjvyPfmyIMJhTsfGzz0ub8R1T5fJO
         HehKjh0twWJf7OhMTEp9OvWC3TXJLor4NEbCxi2ZECP5P39cqUtkqY3MqsUa2OFi900j
         mCLwk1/Qj+ieMqf8N2rBQHJFaS2uUWsQd3Ou7sST3YSLx8PSUrpqaCHdKEHN8AgDSL60
         NTer67VqSXucfmG55AUS/DLdwqTqNlA5/KfEQ8xB+pk0X4o/LyPWz5+r427ooWncJN4i
         G8dpeUDppCEKoZlUm/WvNd36/VFGDEYled9Ttc0mD5bnw3mrNhGXPtqPQemEpMNKD/2F
         NlNA==
X-Gm-Message-State: AOAM532UGQq00MxAo/pA114JBXDjM/FVqdnjX7/0sJzWDbYXPgkaDbBA
        TAghoBUcq2l6IdRLtiIa9XArzfa9y0Kg8j1XuLJvz9ie41gp99akKRrDapsI+VTey5LT9RzEByG
        xAil8BJZDR4TQSpp6eRSD
X-Received: by 2002:a50:da06:: with SMTP id z6mr9515610edj.50.1637063479403;
        Tue, 16 Nov 2021 03:51:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziWnZi0A7YtidAFr8ClW2EWX17vgnSRICyshdZ6kN7QttTEebqs+HGy0b0miUzYX8l1w2ccA==
X-Received: by 2002:a50:da06:: with SMTP id z6mr9515577edj.50.1637063479254;
        Tue, 16 Nov 2021 03:51:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h10sm6076957edr.95.2021.11.16.03.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 03:51:18 -0800 (PST)
Message-ID: <d5679e3a-7500-7b6b-5421-441de306afb7@redhat.com>
Date:   Tue, 16 Nov 2021 12:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 17/20] extcon: intel-cht-wc: Support devs with Micro-B
 / USB-2 only Type-C connectors
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20211114170335.66994-1-hdegoede@redhat.com>
 <20211114170335.66994-18-hdegoede@redhat.com>
 <CAHp75VdXSdhNtPwNdpssnmt+sZb+ZoAUm-cKJu-PqymmHMOpRw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdXSdhNtPwNdpssnmt+sZb+ZoAUm-cKJu-PqymmHMOpRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/16/21 12:28, Andy Shevchenko wrote:
> On Sun, Nov 14, 2021 at 7:04 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> So far the extcon-intel-cht-wc code has only been tested on devices with
>> a Type-C connector with USB-PD, USB3 (superspeed) and DP-altmode support
>> through a FUSB302 Type-C controller.
>>
>> Some devices with the intel-cht-wc PMIC however come with an USB-micro-B
>> connector, or an USB-2 only Type-C connector without USB-PD.
>>
>> Which device-model we are running on can be identified with the new
>> intel_cht_wc_get_model() helper and on models without a Type-C controller
>> the extcon code must control the Vbus 5V boost converter and the USB role
>> switch depending on the detected cable-type.
> 
> ...
> 
>>  config EXTCON_INTEL_CHT_WC
>>         tristate "Intel Cherrytrail Whiskey Cove PMIC extcon driver"
>> -       depends on INTEL_SOC_PMIC_CHTWC
> 
>> +       depends on INTEL_SOC_PMIC_CHTWC && USB_SUPPORT
> 
> Having these two in one expression sounds a bit alogical to me, can
> you just add a separate "depends on"?

Sure.

> 
>> +       select USB_ROLE_SWITCH
> 
> ...
> 
>> +       if (ext->vbus_boost && ext->vbus_boost_enabled != enable) {
>> +               if (enable)
>> +                       ret = regulator_enable(ext->vbus_boost);
>> +               else
>> +                       ret = regulator_disable(ext->vbus_boost);
> 
> Redundant blank line here (but it's up to you)
> 
>> +               if (ret == 0)
>> +                       ext->vbus_boost_enabled = enable;
>> +               else
>> +                       dev_err(ext->dev, "Error updating Vbus boost regulator: %d\n", ret);
> 
> Why not a traditional pattern, i.e. error handling first?

As I've mentioned before (to a very similar remark) error handling
first is not the traditional pattern, at least not for me.

Traditionally (to me) the else case is the error case. This
is just how humans work. E.g. if I need help for something
saying something like:

"If you have time can you help me with this please? Otherwise
I'm afraid that I am never going to solve this."

Feels natural, where as saying it like this:

"If you do not have time I'm afraid I am never going to solve
this, otherwise can you help me with this please ?"

Feels quite unnatural, at least to me.

>> +       }
> 
> ...
> 
>> +/* Some boards require controlling the role-sw and vbus based on the id-pin */
> 
> Vbus ? VBUS? Here and there the inconsistency of some terms...

"Vbus", I'll try to fix this up everywhere.

Regards,

Hans

