Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E60E3D1FE1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 10:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhGVHyA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 03:54:00 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:54708 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhGVHyA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jul 2021 03:54:00 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 28BD8225FB;
        Thu, 22 Jul 2021 08:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626942875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=//Hmw5L09xmoaS2sd4Elsv1sht+jyYYB7SNpQJ0xx/U=;
        b=nuLoY7e+3t3+d8WA8leNWhZQ7xBrIoSwu6aQ/cKAFixLypAY9mMb1bOsjPX9m2bntDYkZU
        4kyAhkSfC+4tnfov7S3PDVyVcMiqP9WQ769Nng5E8GGz0jCDysnWBwgpuu32R7o2ngfaFq
        mRSbI5Z2276svoitJ9O19pugy8HS7Uk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626942875;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=//Hmw5L09xmoaS2sd4Elsv1sht+jyYYB7SNpQJ0xx/U=;
        b=xBcHQUPrVNvwSrH1lIsLtpIvFxv7C4cn0PHaNgBTKsk6efZ/UdR9MSsvyxG78kFZb29YKZ
        KmrU9nY749gCC3AA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E928513889;
        Thu, 22 Jul 2021 08:34:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id clLjNZot+WDYGQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 22 Jul 2021 08:34:34 +0000
Date:   Thu, 22 Jul 2021 10:34:33 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
Message-ID: <20210722103433.6c81c6b2@endymion>
In-Reply-To: <20210721144620.00671c3d@endymion>
References: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
        <20210721144620.00671c3d@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 21 Jul 2021 14:46:20 +0200, Jean Delvare wrote:
> As for testing, I also don't have a PEC-cable device at hand. However,
> we may still be able to test this change:
> * If you have a device at 0x69 on the i801 SMBus of any of your system,
>   that would be a clock device, which almost always support PEC.
> * If you have EEPROMs on your i801 SMBus, you may be lucky and find a
>   sequence of bytes where the PEC computation leads to exactly the
>   value of the following byte. I remember doing that years ago, sadly I
>   can no longer find the script I wrote at that time. Be careful when
>   accessing SPD EEPROMs, you want to read from them, not write to them
>   ;-) Incidentally i2c-tools was just improved to allow arbitrary SMBus
>   block read commands so i2cget can be used for easy testing from
>   user-space.

Well, what I wrote above wasn't accurate (bad memory I suppose). While
SMBus Block Read commands are OK to test the clock devices at 0x69,
they are not the best choice to poke a read-only EEPROM, as the first
byte will be interpreted as the block length, and if it is not between
1 and 32, it is invalid and the transaction will fail, regardless of
PEC. Which in turn dramatically decreases the chances that at least one
offset in your EEPROM will work and be usable for testing purposes.

Furthermore, i2cget has a safety to prevent you from messing up with
your SPD EEPROMs, that will deny using PEC at all in the I2C address
range 0x50-0x57. Which is exactly what I was suggesting to do. So I had
to recompile i2cget without the safety in order to preform my tests. To
be honest I think the safety is overkill (as far as I can see PEC would
only trash data in "c" mode so we could limit the safety to that mode)
but my testing being clearly a protocol abuse, I'm fine with having to
modify the source code to do it.

Anyway, for the record, my hackish testing protocol is as follows:

# rmmod at24
# modprobe i2c-dev
# for i in `seq 0 254` ; do echo $i ; ./tools/i2cget -y 4 0x50 $i bp ; sleep 1 ; done

Then I basically look at commands failing (on PEC error), until I am
lucky enough that the next byte in the EEPROM matches the expected PEC
value. I had 2 such offsets on my first SPD EEPROM (82 and 163).
Meaning that I was able to test your patch and I can confirm that it
works OK (testing limited to the 8 Series/C220 Series [8086:8c22]
device and SMBus Read Byte transactions, but I have no reason to
believe other devices or other transaction types would behave
differently).

Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
