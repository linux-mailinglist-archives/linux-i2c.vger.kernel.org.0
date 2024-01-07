Return-Path: <linux-i2c+bounces-1198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5695826545
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jan 2024 18:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1313C281BE7
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jan 2024 17:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265DC13AEB;
	Sun,  7 Jan 2024 17:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2O6lHjF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D813FE1;
	Sun,  7 Jan 2024 17:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00285C433C8;
	Sun,  7 Jan 2024 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704647459;
	bh=mEi3tjPSbz7C7Qdvo39gBQ54pJ6niF/pIY9mqWuL9Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2O6lHjFYPdLB8KDsswrVsBVt9qc6vGv+MuQ23REMq5VOXipnkLkG6NXIBvBhvRbn
	 9qd/vvrrWfXUDiURQvHUGdKXM+obstO5qrQI9+qa4sZa/zACjXm8Q6RPpZghD9Cavl
	 JSolc7HkZk5MVvy/a/F8daDYCAlMPnGIK+0bpZuOZ9fPbQklqHlLUiUdzWVfOSRR/M
	 Tv8GUSIJ5mOy6jXsXFxX06v84rXuBzn9nQvYgkYFpHEr891G5Hcj46GGs/sM8fAEnD
	 r8owZrOv5CTRI1+BlTAC16Wm3qmdJ0jBkRSi4wcmS6IL3F9R7yOd9H7cMv1BKnd056
	 FPkHu7Gde9kGg==
Received: by pali.im (Postfix)
	id D7D1497E; Sun,  7 Jan 2024 18:10:55 +0100 (CET)
Date: Sun, 7 Jan 2024 18:10:55 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240107171055.ac7jtwhu2kbalaou@pali>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106160935.45487-3-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
> It is not necessary to handle the Dell specific instantiation of
> i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
> inside the generic i801 I2C adapter driver.
> 
> The kernel already instantiates platform_device-s for these ACPI devices
> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> platform drivers.
> 
> Move the i2c_client instantiation from the generic i2c-i801 driver to
> the Dell specific dell-smo8800 driver.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
> - Add a comment documenting the IDF PCI device ids
> ---
>  drivers/i2c/busses/i2c-i801.c            | 126 +----------------------
>  drivers/platform/x86/dell/dell-smo8800.c | 121 +++++++++++++++++++++-
>  2 files changed, 123 insertions(+), 124 deletions(-)

I'm looking at this change again and I'm not not sure if it is a good
direction to do this movement. Some of the issues which this change
introduces I described in the previous email. I somehow have not caught
up why to do it.

ACPI smo8800 device and i2c lis3lv02d are from the OS resource point of
view totally different devices, not connected together in any way. In
ACPI tables there is no link information that smo8800 belongs to
lis3lv02d, and neither that it is on i2c. System tree of the devices
structures also handle it in this way.

If I'm looking at the current device design, it is a bus who instantiate
devices (as children of the bus). In this case, this i2c has no
information what is there connected (no Device Tree, no ACPI), so only
static data hardcoded in kernel are available. And therefore it should
be the bus who create or delete devices.

If the whole idea of this patch series was to merge smo8800 device and
lis3lv02d device into one device, the question is why to do it and why
it is a good idea in this case? (Specially when firmware provide to use
very little information). I just do not see this motivation. If it is
going to fix some bug or required for some new feature or something
else. I would like to know this one. Maybe I'm completely something
missing and hence I'm wrong...

I know that it is just a one device which provides interrupt and
accelerometer axes, but these two things are from OS persepctive totally
separated and there can be all combinations which of them are available
and which not (BIOS has select option to disable ACPI device=interrupt,
can be ON/OFF and kernel has or does not have DMI information of i2c bus
for acelerometer axes).

I can understand motivation to replace one i2c driver by another, if
there is a new style of it. In this it is just needed to teach new iio
lis driver to support some joystick emulation layer (can be generic, or
only for lis, or only available for HP and Dell machines) and switch can
be done without issue.

I can also understand motivation that freefall code is in two drivers
(old i2c lis driver and acpi smo8800). In this case it can be extracted
somwhere into helper function, or maybe completely moves into
platform/x86 as it is IIRC only for HP and Dell machines, and can ripped
out from the old i2c lis driver (unless there is some other usage for
it).

I also know that it is not a clean to have some Dell DMI data list in
the i801 bus driver and helper code not related to i801. So why not to
move this code from i2c-i801.c source file to some other helper library
and call just the helper function from i801.


I would rather let i2c lis device and ACPI smo8800 device separated,
this concept is less prone to errors, matches linux device model and is
already in use for many years and verified that works fine.

