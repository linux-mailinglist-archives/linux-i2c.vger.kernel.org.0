Return-Path: <linux-i2c+bounces-9086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCAFA10A01
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 15:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67C443A4CFD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 14:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B4314B955;
	Tue, 14 Jan 2025 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF2JF7RG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DAA8615A;
	Tue, 14 Jan 2025 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866595; cv=none; b=cNCnK55GM6qa2v/2tvriEMAEKbXySJLA7jlF80oCuu4qOvT8mlaFUe5VWvyfHB5raijXWhZCwTueV1CMFTJP1uOsCeb+9TiU6k6Ds9ti0JrCEL/OrBA9mHSLWg6C2L5EkZraHOBgfvWS4Dikqi0S5+wa3h/dxck5Five/t8WZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866595; c=relaxed/simple;
	bh=Lyf9M+gtThCsLBxPB0rcMLhvOAdFTPZstd7RwtFysTk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lKr/Pb5x9I3kVBrWfO3Z2GKr8mG/UhX0R0+OGJ59zOm7k0/p7N8d6qQ6cbeYU5a1SMNPuiX5mt1p8bXpqjUvYwGEVAIqJIfMs+5Rv4kxuHwdly5+h3szVyEJUjk2FM2dT24K14ob2Hx6qcAv3OGQHEo5H1s8oRfXcGLpftSKll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF2JF7RG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736866593; x=1768402593;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Lyf9M+gtThCsLBxPB0rcMLhvOAdFTPZstd7RwtFysTk=;
  b=MF2JF7RG2UDmZtFohzaM5auO7CLLwuRKvEFDxJ00ROt5Rv2CLtdc9dUW
   UI8ods4k3z6hizDp6618APs4eov1ZqXAWh0mbLEZYpRJ/x9KQEivVsRXn
   NZyRqV4JdgwQ0CteCMN5KhXT8vZug5QyKVbHWkOC94NkMZ5x0FMzJotTj
   33c40b6rXyRT4sIvn+ELNGL6LmpE0/5iDeJykVzputg32pT/S21IU9iqc
   uesYt3WC+k1jvv+SONv8WFP9LZuUDkH0ZdZxF05kBqXWuHmtooeBPCxLO
   yWos2551Y+fmqVAx3zuHtbm3u32APF55WwBONqSuMHoveh7m3SHCZ/JNk
   g==;
X-CSE-ConnectionGUID: ghIdrZ6gRS+xgafZ/9i1xg==
X-CSE-MsgGUID: hyo7rcE4SlSsVc7YkfexgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="62535625"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="62535625"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:56:32 -0800
X-CSE-ConnectionGUID: u9olvqsOTz6gZTJrABMaNw==
X-CSE-MsgGUID: Z6p6svgaTiGArkbsXEMNhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="104998226"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:56:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 14 Jan 2025 16:56:25 +0200 (EET)
To: =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>
cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
    Prasanth Ksr <prasanth.ksr@dell.com>, Paul Menzel <pmenzel@molgen.mpg.de>, 
    Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
    Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
    Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
