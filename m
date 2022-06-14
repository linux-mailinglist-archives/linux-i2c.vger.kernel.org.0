Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7495954B1D5
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 15:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243175AbiFNM75 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 08:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237111AbiFNM74 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 08:59:56 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79EF33373
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 05:59:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A73C91F8F1;
        Tue, 14 Jun 2022 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655211593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UcqpJeWB1eKHUHXfZA7vrdOR4ck+WCAcSrMP3QJ9+yY=;
        b=MYNds/7bsXrcjIHpT5JQ1fR6+7z1T7RHlf6SS6+SjkqozYRCJ/C6k9Q17rqfRi/AxLaSEt
        WwSRz5NRJMQH0bK2RbjHHL9ZxqEGSrKi3BElpyB0XXMMWY/VuZiMQbvCDVAavFVmZs665A
        oEl70Pxha8hS5nD0KyfdvYW8m2EbEC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655211593;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UcqpJeWB1eKHUHXfZA7vrdOR4ck+WCAcSrMP3QJ9+yY=;
        b=WbLfa7R+AFcxPXnhjwqQfsLKH70rjg5gWSaMYCivWnxx2TphHE3UlOvTTEg4ZOB4bg3Tq+
        9xg81SM4x0Sr34DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85E411361C;
        Tue, 14 Jun 2022 12:59:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ZoUgH0mGqGIDHAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 14 Jun 2022 12:59:53 +0000
Date:   Tue, 14 Jun 2022 14:59:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/8] i2c: i801: enable FEATURE_IRQ and
 FEATURE_I2C_BLOCK_READ on all chip versions
Message-ID: <20220614145952.0df9661a@endymion.delvare>
In-Reply-To: <20220613190841.653709e7@endymion.delvare>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <1f81a126-11b4-aa22-1e2c-9824e0ad730c@gmail.com>
        <20220607162442.7b618cca@endymion.delvare>
        <20220613190841.653709e7@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Mon, 13 Jun 2022 19:08:41 +0200, Jean Delvare wrote:
> I was able to resurrect my Sony Vaio GR214EP laptop to test this patch
> on an Intel 82801CAM (ICH3-M) chipset. And as I suspected, it does not
> work. I get the following error in the kernel log:
> 
> [13563.411101] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
> [13565.434712] irq 9: nobody cared (try booting with the "irqpoll" option)

And now it's all coming back to me. The reason why we did not enable
interrupts on chipsets older than the ICH5 is because they lack bit
INTS in PCI register PCISTS. When the IRQ line is shared, we don't know
whether the interrupt was caused by our device or by another device.
Specifically, the following piece of code fails (it returns IRQ_NONE
unconditionally):

static irqreturn_t i801_isr(int irq, void *dev_id)
{
	(...)
	/* Confirm this is our interrupt */
	pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
	if (!(pcists & PCI_STATUS_INTERRUPT))
		return IRQ_NONE;

I tried replacing the code above by a check on SMBHSTSTS instead:

	status = inb_p(SMBHSTSTS(priv));
	if (!(status & STATUS_FLAGS))
		return IRQ_NONE;

It seems to work, however my testing is limited and I don't know how
reliable that would be if the other devices sharing the interrupt line
were used heavily at the same time (the laptop is idling in text mode
at the moment so the fact that the interrupt line is heavily shared
does not really get exercised).

Then I loaded the driver with interrupts disabled
(disable_features=0x10) to see if I2C block read was working. It is NOT
working, as can be seen from the following dumps from the memory SPD
EEPROM:

linux-w6i1:/home/jdelvare/src/i2c-i801 # i2cdump -y 4 0x50 b
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 80 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01    ??????@.?uT.??.?
10: 8f 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20    ?????.??`..???, 
20: 15 08 15 08 00 00 00 00 00 00 00 00 00 00 00 00    ????............
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 b9    ..............??
40: 7f da 00 00 00 00 00 00 53 53 50 31 33 33 2d 30    ??......SSP133-0
50: 36 34 33 32 33 4a 00 00 00 00 00 00 00 01 02 00    64323J.......??.
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 64 cd    ..............d?
80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................

linux-w6i1:/home/jdelvare/src/i2c-i801 # i2cdump -y 4 0x50 i
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
10: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
20: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
30: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
40: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
50: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
60: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
70: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
80: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
90: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
a0: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
b0: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
c0: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
d0: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?
e0: 08 04 0d 09 02 40 00 01 75 54 00 82 10 00 01 8f    ?????@.?uT.??.??
f0: 04 06 01 01 00 0e a0 60 00 00 14 0f 14 2c 20 15    ????.??`..???, ?

As you can see, the requested offset of the I2C block read (0x00, then
0x20, then 0x40 etc.) is being ignored, and instead every I2C block
read starts at EEPROM offset 0x01.

If you compare the datasheets of the ICH5 (Intel doc 252516-001) and
ICH3-M (Intel doc 290716-001), section "I2C Read", you will see that
the description of the command is different. The format described for
the ICH5 (table 114 in the datasheet) does match what the Linux i2c
stack calls an I2C block read, while the format described for the
ICH3-M (table 5-87 in the datasheet) does NOT. Apparently the original
implementation was aimed at specific devices using 10-bit I2C
addressing. As no other SMBus host device implemented that, we did not
even allocate an SMBus command constant to it (and the fact that Intel
changed the format in later hardware iterations proves that this was the
right thing to do).

Looking at the ICH3-M implementation of the "I2C Block Read" transfer,
I feel very lucky that I did not trash my memory SPD EEPROM while
running the command. Because the format really starts with a WRITE of 2
bytes to the EEPROM before reading from it.

So at least the I2C block read part of the patch is never going to
work. The interrupt part could work if we change the test as described
above, however I would question the relevance of making that change
considering that it is no longer the obvious clean-up you originally
proposed, and would then impact recent hardware too. I would hate to
introduce a regression for the sole purpose of enabling interrupts on
20-year old hardware which I doubt many people are still using.

I am available to perform any test you want me to on this old laptop.
As long as it runs...

-- 
Jean Delvare
SUSE L3 Support
