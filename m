Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E181A18604D
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Mar 2020 23:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgCOWtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Mar 2020 18:49:14 -0400
Received: from resqmta-ch2-03v.sys.comcast.net ([69.252.207.35]:50982 "EHLO
        resqmta-ch2-03v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729274AbgCOWtO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Mar 2020 18:49:14 -0400
Received: from resomta-ch2-17v.sys.comcast.net ([69.252.207.113])
        by resqmta-ch2-03v.sys.comcast.net with ESMTP
        id Dbk5j360Y8K6ODc4GjpWSA; Sun, 15 Mar 2020 22:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comcastmailservice.net; s=20180828_2048; t=1584312553;
        bh=zyxWYRhrMQUBE/gi3NYDTUS5olE1r8EDblNLZJWBGAs=;
        h=Received:Received:Reply-To:Subject:To:From:Message-ID:Date:
         MIME-Version:Content-Type;
        b=W34mi4EQDipP3MgdJgarSDG8If2+Cq7qRIFwJqhAoaUHJETjDsVHD3EHKWpwwuBCS
         Pra/GGrJK5IZBmJsRUJwsefx/DXZ0jG3kLMz0X/GVxKN3riAwQSTdhBsDrfM3a027g
         ALTEnyNmwp0qBMKWWSlcDEO/2oF5BMrPdClF6v/xhdoNPdHY7G1dTKaU9f/OJ9swbR
         g8TwDSArubIWct5ilzgzdF2QxcxmDX2VnJNNme3/rWGKo53mDt/0mX3jNg6ucCDhS7
         pxqtV3x7RdQGxyxvd8XsV/25ynL49+4BVnGhvLEqxpyFXDkGOg4YEOkQW0MUAD6KoK
         J+R8rXRMyp5EA==
Received: from [IPv6:2001:558:6040:22:2171:426f:b27e:296d]
 ([IPv6:2001:558:6040:22:2171:426f:b27e:296d])
        by resomta-ch2-17v.sys.comcast.net with ESMTPSA
        id Dc49jSIv6yNKeDc4DjSbVb; Sun, 15 Mar 2020 22:49:10 +0000
X-Xfinity-VMeta: sc=-100.00;st=legit
Reply-To: james@nurealm.net
Subject: Re: i2c-tools - at24 vs eeprom - decode-dimms fails with the at24
 module
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <dc5201ea-de3f-f26c-c95e-fca392b521aa@nurealm.net>
 <20200314214113.54e48d00@endymion>
From:   James Feeney <james@nurealm.net>
Message-ID: <312c4863-9b18-df13-fdf2-d183e192f15c@nurealm.net>
Date:   Sun, 15 Mar 2020 16:49:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200314214113.54e48d00@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hey Jean

On 3/14/20 2:41 PM, Jean Delvare wrote:
> While the legacy eeprom driver (poorly) auto-detected SPD EEPROMs, the
> at24 driver requires SPD EEPOMs to be explicitly enumerated. There is
> work in progress [1] to automate this in some cases (namely x86 systems
> using the i2c-i801 SMBus controller driver) but for now you'll have to
> do it yourself from user-space. How to do that is explained in section 4
> of:
> 
> https://www.kernel.org/doc/Documentation/i2c/instantiating-devices
> ...
> If you have more memory modules, use
> "modprobe i2c-dev ; i2cdetect 0" to find out the proper addresses in
> the 0x50-0x57 range and repeat the command.
>
> I guess I should resubmit this patch set to make it transparent to the
> users.
> 
> [1] https://lore.kernel.org/lkml/20191014113950.1f989ba6@endymion/

Thanks for that!

Hmm - Still, let me point-out some of the "obvious", from my naive perspective.

1) Simply saying that "the legacy eeprom driver (poorly) auto-detected SPD EEPROMs" is *not* communicating an explanation as to *how* the at24 driver is "better" than the eeprom driver.  So, I'm at a loss there, noting, in contrast, that the eeprom driver "just works".  The at24 driver clearly did not "fix" this "poor auto-detection" behavior.

