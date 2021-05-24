Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A7A38E43F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 May 2021 12:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbhEXKni (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 May 2021 06:43:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:22376 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232397AbhEXKnh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 May 2021 06:43:37 -0400
IronPort-SDR: jqsX0OJ0tawZCVVMo7QM9SqKe6dNG32IymqvojXaIoQOYcIoQQ2WtTrk8ppwEELdNCbuOMp2QG
 tJHB+tgQrs6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="182223133"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="182223133"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 03:42:10 -0700
IronPort-SDR: aZ07CTHFdhREBHG1GTjjNZd70hed56DxA7NMR89eRamzNJJOq/drq622ZqwQrJ4t7ILMEP8KEZ
 s56sWlFposIA==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="478472334"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 03:42:08 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ll829-00EIXA-NI; Mon, 24 May 2021 13:42:05 +0300
Date:   Mon, 24 May 2021 13:42:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     syzbot <syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [syzbot] KASAN: out-of-bounds Read in i801_isr
Message-ID: <YKuC/f8abGyyMG5M@smile.fi.intel.com>
References: <00000000000038de1d05c215bf23@google.com>
 <20210521154820.1ce1d84d@endymion>
 <20210524111652.79e397d7@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524111652.79e397d7@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 24, 2021 at 11:16:52AM +0200, Jean Delvare wrote:
> On Fri, 21 May 2021 15:48:20 +0200, Jean Delvare wrote:
> > Looking at the ICH9 datasheet, I see the following description for the
> > KILL bit (which is what we try to use to reset the SMBus controller):
> > 
> >   "Kills the current host transaction taking place, sets the FAILED
> >    status bit, and asserts the interrupt (or SMI#)."
> > 
> > At the time the recovery code was written, i2c-i801 was a polling-only
> > driver, interrupts were not supported, so asserting the interrupt had
> > no effect. Now that the driver does support interrupts, this would call
> > i801_isr(), right?
> 
> I modified the i2c-i801 driver to simulate a timeout once in a while,
> and I can confirm that i801_isr() gets called when the KILL bit is set.
> 
> > So my theory is that our attempt to kill a timed-out byte-by-byte block
> > transaction triggers an interrupt, which calls in i801_isr() with the
> > SMBHSTSTS_BYTE_DONE bit set. This in turn causes i801_isr_byte_done()
> > to be called while we are absolutely not ready nor even supposed to
> > process the next data byte.
> 
> I can also report that I'm reproducing the bug reported by syzbot when
> this happens, by running decode-dimms with my modified i2c-i801 driver.
> I have 4 SPD EEPROMs instantiated for my DIMMs, so decode-dimms
> triggers a lot of calls to i2c_smbus_read_i2c_block_data().
> 
> > I guess we should clear SMBHSTSTS_BYTE_DONE before issuing a
> > SMBHSTCNT_KILL. Alternatively we could add a check at the beginning of
> > i801_isr() to bail out immediately if SMBHSTCNT_KILL is set. While
> > possibly more robust, this approach has the drawback of increasing the
> > processing time of all interrupts, even standard/legitimate ones. So
> > maybe just clearing SMBHSTSTS_BYTE_DONE is more reasonable. Something
> > like:
> > 
> > --- linux-5.11.orig/drivers/i2c/busses/i2c-i801.c
> > +++ linux-5.11/drivers/i2c/busses/i2c-i801.c
> > @@ -393,6 +393,8 @@ static int i801_check_post(struct i801_p
> >  		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
> >  		/* try to stop the current command */
> >  		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
> > +		/* Clear BYTE_DONE so as to not confuse i801_isr() */
> > +		outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
> >  		outb_p(inb_p(SMBHSTCNT(priv)) | SMBHSTCNT_KILL,
> >  		       SMBHSTCNT(priv));
> >  		usleep_range(1000, 2000);
> 
> I ended up with a different approach. Clearing BYTE_DONE would possibly
> avoid the problem immediately at hand, however the interrupt would
> still be triggered, even for other (not byte-by-byte) transactions,
> causing us to fiddle with the status register. I don't think it's
> needed, and it could have unintended side effects.
> 
> So instead I tried the alternative approach of checking the KILL bit in
> i801_isr() and returning immediately if it is set. While it does work,
> I noticed that i801_isr() is in fact called in a loop for the whole
> duration of the usleep_range(1000, 2000) before we clear the KILL bit.
> While better than an out-of-bounds memory access, an interrupt flood is
> still not ideal.
> 
> > I must say I wonder why SMBHSTCNT_KILL generates an interrupt in the
> > first place, I can't see who would need this.
> 
> Which made me think... The interrupt is being generated because we
> *ask* for it. It doesn't have to be generated if we aren't interested
> in it. So the fix would be very simple: don't bother preserving the
> other bits in HST_CNT, they will be set properly again for the next
> transaction anyway, only set the KILL bit to 1. In particular don't
> preserve the INTREN bit, so no interrupt will be generated.
> 
> @@ -395,11 +401,9 @@ static int i801_check_post(struct i801_p
>  		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
>  		/* try to stop the current command */
>  		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
> -		outb_p(inb_p(SMBHSTCNT(priv)) | SMBHSTCNT_KILL,
> -		       SMBHSTCNT(priv));
> +		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
>  		usleep_range(1000, 2000);
> -		outb_p(inb_p(SMBHSTCNT(priv)) & (~SMBHSTCNT_KILL),
> -		       SMBHSTCNT(priv));
> +		outb_p(0, SMBHSTCNT(priv));
>  
>  		/* Check if it worked */
>  		status = inb_p(SMBHSTSTS(priv));
> 
> This works for me. If there are no objections I'll post a proper patch.

No objection from me, thanks for conducting a research and developing the fix!
Feel free to add mine
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
to whatever solution you consider the best.

-- 
With Best Regards,
Andy Shevchenko


