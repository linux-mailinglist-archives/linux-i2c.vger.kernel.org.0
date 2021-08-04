Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36113E0876
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 21:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237429AbhHDTDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 15:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhHDTDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Aug 2021 15:03:04 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70F9C0613D5
        for <linux-i2c@vger.kernel.org>; Wed,  4 Aug 2021 12:02:50 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b11so3374330wrx.6
        for <linux-i2c@vger.kernel.org>; Wed, 04 Aug 2021 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Klx1ZFMODRxUANh91mIqCOT+FEGuSaGimuCwXElm9mc=;
        b=DRTO5tOhszARV3nieByrccQqYDdRtoVJgA8FoRIg+JlLqdPOfNk/BmgKP2AnQqqbW4
         Fdz7VREU7I+mTlYQQuQFZbLy++M2dcO5I21purie2rcljDHIpHmdPFhS/2FFAy6g0VG2
         fVxi6+DY6IsxcK/CMRZVkoDrPZYpKXCjBgY/VxT9ypHS/s4Xn6m23Q8030boDwv+IkJI
         XRXoyyoPRxLBsuhKxfkRiSXhhzY7M6wCUvHWcR4KY1bOnZ2BgovA2PJhPVD421zXCak2
         sbsKVY5QU3fM4mKg/HZzuVxwoigAeHq1IAzZXDVOIQXZhTmsz7iWKYlA5HLOgMaeCXW0
         GXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Klx1ZFMODRxUANh91mIqCOT+FEGuSaGimuCwXElm9mc=;
        b=AtA3EHHUES8xXReDASnaMvPtzMKXgWhiZv6LXKBWnPHa15PKTUhkO8OoGMjI7mAhZc
         y/wfzQeqwsSE3K9j9nu5XEFYV5YQbOWr7xCe14XFsLRx4woyGH5I5QME2+RHUlKi1hPH
         8JIcQd4YjhF0Gl8hVbul+nNtkfgAUn5292wXNIwwTDTXx/dWlSILSVMkKo/CJ6r4HFKP
         HcH5n4YvW3R6rrLOrBFrXWjM1DVDMqjCtirg3fmkLwted65wOUlvmou6dzqGOWar8JTN
         Dk2PGvB5PHZOnxMUTsoZgSD/OBEbHVbTiz7+8WcQ8Kpa6yznRAKb/qnKSLefW3Vyuiax
         Onig==
X-Gm-Message-State: AOAM532A9sCtiH5nDf8m9Emtw2iXGQWi+BcUlJsF6y9AqCLUhXY9Ns8B
        qBKkTn5Y538PX5zttCuNN3zWfXvOi9mxqA==
X-Google-Smtp-Source: ABdhPJyttZ4CYoSzt06aqwMp7RqP3bp5gmQLy6LVwZ7au9vgqzSMYb5LoJpneF4avg4TJz4qnzCdMQ==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr787108wrt.383.1628103769300;
        Wed, 04 Aug 2021 12:02:49 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:1c9b:2aa1:8778:a6c? (p200300ea8f10c2001c9b2aa187780a6c.dip0.t-ipconnect.de. [2003:ea:8f10:c200:1c9b:2aa1:8778:a6c])
        by smtp.googlemail.com with ESMTPSA id x12sm3608393wrt.35.2021.08.04.12.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 12:02:48 -0700 (PDT)
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com>
 <20210802145347.605ce8d5@endymion>
 <b0bca52e-2bbc-18ef-5134-d5b6fe9df2bf@gmail.com>
 <68929f0f-a44e-6617-3e4e-dcdb9933d856@linux.intel.com>
 <CAJZ5v0jdNFDJr8ZrbU-jp53RWsZxY7+KRLF0kqmU+pxzXu6RmA@mail.gmail.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