2) Where i2cdetect says "WARNING! This program can confuse your I2C bus, cause data loss and worse!", and where the document "instantiating-devices" says "Given the huge number of mainboards out there, it is next to impossible to build an exhaustive list of the hardware monitoring chips being used", and "Explicit device instantiation (methods 1 and 2) is much preferred for it is safer", fails to disclose the actual "measure" of "confuse", "unsafe", and "worse".  Again, I am at a loss, since, together, this merely suggests that i2c device auto-detection and enumeration is a "hard" and "unsolved" problem.  Is it really an "unsolved" problem?  i2cdetect seems to "work for me", and I've never seen a problem arise from running sensors-detect.

3) Noting the disclaimers with "[PATCH 3/4] i2c: smbus: Add a way to instantiate SPD EEPROMs automatically", which has "Only works if all filled slots have the same memory type" and "Only works on systems with 1 to 4 memory slots", I can observe that this patch would not even help, in my case, where the board has 6 memory slots.

What did you mean by "make it transparent to the users"?  What is "it"?  Are you describing "auto-detection"?  Or, the difficulty of "auto-detection" and the need for manual enumeration?

Given the circumstances, the sort of resolutions that come to mind include:

1) Provide more "intrusive" documentation for the at24 driver, so that that users will be informed about the need for manual explicit device enumeration with this driver, for instance, presenting the information you provided to me in your email.  How, in the boot process, will you recommend that this manual explicit device enumeration be automated?

2) Or, incorporate the functionality of i2cdetect into the at24 driver itself, perhaps with a parameter to enable or disable this "feature", *and* explain in detail the actual nature and "measure" of possible corruption from auto-detection - "worse", "unsafe", "confuse".

Not articulating and enumerating instances of "worse", "unsafe", and "confuse", is not a "solution" to the auto-detection problem, but is just avoiding the problem.  I would be better to help the user deal with the issue.

Of course, auto-detection sounds hard, and I'm being naive, so forgive me.

I would argue that it is better to provide automatic detection and a warning to "check" that the auto-detection "worked" without causing problems, than to provide *no* auto-detection and remain silent.  In some way, proper use of the at24 driver must be easily "discoverable" by the user.  Better to provide a path to follow, than just failing silently, though maybe it is less challenging to just provide better documentation for the at24 driver.

To the issue of manual instantiation, I found, after some reading and practice:

$ sudo i2cdetect -l
i2c-3   i2c             Radeon i2c bit bus 0x93                 I2C adapter
i2c-10  i2c             NVIDIA i2c adapter 0 at 3:00.0          I2C adapter
i2c-1   i2c             Radeon i2c bit bus 0x91                 I2C adapter
i2c-8   i2c             card0-DP-1                              I2C adapter
i2c-6   i2c             Radeon i2c bit bus 0x96                 I2C adapter
i2c-4   i2c             Radeon i2c bit bus 0x94                 I2C adapter
i2c-11  i2c             NVIDIA i2c adapter 6 at 3:00.0          I2C adapter
i2c-2   i2c             Radeon i2c bit bus 0x92                 I2C adapter
i2c-0   i2c             Radeon i2c bit bus 0x90                 I2C adapter
i2c-9   smbus           SMBus I801 adapter at 0400              SMBus adapter
i2c-7   i2c             Radeon i2c bit bus 0x97                 I2C adapter
i2c-5   i2c             Radeon i2c bit bus 0x95                 I2C adapter
i2c-12  i2c             NVIDIA i2c adapter 10 at 3:00.0         I2C adapter

$ sudo i2cdetect 9
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will probe file /dev/i2c-9.
I will probe address range 0x08-0x77.
Continue? [Y/n]
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         08 -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- 1e --
20: 20 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 31 32 -- -- -- -- 37 -- -- -- -- -- -- -- --
40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
50: 50 51 52 53 54 55 -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

$ sudo sh -c 'for i in 0x5{0..5};do echo spd $i > /sys/bus/i2c/devices/i2c-9/new_device;done'

$ decode-dimms
...
Number of SDRAM DIMMs detected and decoded: 6

So, that works, but it seems tedious.  Perhaps the same thing could be done by dynamically loading Device Tree Overlays, but that also seems tedious to set up.  I suppose that I would use:

install at24 /usr/bin/modprobe -r eeprom;/usr/bin/sleep 6;for i in 5{0..5};do [ ! -d /sys/bus/i2c/devices/i2c-9/9-00$i ] && echo spd 0x$i > /sys/bus/i2c/devices/i2c-9/new_device;done;/usr/bin/modprobe --ignore-install at24 $CMDLINE_OPTS

