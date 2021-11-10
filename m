Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CF744CB2D
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 22:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbhKJVWB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 16:22:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:38176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233220AbhKJVWA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 16:22:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68B9F61207;
        Wed, 10 Nov 2021 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636579146;
        bh=WB6DKL3BV7ruHqNZT75+yRFoBFP70EwqOvtkcEWUbbo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Q/pTul/4w9rZ4nPEuMI/J6fVDTK3fBNVYgPxdii13r1DIyl1TMHeNs3hjmg0Xv0DQ
         Mr/J6mt8GHSZdIsPd9Zn7X5AndZGIyZ9UaluPZEHyZeDjcu3LYloLWJOrK0Oj31peQ
         SFDkCVoYYs006MSUJTGp6XU8awiuoajQDC1iVQ2YwPhwncFCTEJCRGyW9jC8GuXoUC
         +nwiJq8fAvsSyuhXQ+uyr1wWr/brfHiJ4JKnbsSGidMKVyFGfyTZKU1gI/Zx+hbkkB
         TWjIgtzHa6vwgDXRfx9SeBn291XSAJzivc/y9FQzGmmxE6S7qSXZdGTsLiJnx1f/Fj
         TVrmA6L8pORCQ==
Date:   Wed, 10 Nov 2021 15:19:05 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <20211110211905.GA1261732@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP145piSADe8BbArxah3zdJE8nLyjpv1LPxpdCpe-+Y05zQuWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 05:33:11PM +0100, Robert Święcki wrote:
> śr., 10 lis 2021 o 15:14 Bjorn Helgaas <helgaas@kernel.org> napisał(a):
> > On Tue, Nov 09, 2021 at 02:05:18PM -0600, Bjorn Helgaas wrote:
> > > On Tue, Nov 09, 2021 at 07:58:47PM +0100, Rafael J. Wysocki wrote:
> > > > On Tue, Nov 9, 2021 at 7:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > > ...
> >
> > > > > So instead, we can drop the pm_runtime_get_sync() and
> > > > > pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
> > > > > respectively, and add pm_runtine_get_noresume() to pci_pm_init(),
> > > > > which will prevent PM-runtime from touching the device until it has a
> > > > > driver that supports PM-runtime.
> > > > >
> > > > > We'll lose the theoretical ability to put unbound devices into D3 this
> > > > > way, but we learned some time ago that this isn't safe in all cases
> > > > > anyway.
> > > >
> > > > IOW, something like this (untested and most likely white-space-damaged).
> > >
> > > Thanks!  I applied this manually to for-linus in hopes of making the
> > > the next linux-next build.
> > >
> > > Please send any testing reports and corrections to the patch and
> > > commit log!
> >
> > Robert, I hate to ask even more of you, but if you have a chance, it
> > would be very helpful if you could test the patch below.  I'm pretty
> > sure it should fix the problem you saw, and I hope to ask Linus to
> > merge it today.
> 
> I think the most recent patch creates some timeouts and other problems
> in pci-related code? Things I haven't seen before. But, granted, my
> kernel testing approach is not with focus on details, so maybe I did
> sth wrong.

Thank you very much for testing this.  The patch changed the way we
use runtime PM, and the dmesg snippets below look like they could be
related to runtime PM issues.

I think the conclusion is that we need to revert these commits:

  b5f9c644eb1b ("PCI: Remove struct pci_dev->driver")
  2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")

from Linus' tree.  I queued up those reverts on
https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=for-linus

