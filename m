Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC28486934
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 18:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242439AbiAFRyR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 12:54:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241987AbiAFRyQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 12:54:16 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABC7C061245;
        Thu,  6 Jan 2022 09:54:16 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id u25so12536725edf.1;
        Thu, 06 Jan 2022 09:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=eZdw4ha7wSUzgu5ld8qzql8IMnrghV9/jOBQI06caAY=;
        b=iatsx+kVxdpLuJxNT4eblkv/koVpyWHeB1t6cxvQCuctglSTJRs+AU5u+RaKnt2z16
         SpFKcsKp6J/B4y4jA8EJmrmHAnrcZlb90nzS6d+APOhEu5z/SEm1x4G957cyCDlu1m+Y
         8Q74jH8QolZN17aIYi8Lrw3EmvYOv1wCSjEA4WcRDV1lvCTeTM7p1/N1zOqBpd6nDl19
         DM088umPvN+xk1Fby88I4R8Sgr6g0dw/2u8RktVDqbyVcZr6hoAkUR2rEO3e+Kb5/qPZ
         wh9wtudlpLCOR3BbTpfrRE5T35E5zfqq2gxHGacJx6geXhBvs/q0D+wMXP9coGYl8LrF
         i8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eZdw4ha7wSUzgu5ld8qzql8IMnrghV9/jOBQI06caAY=;
        b=VFWoZhJZhrNI5wA58m9ETXipMHnIMD37U3uUxGowvWJ+9qUfSkE+1VEabPtqATPx4U
         +EA1nHoP9eTZp0AYpWgSFsZ0yKTx82SVuuDPuvSXVKYAF42+Bzd4/tLBIJjHODYcgwTH
         c4MX/sOA0PSYxU3YFQFgOoPUMFbHFxFLaBxefulPeoAyIeKIx9n5L+jrXHpPE09AxpXn
         qVcLMdS3tZYC/ec9vfESFCYVGUNCr0l793kWC9urVQg9utIGw+P21kl2Q3doJ+I2mjlF
         ucT7HVh9afhpxL/qkgMcuG7O/SLvr06f11haP2ewHIuRG7OZnE8F7CFS1M77M77TP3gf
         KL5w==
X-Gm-Message-State: AOAM532VVdmSuYTeM3EJW2TLb4NkvzDxD9c4nZGL6IVkCNBz6m6s/p/o
        72EeEJvcamyv8+4OJBs2bBHRP30rvoBMPw==
X-Google-Smtp-Source: ABdhPJybrm8pvFT0nK83X1H1ZNuXhn7ET+WMd7cXZjuPkmAOMDyAGIeaubtHtFjRzOI8+3Rab5O07w==
X-Received: by 2002:a17:906:c13:: with SMTP id s19mr47297098ejf.330.1641491654809;
        Thu, 06 Jan 2022 09:54:14 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.226.0.o2inet.sk. [46.34.226.0])
        by smtp.gmail.com with ESMTPSA id b2sm658060ejh.199.2022.01.06.09.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 09:54:14 -0800 (PST)
Message-ID: <d28741bf-a461-f4da-2f72-7855023684a1@gmail.com>
Date:   Thu, 6 Jan 2022 18:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <f8c13907-d296-baa6-7637-c5f8aa96b7ff@gmail.com> <YdbnQjxBINyFIRsQ@ninjato>
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav.bendik@gmail.com>
In-Reply-To: <YdbnQjxBINyFIRsQ@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

> Do you think this is this the same issue as described in
 > https://bugzilla.kernel.org/show_bug.cgi?id=214597  <https://bugzilla.kernel.org/show_bug.cgi?id=214597>?

Probably not.

> Isn't the interrupt described in the ACPI tables?

Probably not. I am just web developer, i am not 100% sure, but i have not seen
anything usable in ACPI tables:
https://mireq.linuxos.sk/kernel/p14s_gen2_amd_acpi_tables.tar.xz

Most important section with SMBus is here:
https://lore.kernel.org/all/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com/

This section looked promising:

Scope (_SB.I2CB)
{
     Device (TPNL)
     {
         Name (_HID, "XXXX0000")  // _HID: Hardware ID
         Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
         Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
         Name (HID2, 0x00)
         Name (POIO, 0x00)
         Name (SBFB, ResourceTemplate ()
         {
             I2cSerialBusV2 (0x0000, ControllerInitiated, 0x00061A80,
                 AddressingMode7Bit, "\\_SB.I2CB",
                 0x00, ResourceConsumer, _Y0C, Exclusive,
                 )
         })
         Name (SBFG, ResourceTemplate ()
         {
             GpioInt (Level, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
                 "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                 )
                 {   // Pin list
                     0x0005
                 }
         })
         CreateWordField (SBFB, \_SB.I2CB.TPNL._Y0C._ADR, BADR)  // _ADR: Address
         CreateDWordField (SBFB, \_SB.I2CB.TPNL._Y0C._SPE, SPED)  // _SPE: Speed
         Name (ITML, Package (0x0A)
         {
             Package (0x07)
             {
                 0x04F3,
                 0x2A3B,
                 0x10,
                 0x01,
                 0x01,
                 "ELAN901C",
                 0x01
             },


but method _STA returned 0x0 (device not present). There is no activity on pin
5. My device has synaptics trackpoint/touchpad, not elantech.  I think, that
this section is for touchscreen (not on my device).

More infomations to GPIO:

Following command does nothing if psmouse is loaded without synaptics_intertouch:

gpiomon --num-events=1000 gpiochip0 19

After loading psmouse with intertouch it catches constantly cca 2000 changes/s.
There are some changes like two rising / falling edges directly behind each
other. I think, that clok is much faster, than gpiomon monitoring speed,
catching communication with this command would be useless.

I don't know why there is constant communication from trackpoint/touchpad to
GPIO 19/20. Maybe some notification mechanism, attention, maybe something which
stops after clearing some bit, i dont know. Schematic from Lenovo, documentation
or anything useful wold be great, but whithout this i am just guessing.

Pins 19/20 should be SCL/SDA of I2C3 (from coreboot, id don't know source of pin
description:
https://github.com/coreboot/coreboot/blob/cf39336ccfcc363162395bddf65113900aaf19fe/src/soc/amd/cezanne/include/soc/gpio.h#L152

