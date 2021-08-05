Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290E43E1051
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 10:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236850AbhHEIcI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 04:32:08 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47226 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbhHEIcI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 04:32:08 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id CC6AE22240;
        Thu,  5 Aug 2021 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628152313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aSoFwqCEK5S9vVCtZtnlaghTVCcYppLwcDRCHT44o9Y=;
        b=phkJPFQ5tTVizGgpKCzRdcAd5cBUYbkVBY2RWlBxrnr889nhSjb7+2TJtSyul7R8rAbKO9
        mD2RFy9UZDr044L3Igq/OkMfc0Dm0oPguPJL+q9oxyKYNDCdeqzcNwBtc91FyzPg2T57bB
        9WgHtx288jjKdLOxiEL0FV9HSlh77Ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628152313;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aSoFwqCEK5S9vVCtZtnlaghTVCcYppLwcDRCHT44o9Y=;
        b=cj+e0TZ90ZyyE2FHhmhfD9RKKDP90CsFuI19e6zR/c2OkTTe/ZaN/kR91xbSJxbsMG6x6S
        HtDuO8saJLV+wrDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8198613785;
        Thu,  5 Aug 2021 08:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id cO9zHfmhC2GHTgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 08:31:53 +0000
Date:   Thu, 5 Aug 2021 10:31:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
Message-ID: <20210805103150.7df1c315@endymion>
In-Reply-To: <139a63dd-e14e-56d1-9fd1-408047831aea@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com>
        <20210802145347.605ce8d5@endymion>
        <b0bca52e-2bbc-18ef-5134-d5b6fe9df2bf@gmail.com>
        <68929f0f-a44e-6617-3e4e-dcdb9933d856@linux.intel.com>
        <CAJZ5v0jdNFDJr8ZrbU-jp53RWsZxY7+KRLF0kqmU+pxzXu6RmA@mail.gmail.com>
        <139a63dd-e14e-56d1-9fd1-408047831aea@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Wed, 4 Aug 2021 21:02:39 +0200, Heiner Kallweit wrote:
> On 04.08.2021 16:06, Rafael J. Wysocki wrote:
> > On Wed, Aug 4, 2021 at 3:36 PM Jarkko Nikula
> >> Yes, I'm quite sure I've copied it from another driver :-)
> >>
> >> This patch will cause the device here won't go automatically to D3
> >> before some user space script allows it. E.g
> >>
> >> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
> >>
> >> I think this is kind of PM regression with this patch. It's not clear to
> >> me from the Documentation/power/pci.rst why driver should not call the
> >> pm_runtime_allow() and what would be allowed kernel alternative for it.  
> > 
> > Please see the comment in local_pci_probe().
> > 
> > Because the PCI bus type is involved in power management, the driver
> > needs to cooperate.
> >   
> >> Rafael: what would be the correct way here to allow runtime PM from the
> >> driver or does it really require some user space script for it?  
> > 
> > No, it doesn't.
> 
> PCI core code includes the following because of historic issues
> with broken ACPI support on some platforms:
> 
> void pci_pm_init(struct pci_dev *dev)
> {
> 	int pm;
> 	u16 status;
> 	u16 pmc;
> 
> 	pm_runtime_forbid(&dev->dev);
> 	pm_runtime_set_active(&dev->dev);
> 	pm_runtime_enable(&dev->dev);
> 
> That's why RPM has to be enabled by userspace for PCI devices:
> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
> 
> Or drivers (that know that they can't be used on one of the broken
> platforms) call pm_runtime_allow(), what however is explicitly
> discouraged.
> 
> Not sure whether any of the old broken platforms is still relevant,
> therefore I started a discussion about it, which however ended
> w/o tangible result. See here:
> https://www.spinics.net/lists/linux-pci/msg103281.html
> 
> I work around this restriction with the following in an init script,
> not sure how common distro's deal with this.
> 
> # enable Runtime PM for all PCI devices
> for i in /sys/bus/pci/devices/*/power/control; do
>         echo auto > $i
> done

FWIW, my distribution (openSUSE Leap 15.2) doesn't do anything with
these attributes, basically leaving the decision to the drivers. As a
result, your proposed patch leads to the following change for me:

-/sys/bus/pci/devices/0000:00:1f.3/power/control:auto
+/sys/bus/pci/devices/0000:00:1f.3/power/control:on

I don't see that as an improvement.

I also see that several other drivers I'm using (pcieport,
snd_hda_intel, amdgpu) do enable runtime power management, so the
i2c-i801 driver isn't an exception in this respect. Therefore I am not
willing to accept this patch, sorry.

-- 
Jean Delvare
SUSE L3 Support
