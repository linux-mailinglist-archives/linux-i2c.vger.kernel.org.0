Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53329186B58
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 13:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730946AbgCPMsO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 08:48:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:33300 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730919AbgCPMsO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 08:48:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4B49AABDC;
        Mon, 16 Mar 2020 12:48:11 +0000 (UTC)
Date:   Mon, 16 Mar 2020 13:48:09 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     James Feeney <james@nurealm.net>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: i2c-tools - at24 vs eeprom - decode-dimms fails with the at24
 module
Message-ID: <20200316134809.26ee78f1@endymion>
In-Reply-To: <312c4863-9b18-df13-fdf2-d183e192f15c@nurealm.net>
References: <dc5201ea-de3f-f26c-c95e-fca392b521aa@nurealm.net>
        <20200314214113.54e48d00@endymion>
        <312c4863-9b18-df13-fdf2-d183e192f15c@nurealm.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi James,

On Sun, 15 Mar 2020 16:49:05 -0600, James Feeney wrote:
> 1) Simply saying that "the legacy eeprom driver (poorly) auto-detected SPD EEPROMs" is *not* communicating an explanation as to *how* the at24 driver is "better" than the eeprom driver.  So, I'm at a loss there, noting, in contrast, that the eeprom driver "just works".  The at24 driver clearly did not "fix" this "poor auto-detection" behavior.

If you were one of these users who got their Thinkpad laptop killed by
the eeprom driver, you would certainly consider the at24 driver to be
an improvement ;-)

The at24 driver indeed did not fix the auto-detection, instead the
auto-detection was removed from the driver completely by design. In the
Linux device driver model, it is not the driver's job to determine
whether the device is present. Instead, an external source (PCI device
enumeration, OF, user-space...) will create the device, and that's what
will cause the relevant driver to be loaded and have a chance to bind
to the device. The at24 driver fits in that model.

The change is not specific to the eeprom driver. Most drivers inherited
from the lm-sensors project have been converted to support the clean
device driver model. Many still optionally support device
auto-detection, but in some cases that was dropped completely, for
safety or reliability reasons.

Also note that the eeprom driver does not support DDR4 memory modules,
which use a different EEPROM standard compared to previous generations.
So everyone will have to move away from the eeprom driver eventually.

Anyway I agree that the migration from the eeprom driver to the at24
driver is not easy for the users, and I understand that having to move
from "just modprobe" to "obscure machine-specific sysfs magic" can been
seen as a regression from a usability perspective. This is the reason
for my project to re-introduce auto-detection at a different point in
the chain, where it actually belongs. But it will take some time.

I have resubmitted the patches this morning.

> 2) Where i2cdetect says "WARNING! This program can confuse your I2C bus, cause data loss and worse!", and where the document "instantiating-devices" says "Given the huge number of mainboards out there, it is next to impossible to build an exhaustive list of the hardware monitoring chips being used", and "Explicit device instantiation (methods 1 and 2) is much preferred for it is safer", fails to disclose the actual "measure" of "confuse", "unsafe", and "worse".  Again, I am at a loss, since, together, this merely suggests that i2c device auto-detection and enumeration is a "hard" and "unsolved" problem.  Is it really an "unsolved" problem?  i2cdetect seems to "work for me", and I've never seen a problem arise from running sensors-detect.

These warnings are there for as long as I can remember, I believe they
are unnecessarily alarmist nowadays. The reason for their presence is
that we used to have several cases where people have actually killed
pricey hardware by running i2cdetect or sensors-detect. Meanwhile, we
have added workarounds for the known faulty devices, and these machines
are probably no longer used today anyway, but this clearly invited the
developers to be very cautious and to make it clear to the user that
running these tools is not 100% safe and can't be made 100% safe,
unlike "lspci" for example.

Our i2c documentation is being updated at this moment, both format and
contents, so hopefully it will be better soon. If issues remain after
that, we'll look into them.

To answer your immediate questions, I2C only specifies how bits fly
over the wires. It does not specify the meaning of these bits. Our
tools (specifically i2cdetect) is based on the most common use of I2C
transactions, but there is no guarantee that your system does not
include some weird I2C device which interprets the transactions
completely differently. This can go as far as what we consider to be a
read transaction being interpreted as a write transaction by the device.

Sensors-detect runs a huge number of I2C transactions on a large number
of slave addresses. It is by far the most intrusive and dangerous tool
in this respect. Over time I (and maybe others) have added many quirks
to mitigate the risk, but it's still not 100% safe and I have seen
SMBus lock-ups or even instant reboots as a result of running
sensors-detect on some machines even recently. Thankfully no permanent
damage though.

