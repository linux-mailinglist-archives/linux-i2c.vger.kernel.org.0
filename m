Return-Path: <linux-i2c+bounces-980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A79481D48B
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 15:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF3BD1F224BE
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2ECDF5A;
	Sat, 23 Dec 2023 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbNwy6Ab"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191C5DF49;
	Sat, 23 Dec 2023 14:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E391C433C8;
	Sat, 23 Dec 2023 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703341311;
	bh=RnyXYHP3dMZw4dYJBDRufTXGbo0tO/TG/JCTO5lGdlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbNwy6AbD3CubVOOBgojHzQ6n7335C+j06W606+erG8V3mDPX4NpUqo05XM6A4eAx
	 kVfKIoG35MdZ8TsX+zOHmjELgaFNLeweDo0nUcmHhq3fgXh2dcPabO+4Wu1Wf3FlEj
	 YE2uW7DMDB12p6LEv6JbXyOrJdBHtunfgpyyflRpf/6Hv6WH31dZPLeOq6BbAF9bgX
	 xG2WWsIO8RR9H2BmOmPZfm2syvjB6ulfggIOVBkCCk1paqDbAfGR4ShnLEwKBNALrJ
	 HUwYra+7Fw8Ha+GcdfhNGpAiQ3gq3P0i7rF6ORJOMkp4j/fPn36QsT26mLE1VrYOpd
	 oXdA0CBO6aclg==
Received: by pali.im (Postfix)
	id 52259A3B; Sat, 23 Dec 2023 15:21:48 +0100 (CET)
Date: Sat, 23 Dec 2023 15:21:48 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Marius Hoch <mail@mariushoch.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dell.Client.Kernel@dell.com, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Ideas for a generic solution to support accelerometer lis3lv02d
 in Dell laptops/notebooks?
Message-ID: <20231223142148.jl6poaw2eqottzdg@pali>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
 <a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
 <20231223125350.xqggx3nyzyjjmnut@pali>
 <79134dc1-c71c-4f9e-b721-52385df62cf5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79134dc1-c71c-4f9e-b721-52385df62cf5@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 23 December 2023 14:40:09 Hans de Goede wrote:
> Hi,
> 
> On 12/23/23 13:53, Pali Rohár wrote:
> > On Saturday 23 December 2023 13:45:32 Hans de Goede wrote:
> >> 2. Add a "probe_i2c_address" bool module option and when this
> >>    is set try to read the WHO_AM_I register, see
> >>    drivers/misc/lis3lv02d/lis3lv02d.c
> >>    and if this succeeds and gives a known model id then
> >>    continue with the found i2c_address. This should first
> >>    try address 0x29 which seems to be the most common and
> >>    then try 0x18 and then give up.
> > 
> > This is the main problem of the whole email thread. How to figure out
> > the correct smbus device address.
> 
> Ack.
> 
> > And we really must not poke random address during kernel boot time.
> > I think in the past was there enough problems linux kernel broke some HW
> > or made system unbootable just because it tried to read something from
> > some random undocumented address.
> > 
> > Please do not try random unverified address on all machines.
> 
> Right, that is why this sits behind a module option. Also note
> that the 0x29 / 0x18 addresses are typically used by some
> sensor ic, which are typically safe to probe.
> 
> > smbus is not really bus which provides discovering and identifying
> > devices on the bus.
> 
> I know I have worked on the lm_sensors project and the
> sensors-detect script in the past. Generally speaking
> though i2c probing is not that dangerous. But one can
> get unlucky ...

I think that manual probing after user confirmation is acceptable. But
automatic one without any user confirmation after kernel upgrade for all
existing and also all future machines is not something which I can say
that is safe.

I have experience when broken bytes in EDID eeprom and monitor
completely stopped working. It was after manual probing of some eeprom
driver (so driver of the correct class). If kernel/X11 logs did not
print warnings about EDID checksum I would not be able to debug & repair
it.

So one can be really unlucky if something happen in the future, like
changing laptop board wiring, changing accelerator chipset or whatever.

I have also experience with i2c device which have broken first i2c
single byte read (first after wakeup from low power state) and product
errata was to put data line to some position for at least some period of
time before doing the real data transfer.

I rather do not want to image what can happen if similar hw bug is in
the i2c multiplexer after which are connected more i2c devices...

After those experiences I want to be really safe about what is kernel
going to do automatically after the boot.

> We should probably first do 2 single byte i2c-reads
> (not smbus byte reads but plain i2c reads) if there
> is a i2c device there with the standard smbus register
> model where there is a 8 bit register address pointer
> then reading 2 times in a row will read 2 different
> registers (the internal register address pointer will
> increment) so we should get 2 different values.
> 
> If we get the same value twice then whatever is
> present on address 0x29 or 0x18 does not follow
> the standard smbus register addressing and we should
> refrain from doing a smbus-byte-read, which first
> sends the register-address to read so involves
> an actual i2c-*write*.
> 
> The combination of determining that normal smbus
> register addressing is used + only doing reads
> should make probing pretty safe. And the probing
> will only happen when the module option is set
> in the first place.

Hiding all above logic behind module parameter which is disabled by
default sounds safe. I think that this is something against which should
not be too much disagreements (expecting that module parameter will have
correct description with warning, just to be safe).

But well, my guess is that people would like to see accelerometer to
work out-of-the-box without configuring anything.

And this is possible only by communication with Dell. Dell designers
should have some ideas how it is suppose to work. And reinventing the
wheel from scratch in Linux kernel is not the best option.

> Regards,
> 
> Hans
> 
> 
> 
> 