In-Reply-To: <20250113194702.j6ou2d7c3vn32unv@pali>
Message-ID: <913e875d-8bbf-e8f4-2fa5-147ae1e1f577@linux.intel.com>
References: <20241209183557.7560-1-hdegoede@redhat.com> <20241209183557.7560-5-hdegoede@redhat.com> <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com> <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com> <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com>
 <Z4Uy4FYgynLP3ZAp@smile.fi.intel.com> <2b2a3d16-039c-4cdf-94b9-41d074558d97@redhat.com> <20250113194702.j6ou2d7c3vn32unv@pali>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1742997099-1736866585=:1077"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1742997099-1736866585=:1077
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 13 Jan 2025, Pali Roh=C3=A1r wrote:
> On Monday 13 January 2025 17:49:19 Hans de Goede wrote:
> > On 13-Jan-25 4:36 PM, Andy Shevchenko wrote:
> > > On Mon, Jan 13, 2025 at 05:17:43PM +0200, Ilpo J=C3=A4rvinen wrote:
> > >> On Sat, 21 Dec 2024, Hans de Goede wrote:
> > >>> On 17-Dec-24 5:48 PM, Ilpo J=C3=A4rvinen wrote:
> > >>>> On Mon, 9 Dec 2024, Hans de Goede wrote:
> > >=20
> > > ...
> > >=20
> > >>>> So what was the result of the private inquiry to Dell?
> > >>>
> > >>> On July 5th I send the following email to Prasanth Ksr
> > >>> <prasanth.ksr@dell.com> which is the only dell.com address I could
> > >>> find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
> > >>> does not seem to be monitored very actively:
> > >>>
> > >>> """
> > >>> Hello Prasanth,
> > >>>
> > >>> I'm contacting you about a question lis3lv02d freelfall sensors /
> > >>> accelerometers used on many (older) Dell laptop models. There
> > >>> has been a question about this last December and a patch-set
> > >>> trying to address part of this with Dell.Client.Kernel@dell.com
> > >>> in the Cc but no-one seems to be responding to that email address
> > >>> which is why I'm contacting you directly:
> > >>>
> > >>> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161=
bfc@molgen.mpg.de/
> > >>> https://lore.kernel.org/platform-driver-x86/20240704125643.22946-1-=
hdegoede@redhat.com/
> > >>>
> > >>> If you are not the right person to ask these questions to, then
> > >>> please forward this email to the right person.
> > >>>
> > >>> The lis3lv02d sensors are I2C devices and are described in the ACPI
> > >>> tables with an SMO88xx ACPI device node. The problem is that these
> > >>> ACPI device nodes do not have an ACPI I2cResouce in there resource
> > >>> (_CRS) list, so the I2C address of the sensor is unknown.
> > >>>
> > >>> When support was first added for these Dell provided a list of
> > >>> model-name to I2C address mappings for the then current generation
> > >>> of laptops, see:
> > >>>
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/i2c/busses/i2c-i801.c#n1227
> > >>>
> > >>> And later the community added a few more mappings.
> > >>>
> > >>> Paul Menzel, the author of the email starting the discussion on thi=
s:
> > >>>
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/i2c/busses/i2c-i801.c#n1227
> > >>>
> > >>> did a search for the kernel message which is printed when an SMO88x=
x
> > >>> ACPI device is found but the i2c-address is unknown and Paul found
> > >>> many models are missing from the mapping table (see Paul's email).
> > >>>
> > >>> Which leads us to the following questions:
> > >>>
> > >>> 1. Is there another, uniform (so not using a model name table)
> > >>> way to find out the I2C address of the SMO88xx freefall sensor
> > >>> from the ACPI or SMBIOS tables ?
> > >>>
> > >>> 2. If we need to keep using the model-name to I2C-address mapping
> > >>> table can you help us complete it by providing the sensor's I2C
> > >>> address for all models Paul has found where this is currently missi=
ng ?
> > >>>
> > >>> Regards,
> > >>>
> > >>> Hans
> > >>> """
> > >>>
> > >>> Pali and Paul Menzel where in the Cc of this email.
> > >>>
> > >>>> Did they respond?
> > >>>
> > >>> I got a reply from Prasanth that they would forward my request to t=
he
> > >>> correct team. Then I got on off-list reply to the v6 patch-set from
> > >>> David Wang from Dell with as relevant content "We are working on it=
=2E"
> > >>>
> > >>>> Did they provide useful info?
> > >>>
> > >>> No further info was received after the "We are working on it." emai=
l.
> > >>
> > >> Hi Hans,
> > >>
> > >> So you didn't try to remind them after that at all?
> > >>
> > >> This kind of sounds a low priority item they just forgot to do and m=
ight have
> > >> had an intention to follow through.
> > >=20
> > > Talking from my experience with other companies that could have done =
something
> > > better I dare to say that this entire buzz for them is no-priority at=
 all, like
> > > "no money stuff", hence no attention given. That said, I believe ping=
 won't
> > > change anything here, however I agree that it _was_ worth to try to a=
cquire any
> > > response from them.
> >=20
> > Basically what Andy says above.
> >=20
> > Note that Dell's client team has been on the Cc for all the versions of
> > this patch-set many of which were posted after the "We are working on i=
t." email.
> >=20
> > For completeness sake I have just send a request for a status update on
> > this to Prasanth and David from Dell.
> >=20
> > In the mean time it would be good IMO to merge v11 of this patch, if we
> > get useful info from Dell after all we can modify the driver for this
> > later.
>=20
> No, this change should not be taken at all. This change has a chance to
> break booting or brick future dell devices. I'm not going to discuss it
> again, but saying that it is good just because you do not have anything
> better is not an argument to take such change. Also it is not an excuse
> to hide dangerous things behind module parameter. And if you have been
> doing to everything to ensure that companies would not want to tak with
> you then sorry it is only your problem, so please do not complain here.

I'd appreciate if you would refrain on making such personal attacks. We=20
cannot force other people to answer, be they volunteers or employees of
a company.

--=20
 i.

--8323328-1742997099-1736866585=:1077--

