Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEC2224DC2
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Jul 2020 22:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgGRUEq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Jul 2020 16:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgGRUEp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Jul 2020 16:04:45 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51EEC0619D2;
        Sat, 18 Jul 2020 13:04:45 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r12so14194388wrj.13;
        Sat, 18 Jul 2020 13:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6iOmVRoMVbU4qIjJZMlbcTETVfsHT39IuIHdkQtrsZM=;
        b=rupq1Mcd02Am9QpslDBvv9BvBLAWI3XaIjp8CXahnwPEU4u2vDw1NdsSCFqRtnC/q2
         kEhbrawoocZE14sCY1S722viEoU365QLzhvMMQj8Mr/4Z7dr9XTmte16uuPPOfXioT2D
         ouUVKomLIghO4nc+7Q9yJ22x96rIgkfcKmdZQxREZc1gy+S00KNb9LqOAGGB5Qbb/mK9
         0PCVoBquQwzDCGx/6DAxrxLua/XSwJ4I8saRwsPA+ejk7fWD2QDRSIwpKTz55fjzroaN
         qR/1QxvPcBurfddRlqhxJgpkSCMyrDQkPNmLuWIdSt9MZIr8D4WqyzHjA62etaQHTHEN
         jfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6iOmVRoMVbU4qIjJZMlbcTETVfsHT39IuIHdkQtrsZM=;
        b=m6XT3z7GprwJb23VLe+o2gGLy2UsksWlmRGo6YSi6QmgjBcrDR1zOZge9KmpztWvXk
         aWAgZQkePttHsfgZP1SFW2SmQcPtcyOTqBKr+GfVeRMkXloa2rN4eVDL9UAe0/sI//nz
         U/pGvs/2Ltcgtwfcaz4sHE96JoYbH7hQtFUAklBv4vBud1N6hNaO8e+HI6kolFLqt7bp
         4XFSk8vmCYtnuoOQbrpwJMdmI7fQKhdB0N/9SnJ4igVQl9CBxTZVE8PnjYj48IT2HEdQ
         jOG4DCeh/GWOgiha8oLrKSGIRggxOKm/qmWGtvqxYLOA7E2x+ruEyb+chA5uAX3DVw+Q
         0pEg==
X-Gm-Message-State: AOAM531CDXbDIQXZzyzol1XlPQP8akwpqPTh/s7wNrs5D2CM5cRyQEmX
        ojGSeQCyt5TnDx4SHSqZfxIZGsj50rQYDA==
X-Google-Smtp-Source: ABdhPJyIPgcYzZrlIDWvCmxIBQ+wXZNKSfXDuNrUb2LIjS1hZaqXB6MrhLcULcS0HRe7RH5epxWP5w==
X-Received: by 2002:adf:e6ce:: with SMTP id y14mr15559924wrm.401.1595102683993;
        Sat, 18 Jul 2020 13:04:43 -0700 (PDT)
Received: from net.saheed (540018D7.dsl.pool.telekom.hu. [84.0.24.215])
        by smtp.gmail.com with ESMTPSA id o7sm8289049wrv.50.2020.07.18.13.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2020 13:04:43 -0700 (PDT)
Subject: Re: [RFC PATCH 14/35] i2c/busses: Change PCIBIOS_SUCCESSFUL to 0
To:     Jean Delvare <jdelvare@suse.de>
Cc:     helgaas@kernel.org, bjorn@helgaas.com, skhan@linuxfoundation.org,
        linux-pci@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-15-refactormyself@gmail.com>
 <20200717165820.6b5318ad@endymion>
From:   Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <44eecce1-7c2d-32c8-865e-e80aa6c3a891@gmail.com>
Date:   Sat, 18 Jul 2020 21:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717165820.6b5318ad@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/17/20 4:58 PM, Jean Delvare wrote:

> Which PCI specification are you talking about here. In my "PCI Local
> Bus Revision 2.3" specification (March 29, 2002), chapter 2 is about
> Signal Definition and has nothing to do with the BIOS.
http://read.pudn.com/downloads211/doc/comm/994029/pcifw_r3_0_updated.pdf
>> Change all PCIBIOS_SUCCESSFUL to 0
>>
>> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
>> ---
>>   drivers/i2c/busses/i2c-ali15x3.c |  4 ++--
>>   drivers/i2c/busses/i2c-nforce2.c |  2 +-
>>   drivers/i2c/busses/i2c-sis5595.c | 10 +++++-----
>>   3 files changed, 8 insertions(+), 8 deletions(-)
> Hmmm. That seems to be a lot of changes to solve an essentially
> theoretical problem (if a problem at all). I am not familiar enough
> with the PCI subsystem to claim that it is fundamentally wrong, but
> enough to say I'm skeptical.
>
> PCI is a cross-architecture standard, and we can't possibly have the
> return value of core functions such as pci_write_config_word follow
> different conventions depending on the architecture, can we? Does
> pci_write_config_word() currently return PCIBIOS_SUCCESSFUL on success
> on x86 and 0 on success on other architectures? What about errors, do
> we return positive, "PCIBIOS-specific" error codes on x86 and negative,
> unix-like error codes on other architectures?

Unfortunately, the cover letter did not go through. I have resent it now:

https://lore.kernel.org/linux-i2c/20200718184558.110942-1-refactormyself@gmail.com/T/#u

Here is a discussion thread on it:

https://lore.kernel.org/linux-pci/fb40545a8de8df8914df40d7d6167752c5244ce6.camel@kernel.crashing.org/T/#t

>> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
>> index 02185a1cfa77..359ee3e0864a 100644
>> --- a/drivers/i2c/busses/i2c-ali15x3.c
>> +++ b/drivers/i2c/busses/i2c-ali15x3.c
>> @@ -167,11 +167,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>>   	if(force_addr) {
>>   		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
>>   			ali15x3_smba);
>> -		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
>> +		if (0 != pci_write_config_word(ALI15X3_dev,
>>   								SMBBA,
>>   								ali15x3_smba))
>>   			goto error;
> This leaves the code horribly aligned.

Sorry about that, lessons learnt.

Thank you for the review.

- Saheed

