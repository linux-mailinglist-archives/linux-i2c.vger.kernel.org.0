Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0856F252A
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Apr 2023 17:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbjD2PP3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Apr 2023 11:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjD2PP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Apr 2023 11:15:29 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB871BE4
        for <linux-i2c@vger.kernel.org>; Sat, 29 Apr 2023 08:15:27 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D94B721E5E;
        Sat, 29 Apr 2023 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682781323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mg/ui40DHx2aIERo/VKZjxXX7uIlI/1KtvfjtisGnP4=;
        b=nXDEv8AktIhqT2gd40iTnRPKeuofALyedvLpm95oLtgg24bUsSyc862HRVZP0oejwyzbQC
        9SiYljRCDSwqy9pydvoRnQHbuIX5kMrA8XtEc2sXdxHn6zFMCM/gmOSrtc3HdG6GQ3Itc5
        FKWQCXv6omATR+XXO3AS4cen1isik90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682781323;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mg/ui40DHx2aIERo/VKZjxXX7uIlI/1KtvfjtisGnP4=;
        b=UalxJdBP7zUwBRUyYzJHlB4c/MfiubAcHTNVpFvkkLXr88/0tWFdqggThFIZ0zkiLLQOyz
        7fignAorVkg+CzAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B55B4138E0;
        Sat, 29 Apr 2023 15:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Wr9dKos0TWRBCAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sat, 29 Apr 2023 15:15:23 +0000
Date:   Sat, 29 Apr 2023 17:15:22 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     =?UTF-8?B?SmVhbi1GcmFuw6dvaXM=?= Roy <jf@devklog.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [ee1004] Failed to select page 0 - G.Skill Trident Z5 NEO DDR5,
 ASUS X670E board - 6.2.11-arch1-1
Message-ID: <20230429171522.05c671f8@endymion.delvare>
In-Reply-To: <ZEISllc9y2bot/ZT@ninjato>
References: <CAE8T=_HGM+gKQguOasGSKi5YXh91S62QYA2=MC45CLJPYxrVAg@mail.gmail.com>
        <ZEISllc9y2bot/ZT@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean-Fran=C3=A7ois,

On Fri, 21 Apr 2023 06:35:34 +0200, Wolfram Sang wrote:
> On Thu, Apr 20, 2023 at 03:51:38PM -0700, Jean-Fran=C3=A7ois Roy wrote:
> > On a ASUS X670E (AMD AM5 platform) board, I am unable to read the
> > eeprom for my memory (through decode-dimms). The SMBus is driven by
> > piix4_smbus.
> >=20
> > i2cdetect -l lists the following:
> >=20
> > i2c-0   i2c             Synopsys DesignWare I2C adapter         I2C ada=
pter
> > i2c-1   i2c             NVIDIA i2c adapter 2 at 1:00.0          I2C ada=
pter
> > i2c-2   i2c             NVIDIA i2c adapter 3 at 1:00.0          I2C ada=
pter
> > i2c-3   i2c             NVIDIA i2c adapter 4 at 1:00.0          I2C ada=
pter
> > i2c-4   i2c             NVIDIA i2c adapter 5 at 1:00.0          I2C ada=
pter
> > i2c-5   i2c             NVIDIA i2c adapter 6 at 1:00.0          I2C ada=
pter
> > i2c-6   smbus           SMBus PIIX4 adapter port 0 at 0b00      SMBus a=
dapter
> > i2c-7   smbus           SMBus PIIX4 adapter port 2 at 0b00      SMBus a=
dapter
> > i2c-8   smbus           SMBus PIIX4 adapter port 1 at 0b20      SMBus a=
dapter
> >=20
> > Looking at i2c-6:
> >=20
> > i2cdetect -y 6 0x50 0x70
> >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > 00:
> > 10:
> > 20:
> > 30:
> > 40:
> > 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
> > 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 70: --
> >=20
> > I think those are the memory eeproms. If I bind them to ee1004 as so:

They indeed most likely are.

> > echo ee1004 0x51 >/sys/bus/i2c/devices/i2c-6/new_device
> > echo ee1004 0x53 >/sys/bus/i2c/devices/i2c-6/new_device
> >=20
> > The kernel prints:
> >=20
> > [ 1642.373579] ee1004 6-0051: 512 byte EE1004-compliant SPD EEPROM, rea=
d-only
> > [ 1642.373588] i2c i2c-6: new_device: Instantiated device ee1004 at 0x51
> > [ 1645.328289] ee1004 6-0053: 512 byte EE1004-compliant SPD EEPROM, rea=
d-only
> > [ 1645.328299] i2c i2c-6: new_device: Instantiated device ee1004 at 0x53
> >=20
> > But then when I use decode-dimms, the kernel is unable to select page 0:
> >=20
> > [ 1697.112564] ee1004 6-0051: Failed to select page 0 (-6)
> > [ 1702.581605] ee1004 6-0051: Failed to select page 0 (-6)

According to the technical documentation, the ASUS X670E uses DDR5
SDRAM. The EE1004 EEPROMs are the standard used on DDR4 SDRAM memory
modules. I did not look into DDR5 SPD support yet, but your testing
above suggests that DDR5 modules are using an EEPROM standard which is
not compatible with EE1004.

I took a quick look on jedec.org in search for information and found
JESD400-5A which covers SPD contents for DDR5 and it enumerates 1024
bytes. This is twice as much as what EE1004 EEPROMs can hold, so DDR5
modules are definitely not using EE1004 EEPROMs. So far I couldn't find
the "equivalent" of EE1004 for DDR5 modules so far.

Anyway, note that there's currently no support for DDR5 in
decode-dimms, so even after figuring out how to deal with DDR5 module
SPD EEPROMs on the kernel side, we will also have to add full decoding
support for DDR5 SPD fields to that script. The document weights 117
pages so it's a pretty serious amount of work.

--=20
Jean Delvare
SUSE L3 Support
