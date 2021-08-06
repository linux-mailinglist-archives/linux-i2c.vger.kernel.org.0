Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14C73E2652
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 10:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242857AbhHFIqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 04:46:46 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55710 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235812AbhHFIqp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 04:46:45 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6DE3721C40;
        Fri,  6 Aug 2021 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628239589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZJmh6/n3JYRm/bNHgjDhpHoYsUW5DUb9USZRmXONurM=;
        b=h3WoXQ+ec0muGD7Q0AkwqhOodUja2fz2i8vdZeM0/e2Rk/Nz7PCN52M6cNpFg2SyZcT6BX
        W6ahwLXEPSHtDtkoIc1RbGoRNBcG4KrZNBowwYrVlHsebSYt00HYfTIYp6yutNbjVb9iR8
        HQ5LUl8bUNBchopw8IJyKedF+TOawsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628239589;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZJmh6/n3JYRm/bNHgjDhpHoYsUW5DUb9USZRmXONurM=;
        b=w05TABhKNot3xj2iInyqL7GVWxmBimDbFDHVQMJeiz0bMB2mh5M+lkEM3l28K2ukTNFdwJ
        YV2jDXwrHTGyT7CQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4C05C13A69;
        Fri,  6 Aug 2021 08:46:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id QxskEOX2DGGGLAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Fri, 06 Aug 2021 08:46:29 +0000
Date:   Fri, 6 Aug 2021 10:46:28 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 06/10] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
Message-ID: <20210806104628.2975ae37@endymion>
In-Reply-To: <cfe089f3-fe26-5373-63f2-c47b8d13f491@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <f9115eb4-4b19-0a9c-0354-b3ded261c155@gmail.com>
        <20210805124150.3fbdfa9b@endymion>
        <cfe089f3-fe26-5373-63f2-c47b8d13f491@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 5 Aug 2021 22:04:18 +0200, Heiner Kallweit wrote:
> On 05.08.2021 12:41, Jean Delvare wrote:
> > On Sun, 01 Aug 2021 16:21:08 +0200, Heiner Kallweit wrote:  
> >> do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
> >> is cleared if a legacy interrupt is used.  
> > 
> > Only if pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin) returned a
> > non-zero pin, if I read the code correctly. While I can't remember the
> > context in which I wrote this piece of code, I suppose that pin == 0
> > was the situation where this test was needed. I mean, the board
> > designer can legitimately not wire the interrupt pin, and require that
> > polling is being used, right?
>
> I think we have such a use case, but it's handled in ACPI and results
> in dev->irq == IRQ_NOTCONNECTED.

But not all systems use ACPI. The i2c-i801 driver could be used on
non-ACPI systems. I don't know if this is actually the case though. But
we definitely allow building kernels with ACPI disabled and I2C_I801
enabled.

> In case of pin == 0 pci_dev->irq is 0, and I'd expect that irq_to_desc(0)
> returns NULL and request_threaded_irq() returns -EINVAL. This would
> result in switching to polling.

Reading the !CONFIG_SPARSE_IRQ version of that function, it doesn't
seem so. irq_to_desc(0) would return &irq_desc[0]. IRQ 0 is not
invalid, it was the system clock on legacy PC systems, and probably
still is for compatibility reasons. I suppose the CONFIG_SPARSE_IRQ
version of irq_to_desc() is compatible with that too.

That being said, I suppose IRQ 0 is requested early at boot, so the
i2c-i801 driver would get -EBUSY or similar when trying to request it,
which in turn would result in falling back to polling mode, which is
what we want.

> Having said that I see no scenario where the check would be needed.
> 
> > In your favor, I can't find any online kernel log with this message.
> > However that doesn't mean I'm comfortable removing the safety check.

I'm still uncertain about what to do here. On the one hand, the check
can't hurt, and if we hit a corner case, could provide useful debugging
information. On the other hand, it may be dead code if you are correct,
and I don't like dead code.

I suppose we could remove the code for now, and see if anyone reports a
regression.

-- 
Jean Delvare
SUSE L3 Support
