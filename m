Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD273E2F58
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 20:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhHFSfW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 14:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbhHFSfV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 14:35:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DEBC061798
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 11:35:05 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id c16so12189342wrp.13
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 11:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RccbAohYP6I8mRz8loZb/ggN2E6er37spe2Jxl92V5o=;
        b=GvV7tZfmtdqVqeyN9I+pPwYgLhxAK0RP2OkWhMvjO5b8kcLgRTWVd8d/9KFolHyWZF
         axkkcbqdeiBEIEZLMYnXXR0zc/lwJLX2xdAg7xUpLm+Eb7LuP7btpK5rZ6av1InJBmWU
         8t7b80F1Ewugp6l7NCOvFE7tKxF1LxYeVOT8k664xHwKn1eZ6O5eJWOLpdyJYpdzZAGh
         sfzQxxcyCsU5KHMyJx5kNsG+AdKj5bnTXJ2Vpy41uwhbpqLhLhsAiB5p8C+MQhHbIUOz
         1Ui3PVJKHoUpHbrJNLAZlyLWjbAAakSzBD/Tiext0PgYws7mLvAtVtAaMLVE+09ShoZy
         PBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RccbAohYP6I8mRz8loZb/ggN2E6er37spe2Jxl92V5o=;
        b=mW8gMyJ56ma8ertCnepxUVbIUV+qlbs4Zc0reZlX/FEmNbop/JGhFalGDThTot8rna
         6PlBJTVS9Fh9m03RnFC3vE4oPyAorwvrI1pMls+l9hapaFELpqcEAIeeYZm3IamG+bkV
         D2sEjnm+eBwkJVhHzPUI9/l5NEVyLozyRAj2Cv7TT1FoihfTeBKKEkttJDEf6GKBlzYv
         6c3+7GNBATaluQpanC/c/ldkdrYXUbHTN3Hv9n90fGzCEOAN+81/dDdo011ioA77ZOl5
         kiMRSFH613IoFMOx8dOXW2qz0u1GbBGVcJ5il0F092n9Evbr093AcJMMTTaA3n9Vh784
         LO3Q==
X-Gm-Message-State: AOAM533fpItccVxTu+JUy8EI11IMS6wtTTa0bTfVhMdLl98FD/4Oj6Zo
        qpdtMNVc389Bp5NGr8PX8O+6Vxgu19H+yw==
X-Google-Smtp-Source: ABdhPJyTiqQiLmX03r0wR9mfF/SN/1Kkj084RlWBYmE9sivtnMjNnMB3/aZI/tdvQwT8MNDYepfY9Q==
X-Received: by 2002:adf:ed0a:: with SMTP id a10mr12406725wro.30.1628274903591;
        Fri, 06 Aug 2021 11:35:03 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id r13sm6453310wro.91.2021.08.06.11.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 11:35:03 -0700 (PDT)
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com>
 <20210802145347.605ce8d5@endymion>
 <b0bca52e-2bbc-18ef-5134-d5b6fe9df2bf@gmail.com>
 <68929f0f-a44e-6617-3e4e-dcdb9933d856@linux.intel.com>
 <CAJZ5v0jdNFDJr8ZrbU-jp53RWsZxY7+KRLF0kqmU+pxzXu6RmA@mail.gmail.com>
 <139a63dd-e14e-56d1-9fd1-408047831aea@gmail.com>
 <CAJZ5v0j2t+AZGqMwAgZEJR2RoXHqB=H+CgzErc=fq5fcWNQiSg@mail.gmail.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <10ec5f87-c4c2-4740-b52d-0ad626178db4@gmail.com>
