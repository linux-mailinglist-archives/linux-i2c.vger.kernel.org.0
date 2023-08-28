Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B635778B414
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 17:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjH1PKg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 11:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjH1PKY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 11:10:24 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53A6CDB
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 08:10:17 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6AED51F383;
        Mon, 28 Aug 2023 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693235416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qOnRDjTR9O4E8hOLkzLvHzwJ1DRYUfsV6Yd0b7pE19M=;
        b=CH6p204ngw+cFYQiPj3f1/zfu3NXVUUYdJ9ryL5cHUmbKfh3MuYX5CrdWGPaPTymPMwKQY
        UQwQ0RNHKcMsGqEURcQZjCWw+GGoHZVPLFV7zUQOU0MikpGeSCsR4R5WC9fKR8Iy7/Yijr
        eTO1ITSdLHnEcMFBK4PdlNhSYfRJVz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693235416;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qOnRDjTR9O4E8hOLkzLvHzwJ1DRYUfsV6Yd0b7pE19M=;
        b=IYmcOmvePPl5sJKn8eYYQD7jVhUXq/irxojXUAm5dV/jF75o8Xl0wsC+isBrxkfBId9l5r
        QceSs3rIQYhuYZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AB6513A11;
        Mon, 28 Aug 2023 15:10:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ETnPDNi47GSndAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 28 Aug 2023 15:10:16 +0000
Date:   Mon, 28 Aug 2023 17:10:14 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
Message-ID: <20230828171014.2bc37cab@endymion.delvare>
In-Reply-To: <20230828152747.09444625@endymion.delvare>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
        <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
        <20230627154606.1488423f@endymion.delvare>
        <cc1826de-35b1-cd20-900f-3908c7499792@gmail.com>
        <20230828152747.09444625@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 28 Aug 2023 15:27:47 +0200, Jean Delvare wrote:
> On Sun, 27 Aug 2023 19:14:38 +0200, Heiner Kallweit wrote:
> > We set SMBHSTCNT_LAST_BYTE whilst the host is receiving the last byte.
> > Apparently the host checks for SMBHSTCNT_LAST_BYTE once it received
> > a byte, in order to determine whether to ack the byte or not.
> > So SMBHSTCNT_LAST_BYTE doesn't have to be set before the host starts
> > receiving the last byte.  
> 
> How is this not racy?
> 
> In the interrupt-driven case, at the end of a block read transaction,
> we set SMBHSTCNT_LAST_BYTE at the end of i801_isr_byte_done(), then
> return to i801_isr() where we write 1 to SMBHSTSTS_BYTE_DONE to clear
> it. This lets the controller handle the last byte with the knowledge
> that this is the last byte.
> 
> However, in the poll-driven case, SMBHSTSTS_BYTE_DONE is being cleared
> at the end of the loop in i801_block_transaction_byte_by_byte(), then
> at the beginning of the next iteration, we write SMBHSTCNT_LAST_BYTE,
> then wait for completion. If the controller is super fast (or, to be
> more realistic, the i2c-i801 driver gets preempted between writing
> SMBHSTSTS_BYTE_DONE and writing SMBHSTCNT_LAST_BYTE) then the byte may
> have been already read and acked, before we have the time to let the
> controller know that no ACK should be sent. This looks racy. Am I
> missing something?

I made a little experiment which, I think, proves my point.

Firstly, I loaded the i2c-i801 driver with disable_features=0x12, to
make sure the poll-based byte-by-byte code path is used. The EEPROM
data starts with:

     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: 92 13 0b 02 04 21 02 01 03 52 01 08 0a 00 fc 00

The following commands read the first 4 bytes with an I2C Block Read
command, then fetch the next byte from the EEPROM (without specifying
the offset):

# /usr/local/sbin/i2cget -y 4 0x53 0 i 4 ; /usr/local/sbin/i2cget -y 4 0x53
0x92 0x13 0x0b 0x02
0x04

As you can see, I get the 5 first bytes of the EEPROM, as expected.

Then I added an arbitrary delay in the driver where I think the race
condition exists:

--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -684,8 +684,10 @@ static int i801_block_transaction_byte_b
 
 		if (i == 1)
 			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
-		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
+		else if (smbcmd & SMBHSTCNT_LAST_BYTE) {
+			usleep_range(10000, 20000);
 			outb_p(smbcmd, SMBHSTCNT(priv));
+		}
 
 		status = i801_wait_byte_done(priv);
 		if (status)

I loaded the modified i2c-i801 driver, still with
disable_features=0x12. Running the same commands again, I now get:

# /usr/local/sbin/i2cget -y 4 0x53 0 i 4 ; /usr/local/sbin/i2cget -y 4 0x53
0x92 0x13 0x0b 0x02
0x21

So I get EEPROM bytes 0-3 then it jumps to offset 5 directly. This
means that the EEPROM started sending the byte at offset 4 at the end
of the I2C Block Read transfer, due to the controller sending an ACK
after the byte at offset 3.

For the code to be safe, we need to set SMBHSTCNT_LAST_BYTE *before*
clearing SMBHSTSTS_BYTE_DONE.

Note: the transfers do not fail, only the internal register pointer of
the EEPROM gets screwed, so this is probably not an issue for devices
which don't rely on an internal register pointer, only EEPROM-like
devices are affected.

-- 
Jean Delvare
SUSE L3 Support
