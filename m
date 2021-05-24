Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EA938E31B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 May 2021 11:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhEXJSX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 May 2021 05:18:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:35906 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232313AbhEXJSW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 May 2021 05:18:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1621847814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PJpmggpv9RwYpVxVR30hmfpBULz3RROv5Jcycq23Tdo=;
        b=t4LAkci7nE36IG5rm74z4oBwcXh/WAh25A0YfBhfmFaOtcmGVA8EhE5i7cfyFaqQfrS0Lu
        VJkFXz64r89ZspZPw6ufDxrFn3Jf+O/rPEy/4RZgCWV60A1XrdfcGy63vVCzZIZb9YfeTW
        kDg/1iCgwHgf/gEWEqbJYHWjjRRu+oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1621847814;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PJpmggpv9RwYpVxVR30hmfpBULz3RROv5Jcycq23Tdo=;
        b=KqnKq81w/WWRpbBIVJmYh3OJlezc9uRQI5FdeYrdTsKPvTUjhUa2LvlG39IoDEspRB8lzz
        wDTB1TtuYNUFpsCg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 07D8AABC1;
        Mon, 24 May 2021 09:16:54 +0000 (UTC)
Date:   Mon, 24 May 2021 11:16:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     syzbot <syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [syzbot] KASAN: out-of-bounds Read in i801_isr
Message-ID: <20210524111652.79e397d7@endymion>
In-Reply-To: <20210521154820.1ce1d84d@endymion>
References: <00000000000038de1d05c215bf23@google.com>
        <20210521154820.1ce1d84d@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 May 2021 15:48:20 +0200, Jean Delvare wrote:
> Looking at the ICH9 datasheet, I see the following description for the
> KILL bit (which is what we try to use to reset the SMBus controller):
> 
>   "Kills the current host transaction taking place, sets the FAILED
>    status bit, and asserts the interrupt (or SMI#)."
> 
> At the time the recovery code was written, i2c-i801 was a polling-only
> driver, interrupts were not supported, so asserting the interrupt had
> no effect. Now that the driver does support interrupts, this would call
> i801_isr(), right?

I modified the i2c-i801 driver to simulate a timeout once in a while,
and I can confirm that i801_isr() gets called when the KILL bit is set.

> So my theory is that our attempt to kill a timed-out byte-by-byte block
> transaction triggers an interrupt, which calls in i801_isr() with the
> SMBHSTSTS_BYTE_DONE bit set. This in turn causes i801_isr_byte_done()
> to be called while we are absolutely not ready nor even supposed to
> process the next data byte.

I can also report that I'm reproducing the bug reported by syzbot when
this happens, by running decode-dimms with my modified i2c-i801 driver.
I have 4 SPD EEPROMs instantiated for my DIMMs, so decode-dimms
triggers a lot of calls to i2c_smbus_read_i2c_block_data().

> I guess we should clear SMBHSTSTS_BYTE_DONE before issuing a
> SMBHSTCNT_KILL. Alternatively we could add a check at the beginning of
> i801_isr() to bail out immediately if SMBHSTCNT_KILL is set. While
> possibly more robust, this approach has the drawback of increasing the
> processing time of all interrupts, even standard/legitimate ones. So
> maybe just clearing SMBHSTSTS_BYTE_DONE is more reasonable. Something
> like:
> 
> --- linux-5.11.orig/drivers/i2c/busses/i2c-i801.c
> +++ linux-5.11/drivers/i2c/busses/i2c-i801.c
> @@ -393,6 +393,8 @@ static int i801_check_post(struct i801_p
>  		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
>  		/* try to stop the current command */
>  		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
> +		/* Clear BYTE_DONE so as to not confuse i801_isr() */
> +		outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
>  		outb_p(inb_p(SMBHSTCNT(priv)) | SMBHSTCNT_KILL,
>  		       SMBHSTCNT(priv));
>  		usleep_range(1000, 2000);

I ended up with a different approach. Clearing BYTE_DONE would possibly
avoid the problem immediately at hand, however the interrupt would
still be triggered, even for other (not byte-by-byte) transactions,
causing us to fiddle with the status register. I don't think it's
needed, and it could have unintended side effects.

So instead I tried the alternative approach of checking the KILL bit in
i801_isr() and returning immediately if it is set. While it does work,
I noticed that i801_isr() is in fact called in a loop for the whole
duration of the usleep_range(1000, 2000) before we clear the KILL bit.
While better than an out-of-bounds memory access, an interrupt flood is
still not ideal.

> I must say I wonder why SMBHSTCNT_KILL generates an interrupt in the
> first place, I can't see who would need this.

Which made me think... The interrupt is being generated because we
*ask* for it. It doesn't have to be generated if we aren't interested
in it. So the fix would be very simple: don't bother preserving the
other bits in HST_CNT, they will be set properly again for the next
transaction anyway, only set the KILL bit to 1. In particular don't
preserve the INTREN bit, so no interrupt will be generated.

@@ -395,11 +401,9 @@ static int i801_check_post(struct i801_p
 		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
 		/* try to stop the current command */
 		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
-		outb_p(inb_p(SMBHSTCNT(priv)) | SMBHSTCNT_KILL,
-		       SMBHSTCNT(priv));
+		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
 		usleep_range(1000, 2000);
-		outb_p(inb_p(SMBHSTCNT(priv)) & (~SMBHSTCNT_KILL),
-		       SMBHSTCNT(priv));
+		outb_p(0, SMBHSTCNT(priv));
 
 		/* Check if it worked */
 		status = inb_p(SMBHSTSTS(priv));

This works for me. If there are no objections I'll post a proper patch.

-- 
Jean Delvare
SUSE L3 Support
