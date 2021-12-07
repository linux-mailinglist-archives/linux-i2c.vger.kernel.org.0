Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D275946BD5A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 15:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237650AbhLGOSQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 09:18:16 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:41462 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbhLGOSQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Dec 2021 09:18:16 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 52ECB212CC;
        Tue,  7 Dec 2021 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638886485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4NMD33uulfJOwJRANeLD7Pf9m1xVv/Tqj6P39Ecjdt4=;
        b=mmSgdhjQV+EIxniC1u4HHwwi8wOHM4IesY0sH56v4NJ2ARMb/vJfVJHb+jIf4TVxxLh690
        CGPDoabCjAbtZrEaQbOIRBPgtM+BXZrbxdxTXmFkLE7mTofShQKC9gkoEm1ViF3zchzOAF
        dMIOhENlxwuUnmBd06ocM6QPeJ1GErg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638886485;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4NMD33uulfJOwJRANeLD7Pf9m1xVv/Tqj6P39Ecjdt4=;
        b=BTZ6xJom//JwaCeK0NNOwdErG+ff8qdGirMcyD2f9ySHlEYx3Pulncbohabw83QJpBIxVX
        o6w8ukkKeqaXmWAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D34E13A82;
        Tue,  7 Dec 2021 14:14:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 74N0CFVsr2FEYgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 07 Dec 2021 14:14:45 +0000
Date:   Tue, 7 Dec 2021 15:14:43 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Don't read back cleared status in
 i801_check_pre()
Message-ID: <20211207151443.362c89a2@endymion>
In-Reply-To: <31f34ce9-bf1f-29fc-a2c1-6ad549b5dd16@gmail.com>
References: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
 <20211203105914.393ffd24@endymion>
 <31f34ce9-bf1f-29fc-a2c1-6ad549b5dd16@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Fri, 3 Dec 2021 13:55:30 +0100, Heiner Kallweit wrote:
> On 03.12.2021 10:59, Jean Delvare wrote:
> > On Thu, 02 Dec 2021 10:53:05 +0100, Heiner Kallweit wrote:  
> >> I see no need to read back the registers to verify that the bits
> >> have actually been cleared. I can't imagine any scenario where
> >> the bits would remain set after a write to them.  
> > 
> > This happened at least once in the past. See this archived message:
> > 
> > https://www.spinics.net/lists/linux-i2c/msg02651.html
> 
> "My last attempt locked the SMBus, but I was able to
> recover by repeatedly writing to the HST_STS register, as may times as
> the block length."
> 
> OK, this was 11 yrs ago, so at least I wouldn't be able to recall in
> detail what happened back then ..

I definitely do not remember, so all the information available now is
what can be read in this archived thread.

> Question is how you did this "repeatedly writing to the HST_STS
> register". Something like the following?

Sorry for the confusion, Felix was the guy hitting the bug, and I was
helping him understand what was happening and how to fix it.

> while (status = in (STATUS))
> 	out(STATUS, status);

Most probably yes.

> Or maybe the driver started the loop to process the next byte?
> I think it's not likely that when writing a status bit it
> remained set. As we now know E32B is ignored in I2C mode, therefore
> the chip can read/write only one byte in a row, and w/o setting
> SMBHSTCNT_START in between it wouldn't touch the next byte.
> Of course I may be wrong with my assumptions ..

The important bit was probably SMBHSTSTS_BYTE_DONE. The driver set the
block buffer mode, expecting the hardware to support that, but the
hardware didn't and thus expected a byte-by-byte block transaction,
which requires ack-ing every byte by clearing SMBHSTSTS_BYTE_DONE.

> > (...)
> > So I'm not too sure what to do with this. On the one hand, the code
> > you want to remove could be useful to catch and investigate future
> > bugs. The rest of the code does assume that the status bits are
> > properly cleared before starting a new transaction. On the other
> > hand, it is slowing down the driver a bit when all is fine. Is that
> > really worth optimizing?

As I got some time to think about it, answering myself: I'm fine
removing the checks. If we ever hit the problem (unable to clear the
error flags), it means that something went wrong _before_, and we must
have logged these problems already. As a matter of fact, that was
exactly the situation for Felix, the message you want to remove was the
4th error message logged, so in fact it did not really add any value.

-- 
Jean Delvare
SUSE L3 Support
