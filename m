Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFC64B36D8
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Feb 2022 18:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiBLRmQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Feb 2022 12:42:16 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiBLRmQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Feb 2022 12:42:16 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98492FFCC;
        Sat, 12 Feb 2022 09:42:11 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id n8so2412416wms.3;
        Sat, 12 Feb 2022 09:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:cc:in-reply-to:content-transfer-encoding;
        bh=z/UHU0aZnUbTEcNhsv89KHKF8r7FtgkxM0XdABko6bE=;
        b=n//i7sdKoEjdHEmGaycfN6wFYXAifqhUajCWdNkuM80L/xsgs57QMf3PJuYUi5IAEZ
         jdGnxe6buuq2FnFGUyNSS//dOgXZmgiOnD8GsLo4uKJJ0vA44qvedyyYqf+wBR1XLn2g
         fyb2i91ImQhVm+yoo7xIieHK6rRHjlSw4RsVJDGhoLBf71xakI0SY52Bo8mQnSXQF6VJ
         3dF1+aKqXfRluHJeFM8P9wcQ2llzMoviVssyWWVTeJRShYdGCcQtwSV43of7E0bdyYGs
         IIRYhqYEI0DQo+7l14OVRv5c+YtgBIhyOGZGjdAIGwlRf8msPExkzSQU10RrOg+4qzMa
         d3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:cc:in-reply-to
         :content-transfer-encoding;
        bh=z/UHU0aZnUbTEcNhsv89KHKF8r7FtgkxM0XdABko6bE=;
        b=u2wjCpZoCGEB13RQKC/lPqVcej1SvPWFsgg0phSDV2MumzXbN2kvNnO6FqW3353JZH
         CGkSYXX0AzViB+9TVFdzbgqSpP/UK+WY5v3Cm2YlRkwjs2j8fFBmD8vpcnrtVrQCmEw9
         m29fV/RwRfVqiWAsS9QwvWuljS8RCbn22XqeQipMXvqNQwYAu1tsdQHRUb0mfNybcS/6
         PbSfS+E8aR+TbWfsmWHFFZKO9GCphsr5TpsV8sTrTlX6aFxAS5u5nMZY3MxT9IQ87wzl
         ePwzWLXfRWVwP52XcUZNYV/kvoVJbm0DZNGpfjN0UStwUF2rHQC1HB24mLACJR8nrrZC
         Hh6g==
X-Gm-Message-State: AOAM533pl1UPqRGUEo+iMaCyXwzFuyxu9QvGcdUUBRylRUCESmNqBbr2
        b9YksQideMpN2cfF49FlC3BgpUCgFdQ=
X-Google-Smtp-Source: ABdhPJxYv9L6sPu0ZUnSvIs/xtzY75LHXIL51NoTw48m4uS6bhVpuRcuClINnzViygHvI7SKMjPZ9Q==
X-Received: by 2002:a1c:a552:: with SMTP id o79mr4815590wme.40.1644687729950;
        Sat, 12 Feb 2022 09:42:09 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.226.78.o2inet.sk. [46.34.226.78])
        by smtp.gmail.com with ESMTPSA id l15sm6823610wmi.29.2022.02.12.09.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Feb 2022 09:42:09 -0800 (PST)
Message-ID: <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
Date:   Sat, 12 Feb 2022 18:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav.bendik@gmail.com>
To:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
Cc:     Andrew Duggan <aduggan@synaptics.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,
i think, that SMBus works now pretty good and last problem is screaming 
interrupt from synaptics (1000 irq/s). I need little help to solve this 
problem.

Little summary first:

On this thinkpad is synaptics trackpoint/touchpad connected to PIIX4. To 
enable RMI4 mode, SMBus driver should support host notify protocol. I 
have added support of host notify and replaced active waiting 
transaction with completer + interrupt. Driver is now pretty stable and 
works way better, than old implementation. For example i2c-detect shows 
real devices (previous transaction code showed all addresses from 0x1c 
as active). Patch on following link is still hack, has hardcoded IRQ and 
supports host notifications and interrupts only on auxiliary port. I can 
implement other ports later.

Patch: 
https://lore.kernel.org/all/c9b0b147-2907-ff41-4f13-464b3b891c50@wisdomtech.sk/
This patch includes PM register access using MMIO: 
https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/

Now i can load psmouse synaptics_intertouch=1 and everything works 
great, but it uses 5% CPU and interrupt is called 1000/s. I have changed 
interrupt from rising edge to active low (it's PCIE, PCIE has active 
low) and i have many times checked if all interrupt bits are cleared in 
interrupt request. Yes, they are always cleared. Interrupts are 
generated only after first touch if i have compiled only F12. If i 
compile F03, then interrupts are generated immediately after load of 
psmouse. After unload, interrupts are not generated (i2c-piix4 still 
loaded).

On this machine I2C is accessible using GPIO 19(SCL), 20(SDA). Using 
kernel thread with RT priority on isolated core i have tried to record 
pin values on GPIO pins. Latency is too high to record all transferred 
data. Some state changes are lost (approximately 1/50 bits). Not too low 
to read reliably all data, but good enough to see what happens at bus 
level. Here is recorded file: 
https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_scl_sda.xz.

Every byte is sample, first bit is SCL, second SDA. Sample rate is cca 
500 000 Hz, but often drops under 100 000 (lost bit).

On this screenshot is typical activity on bus: 
https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_1.png (pulseview with 
imported raw file)

Zoom to two packet is here: 
https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_2.png

First packet is SMBus host notify. Address 0x08 is SMBus host address 
and 0x58 is address of synaptics (0x2c << 1). Second packet is reading 
of interrupt status registers. Data 02 is length of interrupt status 
register (9 bits) and last 2 bytes are zero (idle, when moving cursor, 
then interrupt status register contains one bit set).

Zoomed out: https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_3.png

Before transaction SMBus slave state machine is disabled and after 
transaction enabled. If notification is received when state machine is 
disabled, then device writes only address and don't get response. If 
driver runs with always enabled slave state machine, then output will 
contain only notify + read interrupt status pairs and no separate 
addresses, but with this mode bus collisions occur more often.

Here is dmesg output: https://pastebin.com/RdDYHJn0

Cursor is moved until 2862.8, then i have not touched trackpoint.

Idle device don't produce bus collisions. Moving cursor produces 
collisions, but sample rate is stable 100Hz, which is way better, than 
<40 Hz with PS/2 mode. I don't know how to solve collisions. Maybe they 
are related to not silenced host notifications.

If i were to be optimistic, then i would say that clearing interrupt 
vector will solve all problems. According old RMI4 documentation, 
reading from interrupt status register should clear interrupts (status 
register is cleared), but this don't prevent device form sending host 
notifications. Maybe exists new way to disable interrupts. I don't know, 
i have no access to current documentation.

My device has this signature:
Synaptics, product: TM3471-030, fw id: 3418235

Any help welcome.