> 3) Noting the disclaimers with "[PATCH 3/4] i2c: smbus: Add a way to instantiate SPD EEPROMs automatically", which has "Only works if all filled slots have the same memory type" and "Only works on systems with 1 to 4 memory slots", I can observe that this patch would not even help, in my case, where the board has 6 memory slots.

This is still work in progress and we will go step by step. The last
thing I want is that this patch causes trouble to dozens of users, gets
reverted, and the whole idea rejected. I prefer to cover half of the
users properly first, so as to prove the viability of the idea. What is
needed to properly support the remaining users can then be investigated.

If the you want to try a version of the patch that would support your
system, I can provide that. I can even provide an out-of-tree version of
the i2c-i801 driver for you to build and test, if you are interested.

> What did you mean by "make it transparent to the users"?  What is "it"?  Are you describing "auto-detection"?  Or, the difficulty of "auto-detection" and the need for manual enumeration?

"it" in that sentence designated the transition from the eeprom driver
to the at24 driver.

> Given the circumstances, the sort of resolutions that come to mind include:
> 
> 1) Provide more "intrusive" documentation for the at24 driver, so that that users will be informed about the need for manual explicit device enumeration with this driver, for instance, presenting the information you provided to me in your email.  How, in the boot process, will you recommend that this manual explicit device enumeration be automated?

I'd rather document it in decode-dimms, because the at24 driver is only
one of 2 drivers that you may have to use (ee1004 for DDR4 being the
other one).

Automation at boot is tricky because it depends on the distribution. I
can't write documentation that will cover all distributions out there,
and more importantly I don't want to have to maintain such
documentation. I believe the user should look for documentation on the
distribution side, as running commands at boot time is a generic need
that most distributions out there already document one way or another.

> 2) Or, incorporate the functionality of i2cdetect into the at24 driver itself, perhaps with a parameter to enable or disable this "feature", *and* explain in detail the actual nature and "measure" of possible corruption from auto-detection - "worse", "unsafe", "confuse".

The functionality of i2cdetect is not enough. i2cdetect tells you which
I2C addresses are responsive. It does not tell you what is the slave
device which responded. This is the core of the problem. If you see a
slave answer at I2C address 0x54, is it a DDR2 or DDR3 SPD EEPROM (that
would need the at24 driver)? A DDR4 SPD EEPROM (that would need the
ee1004 driver)? An AT24RF08 device that risk to get corrupted if you
access it because of a bug in its state machine implementation?

There's a reason for the device driver model and there's a reason why
the at24 driver sticks to that model. Adding auto-detection to the at24
driver itself would be a step back, and clearly in the wrong direction.
Not happening, sorry.

> Not articulating and enumerating instances of "worse", "unsafe", and "confuse", is not a "solution" to the auto-detection problem, but is just avoiding the problem.  I would be better to help the user deal with the issue.

I don't disagree. My take at the problem is to try hard to make it work
out of the box (even better than before, as the proper drivers will get
loaded automatically, unlike "eeprom"). I don't want to waste too much
time documenting a temporary situation.

> Of course, auto-detection sounds hard, and I'm being naive, so forgive me.

You underestimate the horror. It is hard, unsafe, and broken by design.

What should really happen is that the firmware enumerates the memory
slots with all the details we need, so that no detection is needed by
the OS at all. DMI provides some of the information, but not all. ACPI
could (should) do it as well, but doesn't. I'm trying to do the best we
can with the little information we have.

> I would argue that it is better to provide automatic detection and a warning to "check" that the auto-detection "worked" without causing problems, than to provide *no* auto-detection and remain silent.

And you would be wrong, sorry. SPD support at the OS level is nice to
have but certainly not mandatory. So if blindly automating it would
result in even just 0.01 % of systems failing to work properly then
that's not acceptable.

> In some way, proper use of the at24 driver must be easily "discoverable" by the user.  Better to provide a path to follow, than just failing silently, though maybe it is less challenging to just provide better documentation for the at24 driver.

The fact that nothing happens when you load the at24 driver is by
design, that's not going to change.

Better documentation would clearly help, yes. I guess the problem is
that I'm too ashamed by how uneasy it is, to write it black on white.

