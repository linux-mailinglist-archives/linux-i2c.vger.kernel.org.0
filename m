Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DD74216C8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 20:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbhJDSrc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 14:47:32 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:45298 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbhJDSrc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 14:47:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id EB9BE1FE0B;
        Mon,  4 Oct 2021 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633373141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZelblX7GmtHbSC4tLkBBlO+yQNr/d2a85RwaVvx8vsA=;
        b=OSENQW5/r6hMXBlCDW6n000NTnmsfA4lcRAy4osobeRtrC0e3HGYlvGDqIcM5Gkyq7Rlh2
        b5PdWiB8qDA/Gljy7BtMvVhf39hvYujtOmOo6dgSff4YZdcz05AXFYUinPDuULIbI49Pck
        ITpQu+DXq4LeVddx6hlLbsGmAL+BH2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633373141;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZelblX7GmtHbSC4tLkBBlO+yQNr/d2a85RwaVvx8vsA=;
        b=v1yj2lFwDiJLzhFArdYKjCk2XWwFyvi2qVFSmI2AUoh9h6jhleKcHZK6rDoPZZKJ3Plb4p
        mvg7+I58ukuO+2BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B13DA13B11;
        Mon,  4 Oct 2021 18:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id BKZdKNVLW2GjbwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 04 Oct 2021 18:45:41 +0000
Date:   Mon, 4 Oct 2021 20:45:14 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     J88 <jakob.mailto@googlemail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [decode-dimms] fails to read SPD
Message-ID: <20211004204514.12bfc9c6@endymion>
In-Reply-To: <CAG4msd=qMuJt72qjouRKMM85=zDpLunyaRRRYAAzkiuxEw=t2g@mail.gmail.com>
References: <CAG4msd=qMuJt72qjouRKMM85=zDpLunyaRRRYAAzkiuxEw=t2g@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jakob,

On Sun, 3 Oct 2021 09:47:18 +0200, J88 wrote:
> i am trying to read out the DDR4 Specs on
> 
> SETUP
> 
> [Mainboard] Supermicro X10DRH-CT (
> https://www.supermicro.com/en/products/motherboard/X10DRH-CT)
> 
> [Memory]
> 2x 16GB DDR4Super Talent F24R16G4S1
> 
> [OS]
> Ubuntu Server 21.04 / Kernel 5.11.0-37-generic
> 
> --------------------------------
> 
> root@ramtest1:/home/rt1# modprobe -r eeprom
> root@ramtest1:/home/rt1# modprobe ee1004
> root@ramtest1:/home/rt1# i2cdetect -y 1
> 
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- 37 -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- 49 -- -- -- -- -- --
> 50: 50 -- -- -- -- -- -- -- -- 59 -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> root@ramtest1:/home/rt1# echo ee1004 0x50 >
> /sys/bus/i2c/devices/i2c-1/new_device
> root@ramtest1:/home/rt1# echo ee1004 0x59 >
> /sys/bus/i2c/devices/i2c-1/new_device
> root@ramtest1:/home/rt1# decode-dimms
> Cannot read /sys/bus/i2c/drivers/ee1004/1-0050/eeprom at
> /usr/bin/decode-dimms line 2459.

This is a server board with 16 memory slots, well above the 4 supported
by the automatic SPD detection currently implemented in the i2c-i801
driver. These server boards have their SMBus multiplexed, so automatic
DPS detection is not possible. You need to get information from the
vendor, how the multiplexing is implemented. Some boards are using
GPIO-controlled mux chips, and you need to know which pins to toggle.
Other boards use I2C-controlled mux chips, and you need to know which
model and at which address it lives.

This work was already done for Asus Z8 board series 10 years ago. You
will need similar work for your board in order to be able to access SPD
EEPROMs (and possibly some thermal sensors) on your system.

-- 
Jean Delvare
SUSE L3 Support