Date:   Fri, 6 Aug 2021 20:34:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0j2t+AZGqMwAgZEJR2RoXHqB=H+CgzErc=fq5fcWNQiSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06.08.2021 15:52, Rafael J. Wysocki wrote:
> On Wed, Aug 4, 2021 at 9:02 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 04.08.2021 16:06, Rafael J. Wysocki wrote:
>>> On Wed, Aug 4, 2021 at 3:36 PM Jarkko Nikula
>>> <jarkko.nikula@linux.intel.com> wrote:
>>>>
>>>> Hi
>>>>
>>>> On 8/2/21 7:31 PM, Heiner Kallweit wrote:
>>>>> On 02.08.2021 14:53, Jean Delvare wrote:
>>>>>> Hi Heiner,
>>>>>>
>>>>>> On Sun, 01 Aug 2021 16:16:56 +0200, Heiner Kallweit wrote:
>>>>>>> Drivers should not call pm_runtime_allow(), see
>>>>>>> Documentation/power/pci.rst. Therefore remove the call and leave this
>>>>>>> to user space. Also remove the not needed call to pm_runtime_forbid().
>>>>>>>
>>>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>>>> ---
>>>>>>>   drivers/i2c/busses/i2c-i801.c | 2 --
>>>>>>>   1 file changed, 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>>>>>> index 92ec291c0..362e74761 100644
>>>>>>> --- a/drivers/i2c/busses/i2c-i801.c
>>>>>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>>>>>> @@ -1891,7 +1891,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>>>>>>     pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
>>>>>>>     pm_runtime_use_autosuspend(&dev->dev);
>>>>>>>     pm_runtime_put_autosuspend(&dev->dev);
>>>>>>> -   pm_runtime_allow(&dev->dev);
>>>>>>>
>>>>>>>     return 0;
>>>>>>>   }
>>>>>>> @@ -1900,7 +1899,6 @@ static void i801_remove(struct pci_dev *dev)
>>>>>>>   {
>>>>>>>     struct i801_priv *priv = pci_get_drvdata(dev);
>>>>>>>
>>>>>>> -   pm_runtime_forbid(&dev->dev);
>>>>>>>     pm_runtime_get_noresume(&dev->dev);
>>>>>>>
>>>>>>>     i801_disable_host_notify(priv);
>>>>>>
>>>>>> These calls were added by Jarkko (Cc'd) and I'm not familiar with power
>>>>>> management so I'll need an explicit ack from him before I can accept
>>>>>> this patch.
>>>>>>
>>>>> The calls were part of the initial submission for rpm support and supposedly
>>>>> just copied from another driver. But fine with me to wait for his feedback.
>>>>>
>>>> Yes, I'm quite sure I've copied it from another driver :-)
>>>>
>>>> This patch will cause the device here won't go automatically to D3
>>>> before some user space script allows it. E.g
>>>>
>>>> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
>>>>
>>>> I think this is kind of PM regression with this patch. It's not clear to
>>>> me from the Documentation/power/pci.rst why driver should not call the
>>>> pm_runtime_allow() and what would be allowed kernel alternative for it.
>>>
>>> Please see the comment in local_pci_probe().
>>>
>>> Because the PCI bus type is involved in power management, the driver
>>> needs to cooperate.
>>>
>>>> Rafael: what would be the correct way here to allow runtime PM from the
>>>> driver or does it really require some user space script for it?
>>>
>>> No, it doesn't.
>>>
>>
>> PCI core code includes the following because of historic issues
>> with broken ACPI support on some platforms:
>>
>> void pci_pm_init(struct pci_dev *dev)
>> {
>>         int pm;
>>         u16 status;
>>         u16 pmc;
>>
>>         pm_runtime_forbid(&dev->dev);
>>         pm_runtime_set_active(&dev->dev);
>>         pm_runtime_enable(&dev->dev);
> 
> Well, thanks for reminding me about that!
> 
>> That's why RPM has to be enabled by userspace for PCI devices:
>> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
> 
> Not really enabled, but rather "unlocked".
> 
>> Or drivers (that know that they can't be used on one of the broken
>> platforms) call pm_runtime_allow(), what however is explicitly
>> discouraged.
> 
> The problem here is that whether or not PM-runtime works in the given
> configuration is not a property of a driver or an individual device,
> but it depends on the platform.
> 
> Also if the driver is unbound from the device, the modified setting is
> left behind it which isn't particularly nice.
> 
>> Not sure whether any of the old broken platforms is still relevant,
> 
> That's a good question, but it boils down to whether or not any of
> them are still in use, which is hard to measure.
> 
>> therefore I started a discussion about it, which however ended
>> w/o tangible result. See here:
>> https://www.spinics.net/lists/linux-pci/msg103281.html
> 
> So I'm thinking that there could be a global flag accessible via a
> kernel command line option, say pci_pm_runtime=allow/deny that would
> allow the default behavior to be adjusted.  Now, the default value of
> that flag could depend on some heuristics, like the BIOS date or
> whether or not the system has ACPI etc.
> 
Right, such proposals have been made. See e.g. here:
https://www.spinics.net/lists/linux-pci/msg103313.html

1. use dmi_get_bios_year() as indicator
2. Use ACPI version (major.minor) as indicator

Now it just takes a brave person who says:
There's no perfect indicator, let's go with the following and see
whether anybody complains.

>> I work around this restriction with the following in an init script,
>> not sure how common distro's deal with this.
> 
> Some of them use powertop to do an equivalent of the loop below IIRC.
> 
>> # enable Runtime PM for all PCI devices
>> for i in /sys/bus/pci/devices/*/power/control; do
>>         echo auto > $i
>> done

