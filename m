Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7F964F84B
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 09:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiLQIkt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 03:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiLQIkq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 03:40:46 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0D710A1
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:43 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o5-20020a05600c510500b003d21f02fbaaso5539486wms.4
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GDLBFkuJFXSyonrm8eFgXAmB+1o4E8vQUhTBk/hGWM=;
        b=l7eCYGq1xVMxw26VmtXZKCZAS94QkPgQnoAhLrW3CgT1AultN8Wt2/aKnA+ehb11OU
         WLMkflZT0A7A+DMGCOd1rZf/5f/2eRBNRXbBCPx1XRQgY0Z94MgSHn6RR/99cq6l4fLw
         QXjRaqXEdlDHUTxerL9Q6a4TUKQtt1EGMyUdE4xSWclpVH+vd1APv053uoBjohH0MoiC
         cgOkicgoQ+K8nBWiDzeBaBLCHnwBZNYGAtl+OYhJ2GL9asl3ClJcaDqFNdcnO/knnKqI
         P8NkirGueYaGAWllERSl6/stGwtfwbdqJEkXxdY7cOhXN8IXBWKzYyL92vOLUpEgT0jJ
         uRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GDLBFkuJFXSyonrm8eFgXAmB+1o4E8vQUhTBk/hGWM=;
        b=M1NoCOOHUjyFz3MrhA+9fZDDN7vvVSnKGiFBQfyJkD2J4fjaRZyWdl77IlR9ne4Z2o
         zckG6ODAXGYZDqvyTjMQfEAPE0kymrPBbXdRfY61a25qlRwLXewW+UsXmsR69gPcVNrP
         qcygdM0D06ttyhvh3IGb5e/vDm1znCrSBaSIx9+f38koKSLRiQbCBeQloSZs1x3NFxPf
         FUTyPJtPHFnhmLgBQMypvQQWrrkKzJny3i2VvfgnkJdW99j9OUvoaujF2yut9HSQVl8p
         Q9qLF2Be93bX/QOU0oe4k71I2yjkWcRkJ0aQn+tjNdcaZ74EyCsV3WGDw/pcBFXKBR8F
         Gykw==
X-Gm-Message-State: ANoB5plW1BjZMkK4bksbJMrM4U5ZHbb/9+zgzvHk+2Fwvt1VJwagmzCE
        oOaU8qjHR+75SDjtCd6tBYLyDsXWwnk=
X-Google-Smtp-Source: AA0mqf4AYPPOHK/dPboT9y2c43U/Xt+tiwOifheHQ4XsjUGNDt1lDOVnEZWJtD6vd2K07HAIgHQ7DA==
X-Received: by 2002:a05:600c:554b:b0:3d2:1761:3742 with SMTP id iz11-20020a05600c554b00b003d217613742mr21936429wmb.15.1671266441492;
        Sat, 17 Dec 2022 00:40:41 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af7:5300:8868:b389:215f:d1? (dynamic-2a01-0c22-7af7-5300-8868-b389-215f-00d1.c22.pool.telefonica.de. [2a01:c22:7af7:5300:8868:b389:215f:d1])
        by smtp.googlemail.com with ESMTPSA id o3-20020a05600c4fc300b003cfbbd54178sm24538588wmq.2.2022.12.17.00.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 00:40:41 -0800 (PST)
Message-ID: <06d01cd1-fc17-48d5-476f-7bce031d0ac1@gmail.com>
Date:   Fri, 16 Dec 2022 22:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/8] i2c: i801: enable FEATURE_IRQ and
 FEATURE_I2C_BLOCK_READ on all chip versions
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <1f81a126-11b4-aa22-1e2c-9824e0ad730c@gmail.com>
 <20220607162442.7b618cca@endymion.delvare>
 <20220613190841.653709e7@endymion.delvare>
 <20220614145952.0df9661a@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20220614145952.0df9661a@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14.06.2022 14:59, Jean Delvare wrote:
> Hi Heiner,
> 
> On Mon, 13 Jun 2022 19:08:41 +0200, Jean Delvare wrote:
>> I was able to resurrect my Sony Vaio GR214EP laptop to test this patch
>> on an Intel 82801CAM (ICH3-M) chipset. And as I suspected, it does not
>> work. I get the following error in the kernel log:
>>
>> [13563.411101] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
>> [13565.434712] irq 9: nobody cared (try booting with the "irqpoll" option)
> 
> And now it's all coming back to me. The reason why we did not enable
> interrupts on chipsets older than the ICH5 is because they lack bit
> INTS in PCI register PCISTS. When the IRQ line is shared, we don't know
> whether the interrupt was caused by our device or by another device.
> Specifically, the following piece of code fails (it returns IRQ_NONE
> unconditionally):
> 
> static irqreturn_t i801_isr(int irq, void *dev_id)
> {
> 	(...)
> 	/* Confirm this is our interrupt */
> 	pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
> 	if (!(pcists & PCI_STATUS_INTERRUPT))
> 		return IRQ_NONE;
> 
> I tried replacing the code above by a check on SMBHSTSTS instead:
> 
> 	status = inb_p(SMBHSTSTS(priv));
> 	if (!(status & STATUS_FLAGS))
> 		return IRQ_NONE;
> 
> It seems to work, however my testing is limited and I don't know how
> reliable that would be if the other devices sharing the interrupt line
> were used heavily at the same time (the laptop is idling in text mode
> at the moment so the fact that the interrupt line is heavily shared
> does not really get exercised).
> 
> Then I loaded the driver with interrupts disabled
> (disable_features=0x10) to see if I2C block read was working. It is NOT
> working, as can be seen from the following dumps from the memory SPD
> EEPROM:
> 
> linux-w6i1:/home/jdelvare/src/i2c-i801 # i2cdump -y 4 0x50 b
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 80 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01    ??????@.?uT.??.?
> 10: 8f 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20    ?????.??`..???, 
> 20: 15 08 15 08 00 00 00 00 00 00 00 00 00 00 00 00    ????............
> 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 b9    ..............??
> 40: 7f da 00 00 00 00 00 00 53 53 50 31 33 33 2d 30    ??......SSP133-0
> 50: 36 34 33 32 33 4a 00 00 00 00 00 00 00 01 02 00    64323J.......??.
> 60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 64 cd    ..............d?
> 80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> 90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
> 
> linux-w6i1:/home/jdelvare/src/i2c-i801 # i2cdump -y 4 0x50 i
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> 10: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> 20: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> 30: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> 40: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> 50: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> 60: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> 70: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> 80: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> 90: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> a0: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> b0: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> c0: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> d0: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> e0: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
> f0: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
> 
> As you can see, the requested offset of the I2C block read (0x00, then
> 0x20, then 0x40 etc.) is being ignored, and instead every I2C block
> read starts at EEPROM offset 0x01.
> 
> If you compare the datasheets of the ICH5 (Intel doc 252516-001) and
> ICH3-M (Intel doc 290716-001), section "I2C Read", you will see that
> the description of the command is different. The format described for
> the ICH5 (table 114 in the datasheet) does match what the Linux i2c
> stack calls an I2C block read, while the format described for the
> ICH3-M (table 5-87 in the datasheet) does NOT. Apparently the original
> implementation was aimed at specific devices using 10-bit I2C
> addressing. As no other SMBus host device implemented that, we did not
> even allocate an SMBus command constant to it (and the fact that Intel
> changed the format in later hardware iterations proves that this was the
> right thing to do).
> 
> Looking at the ICH3-M implementation of the "I2C Block Read" transfer,
> I feel very lucky that I did not trash my memory SPD EEPROM while
> running the command. Because the format really starts with a WRITE of 2
> bytes to the EEPROM before reading from it.
> 
> So at least the I2C block read part of the patch is never going to
> work. The interrupt part could work if we change the test as described
> above, however I would question the relevance of making that change
> considering that it is no longer the obvious clean-up you originally
> proposed, and would then impact recent hardware too. I would hate to
> introduce a regression for the sole purpose of enabling interrupts on
> 20-year old hardware which I doubt many people are still using.
> 
> I am available to perform any test you want me to on this old laptop.
> As long as it runs...
> 
Thanks for testing! So I'll drop this patch from the series.

