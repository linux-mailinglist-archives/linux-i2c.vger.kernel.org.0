Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA17C4A367A
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 14:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiA3NOv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 08:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347097AbiA3NOu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jan 2022 08:14:50 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40BAC061714;
        Sun, 30 Jan 2022 05:14:49 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id d10so34310083eje.10;
        Sun, 30 Jan 2022 05:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QvcDRq4neR39bPyJq8ML9UJ19/Fds3F0tLeCK/aNS1I=;
        b=FOSc53BYqQeWxyJDbHK3FtfppA/So6bx/6lPFS2WepSiM2iLKRfqaDlaiyrnVUkg1S
         AQFhmR4kuw/UnUnsbhlWp0PAZWCROg1bvgws+uVDkYSfuiVRPfqQra2rWHenKKQ/nXXb
         pzkhIxKs2Y50y5bvnCNXKOvFJNRcC//UrNFfQuOmeHd+wxeGLDlGvoVLEFOAKYZ+eezJ
         U2u84EZ4i5lIxboT+fHo2vpxbfp6Q2VGXdtO5Kzq0zBC85EDhQl0c+lhL6lZv0gXuCe2
         9kwVp/FjyAhydSrGaX3PBBcDE1FVhPnMDYzxdEItP68G7Xuyf20jaok6eH9NZkZAXqew
         LizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QvcDRq4neR39bPyJq8ML9UJ19/Fds3F0tLeCK/aNS1I=;
        b=f9A5QjvG+XU+AhO/7AjLj3mlA4wlfcb5R76TG62udwmzoRUDp3uBcuu/ALatToyJTr
         kulLOTf3Qha35xZ9Iawif7E49KTkvd9APtnmE9cbZX/iqZNMAYcuE7wk0gGXsWNke/cM
         xu4xo+qR4njoZ6jot6UgMXwaOLCtv/2zHoCn473PiScIoyCQkdeDoUv4g7Iog9CCh3dh
         QBo36ABS6cZ/++qqIcfutXqgd6A9S/jphAEzqpCReNqbNYjeS2Ay1189iFZ27Zw4yDeY
         y0nd9ko8LlXRJq/03OONBvEyRp0ttpP62W9pNpj01psyRzPGia3CMEYGaA/d+xH6nujf
         X9mA==
X-Gm-Message-State: AOAM532cDqp+wodbDlSUvClOXdbl487pattKLwSiKDaMRLVtgZ43OK/1
        Ng97zrzi58Jx+7n3v9aNz3I=
X-Google-Smtp-Source: ABdhPJz06KtPOA0KqSNm2V25Mni3M75FgME+3UJ6Kp2pQF5ljdTZ4fOp//F7FSzM2KJF/77YTDDzRw==
X-Received: by 2002:a17:907:6e86:: with SMTP id sh6mr14028357ejc.398.1643548488266;
        Sun, 30 Jan 2022 05:14:48 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.228.91.o2inet.sk. [46.34.228.91])
        by smtp.gmail.com with ESMTPSA id o14sm16158889edr.6.2022.01.30.05.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jan 2022 05:14:47 -0800 (PST)
Message-ID: <04a38456-8999-36ac-1adc-632b9ba942ad@gmail.com>
Date:   Sun, 30 Jan 2022 14:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com>
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav.bendik@gmail.com>
In-Reply-To: <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,
i have small status update.

First most important information:
On AMD is trackpoint connected to ASF bus (similar to SMBus, but with
other control registers).

This bus has interrupt. After boot always generates interrupts for each
transaction. After playing it stops generating interrupts for
transaction, i don't know exactly why. More important is, that it can
generate interrupts when receives message from slave to broadcast
address (0x08).

To enable interrupts we should set:

ListenAddr to 0x08 and ListenAddrEn to 1:

outb_p((0x08 << 1) | 0x01, 0x09 + piix4_smba);

Then SlaveIntrListenEn of SlaveEn should be set to 1:

outb_p(inb_p(0x15 + piix4_smba) | 0x02, 0x15 + piix4_smba);

Now funny part, how to read address of slave device
(0x2c for synaptics):

Important register is ASFx13 DataBankSel register. If interrupt is
generated from slave device, then DataBankxFull is set. Address can be
retrieved using block read from 0x07 (DataIndex) register. Before
reading register SetReadHostDataBank should be 0. After setting
DataBankSel i am reading HostControl (dummy read), then reading form
DataIndex value 0x08 (broadcast address) and 0x2c (device, that wanted
attention). I am using following code, but it don't work good. Sometimes
there is bad value, sometimes it's reversed, first read gives 0x2c,
second 0x10. Don't know why. I have looked on decompiled windows driver
from synaptics and it looks, that there is special handling for
different DataBankSel values. I don't know exactly why, but problems are
rare, for now i am ignoring problems.


static u8 read_asf_data_bank(unsigned short piix4_smba, u8 bank_number)
{
     outb_p(bank_number << 4, 0x13 + piix4_smba);
     inb_p(0x02 + piix4_smba); // reset DataIndex
     inb_p(0x07 + piix4_smba); // read SMBus broadcast address
     return inb_p(0x07 + piix4_smba);
}


