Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEF149283F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 15:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244914AbiAROWL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 09:22:11 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:43922 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244543AbiAROWK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 09:22:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A2FC1212B9;
        Tue, 18 Jan 2022 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642515729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RvOUe3ELIa/FShs0hbwRjopL1t8qHivicLBTtqfOpfw=;
        b=NSI9yKIgIRl6zqnD4psUVqzDYe8Hs7TeJiI/Zot8oyInrym2yNaEYlH4y1FRPNhiK0Vmw6
        LjGglL1irebSbvQDNynBXCMsfV0VGLBGSuVVTIrfQEsGpZz1asScadxQdpfabpG9e6HvVd
        jyYPt4zBmUOCd48aBviNNjmGKbNy8ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642515729;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RvOUe3ELIa/FShs0hbwRjopL1t8qHivicLBTtqfOpfw=;
        b=5kBEHCzloVHq2byYZEtYZuxj0qMH0BHSKZcq+i4ZIah19UG17g2JLXODQCfHUAAEVGTXa/
        dE8SoRiP1oCz30Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50CBF13AB6;
        Tue, 18 Jan 2022 14:22:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UqX3EBHN5mHHOwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Jan 2022 14:22:09 +0000
Date:   Tue, 18 Jan 2022 15:22:05 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, thomas.lendacky@amd.com
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <20220118152205.7e88c3f9@endymion>
In-Reply-To: <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
        <20210907183720.6e0be6b6@endymion>
        <20211105170550.746443b9@endymion>
        <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

Thank you for following up, and sorry for the later reply.

On Mon, 13 Dec 2021 11:48:18 -0600, Terry Bowman wrote:
> I added Guenter to this email because his input is needed for adding the same
> changes to the sp5100_tco driver. The sp5100_tco and piix4_smbus driver
> must use the same synchronization logic for the shared register.

Correct.

> On 11/5/21 11:05, Jean Delvare wrote:
> > On Tue, 7 Sep 2021 18:37:20 +0200, Jean Delvare wrote:  
> >> More generally, I am worried about the overall design. The driver
> >> originally used per-access I/O port requesting because keeping the I/O
> >> ports busy all the time would prevent other drivers from working. Do we
> >> still need to do the same with the new code? If it is possible and safe
> >> to have a permanent mapping to the memory ports, that would be a lot
> >> faster.
> 
> Permanent mapping would likely improve performance but will not provide the
> needed synchronization.

Depends how it is implemented, see below.

> (...) As you mentioned below the sp5100 driver only uses
> the DECODEEN register during initialization but the access must be
> synchronized or an i2c transaction or sp5100_tco timer enable access may be
> lost. I considered alternatives but most lead to driver coupling or considerable
> complexity.
> 
> >> On the other hand, the read-modify-write cycle in
> >> piix4_setup_sb800_smba() is unsafe if 2 drivers can actually call
> >> request_mem_region() on the same memory area successfully.
> >>
> >> I'm not opposed to taking your patch with minimal changes (as long as
> >> the code is safe) and working on performance improvements later.  
> >   
> 
> I confirmed through testing the request_mem_region() and request_muxed_region() 
> macros provide exclusive locking. One difference between the 2 macros is the 
> flag parameter, IORESOURCE_MUXED. request_muxed_region() uses the 
> IORESOURCE_MUXED flag to retry the region lock if it's already locked. 
> request_mem_region() does not use the IORESOURCE_MUXED and as a result will 
> return -EBUSY immediately if the region is already locked.
> 
> I must clarify: the piix4_smbus v1 patch uses request_mem_region() which is not 
> correct because it doesn't retry locking an already locked region.  The driver 
> must support retrying the lock or piix4_smbus and sp5100_tco drivers may 
> potentially fail loading. I added proposed piix4_smbus v2 changes below to solve.

Yes, I mentioned that problem during my initial review (I think).

