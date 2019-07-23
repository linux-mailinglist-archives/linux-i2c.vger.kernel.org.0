Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A0971389
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 10:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfGWIDB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 04:03:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:46602 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727352AbfGWIDB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jul 2019 04:03:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 07A5EB0BE;
        Tue, 23 Jul 2019 08:03:00 +0000 (UTC)
Date:   Tue, 23 Jul 2019 10:02:56 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Valentin Vidic <vvidic@valentin-vidic.from.hr>
Cc:     "Felipe Balbi" <felipe.balbi@linux.intel.com>,
        <linux-i2c@vger.kernel.org>
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190723100256.3895bd3b@endymion>
In-Reply-To: <20190722174504.qwp52opvy6ptyxn6@valentin-vidic.from.hr>
References: <20190722174504.qwp52opvy6ptyxn6@valentin-vidic.from.hr>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Valentin,

On Mon, 22 Jul 2019 19:45:04 +0200, Valentin Vidic wrote:
> I'm having trouble getting iTCO_wdt to work on NUC8i5BEH with kernel 4.19.37-5+deb10u1:
> 
> # modprobe i2c_i801
> [40450.070587] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> [40450.070652] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> [40450.072919] iTCO_vendor_support: vendor-support=0
> [40450.073485] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [40450.073546] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
> [40450.073578] iTCO_wdt: probe of iTCO_wdt failed with error -16
> 
> Is there a way to check if the TCO hardware is missing in this machine
> or something else needs to be updated to get it working?

I think you are contacting the wrong people and list. The iTCO_wdt
driver is a watchdog driver and as such it is handled by the watchdog
subsystem maintainers (Wim Van Sebroeck and Guenter Roeck). You better
write to them and their list (linux-watchdog@vger).

The fact that iTCO_wdt loads when you load i2c-i801 is just a side
effect of an implementation detail (i2c-i801 instantiates the watchdog
device in certain cases, then module alias magic gets the needed driver
loaded automatically). If you only care about SMBus and not watchdog,
you can ignore the error message completely.

If you care about the watchdog feature, you should check what is
conflicting with iTCO_wdt. Error -16 is -EBUSY which suggests that
another driver has already grabbed the memory range. This should be
visible in /proc/iomem.

If it was grabbed by ACPI, you may need an ACPI driver for your
watchdog (if anything like that exists). If it was grabbed by another
non-ACPI driver, both drivers may have to be modified to synchronize
their access to the hardware.

-- 
Jean Delvare
SUSE L3 Support
