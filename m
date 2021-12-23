Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338EA47E69D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Dec 2021 18:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349353AbhLWRCd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Dec 2021 12:02:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40992 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233591AbhLWRCc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Dec 2021 12:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640278952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0L3hrfGHh2CA7aMbkoiYJDWgrUzDP7juBauygQys1NE=;
        b=crVJQlN/JO2zqnvPxXEnCgKzsYPLHvinA3HORg+Ug2CoYnVjDDsPajUCq19cqGZ+DLEDSd
        y4EGgu8AC0AhSLlWZWTmCFH9mIkBdUH+nB/0q8Gsy1Wodvg8YUi8FBHxpSylaMBge8bbzk
        IxWJMJpm9sbHgcKp9qShuXHhTtf7Rxw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-P_5AW6E6M6K2I9n4xqdAUA-1; Thu, 23 Dec 2021 12:02:31 -0500
X-MC-Unique: P_5AW6E6M6K2I9n4xqdAUA-1
Received: by mail-ed1-f70.google.com with SMTP id s12-20020a50ab0c000000b003efdf5a226fso4930124edc.10
        for <linux-i2c@vger.kernel.org>; Thu, 23 Dec 2021 09:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=0L3hrfGHh2CA7aMbkoiYJDWgrUzDP7juBauygQys1NE=;
        b=OuzHO3oRbh5i4XwHCMDGDdDf4744XXqAhNltDnfV9ZlXc7a/iobk5kaPJTM6ppCRD1
         Wepq88MkXUxUM/0Co7IhOungoP/2wB16uyrLJtyLu7Bj3tba0+P9xTDhUCA4O1SoDWIl
         LOxkVm+9iuwzrobVIX7dgxzHzq6zZGm0M+x6w1romqEnUPyo+BDmxNNfCIjRAa8xbtTy
         gc2amPkA1ivwHTybwVNT31bcBdkey58NCIJjOlA8rx4Qm/Icd0wRTO1DSu171Q7susUu
         er9DttW0lzo//1RxolP6wtZ8n53V7DJpqFs7CMEM3nn/WCen6ZGkK83mcHOxNv+gUgYH
         1qSQ==
X-Gm-Message-State: AOAM531AAhN3hwys67J66H1u0YE2GtPFubqOd2fgkZ1hn35l2L+SyvvP
        09Gq7aAb/js+VohJCOpNYG6wT+hUUKiTLqoMimhqGJazHeu7wjq6qfQSNFxix0ZyQTUDRRPaWFz
        iOBhWQagbr56D5C8PfSdZ
X-Received: by 2002:a17:906:f890:: with SMTP id lg16mr2710053ejb.757.1640278949776;
        Thu, 23 Dec 2021 09:02:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd6UhL94vaLcT6InDaVEGyzk60r+sLqen2QhcGsQrIMo2bSgdjMPwZF4AcdCPefw/JLHpfew==
X-Received: by 2002:a17:906:f890:: with SMTP id lg16mr2710037ejb.757.1640278949597;
        Thu, 23 Dec 2021 09:02:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id nc14sm1937751ejc.44.2021.12.23.09.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 09:02:29 -0800 (PST)
Message-ID: <4f3eca9f-1d55-35f5-585d-d121b1c83920@redhat.com>
Date:   Thu, 23 Dec 2021 18:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 0/8] platform/x86: introduce p2sb_bar() helper
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
 <08236e18-f1ae-303c-3d2e-96f795d96c1f@redhat.com>
In-Reply-To: <08236e18-f1ae-303c-3d2e-96f795d96c1f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 12/23/21 18:00, Hans de Goede wrote:
> Hi,
> 
> On 12/21/21 19:15, Andy Shevchenko wrote:
>> There are a few users and at least one more is coming that would
>> like to utilize P2SB mechanism of hiding and unhiding a device from
>> the PCI configuration space.
>>
>> Here is the series to deduplicate existing users and provide
>> a generic way for new comers.
>>
>> It also includes a patch to enable GPIO controllers on Apollo Lake
>> when it's used with ABL bootloader w/o ACPI support.
>>
>> The patch that bring the helper ("platform/x86/intel: Add Primary
>> to Sideband (P2SB) bridge support") has a commit message that
>> sheds a light on what the P2SB is and why this is needed.
>>
>> Please, comment on the approach and individual patches.
>>
>> The changes made in v2 do not change the main idea and the functionality
>> in a big scale. What we need is probably one more (RE-)test done by Henning.
>> I hope to have it merged to v5.17-rc1 that Siemens can develop their changes
>> based on this series.
>>
>> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
>> since we have an ACPI device for GPIO I do not see any attempts to recreate
>> one).
>>
>> (Since it's cross subsystem, the PDx86 seems the main one and
>> I think it makes sense to route it throught it with immutable
>> tag or branch provided for the others).
> 
> The series looks good to me:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> 
> For the series.
> 
> Not sure if this is really 5.17 material this late in the cycle though,
> but lets wait and see what Bjorn and Lee have to say (patch 8/8 still
> needs an ack from Lee).

Correction I just realized that that would be 7/8 that needs an ack from
Lee and that 8/8 needs an ack from Wolfram.

> I'm fine with taking this upstream through the pdx86 tree, please
> prepare a pull-req for everyone involved with an immutable branch
> pushed to pdx86/platform-drivers-x86.git/
> based on 5.16-rc1 (if everyone is happy with merging this for 5.17) or
> based on 5.17-rc1 once that is out.

Regards,

Hans

