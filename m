Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3B5721794
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jun 2023 16:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbjFDOBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jun 2023 10:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjFDOBm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jun 2023 10:01:42 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDD490;
        Sun,  4 Jun 2023 07:01:35 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 03F9A21B0A;
        Sun,  4 Jun 2023 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685887294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tdBAE3HtKivHJVVv6ZeQodqReATNJ0yZv6/ntcLxKKI=;
        b=f2q7SrLtQ19KSVlLOqKLMb1G7ft+VqaBrqlyDgcTC7SW8QXjDB4yII7+80ge7W4uaY1Bjb
        /vRTKL6yindoIoAJSlHUOldn9pF8xA6jGXHR2i+CgmuyNou8KNTgC2ydJmP1PBwNs2u4TH
        N/bRFVCawdzyTmtfaL6/Bpc++533oHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685887294;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tdBAE3HtKivHJVVv6ZeQodqReATNJ0yZv6/ntcLxKKI=;
        b=rcOXh8zYaXswpIdIkDQclBBRs+5s67EKUkp+yURNXW5hhJ5mv6Es17B4frOhyBlOmlrNMZ
        ddYmlUJG62lr75AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF474139C8;
        Sun,  4 Jun 2023 14:01:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id oqjOMD2ZfGSWUQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sun, 04 Jun 2023 14:01:33 +0000
Date:   Sun, 4 Jun 2023 16:01:32 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Marius Hoch <mail@mariushoch.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Message-ID: <20230604160132.102dd6a7@endymion.delvare>
In-Reply-To: <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
References: <20230514103634.235917-1-mail@mariushoch.de>
        <20230523200350.62ab4788@endymion.delvare>
        <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marius,

On Sat, 3 Jun 2023 11:24:02 +0200, Marius Hoch wrote:
> On 23/05/2023 20:03, Jean Delvare wrote:
> > On Sun, 14 May 2023 12:36:32 +0200, Marius Hoch wrote:  
> >> The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
> >> but also claims that the SMBus uses IRQ 18. This will
> >> result in:
> >>
> >> i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
> >> i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
> >> i801_smbus: probe of 0000:00:1f.3 failed with error -16  
> > The i2c-i801 driver supports shared IRQ. If this fails, this means that
> > the other driver is not passing IRQF_SHARED when registering the
> > interrupt. Which driver is this? I'd rather check whether sharing the
> > IRQ is possible, rather that falling back to polling, which has a
> > performance cost.  
> I don't think this is a conflict rather than a completely bogus entry: 
> smo8800 uses IRQ 18 (the freefall sensor).

You're probably right. I admit I misread your report originally and
thought requesting the IRQ was failing. But actually the failure
happens before that, when enabling the PCI device. So its not related
to sharing the interrupt.

> For the SMBus in acpi_pci_irq_enable, acpi_register_gsi fails for GSI 18 
> with IRQ 255 (dev->irq), independently from the presence of the 
> dell_smo8800 module.
>
> Now looking into this again, seeing dev->irq at 255 seems very 
> suspicious here? Doesn't that mean not connected (although I'm not sure 
> how this relates to it supposedly having GSI 18)?

I admit I don't know. I'm not familiar with how GSI numbers relate to
IRQ numbers. I think I understand that GSI numbers are an ACPI thing,
and the ACPI layer is responsible for mapping these to actual IRQ
numbers? Is there a GSI-to-IRQ table available somewhere as part of the
ACPI tables? If so, it would be interesting to disassemble the ACPI
tables on your system and check what this looks like for you.

If this is a bug in the ACPI data then it might be worth booting with
acpi=noirq and see if it helps. This option might break other things
though (like free fall detection or thermal management) so be cautious.

IRQ number 255 indeed looks suspicious, but I'm also not aware of this
being a special value (nr_irqs is defined as an unsigned int, which
suggest that large IRQ numbers, albeit unusual on desktop and laptop
systems, are supported and frequently seen on large server systems), so
the i2c-i801 driver has no reason to handle it in a particular way.

Out of curiosity, did you check for a BIOS update for your laptop? Did
you look at BIOS option to see if by any chance enabling/disabling the
SMBus interrupt is an option there?

I'm also curious how you collected the IRQ value. Did you boot with
some debug kernel parameter, like dyndbg="file pci_irq.c +p"?

Did you manage to figure out where in the function call chain (starting
with pcim_enable_device) the failure actually happens? Even if IRQ
value 255 is most probably wrong in your case, I'm surprised that this
causes an error at device activation time, rather than when later
requesting the IRQ.

> >> Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
> >> we fall back to polling, which also seems to be what the (very
> >> dated) Windows 7 drivers on the Dell Latitude E7450 do.  
> > What makes you think so?
>
> According to the Windows 7 device manager IRQ view, the SMBus has no IRQ 
> assigned, which I assumed implies that polling is used. If there is 
> another way to check this on Windows 7, please let me know.

That's a reasonable assumption, and not being familiar with Windows, I
don't have any other suggestion. However that doesn't necessarily mean
that interrupts can't work. After all, the original i2c-i801 Linux
driver also did not support interrupts.

-- 
Jean Delvare
SUSE L3 Support