> To the issue of manual instantiation, I found, after some reading and practice:
> 
> $ sudo i2cdetect -l
> i2c-3   i2c             Radeon i2c bit bus 0x93                 I2C adapter
> i2c-10  i2c             NVIDIA i2c adapter 0 at 3:00.0          I2C adapter
> i2c-1   i2c             Radeon i2c bit bus 0x91                 I2C adapter
> i2c-8   i2c             card0-DP-1                              I2C adapter
> i2c-6   i2c             Radeon i2c bit bus 0x96                 I2C adapter
> i2c-4   i2c             Radeon i2c bit bus 0x94                 I2C adapter
> i2c-11  i2c             NVIDIA i2c adapter 6 at 3:00.0          I2C adapter
> i2c-2   i2c             Radeon i2c bit bus 0x92                 I2C adapter
> i2c-0   i2c             Radeon i2c bit bus 0x90                 I2C adapter
> i2c-9   smbus           SMBus I801 adapter at 0400              SMBus adapter
> i2c-7   i2c             Radeon i2c bit bus 0x97                 I2C adapter
> i2c-5   i2c             Radeon i2c bit bus 0x95                 I2C adapter
> i2c-12  i2c             NVIDIA i2c adapter 10 at 3:00.0         I2C adapter
> 
> $ sudo i2cdetect 9
> WARNING! This program can confuse your I2C bus, cause data loss and worse!
> I will probe file /dev/i2c-9.
> I will probe address range 0x08-0x77.
> Continue? [Y/n]
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         08 -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- 1e --
> 20: 20 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: 30 31 32 -- -- -- -- 37 -- -- -- -- -- -- -- --
> 40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
> 50: 50 51 52 53 54 55 -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> $ sudo sh -c 'for i in 0x5{0..5};do echo spd $i > /sys/bus/i2c/devices/i2c-9/new_device;done'
> 
> $ decode-dimms
> ...
> Number of SDRAM DIMMs detected and decoded: 6

Looks good.

> So, that works, but it seems tedious.  Perhaps the same thing could be done by dynamically loading Device Tree Overlays, but that also seems tedious to set up.  I suppose that I would use:
> 
> install at24 /usr/bin/modprobe -r eeprom;/usr/bin/sleep 6;for i in 5{0..5};do [ ! -d /sys/bus/i2c/devices/i2c-9/9-00$i ] && echo spd 0x$i > /sys/bus/i2c/devices/i2c-9/new_device;done;/usr/bin/modprobe --ignore-install at24 $CMDLINE_OPTS
> 
> and
> 
> remove at24 for i in 5{0..5};do [ -d /sys/bus/i2c/devices/i2c-9/9-00$i -a `cat /sys/bus/i2c/devices/i2c-9/9-00$i/name` = spd ] && echo 0x$i > /sys/bus/i2c/devices/i2c-9/delete_device;done; /usr/bin/modprobe -r --ignore-remove at24 $CMDLINE_OPT

Please note that there is no guarantee that i2c-9 will always be the
SMBus I801 adapter. In most cases the I2C bus numbering is stable, but
that's not guaranteed, and a number of things could cause it to change
(driver loading order for example, device hot-plugging...)

> But then, we see at man 8 modprobe.d, regarding "install modulename command...":
> 
>       The long term future of this command as a solution to the problem of providing additional module
>       dependencies is not assured and it is intended to replace this command with a warning about its
>       eventual removal or deprecation at some point in a future release. Its use complicates the automated
>       determination of module dependencies by distribution utilities, such as mkinitrd (because these now
>       need to somehow interpret what the install commands might be doing. In a perfect world, modules
>       would provide all dependency information without the use of this command and work is underway to
>       implement soft dependency support within the Linux kernel.
>            ...
>  COMPATIBILITY
>       A future version of kmod will come with a strong warning to avoid use of the install as explained
>       above. This will happen once support for soft dependencies in the kernel is complete. That support
>       will complement the existing softdep support within this utility by providing such dependencies
>       directly within the modules.
> 
> This leads me to the impression that the at24 driver is being considered "faulty", simply because it fails to do its own configuration.  What are the "rules" about "proper" module and driver functionality?

The problem is that you are trying hard to have the at24 driver mimic
the eeprom driver's behavior. There's really no reason to do that.
There is no reason to put these sysfs attribute writes into the
modprobe rule. They are simple shell commands that should be included
in whatever boot-time init script your distribution implements. That
will even load the at24 driver automatically for you.

If anything, the at24 driver itself is the only sane thing in the whole
mess.

> But, you say the long-term plan is already to automate this, using the i2c-i801 SMBus controller driver?  So, modprobe is just a temporary work-around - hopefully.

Actually, writing to the sysfs attribute "new_device" is the temporary
workaround.

> The kernel *did* autoload the at24 driver at "echo spd 0x50 > /sys/bus/i2c/devices/i2c-9/new_device", but the at24 module must be explicitly loaded anyway, to actually invoke the modprobe command.

It must not. You decided to do it this way, and it looks convoluted to
me.

> Oddly, with the eeprom driver loaded, it is not possible to write to "delete_device", which instead responds with "sh: line 0: echo: write error: No such file or directory".  Removing eeprom will delete its devices, but removing at24 will not.

As I recall, delete_device can only delete devices which were created
by new_device, by design. Either you instantiate from user-space, or
from kernel-space, you can't mix.

> The documentation is contradictory about correct behavior.

Which documentation specifically?

> But then, if the at24 devices are configured, and the eeprom driver is loaded, the eeprom driver will not delete the at24 devices, and will fail to configure its own devices when loaded.

Correct, again on purpose. The eeprom driver can only bind to addresses
that haven't been claimed by anyone yet. By declaring "spd" devices
through sysfs, these addresses are no longer free to claim. Only a
driver which declared itself as supporting the "spd" devices will be
allowed to bind to them. That's the at24 driver.

> The at24 driver also cannot delete the eeprom devices, when both drivers are loaded.  Of course loading both drivers is not "normal".

The core of the problem is that these 2 drivers are using different
device driver models. Both are "supported" technically, although
clearly the at24 one is recommended while the eeprom one is deprecated.
They do not mix well. That being said, loading 2 drivers for the same
device never works well anyway.

> We see at Documentation/i2c/instantiating-devices:
> 
>  Method 2: Instantiate the devices explicitly
>  ...
>  The driver which instantiated the I2C device is responsible for destroying it on cleanup.

Typical case would be some platform specific driver instantiating
known-to-be-present I2C devices. The i2c-i801 driver already did that
for a limited number of I2C devices, and with my proposed patches that
would be extended to SPD EEPROMs.

> but then:
> 
>  Method 4: Instantiate from user-space
>  ...
>  You can also instantiate the device before the driver is loaded or even
>  available, and you don't need to know what driver the device needs.
> 
> Those "recommendations" or "rules" appear to be contradictory, and there is no author attribution with the Documentation to determine to whom to appeal for clarification.

"git blame" will always tell you, but I'll save you the effort, I'm the
one to appeal to for clarification ;-)

