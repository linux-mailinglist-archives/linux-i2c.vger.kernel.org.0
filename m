Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9355828E2E7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 17:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731704AbgJNPOG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 11:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50968 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726006AbgJNPOG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 11:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602688443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bs9TEC5cu/tQ6mugadECx/XTM9nETuh6JIFfAQ+7f2I=;
        b=cGYE58Zzyoy4fhfvIxcwmEVsfia3I9KjurxACbuFN6HYlM+hR9L4jsTfSEnqX1U74U/PuO
        kiKSW65QdFqNJNRiaSSxk0tbJ0AnycWdJQOau2gE1tyUsfnxVZ7P7PQVzRlBZcPUSKpWbe
        q5V7WhUBsb1NQyMwOpCLkOD6OFdruGs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-v83y7j2yOLCg6wzWOsNEQA-1; Wed, 14 Oct 2020 11:14:01 -0400
X-MC-Unique: v83y7j2yOLCg6wzWOsNEQA-1
Received: by mail-ej1-f69.google.com with SMTP id d13so1320294ejz.6
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 08:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Bs9TEC5cu/tQ6mugadECx/XTM9nETuh6JIFfAQ+7f2I=;
        b=r1gcWauzFxIpDzv1LwUI0eWI39Qps6R3rK/pfu3DdQ32nM7tmm2BiWquQmxsS0a07i
         B5kYA1N36O9J0toXb0cmm6d+ZDnmEe4HffCfJj+vAwQulZNODrdg8ccmGxXllwrRB2a+
         t0Ht0XL+nLSQ9NzQF4uRJzuBEeQNDCHIC9X06j7+GYkXRunUA6i4cVHno+0ZSLQqqZd/
         ZzW/jhrGR0bP+XbX+yCz8QRAXlyZxdGU3l2maC81F+g2mxfseYTVKqRZqAqd8r0iAmGz
         2AWjDF6zGy0nVxabwYPe67yVKvGDgzxPYUlptdRBeNJ6Ev3pOD33Ft67Zxb9vQDCmhLP
         bj5w==
X-Gm-Message-State: AOAM530lQHiTikkjF0QYEgWbsT02sCAKsLzbz2sBqGRcoQISwkLh3vZ1
        bzqh1tAz+qHEwBno2zidr3JRbjIjPK7MYP+4fXAiUwa8Zf30DdbXo/owV3YG5nxSJj0ZrSZ8IBH
        gICy2+D5PwJ3kz9Cgwl7C
X-Received: by 2002:a17:906:f8ca:: with SMTP id lh10mr5521926ejb.528.1602688439593;
        Wed, 14 Oct 2020 08:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6L5qLmuTkOrqOD29mn2hwDn6YCQUEg5N/BrsA3BValbucReXRnqbM/KZ49MqmA8ANu1e/jA==
X-Received: by 2002:a17:906:f8ca:: with SMTP id lh10mr5521897ejb.528.1602688439297;
        Wed, 14 Oct 2020 08:13:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id o3sm1789239edv.63.2020.10.14.08.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 08:13:58 -0700 (PDT)
Subject: Re: [Bug 209627] Touchscreen doesn't work anymore since commit
 21653a4181ff292480599dad996a2b759ccf050f (regression)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Rainer Finke <rainer@finke.cc>, linux-i2c@vger.kernel.org
Cc:     mika.westerberg@linux.intel.com, wsa@kernel.org, sashal@kernel.org
References: <ab71ef62-64c8-ff31-c5aa-43ad454d1143@finke.cc>
 <cb544a8b-98e8-2f43-4984-bc0422a05703@redhat.com>
Message-ID: <4dd2d096-a3dd-c151-01ff-346fd776351d@redhat.com>
Date:   Wed, 14 Oct 2020 17:13:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cb544a8b-98e8-2f43-4984-bc0422a05703@redhat.com>
Content-Type: multipart/mixed;
 boundary="------------E4CCA88F50161405964CC409"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a multi-part message in MIME format.