static irqreturn_t piix4_isr(int irq, void *dev_id)
{
     //struct i2c_adapter *piix4_adapter = (struct i2c_adapter *)dev_id;
     //struct i2c_piix4_adapdata *adapdata = 
i2c_get_adapdata(piix4_adapter);
     unsigned short piix4_smba = 0xb20;

     u8 bank_sel;
     u8 address[2] = {0x00, 0x00};
     u8 *current_address;

     current_address = &address[0];

     bank_sel = inb_p(0x13 + piix4_smba); // DataBankSel

     if ((bank_sel & 0x0c) == 0x00) { // bits DataBankxFull not set
         return IRQ_HANDLED;
     }

     printk(KERN_INFO "Bank=%02x\n", bank_sel);

     if ((bank_sel & 0x01) == 0) { // Last touched bank is 0
         if (bank_sel & 0x08) {
             *current_address = read_asf_data_bank(piix4_smba, 1);
             current_address++;
         }
         if (bank_sel & 0x04) {
             *current_address = read_asf_data_bank(piix4_smba, 0);
         }
     }
     else { // Last touched bank is 1
         if (bank_sel & 0x04) {
             *current_address = read_asf_data_bank(piix4_smba, 0);
             current_address++;
         }
         if (bank_sel & 0x08) {
             *current_address = read_asf_data_bank(piix4_smba, 1);
         }
     }

     outb_p(bank_sel & 0x0c, 0x13 + piix4_smba); // Clear DataBankxFull

     printk(KERN_INFO "Address=%02x %02x\n", address[0] >> 1, address[1] 
 >> 1);

     if (address[0] != 0x00) {
         i2c_handle_smbus_host_notify(piix4_aux_adapter, address[0] >> 1);
     }
     if (address[1] != 0x00 && address[1] != address[0]) {
         i2c_handle_smbus_host_notify(piix4_aux_adapter, address[1] >> 1);
     }

     return IRQ_HANDLED;
}

Now, when i load module i see this in log:

i2c i2c-11: Error: no response!
rmi4_f12 rmi4-00.fn12: Failed to read object data. Code: -6.
Bank=8d
Address=2c 2c
input input92: rmi_2d_sensor_abs_report: obj[0]: type: 0x01 X: 323 Y: 
301 Z: 79 WX: 9 WY: 2
Bank=8d
Address=2c 2c
input input92: rmi_2d_sensor_abs_report: obj[0]: type: 0x01 X: 271 Y: 
378 Z: 73 WX: 8 WY: 4
Bank=8d
Address=2c 2c
input input92: rmi_2d_sensor_abs_report: obj[0]: type: 0x01 X: 468 Y: 
378 Z: 72 WX: 7 WY: 3
Bank=8d
Address=2c 2c
i2c i2c-11: Bus collision! SMBus may be locked until next hard reset. 
(sorry!)
rmi4_f12 rmi4-00.fn12: Failed to read object data. Code: -5.
Bank=8d
Address=2c 2c
input input92: rmi_2d_sensor_abs_report: obj[0]: type: 0x01 X: 563 Y: 
373 Z: 73 WX: 7 WY: 2
Bank=8d
Address=2c 2c
i2c i2c-11: Bus collision! SMBus may be locked until next hard reset. 
(sorry!)
rmi4_f12 rmi4-00.fn12: Failed to read object data. Code: -5.


There are too many bus collisions a no responses. This is my
implementation of piix4_access_asf

static s32 piix4_access_asf(struct i2c_adapter *adap, u16 addr,
          unsigned short flags, char read_write,
          u8 command, int size, union i2c_smbus_data *data)
{
     struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(adap);
     unsigned short piix4_smba = adapdata->smba;
     int timeout = 0;
     int retval;
     u8 temp;

     // Acquire IMC semaphore
     outb_p(0x01, 0x14 + piix4_smba);
     while ((++timeout < MAX_TIMEOUT) && (!((temp = inb_p(0x14 + 
piix4_smba)) & 0x01))) {
         usleep_range(250, 500);
     }
     if ((temp & 0x01) == 0) {
         printk(KERN_INFO "lock not acquired\n");
         return -EBUSY;
     }

     outb_p(0x80, 0x13 + piix4_smba); // Set DataBankSel to host bank

     retval = piix4_access(adap, addr, flags, read_write, command, size, 
data);

     // Release semphore
     outb_p(0x02, 0x14 + piix4_smba);

     return retval;
}

Before transaction i am requesting HostSemaphore. Semaphore is correctly
acquired. Always. I don't know how exactly i should avoid bus conflicts.

Interrupts are sometimes generated with low frequency, sometimes with
high frequency. I don't know exactly why. Frequency changes after
restart of psmouse driver. Frequency changes with touch activity too, if
starts generating with high frequency and then i don't touch anything,
then frequency goes down. After touchpad activity frequency again goes
up.

Here is video with current state:

https://youtu.be/tf850B7UTWA
