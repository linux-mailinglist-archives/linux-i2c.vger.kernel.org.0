Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2AC488563
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 19:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbiAHSmd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 13:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbiAHSmc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 13:42:32 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D95C06173F;
        Sat,  8 Jan 2022 10:42:32 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id b13so35722090edd.8;
        Sat, 08 Jan 2022 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=GucwCLqUZ5vDkmSoTx5MhL7d97pjcPtPrGWziRoB/AE=;
        b=JnJEr7Tw61tc1GV4ra+hecW8qVl1PM0xe5UwwHk2efHXVHhDtctKJrLlpf8+FoK91i
         e429x29t2gme7nMiXKjJRXjYCMDwqPWI1cxSME7sKjI+Vhaswz/LsBLfq8oZwJvJJG+X
         d3DsZfzQm/+e7xdbUuNewrRvXk4W9EiWxLyNeOPXXEmweOLbJ8G7Emj7J4cDUFMKmk+2
         0IAKFhtZ7bzHRWAWbuzzaZIttgOjvI9QNtOrm2exIdeu5/2iIY0acQ7i+nCC6G9ECPe9
         SosFVqIOo2B/XPLk+6LPbCrShme17h6SV+TUrZLKq59qbm3wKEOqb4gQSOtjMsuhuhrQ
         VxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=GucwCLqUZ5vDkmSoTx5MhL7d97pjcPtPrGWziRoB/AE=;
        b=B8eawezxn1NzTXDb3j8zJNZ4xeIRwuxMrw9rA3TuTgItdth/0oQUK3hpoZEXqhucpv
         EcXaAtPqPyn4C+h00TA8OQT2QR4BZAAfGNWUocGEEUH+yW6vcGck2jhjQ2gsZLOGkqLQ
         T/JgZpmCjyhirSGxPOGZ7JL48jsLVSp+g8uTmrr3iNbpr+9w9C2QgRuOvxpKk6F67Izf
         kbva9t+UF8pG4koP3oETOQbfT7LC6cO6c49XVUNfS6qsYDttpoXLOfayflTxOND0Qs4N
         fFBnCeUZJbwlSN+h4k+BFGsIf6kW5VRgXzxScrDwREYsB9Yj9CdE9cVqHrWqe2IPJPAm
         QJYg==
X-Gm-Message-State: AOAM530Zyt6uRao++AQ74oR2EIw99pNa2GLXKOr2IklKs1CxbiHTK7vj
        3sOs1orJrFleQRbFoDsQ2+2uPJlHXtWc7A==
X-Google-Smtp-Source: ABdhPJxZxVy2l08LZOWveIAAgmYBrT+gHa/nszWfFPzJCSb6aOiS8qFm+gFA8gheBILmQamZsGKWIA==
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr51991249ejc.14.1641667350516;
        Sat, 08 Jan 2022 10:42:30 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.226.0.o2inet.sk. [46.34.226.0])
        by smtp.gmail.com with ESMTPSA id lv23sm710315ejb.125.2022.01.08.10.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 10:42:30 -0800 (PST)
Message-ID: <5fc2c68d-a9df-402a-58b5-fdd531f86b55@gmail.com>
Date:   Sat, 8 Jan 2022 19:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav.bendik@gmail.com>
To:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Mario Limonciello <superm1@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
In-Reply-To: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Summary of synaptics_intertouch problem on Thinkpad with Ryzen 5850U:

Problem with wrong base address is fixed using this patch:
https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/

Second problem is, that RMI4 driver don't work with i2c-piix4, because 
it needs
I2C_FUNC_SMBUS_HOST_NOTIFY. I have added I2C_FUNC_SMBUS_HOST_NOTIFY to
piix4_func and psmouse can be loaded with synaptics_intertouch=1 
parameter. Here
is output with rmi_core debug_flags=0xfffd - https://pastebin.com/xGRHyyXV

Synaptics is on address 0x2c (value 0x58/0x59 in SMBus register, bit 1 
is r/w).
Command i2cdetect -l can see i2c busses:

i2cdetect -l
i2c-3   i2c             AMDGPU DM i2c hw bus 1                  I2C adapter
i2c-10  smbus           SMBus PIIX4 adapter port 2 at 0b00 SMBus adapter
i2c-1   i2c             Synopsys DesignWare I2C adapter         I2C adapter
i2c-8   i2c             AMDGPU DM aux hw bus 3                  I2C adapter
i2c-6   i2c             AMDGPU DM aux hw bus 0                  I2C adapter
i2c-4   i2c             AMDGPU DM i2c hw bus 2                  I2C adapter
i2c-11  smbus           SMBus PIIX4 adapter port 1 at 0b20 SMBus adapter
i2c-2   i2c             AMDGPU DM i2c hw bus 0                  I2C adapter
i2c-0   i2c             Synopsys DesignWare I2C adapter         I2C adapter
i2c-9   smbus           SMBus PIIX4 adapter port 0 at 0b00 SMBus adapter
i2c-7   i2c             AMDGPU DM aux hw bus 2                  I2C adapter
i2c-5   i2c             AMDGPU DM i2c hw bus 3                  I2C adapter

Device is visible on address 0x2c (output when psmouse is loaded with
smbus_intertouch):

i2cdetect -q -y 11
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- 1c -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

I can add this call

i2c_handle_smbus_host_notify(piix4_aux_adapter, 0x2c);

to end of piix4_transaction and i have working touchpad / trackpoint. I can
move, i can click and evhz reports rate 100Hz, which is much better than 
39 with
PS/2 protocol. I know, this is endless loop, which generates on my 
machine 2000
interrupts/s and it can break some features like sleep.