--------------E4CCA88F50161405964CC409
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/13/20 5:45 PM, Hans de Goede wrote:
> Hi,
> 
> On 10/12/20 9:52 PM, Rainer Finke wrote:
>> After upgrading from Linux 5.4.68 to Linux 5.4.69, the touchscreen of my Huawei Matebook 12 doesn't work anymore. The same issue happens with Linux >= 5.8.13.
>>
>> I've compiled Linux from git to verify if it was fixed, but it doesn't help. But when reverting the commit 21653a4181ff292480599dad996a2b759ccf050f the touchscreen works fine again.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.8.13&id=953fc770d069b167266d9d9ccfef0455fcfdc070
>>
>> For reference my bug reports:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=209627
>>
>> https://bugs.archlinux.org/task/68178#comment193400
>>
>>
>> Hardware:
>>
>> - CPU Intel Core m3-6Y30
>>
>> - GPU Intel Graphics 515
> 
> Thank you for your bug report and I'm sorry to hear about this problem.
> 
> The commit in question fixes the touchpad not working on several
> recent Lenovo models. What it does it makes the method (opregion) to
> access the i2c bus from ACPI code available to the ACPI code before
> calling the status method of ACPI devices on that i2c-bus.
> This status method tells us if the device is actually present or not
> and on those Thinkpads the status method did an i2c check, so we
> needed to register the i2c opregion before checking for new devices.
> 
> Registering the i2c opregion earlier seemed like an obvious
> solution, but I was already afraid we would hit an issue on some
> device because of this, because of ACPI being ACPI.
> 
> It seems that the ACPI status method for your device probably
> also does something with the i2c bus when the i2c opregion
> is available, but for some reason that is not working...
> 
> The next step in debugging this would be to take a look at
> the ACPI tables for your device, can you please run:
> 
> sudo acpidump -o acpidump.Huawei-Matebook-12
> 
> And then send out an email with the generated
> acpidump.Huawei-Matebook-12 file attached?
> 
> Note please drop the list from the Cc when sending the
> email with the attachment.
> 
> What would also be useful (for a possible workaround) would
> be the output of:
> 
> grep . /sys/class/dmi/id/* 2> /dev/null
> 
> Please run this as a normal user (*) and copy and paste
> the output into your next email.

In the mean time another issue triggered by the same
commit has shown up on Microsoft Surface Go models.

With te help fo the reporters of that issue I have found
on issue with that commit.

Can you please try a kernel with the troublesome commit
*included* with the attached patch added on top and see
if that fixes things?

Regards,

Hans

--------------E4CCA88F50161405964CC409
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-i2c-core-Restore-acpi_walk_dep_device_list-getting-c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-i2c-core-Restore-acpi_walk_dep_device_list-getting-c.pa";
 filename*1="tch"

From 3f52f91e8b7a11f96c815ea9c86632b797bdfe97 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 14 Oct 2020 13:59:06 +0200
Subject: [PATCH] i2c: core: Restore acpi_walk_dep_device_list() getting called
 after registering the ACPI i2c devs

Commit 21653a4181ff ("i2c: core: Call i2c_acpi_install_space_handler()
before i2c_acpi_register_devices()")'s intention was to only move the
acpi_install_address_space_handler() call to the point before where
the ACPI declared i2c-children of the adapter where instantiated by
i2c_acpi_register_devices().

But i2c_acpi_install_space_handler() had a call to
acpi_walk_dep_device_list() hidden (that is I missed it) at the end
of it, so as an unwanted side-effect now acpi_walk_dep_device_list()
was also being called before i2c_acpi_register_devices().

Move the acpi_walk_dep_device_list() call to the end of
i2c_acpi_register_devices(), so that it is once again called *after*
the i2c_client-s hanging of the adapter have been created.

This fixes the Microsoft Surface Go 2 hanging at boot.

Fixes: 21653a4181ff ("i2c: core: Call i2c_acpi_install_space_handler() before i2c_acpi_register_devices()")
Suggested-by: Maximilian Luz <luzmaximilian@gmail.com>
Reported-and-tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/i2c-core-acpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index e627d7b2790f..37c510d9347a 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -264,6 +264,7 @@ static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
 void i2c_acpi_register_devices(struct i2c_adapter *adap)
 {
 	acpi_status status;
+	acpi_handle handle;
 
 	if (!has_acpi_companion(&adap->dev))
 		return;
@@ -274,6 +275,15 @@ void i2c_acpi_register_devices(struct i2c_adapter *adap)
 				     adap, NULL);
 	if (ACPI_FAILURE(status))
 		dev_warn(&adap->dev, "failed to enumerate I2C slaves\n");
+
+	if (!adap->dev.parent)
+		return;
+
+	handle = ACPI_HANDLE(adap->dev.parent);
+	if (!handle)
+		return;
+
+	acpi_walk_dep_device_list(handle);
 }
 
 static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
@@ -719,7 +729,6 @@ int i2c_acpi_install_space_handler(struct i2c_adapter *adapter)
 		return -ENOMEM;
 	}
 
-	acpi_walk_dep_device_list(handle);
 	return 0;
 }
 
-- 
2.28.0


--------------E4CCA88F50161405964CC409--