That branch also includes an unrelated revert of 041284181226
("of/irq: Allow matching of an interrupt-map local to an interrupt
controller") that shouldn't affect you unless you're on an Apple M1
machine.

> code is now at: cb690f5238d71f543f4ce874aa59237cf53a877c
> https://github.com/torvalds/linux/commit/cb690f5238d71f543f4ce874aa59237cf53a877c
> 
> lis 10 17:26:41 jd kernel: Linux version 5.15.0+ (jagger@jd) (gcc
> (Debian 11.2.0-10) 11.2.0, GNU ld (GNU Binutils for Debian)
> 2.37.50.20211102) #105 SMP PREEMPT Wed Nov 10 17:23:49 CET 2021
> lis 10 17:26:41 jd kernel: Command line: BOOT_IMAGE=/vmlinuz-5.15.0+
> root=UUID=8759fa14-93a4-4dc1-87e6-aa6f5cdbb2ff ro nosplash
> mitigations=off no_file_caps apparmor=0 selinux=0 audit=0
> amdgpu.ppfeaturemask=0xffffffff hugepagesz=1G default_hugepagesz=1G
> hugepages=8 amd_iommu=on iommu=pt
> vfio-pci.ids=10de:1f02,10de:10f9,10de:1ada,10de:1adb
> drm.edid_firmware=DP-1:edid/sam-g9.edid isolcpus=1,2,5,6,17,18,21,22
> ..
> lis 10 17:26:41 jd kernel: usb usb5: runtime PM trying to activate
> child device usb5 but parent (0000:0c:00.2) is not active
> ..
> lis 10 17:26:41 jd kernel: i2c-designware-pci 0000:0c:00.3: timeout in
> disabling adapter
> lis 10 17:26:41 jd kernel: i2c-designware-pci 0000:0c:00.3: timeout in
> disabling adapter
> ..
> lis 10 17:26:41 jd kernel: usb 1-5.3: config 1 has an invalid
> interface number: 2 but max is 1
> lis 10 17:26:41 jd kernel: usb 1-5.3: config 1 has no interface number 1
> ..
> lis 10 17:26:41 jd kernel: i2c-designware-pci 0000:0c:00.3: timeout in
> disabling adapter
> ..
> lis 10 17:26:41 jd kernel: i2c-designware-pci 0000:0c:00.3: timeout in
> disabling adapter
> lis 10 17:26:41 jd kernel: i2c-designware-pci 0000:0c:00.3: i2c
> timeout error -110
> lis 10 17:26:41 jd kernel: ucsi_ccg 3-0008: i2c_transfer failed -110
> lis 10 17:26:41 jd kernel: ucsi_ccg 3-0008: ucsi_ccg_init failed - -110
> lis 10 17:26:41 jd kernel: ucsi_ccg: probe of 3-0008 failed with error -110
> lis 10 17:26:42 jd kernel: snd_hda_intel 0000:0c:00.1:
> azx_get_response timeout, switching to polling mode: last
> cmd=0x000f0000
> lis 10 17:26:42 jd kernel: hdaudio hdaudioC0D0: runtime PM trying to
> activate child device hdaudioC0D0 but parent (0000:0c:00.1) is not a>
> lis 10 17:26:42 jd kernel: snd_hda_codec_hdmi hdaudioC0D0: HDMI:
> failed to get afg sub nodes
> lis 10 17:26:42 jd kernel: snd_hda_codec_hdmi: probe of hdaudioC0D0
> failed with error -22
> lis 10 17:26:42 jd kernel: snd_hda_codec_hdmi hdaudioC0D0: HDMI:
> failed to get afg sub nodes
> lis 10 17:26:42 jd kernel: snd_hda_codec_hdmi: probe of hdaudioC0D0
> failed with error -22
> lis 10 17:26:42 jd kernel: snd_hda_codec_hdmi hdaudioC0D0: HDMI:
> failed to get afg sub nodes
> lis 10 17:26:42 jd kernel: snd_hda_codec_hdmi: probe of hdaudioC0D0
> failed with error -22
> ...
> lis 10 17:26:42 jd kernel: snd_hda_codec_generic: probe of hdaudioC0D0
> failed with error -5
> lis 10 17:26:42 jd kernel: snd_hda_intel 0000:0c:00.1: Cannot probe
> codecs, giving up
> lis 10 17:26:42 jd kernel: ------------[ cut here ]------------
> lis 10 17:26:42 jd kernel: WARNING: CPU: 0 PID: 206 at
> sound/hda/hdac_bus.c:73 snd_hdac_bus_exit+0x3b/0x80 [snd_hda_core]
> lis 10 17:26:42 jd kernel: Modules linked in: snd_hda_codec_hdmi(E)
> nls_iso8859_2(E) snd_hda_codec_realtek(E) nls_cp852(E) snd_hda_codec_>
> lis 10 17:26:42 jd kernel:  i2c_designware_pci(E) drm(E) i2c_piix4(E)
> i2c_designware_core(E) xhci_pci(E) backlight(E) ice(E) xhci_pci_ren>
> lis 10 17:26:42 jd kernel: CPU: 0 PID: 206 Comm: kworker/0:2 Tainted:
> G            E     5.15.0+ #105
> lis 10 17:26:42 jd kernel: Hardware name: ASUS System Product Name/ROG
> CROSSHAIR VIII FORMULA, BIOS 3901 09/07/2021
> lis 10 17:26:42 jd kernel: Workqueue: events azx_probe_work [snd_hda_intel]
> lis 10 17:26:42 jd kernel: RIP: 0010:snd_hdac_bus_exit+0x3b/0x80 [snd_hda_core]
> lis 10 17:26:42 jd kernel: Code: 75 19 48 8b 57 58 48 8d 47 58 48 39
> c2 75 1b 48 81 c7 f8 02 00 00 e9 94 61 10 d8 0f 0b 48 8b 57 58 48 8d>
> lis 10 17:26:42 jd kernel: RSP: 0018:ffffa3e1008d3e40 EFLAGS: 00010283
> lis 10 17:26:42 jd kernel: RAX: ffff9728c5f38080 RBX: ffff9728c5f38028
> RCX: 000000008020001f
> lis 10 17:26:42 jd kernel: RDX: ffff9728c1f40b00 RSI: ffffffff9a30ddc9
> RDI: ffff9728c5f38028
> lis 10 17:26:42 jd kernel: RBP: ffff9728c5f384d0 R08: 0000000000000000
> R09: ffff9728c14a4e00
> lis 10 17:26:42 jd kernel: R10: 0000000000000000 R11: 0000000000000005
> R12: 00000000ffffffed
> lis 10 17:26:42 jd kernel: R13: 0000000000000000 R14: 0000000000000000
> R15: ffff972fcea26405
> lis 10 17:26:42 jd kernel: FS:  0000000000000000(0000)
> GS:ffff972fcea00000(0000) knlGS:0000000000000000
> lis 10 17:26:42 jd kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> lis 10 17:26:42 jd kernel: CR2: 00007fa43a298cb0 CR3: 000000010e58e000
> CR4: 0000000000750ef0
> lis 10 17:26:42 jd kernel: PKRU: 55555554
> lis 10 17:26:42 jd kernel: Call Trace:
> lis 10 17:26:42 jd kernel:  <TASK>
> lis 10 17:26:42 jd kernel:  azx_free+0xe5/0x1c0 [snd_hda_intel]
> lis 10 17:26:42 jd kernel:  azx_probe_continue+0x1a8/0x300 [snd_hda_intel]
> lis 10 17:26:42 jd kernel:  process_one_work+0x1eb/0x380
> lis 10 17:26:42 jd kernel:  worker_thread+0x48/0x400
> lis 10 17:26:42 jd kernel:  ? rescuer_thread+0x3c0/0x3c0
> lis 10 17:26:42 jd kernel:  kthread+0x151/0x180
> lis 10 17:26:42 jd kernel:  ? set_kthread_struct+0x40/0x40
> lis 10 17:26:42 jd kernel:  ret_from_fork+0x1f/0x30
> lis 10 17:26:42 jd kernel:  </TASK>
> lis 10 17:26:42 jd kernel: ---[ end trace f522829b4b020462 ]---
> lis 10 17:26:42 jd kernel: i2c-designware-pci 0000:0c:00.3: timeout in
> disabling adapter
> 
> > > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > > index 1d98c974381c..41cdf510214f 100644
> > > --- a/drivers/pci/pci-driver.c
> > > +++ b/drivers/pci/pci-driver.c
> > > @@ -309,16 +309,6 @@ static long local_pci_probe(void *_ddi)
> > >       struct device *dev = &pci_dev->dev;
> > >       int rc;
> > >
> > > -     /*
> > > -      * Unbound PCI devices are always put in D0, regardless of
> > > -      * runtime PM status.  During probe, the device is set to
> > > -      * active and the usage count is incremented.  If the driver
> > > -      * supports runtime PM, it should call pm_runtime_put_noidle(),
> > > -      * or any other runtime PM helper function decrementing the usage
> > > -      * count, in its probe routine and pm_runtime_get_noresume() in
> > > -      * its remove routine.
> > > -      */
> > > -     pm_runtime_get_sync(dev);
> > >       rc = pci_drv->probe(pci_dev, ddi->id);
> > >       if (!rc)
> > >               return rc;
> > > @@ -464,9 +454,6 @@ static void pci_device_remove(struct device *dev)
> > >       pcibios_free_irq(pci_dev);
> > >       pci_iov_remove(pci_dev);
> > >
> > > -     /* Undo the runtime PM settings in local_pci_probe() */
> > > -     pm_runtime_put_sync(dev);
> > > -
> > >       /*
> > >        * If the device is still on, set the power state as "unknown",
> > >        * since it might change by the next time we load the driver.
> > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > index b88db815ee01..e9c38b994c73 100644
> > > --- a/drivers/pci/pci.c
> > > +++ b/drivers/pci/pci.c
> > > @@ -3097,7 +3097,15 @@ void pci_pm_init(struct pci_dev *dev)
> > >       u16 pmc;
> > >
> > >       pm_runtime_forbid(&dev->dev);
> > > +
> > > +     /*
> > > +      * Unbound PCI devices are always put in D0.  If the driver supports
> > > +      * runtime PM, it should call pm_runtime_put_noidle(), or any other
> > > +      * runtime PM helper function decrementing the usage count, in its
> > > +      * probe routine and pm_runtime_get_noresume() in its remove routine.
> > > +      */
> > >       pm_runtime_set_active(&dev->dev);
> > > +     pm_runtime_get_noresume(&dev->dev);
> > >       pm_runtime_enable(&dev->dev);
> > >       device_enable_async_suspend(&dev->dev);
> > >       dev->wakeup_prepared = false;
> 
> -- 
> Robert Święcki
