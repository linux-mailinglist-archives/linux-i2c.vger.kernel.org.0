Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD23715B5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 12:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfGWKKA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 23 Jul 2019 06:10:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:60120 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726710AbfGWKKA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jul 2019 06:10:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 54BAAB119;
        Tue, 23 Jul 2019 10:09:58 +0000 (UTC)
Date:   Tue, 23 Jul 2019 12:09:36 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Valentin =?UTF-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190723120936.176290d2@endymion>
In-Reply-To: <20190723085546.n4c33twqrtul6fae@valentin-vidic.from.hr>
References: <20190722174504.qwp52opvy6ptyxn6@valentin-vidic.from.hr>
        <20190723100256.3895bd3b@endymion>
        <20190723085546.n4c33twqrtul6fae@valentin-vidic.from.hr>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 23 Jul 2019 10:55:46 +0200, Valentin Vidić wrote:
> So the main question at the moment is why loading just i2c-i801 produces
> an iTCO_wdt entry in /proc/iomem? Could it be that both i2c-i801 and
> iTCO_wdt are trying to register the same region?

This is expected, due to how resources are handled by the kernel. In
fact there are 2 types of resources: free resources, which are merely
information about known devices, and busy resources, which correspond
to resources actually reserved by running drivers. If you look
at /proc/iomem (or /proc/ioport for that matter), you'll find a lot of
similar examples. For example i2c-i801 on my machine:

0d00-ffff : PCI Bus 0000:00
  (...)
  f000-f01f : 0000:00:1f.3
    f000-f01f : i801_smbus

First one is the port pool allocated to the whole PCI bus. Second one
is the resource declared as used by the SMBUs controller device at the
PCI level, and the last one is the busy resource created by the
i2c-i801 driver to claim that I/O port range. In general the busy range
matches the device range, but it can also be a subset.

Back to iTCO_wdt... This is not a standalone PCI device, instead it is
a feature of another device. If I recall right, depending on the
chipset, it is part of the SMBus controller device (which is why
i2c-i801 is in charge of instantiating the device), or part of the LPC
device (then lpc_ich is in charge of instantiating the device). In your
case, the i2c-i801 driver instantiates the iTCO_wdt device. Nothing
wrong with that.

My own resources for the iTCO_wdt device look like:

fed1c000-fed1ffff : Reserved
  fed1c000-fed1ffff : pnp 00:09
    fed1f410-fed1f414 : iTCO_wdt.0.auto
      fed1f410-fed1f414 : iTCO_wdt.0.auto

That's with the iTCO_wdt driver loaded (last line is the busy
resource). Last line goes away when iTCO_wdt driver is not loaded.

Now if I look at your resource tree, we have:

00100000-6f8d8017 : System RAM
  00c5fffc-00c5ffff : iTCO_wdt

The key difference between yours and mine is that mine is in a RESERVED
memory range, while yours is in SYSTEM RAM. Which is a totally
incorrect place to map device I/O memory. And that's the reason why it
fails.

Down to the technical details... The kernel will always let you create
a free resource in the tree as long as it doesn't break a boundary of
an existing resource (region). However you can only create a BUSY
resource if ALL wrapping resources down the tree are themselves FREE
(that's the whole point of having busy resources in the first place).
In order to protect the system, the System RAM regions are always
created busy by the kernel, so no driver can accidentally use system
RAM as device mapped memory (the consequences would be terribly unsafe
and insecure).

As a conclusion, your problem is that your watchdog device was not
properly configured by the BIOS. The device needs to be assigned an I/O
memory range within a Reserved area, NOT System RAM. A range that's
also not used by any other device. The BIOS author is supposed to make
the decision.

So... I think you're up for a visit to your BIOS options in case
anything related to the watchdog can be configured. If that doesn't
help, look for BIOS updates for your system. And if that still doesn't
help, you'll have to complain to your system vendor.

-- 
Jean Delvare
SUSE L3 Support