> I propose reusing the existing request_*() framework from include/linux/ioport.h 
> and kernel/resource.c. A new helper macro will be required to provide an 
> interface to the "muxed" iomem locking functionality already present in 
> kernel/resource.c. The new macro will be similar to request_muxed_region() 
> but will instead operate on iomem. This should provide the same performance 
> while using the existing framework.
> 
> My plan is to add the following to include/linux/ioport.h in v2. This macro
> will add the interface for using "muxed" iomem support:
> #define request_mem_muxed_region(start,n,name)  __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)
> 
> The proposed changes will need review from more than one subsystem maintainer.
> The macro addition in include/linux/ioport.h would reside in a
> different maintainer's tree than this driver. The change to use the
> request_mem_muxed_region() macro will also be made to the sp5100_tco driver.
> The v2 review will include maintainers from subsystems owning piix4_smbus
> driver, sp5100_tco driver, and include/linux/ioport.h.
> 
> The details provided above are described in a piix4_smbus context but would also be 
> applied to the sp5100_tco driver for synchronizing the shared register.
> 
> Jean and Guenter, do you have concerns or changes you prefer to the proposal I 
> described above?

To be honest, I have a conceptual disagreement with
request_mem_muxed_region().

The reason why request_muxed_region() was implemented in the first
place, is that muxed I/O port pairs allow access to different registers
"behind" the ports, using what I would call "logical addressing", and
while it is legitimate for different drivers to have to access
different register ranges "behind" the ports, the I/O helper functions
do not allow reserving these, and more generally the I/O requesting
mechanism in Linux only deals with physical I/O ports and not logical
ranges behind muxed pairs.

So request_muxed_region() allows different drivers to use the same I/O
ports with mutual exclusion in order to access the logical register
ranges. My feeling is, that the expectation is still that the different
drivers do not step on each other's toes and each driver only accesses
their own registers, even though there is no way to enforce that (and
as a matter of fact, we have found that the i2c-piix4 and sp5100_tco
drivers do share one register).

(Thankfully, the access to this "shared" register is always done with
the muxed region owned for the whole duration of the read / modify /
write cycles, so I think we are on the same side. But it's really up to
the drivers to behave properly, as in theory it would be possible to
own the muxed region just for reading, then just for writing, with no
guarantee that another driver didn't change the register value in
between.)

Where I'm getting at is, request_muxed_region() works, but only with
certain restrictions and assumptions. It's there because we need it and
there's no easy way to implement it differently. On the other hand,
there's no reason for request_mem_muxed_region() to exist in the first
place, and as a matter of fact, it does not exist yet. You only want it
in order to avoid having to redesign 2 drivers that have grown
organically for 2 decades and that barely talk to each other even
though they access the very same piece of hardware.

But in fact there's nothing you would do with
request_mem_muxed_region() that can't be done without it. As mentioned
before, the i2c-i801 and iTCO_wdt drivers were in a similar situation
and their design was changed slightly in order to solve the problem.
See commit 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel
PCHs").

So clearly my personal preference would be to do the same for the
i2c-piix4+sp5100_tco driver pair, for consistency and because we know
it is a design that works. And it does allow permanent mapping of the
registers, so performance should be better. My only concern is that
you'll have to deal with older chipsets (legacy I/O, permanent mapping
not possible) and newer chipsets (MMIO access, permanent mapping
possible) and this is likely to clutter the code to some degree.

Going with request_mem_muxed_region() is only the second choice as far
as I'm concerned. I see the advantage (that's clearly the minimal
effort to get your problem fixed) but I'm afraid to create an API that
will later be abused to circumvent clean driver design. I'm also not
sure if you will find someone willing to accept it upstream in the
first place. The fact that there is no dedicated maintainer
for <linux/ioport.h> is probably not going to help (unless you want to
sneak the change in while nobody is paying attention, in which case it
might actually help ^^).

I see that Andy suggested a regmap approach instead. My only attempt to
use regmap in one of my drivers ended up in miserable failure, I got
totally lost in the too many abstraction layers. So I just can't say
whether this is the right thing to do or even if it can solve the
problem at hand. The resource reservation and/or locking issue we have
is clearly not trivial, so the regmap infrastructure would have to be
highly flexible in order to accommodate that. Feel free to give it a
try and see for yourself if it's going to fit the bill. If it works, I
won't object, and I'll finally have to do the effort to understand how
it works.

As a conclusion, everything I wrote above is about my opinions and
preferences. At the end of the day, I understand that we need to fix
the i2c-piix4 and sp5100_tco drivers, and the sooner the better, so any
solution that works and nobody objects against will be OK with me.

-- 
Jean Delvare
SUSE L3 Support
