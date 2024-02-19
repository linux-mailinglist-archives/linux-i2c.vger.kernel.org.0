Return-Path: <linux-i2c+bounces-1857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F61685A288
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 12:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4411A1C21EAA
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17182C856;
	Mon, 19 Feb 2024 11:53:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2FF2E85B;
	Mon, 19 Feb 2024 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708343586; cv=none; b=e/ZWjlSn3KrlN/yh17q/ZCSLnlXoOZ5pF4sMQrmy0x/5Qm3yEdEIKEvqqO6dzyliTc/yk9+A3JUDfyIeshCqi322WxAmIGjI1R6h5Pmdguzy26CczRDWl4zZjkw21KKas2y9K9KPSa5SBcsFZfiDMV7q6b7BXQ2NKbPDVmEy9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708343586; c=relaxed/simple;
	bh=aZdyduIIiyW+F/5i+mZdjMfs4VR1027rRZFus95sCjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6odLC5KqdDvRhKFSg0ek5pXiLuT9pc8YnBfkohgs2OSTE7p5Cn/DTVdw2ljDxM2RADSMd0/Mf3vzOj3gYecmWL6GzFgi2YBgPK3RnmBoR6KLjT4qv7nxQA3Ov4XGzvWkE6Ry5X8tK5F7ZNT5kFtG1IsqGpgM1WTwMjifXEpmX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19950598"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="19950598"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 03:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="912862325"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="912862325"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 03:53:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rc2Cf-00000005oOd-1f3p;
	Mon, 19 Feb 2024 13:52:57 +0200
Date: Mon, 19 Feb 2024 13:52:57 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jean Delvare <jdelvare@suse.de>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Feb 17, 2024 at 11:33:21AM +0100, Hans de Goede wrote:
> On 2/13/24 17:30, Jean Delvare wrote:
> > On Sun, 7 Jan 2024 18:10:55 +0100, Pali Rohár wrote:
> >> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:

FWIW, I agree with Hans on the location of the HW quirks.
If there is a possible way to make the actual driver cleaner
and collect quirks somewhere else, I'm full support for that.

> >> I'm looking at this change again and I'm not not sure if it is a good
> >> direction to do this movement. (...)
> > 
> > Same feeling here. Having to lookup the parent i2c bus, which may or
> > may not be present yet, doesn't feel good.
> > 
> > I wouldn't object if everybody was happy with the move and moving the
> > code was solving an actual issue, but that doesn't seem to be the case.
> 
> I thought you would actually like getting this somewhat clunky code
> which basically works around the hw not being properly described in
> the ACPI tables out of the generic i2c-i801 code.
> 
> I didn't get around to answer's Pali's concerns yet, so let me
> start by addressing those since you indicate that you share Pali's
> concerns:
> 
> Pali wrote:
> > Now after looking at this change again I see there a problem. If i2c-801
> > driver initialize i2c-801 device after this smo8800 is called then
> > accelerometer i2c device would not happen.
> 
> That is a good point (which Jean also points out). But this can simply
> be fixed by making the dell-smo8800's probe() method return -EPROBE_DEFER
> if the i2c-i801 i2c-bus is not present yet (all designs using the
> dell-smo8800 driver will have an i2c-bus so waiting for this to show
> up should not cause regressions).
> 
> If we can agree to move forward this series I'll fix this.
> 
> Pali wrote:
> > Also it has same problem if PCI i801 device is reloaded or reset.
> 
> The i801 device is not hotplugable, so normally this will never
> happen. If the user manually unbinds + rebinds the i2c-i801 driver
> them the i2c_client for the smo88xx device will indeed get removed
> and not re-added. But this will normally never happen and if
> a user is manually poking things then the user can also unbind +
> rebind the dell-mso8800 driver after the i2c-i801 rebind.
> So I don't really see this as an issue.
> 
> With those remarks addressed let me try to explain why I think
> that moving this to the dell-smo8800 code is a good idea:
> 
> 1. It is a SMO88xx ACPI device specific kludge and as such IMHO
> thus belongs in the driver for the SMO88xx ACPI platform_device.
> 
> The i2c-i801 driver gets loaded on every x86 system and it is
> undesirable to have this extra code and the DMI table in RAM
> on all those other systems.
> 
> 2. Further changes in this series, like adding support for
> probing for the i2c address of the lis3lv02d device on models
> not yet in the DMI table, will add a bunch of more code specific
> to SMO88xx ACPI devices. Making the problem of having SMO88xx
> specific code in the generic i2c-i801 driver even bigger.
> The current amount of SMO88xx specific code in the
> generic i2c-i801 driver might be considered acceptable but I'm
> afraid that the amount of code after this series will not be
> acceptable.
> 
> 3. Some of the changes in this series are harder to implement inside
> the i2c-i801 code, like optionally instantiating an i2c_client for
> the IIO st_accel driver (*) so that the accelerometer gets presented
> to userspace as a standard IIO device like all modern accelerometer
> drivers do.
> 
> This requires setting i2c_client.irq and that IRQ comes from
> the SMO88xx ACPI device. So this would require the i2c-i801 code
> to lookup the ACPI device and get the IRQ from there. Where as
> in the SMO88xx ACPI platform_device driver the IRQ is readily
> available.
> 
> TL;DR: IMHO all this SMO88xx quirk/glue handling belongs in
> the SMO88xx specific dell-smo8800 driver rather then in
> the generic i2c-i801 code.
> 
> Regards,
> 
> Hans
> 
> 
> *) Instead of an i2c_client for the somewhat weird (but still
> default for backward compat) drivers/misc/lis3lv02d/lis3lv02d.c
> driver

-- 
With Best Regards,
Andy Shevchenko