Current state is, that everything works with one exception - cursor moved
/ click interrupt. I don't know which interrupt / pin generates this event.

Now what i have tried:

Interrupt line can be retrieved using ACPI. More informations and links 
to full
ACPI tables are here:
https://lore.kernel.org/all/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com/

I have added this code to end of piix_probe:

retval = devm_request_irq(&dev->dev, dev->irq, piix4_isr, IRQF_SHARED, 
"piix4_smbus", piix4_aux_adapter);
if (!retval) {
     printk(KERN_INFO "smbus Using irq %d\n", dev->irq);
}
else {
     printk(KERN_INFO "smbus No irq %d\n", dev->irq);
}

PCI IRQ is set, because i have added it to PCI quirks (temporary hack).
Synaptics is connected to aux adaptor, i am registering irq wit aux adapter.
I have added InterruptEnable call (bit 0) in SMBUSx02 SMBusControl register
(register numbers are from AMD BKDG
- https://www.amd.com/en/support/tech-docs?keyword=bkdg):

unsigned short piix4_smba = 0xb20;
outb_p(0x01, (0x02 + piix4_smba));

Now i have tried to check SMBusStatus and SMBusSlaveStatus in interrupt 
handler,
but they are not usable. First register is cleared directly in transfer
function, which is called before interrupt handler and second is always 
zero. It
looks, that interrupt is triggered only after data transfer, but not for 
host
notification event from slave.

I have added some print statements, to see, what happended. This code 
dumps registers:

static void piix4_dump_registers(struct i2c_adapter *piix4_adapter, char 
*label)
{
     struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(piix4_adapter);
     unsigned short piix4_smba = adapdata->smba;
     int i;
     u8 d[16];

     for (i = 0; i < 16; ++i) {
         if (i == 2 || i == 7)
             d[i] = 0;
         else
             d[i] = inb_p(i + piix4_smba);
     }

     printk(KERN_INFO "smb registers: %s    %02x%02x ...);
}

There are problems with reading form registers 2 and 7. It breaks 
communication,
i don't know why.

Now this is interrupt handler:

static irqreturn_t piix4_isr(int irq, void *dev_id)
{
     struct i2c_adapter *piix4_adapter = (struct i2c_adapter *)dev_id;
     piix4_dump_registers(piix4_adapter, "isr              ");

     return IRQ_HANDLED;
}

I have added piix4_dump_register after transaction, but before clearing 
status.
Output is on this link: https://pastebin.com/4mLBk0U7

After last line there is no output from RMI4/SMBus. Only this line has 
set 0x0a
register (SMBusSlaveEvent) which looks like event from slave. This line is
generated after transaction, but not from interrupt handler. Interrupt 
is not
called for slave events.

Now i have tried to enable interrupts from slave events. I have added 
this code
to probe function (again, numeric addresses, but i can find numbers 
faster in
reference documentation):

outb_p(0x80, (0x02 + piix4_smba)); // Reset to  SMBusControl
outb_p(0x01, (0x02 + piix4_smba)); // InterruptEnable to SMBusControl
outb_p(inb_p(0x01 + piix4_smba) | 0x02, (0x01 + piix4_smba)); // 
SlaveInit to  SMBusSlaveStatus

outb_p(0x2c << 1, (0x04 + piix4_smba)); // write 0x2c address ?
outb_p(0xff, (0x0a + piix4_smba)); // enable all slave events 
onSMBusSlaveEvent
outb_p(0xff, (0x0b + piix4_smba)); // enable all slave events
outb_p(inb_p(0x08 + piix4_smba) | 0x01, (0x08 + piix4_smba)); // SlaveEnable
outb_p(inb_p(0x08 + piix4_smba) | 0x08, (0x08 + piix4_smba)); // 
SMBusAlertEnable
outb_p(inb_p(0x08 + piix4_smba) | 0x02, (0x08 + piix4_smba)); // 
SMBusShadow1EN
outb_p(inb_p(0x08 + piix4_smba) | 0x04, (0x08 + piix4_smba)); // 
SMBusShadow2EN

I have tried other combinations, but without success. This part of 
documentation
looks like description of SMBus host notify:

SMBusShadow1En. Read-write. Reset: 0. Enable the generation of an 
interrupt or
resume event upon an external SMBus master generating a transaction with an
address that matches the SMBus Shadow 1 register.
SlaveEnable. Read-write. Reset: 0. Enable the generation of an interrupt or
resume event upon an external SMBus master generating a transaction with an
address that matches the host controller slave port of 10h, a command 
field that
matches the SMBus slave control register, and a match of corresponding 
enabled
events.

I don't know how should i exactly interpret this part. I don't know what is
SMBus slave control register. It looks like this part is copied from PIIX4
documentation from intel
(https://www.intel.com/Assets/PDF/datasheet/290562.pdf), but without exact
description how matching works.

I have looked at other options how to retrieve interrupt, for example 
amd_pinctl
GPIO. This looked promising:

cat /sys/kernel/debug/pinctrl/AMDI0030\:00/pingroups
registered pin groups:
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

Pins 19/20 are normally idle, but after loading psmouse with intertouch, 
then
there is constant activity (i can capture cca 2000 evnets/s using gpiomon,
frequency is probably much higher). I don't know if this is usable, but 
looks,
that this is i2c line from synaptics. I have not found interrupt pin.

On this link is output of gpiomon --num-events=5000  gpiochip0 19 20:
https://pastebin.com/B9XamDZA

This is everything, that i know. It thin, that i have forgotten some trivial
call, to unmask interrupt, but really, i don't know what. With working
interrupt, enabling RMI4 over piix4-smbus should be trivial.
