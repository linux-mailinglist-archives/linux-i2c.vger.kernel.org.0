Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0B448C402
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 13:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353145AbiALMaI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 07:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240498AbiALMaI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 07:30:08 -0500
X-Greylist: delayed 513 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Jan 2022 04:30:07 PST
Received: from server00.inetadmin.eu (server00.inetadmin.eu [IPv6:2a01:390:1:2:e1b1:2:0:d7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB06BC06173F;
        Wed, 12 Jan 2022 04:30:07 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.226.0.o2inet.sk [46.34.226.0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: miroslav@wisdomtech.sk)
        by server00.inetadmin.eu (Postfix) with ESMTPSA id 709D413A569;
        Wed, 12 Jan 2022 13:21:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wisdomtech.sk;
        s=dkiminetadmin; t=1641990089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PrJWjC6rXy/yziDCyLYQTnCgivshgKBhKhOEpfD/N0Q=;
        b=kVwogiEB7OXO3+wwYhozP2E3z5QphjWPAVi/fCUvECmjE/5Mqnqm0h6Pael4O3vB+/nA+h
        D9si/yy1gPEnP8R6sAYFRbpU+X8bhFaigfyaWorpKt4Y0jqj/3O71CCKmcA1C0+AZrOhRN
        ZCYQ+MRHZP4PUk8Ogak5vZcEV2+kEQg=
Message-ID: <596d6af1-d67c-b9aa-0496-bd898350865c@wisdomtech.sk>
Date:   Wed, 12 Jan 2022 13:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
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
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com> <Yd6SRl7sm8zS85Al@ninjato>
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav@wisdomtech.sk>
In-Reply-To: <Yd6SRl7sm8zS85Al@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

 > IIRC tests done by Miroslav showed that interrupt 7 was used for
 > completing SMBus Block transfers and alike, but not for HostNotify. He
 > suspects this is wired via GPIO somehow.

This is just speculation. It may be routed to GPIO pin, but think it's more
likely that AMD implements host notify. I have looked at windwos drivers and
there is only SMBus driver bundled with synaptics.

Lets look at https://www.intel.com/Assets/PDF/datasheet/290562.pdf 
(PIIX4 from
Intel). There is SMBSLVCNT register (page 152). Last bit (Slave Enable) 
should
enable interrupt on host notify if slave address matches content of SMBSLVC.
This register is described on page 135 (SMBUS SLAVE COMMAND). Registers are
accessible using PCI configuration registers. I have tried this code before
enabling interrupts without success:

pci_write_config_word(dev, SMBSLVC, 0x2c); // synaptics

I don't know if this PDF is relevant for AMD. Newest documentation from AMD,
which i found is:
https://www.amd.com/system/files/TechDocs/55072_AMD_Family_15h_Models_70h-7Fh_BKDG.pdf

This document describes SMBusSlaveControl on same address (0x08) and 
SlaveEnable
looks almost identical.

The interesting part is:

"address that matches the host controller slave port of 10h, a command field
that matches the SMBus slave control register, and a match of corresponding
enabled events"

Slave device should send address 10h automatically. Enabled events can 
be set
using SMBusSlaveEvent register. I have enabled all (set 0xff to 0x0a / 0x0b
registers), but i don't know how to set "command field". There is no 
register
named "command field". Intel has SMBSLVC, but i can't find corresponding
register on AMD.

Constant activity on I2C pins can be repeated host notify request from 
synaptics.

Last interesting fact:

I have recorded register value (except 0x02 and 0x07) after each SMBus
transaction. This is from last 2 transactions:

0200 0004 5801 0000 0fa9 00ff ff00 a8aa
0200 0001 5802 0000 0fa9 40ff ff00 a8aa

Every call has SMBusSlaveEvent (register 0x0a) 0x00 except of last 
command after
which device is initialized. After this call register has value 0x40. I have
written 0xff to this register to enable all events in probe function. I 
don't
know why it's 0x00 until last transaction.

