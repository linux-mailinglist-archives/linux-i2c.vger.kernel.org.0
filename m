Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60DF4857CD
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 18:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242654AbiAER5a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 12:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242674AbiAER5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jan 2022 12:57:24 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2529BC06118A;
        Wed,  5 Jan 2022 09:57:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id o6so165286172edc.4;
        Wed, 05 Jan 2022 09:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=J6wuYJoPRIgKjVbhBQqiwOqRsDcdL51zm9vcwe/xXQo=;
        b=iWb8+VNYbZd+CDD+ps0GriDmerKESeMQhKXmqCDDFwix2vvgkaaj8dXwwXN1OxrxNy
         kg8qL0IxmRlBzV69+1BqtT7yuWb9VTqkZs+11K86E/ECSsIDUqP+iMIZ5mHq1F2TkLhN
         lnlEuuvHs/hMbGzolCn3RSvS6O4EVuvRV+SPyhWuvpsIX8lrz7D7/RzNffYsNfV5tXDE
         3kG03uhFATshNjEfwYXM7FqAM+6l5KX97fkKG6hxHn02xzEiNPTcTkZ0GOdkZW++smUJ
         h5Axuwwmz/bAEfhMyKooZMHwxHh/v6OLC6sLwZyCdWCjanMY1CoKVvCLyLWE+EZCyWOm
         QU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=J6wuYJoPRIgKjVbhBQqiwOqRsDcdL51zm9vcwe/xXQo=;
        b=QbHWwMmgpPbRt8kuiDAkOsEO35DW6rjP/LY+o/LOgbXMpvkfCHBNYIpJvwapUAmnTc
         /2VzRwiahjVVLixukMf6gpg67hwoX150ORgoZ/j5cJFQI2wuk6x+LiMQfkOUGdg29zhL
         qYJ092QAOAKJU0s3N5iB2+2z/UnJLL+88f80Mr/M1+gc35/B3IocZM4QtB9ahxQP+q8w
         wPgNgKg96RbShtLke5a5Ti9iiACqMRZdKlQuB0ytXWYawWJ9bF4ofX32aW8fxVzjG0Is
         y8gU3+d7YnGTuqHLe/Z6fPMeaaKbQ+nFLZwWERtWnBhAOCo9o5/I+dIkDtyiLmoCwpTp
         7Aow==
X-Gm-Message-State: AOAM533hIDa38G1NSfRr6HY1btDMOwODVOSbtyPqlpxqHBDfS8jy0A88
        DGBZ9ustmUeMpN1OGgEtwKecPsFjBQ/Qiw==
X-Google-Smtp-Source: ABdhPJxWguD/0/sV326JskWQ+S78ETcPs+lslY0AYxZ16VVsyx7g1Hzp6IyxODzrdiW7mXFl5aAqwg==
X-Received: by 2002:a05:6402:40c3:: with SMTP id z3mr37063109edb.386.1641405441592;
        Wed, 05 Jan 2022 09:57:21 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.226.0.o2inet.sk. [46.34.226.0])
        by smtp.gmail.com with ESMTPSA id c12sm16444500edx.80.2022.01.05.09.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 09:57:21 -0800 (PST)
Message-ID: <f8c13907-d296-baa6-7637-c5f8aa96b7ff@gmail.com>
Date:   Wed, 5 Jan 2022 18:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav.bendik@gmail.com>
To:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
In-Reply-To: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Address detection does not work because cd6h/cd7h port io can be 
disabled, but
it's accessible using mmio. This patch:
https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/ 
with
modified AMD_PCI_SMBUS_REVISION_MMIO fixed base address detection.

Problem with RMI4 touchpad / trackpoint remains, because rmi4-smbus 
needs host
notify feature. I have tried implement this feature, without success. 
Interrupts
on IRQ 7 (SMBus) are generated only for block data transfers, but not for
trackpoint / touchpad move actions. I have looked at pinctrl_amd and it 
looks,
that activity is signaled using GPIO. This looks promising:

cat /sys/kernel/debug/pinctrl/AMDI0030:00/pingroups:

group: i2c0
pin 145 (GPIO_145)
pin 146 (GPIO_146)

group: i2c1
pin 147 (GPIO_147)
pin 148 (GPIO_148)

group: i2c2
pin 113 (GPIO_113)
pin 114 (GPIO_114)

group: i2c3
pin 19 (GPIO_19)
pin 20 (GPIO_20)

After loading psmouse with forced enabled intertouch pin 19/20 started
generating events.