and

remove at24 for i in 5{0..5};do [ -d /sys/bus/i2c/devices/i2c-9/9-00$i -a `cat /sys/bus/i2c/devices/i2c-9/9-00$i/name` = spd ] && echo 0x$i > /sys/bus/i2c/devices/i2c-9/delete_device;done; /usr/bin/modprobe -r --ignore-remove at24 $CMDLINE_OPT


But then, we see at man 8 modprobe.d, regarding "install modulename command...":

      The long term future of this command as a solution to the problem of providing additional module
      dependencies is not assured and it is intended to replace this command with a warning about its
      eventual removal or deprecation at some point in a future release. Its use complicates the automated
      determination of module dependencies by distribution utilities, such as mkinitrd (because these now
      need to somehow interpret what the install commands might be doing. In a perfect world, modules
      would provide all dependency information without the use of this command and work is underway to
      implement soft dependency support within the Linux kernel.
           ...
 COMPATIBILITY
      A future version of kmod will come with a strong warning to avoid use of the install as explained
      above. This will happen once support for soft dependencies in the kernel is complete. That support
      will complement the existing softdep support within this utility by providing such dependencies
      directly within the modules.

This leads me to the impression that the at24 driver is being considered "faulty", simply because it fails to do its own configuration.  What are the "rules" about "proper" module and driver functionality?

But, you say the long-term plan is already to automate this, using the i2c-i801 SMBus controller driver?  So, modprobe is just a temporary work-around - hopefully.

The kernel *did* autoload the at24 driver at "echo spd 0x50 > /sys/bus/i2c/devices/i2c-9/new_device", but the at24 module must be explicitly loaded anyway, to actually invoke the modprobe command.  Oddly, with the eeprom driver loaded, it is not possible to write to "delete_device", which instead responds with "sh: line 0: echo: write error: No such file or directory".  Removing eeprom will delete its devices, but removing at24 will not.  The documentation is contradictory about correct behavior.  But then, if the at24 devices are configured, and the eeprom driver is loaded, the eeprom driver will not delete the at24 devices, and will fail to configure its own devices when loaded.  The at24 driver also cannot delete the eeprom devices, when both drivers are loaded.  Of course loading both drivers is not "normal".

We see at Documentation/i2c/instantiating-devices:

 Method 2: Instantiate the devices explicitly
 ...
 The driver which instantiated the I2C device is responsible for destroying it on cleanup.

but then:

 Method 4: Instantiate from user-space
 ...
 You can also instantiate the device before the driver is loaded or even
 available, and you don't need to know what driver the device needs.

Those "recommendations" or "rules" appear to be contradictory, and there is no author attribution with the Documentation to determine to whom to appeal for clarification.

As an aside, I notice that when the eeprom driver is removed at the same time that the at24 driver is being loaded, using the modprobe command shown above, but without the sleep, there are lots of errors showing with dmesg, whether or not the eeprom module was actually already loaded:

i2c i2c-9: new_device: Instantiated device spd at 0x50
...
at24 9-0050: 256 byte spd EEPROM, read-only
...
i2c i2c-9: Failed to register i2c client spd at 0x50 (-16)
...
i2c i2c-9: Failed to register i2c client spd at 0x50 (-16)
...

but the result seems to be correct, with the at24 devices replacing the eeprom devices.  I don't know why these error messages would be generated, unless there is some race condition or something blocking.  Not running "modprobe -r eeprom" immediately before, and presumably overlapping with, "modprobe at24" avoids the error messages.  It's just confusing, since the message states that something failed, when in fact, everything worked.  Perhaps those misleading error messages arise from some odd behavior with "modprobe --remove".  Avoiding the error messages requires a substantial delay between the modprobe remove and install commands, at least 4 seconds, and sometimes 5 or more seconds.  And, as mentioned, removing the eeprom driver *after* the at24 driver is loaded does not actually create at24 spd devices.

BTW, at https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/about/ we still see:

eeprom
  Perl scripts for decoding different types of EEPROMs (SPD, EDID...) These
  scripts rely on the "eeprom" kernel driver.

even though the eeprom driver is now deprecated.

I hope that these naive outsider observations will be helpful or useful in some way.  Of course, I appreciate the work you do, to make it all possible.


James