Message-ID: <139a63dd-e14e-56d1-9fd1-408047831aea@gmail.com>
Date:   Wed, 4 Aug 2021 21:02:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jdNFDJr8ZrbU-jp53RWsZxY7+KRLF0kqmU+pxzXu6RmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04.08.2021 16:06, Rafael J. Wysocki wrote:
> On Wed, Aug 4, 2021 at 3:36 PM Jarkko Nikula
> <jarkko.nikula@linux.intel.com> wrote:
>>
>> Hi
>>
>> On 8/2/21 7:31 PM, Heiner Kallweit wrote:
>>> On 02.08.2021 14:53, Jean Delvare wrote:
>>>> Hi Heiner,
>>>>
>>>> On Sun, 01 Aug 2021 16:16:56 +0200, Heiner Kallweit wrote:
>>>>> Drivers should not call pm_runtime_allow(), see
>>>>> Documentation/power/pci.rst. Therefore remove the call and leave this
>>>>> to user space. Also remove the not needed call to pm_runtime_forbid().
>>>>>
>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>> ---
>>>>>   drivers/i2c/busses/i2c-i801.c | 2 --
>>>>>   1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>>>> index 92ec291c0..362e74761 100644
>>>>> --- a/drivers/i2c/busses/i2c-i801.c
>>>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>>>> @@ -1891,7 +1891,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>>>>     pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
>>>>>     pm_runtime_use_autosuspend(&dev->dev);
>>>>>     pm_runtime_put_autosuspend(&dev->dev);
>>>>> -   pm_runtime_allow(&dev->dev);
>>>>>
>>>>>     return 0;
>>>>>   }
>>>>> @@ -1900,7 +1899,6 @@ static void i801_remove(struct pci_dev *dev)
>>>>>   {
>>>>>     struct i801_priv *priv = pci_get_drvdata(dev);
>>>>>
>>>>> -   pm_runtime_forbid(&dev->dev);
>>>>>     pm_runtime_get_noresume(&dev->dev);
>>>>>
>>>>>     i801_disable_host_notify(priv);
>>>>
>>>> These calls were added by Jarkko (Cc'd) and I'm not familiar with power
>>>> management so I'll need an explicit ack from him before I can accept
>>>> this patch.
>>>>
>>> The calls were part of the initial submission for rpm support and supposedly
>>> just copied from another driver. But fine with me to wait for his feedback.
>>>
>> Yes, I'm quite sure I've copied it from another driver :-)
>>
>> This patch will cause the device here won't go automatically to D3
>> before some user space script allows it. E.g
>>
>> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
>>
>> I think this is kind of PM regression with this patch. It's not clear to
>> me from the Documentation/power/pci.rst why driver should not call the
>> pm_runtime_allow() and what would be allowed kernel alternative for it.
> 
> Please see the comment in local_pci_probe().
> 
> Because the PCI bus type is involved in power management, the driver
> needs to cooperate.
> 
>> Rafael: what would be the correct way here to allow runtime PM from the
>> driver or does it really require some user space script for it?
> 
> No, it doesn't.
> 

PCI core code includes the following because of historic issues
with broken ACPI support on some platforms:

void pci_pm_init(struct pci_dev *dev)
{
	int pm;
	u16 status;
	u16 pmc;

	pm_runtime_forbid(&dev->dev);
	pm_runtime_set_active(&dev->dev);
	pm_runtime_enable(&dev->dev);

That's why RPM has to be enabled by userspace for PCI devices:
echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control

Or drivers (that know that they can't be used on one of the broken
platforms) call pm_runtime_allow(), what however is explicitly
discouraged.

Not sure whether any of the old broken platforms is still relevant,
therefore I started a discussion about it, which however ended
w/o tangible result. See here:
https://www.spinics.net/lists/linux-pci/msg103281.html

I work around this restriction with the following in an init script,
not sure how common distro's deal with this.

# enable Runtime PM for all PCI devices
for i in /sys/bus/pci/devices/*/power/control; do
        echo auto > $i
done