I'm sorry but I can't see how these recommendations are contradictory.
These are alternative ways to achieve the same thing, the user
shall pick one or the other depending on the situation. Right now the
at24 driver needs method 4 (on x86 PC, that is), and I'm trying to move
it to method 2 for the majority of users.

Method 4 differs from all others in that it happens in user-space, so
it in inherently very different from the others.

> As an aside, I notice that when the eeprom driver is removed at the same time that the at24 driver is being loaded, using the modprobe command shown above, but without the sleep, there are lots of errors showing with dmesg, whether or not the eeprom module was actually already loaded:
> 
> i2c i2c-9: new_device: Instantiated device spd at 0x50
> ...
> at24 9-0050: 256 byte spd EEPROM, read-only
> ...
> i2c i2c-9: Failed to register i2c client spd at 0x50 (-16)
> ...
> i2c i2c-9: Failed to register i2c client spd at 0x50 (-16)
> ...
> 
> but the result seems to be correct, with the at24 devices replacing the eeprom devices.  I don't know why these error messages would be generated, unless there is some race condition or something blocking. 

This is news to me, thanks for reporting. I suppose that part of the
removal process is asynchronous, so "modprobe -r" returns before
everything is actually cleaned up. I guess things are done this way for
performance reasons, but it can clearly cause confusion. Furthermore, I
would expect a subsequent "modprobe" to be serialized to prevent any
kind of race. Apparently that's not happening, but that would be a
module core issue, not specific to the eeprom and at24 drivers. Again
the root of the problem is having 2 drivers for the same device - that
never works well.

> Not running "modprobe -r eeprom" immediately before, and presumably overlapping with, "modprobe at24" avoids the error messages.  It's just confusing, since the message states that something failed, when in fact, everything worked.  Perhaps those misleading error messages arise from some odd behavior with "modprobe --remove".  Avoiding the error messages requires a substantial delay between the modprobe remove and install commands, at least 4 seconds, and sometimes 5 or more seconds.  And, as mentioned, removing the eeprom driver *after* the at24 driver is loaded does not actually create at24 spd devices.

My suggestion would be to simply not load the eeprom driver in the
first place. There's really no need to create more problems than you
already have.

> BTW, at https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/about/ we still see:
> 
> eeprom
>   Perl scripts for decoding different types of EEPROMs (SPD, EDID...) These
>   scripts rely on the "eeprom" kernel driver.
> 
> even though the eeprom driver is now deprecated.

Thanks for pointing it out, I'll fix that. I thought I had done that
already but that must have been somewhere else.

> I hope that these naive outsider observations will be helpful or useful in some way.  Of course, I appreciate the work you do, to make it all possible.

Yes, feedback is always appreciated. If nothing else it helps me know
where my time is best spent to make things better.

-- 
Jean Delvare
SUSE L3 Support
