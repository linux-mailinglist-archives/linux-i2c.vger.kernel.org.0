Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC2828E8CA
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 00:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgJNWfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 18:35:07 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:53270 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727387AbgJNWfH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 18:35:07 -0400
Received: from [37.201.5.97] (helo=[192.168.1.61])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <rainer@finke.cc>)
        id 1kSpML-00078D-Ih; Thu, 15 Oct 2020 00:35:01 +0200
From:   Rainer Finke <rainer@finke.cc>
Subject: Re: [Bug 209627] Touchscreen doesn't work anymore since commit
 21653a4181ff292480599dad996a2b759ccf050f (regression)
To:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org
Cc:     mika.westerberg@linux.intel.com, wsa@kernel.org, sashal@kernel.org
References: <ab71ef62-64c8-ff31-c5aa-43ad454d1143@finke.cc>
 <cb544a8b-98e8-2f43-4984-bc0422a05703@redhat.com>
 <4dd2d096-a3dd-c151-01ff-346fd776351d@redhat.com>
Message-ID: <7ddaf5ab-bca9-e634-d829-8965fb3be0ba@finke.cc>
Date:   Thu, 15 Oct 2020 00:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <4dd2d096-a3dd-c151-01ff-346fd776351d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Con-Id: 198604
X-Con-U: 0-mail
X-Originating-IP: 37.201.5.97
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 14.10.20 17:13, Hans de Goede wrote:
> Hi,
>
> On 10/13/20 5:45 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 10/12/20 9:52 PM, Rainer Finke wrote:
>>> After upgrading from Linux 5.4.68 to Linux 5.4.69, the touchscreen 
>>> of my Huawei Matebook 12 doesn't work anymore. The same issue 
>>> happens with Linux >= 5.8.13.
>>>
>>> I've compiled Linux from git to verify if it was fixed, but it 
>>> doesn't help. But when reverting the commit 
>>> 21653a4181ff292480599dad996a2b759ccf050f the touchscreen works fine 
>>> again.
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.8.13&id=953fc770d069b167266d9d9ccfef0455fcfdc070 
>>>
>>>
>>> For reference my bug reports:
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=209627
>>>
>>> https://bugs.archlinux.org/task/68178#comment193400
>>>
>>>
>>> Hardware:
>>>
>>> - CPU Intel Core m3-6Y30
>>>
>>> - GPU Intel Graphics 515
>>
>> Thank you for your bug report and I'm sorry to hear about this problem.
>>
>> The commit in question fixes the touchpad not working on several
>> recent Lenovo models. What it does it makes the method (opregion) to
>> access the i2c bus from ACPI code available to the ACPI code before
>> calling the status method of ACPI devices on that i2c-bus.
>> This status method tells us if the device is actually present or not
>> and on those Thinkpads the status method did an i2c check, so we
>> needed to register the i2c opregion before checking for new devices.
>>
>> Registering the i2c opregion earlier seemed like an obvious
>> solution, but I was already afraid we would hit an issue on some
>> device because of this, because of ACPI being ACPI.
>>
>> It seems that the ACPI status method for your device probably
>> also does something with the i2c bus when the i2c opregion
>> is available, but for some reason that is not working...
>>
>> The next step in debugging this would be to take a look at
>> the ACPI tables for your device, can you please run:
>>
>> sudo acpidump -o acpidump.Huawei-Matebook-12
>>
>> And then send out an email with the generated
>> acpidump.Huawei-Matebook-12 file attached?
>>
>> Note please drop the list from the Cc when sending the
>> email with the attachment.
>>
>> What would also be useful (for a possible workaround) would
>> be the output of:
>>
>> grep . /sys/class/dmi/id/* 2> /dev/null
>>
>> Please run this as a normal user (*) and copy and paste
>> the output into your next email.
>
> In the mean time another issue triggered by the same
> commit has shown up on Microsoft Surface Go models.
>
> With te help fo the reporters of that issue I have found
> on issue with that commit.
>
> Can you please try a kernel with the troublesome commit
> *included* with the attached patch added on top and see
> if that fixes things?
>
> Regards,
>
> Hans


I've compiled linux-git with the provided patch and it worked :-)


Thank you very much for the great support!

Regards,

Rainer Finke

