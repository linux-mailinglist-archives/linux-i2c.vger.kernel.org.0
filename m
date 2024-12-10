Return-Path: <linux-i2c+bounces-8416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E40899EB308
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86E422837B8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 14:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C261ABED8;
	Tue, 10 Dec 2024 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjTf4mur"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0F31AA792;
	Tue, 10 Dec 2024 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733840469; cv=none; b=MJNgwLlx3DpDRcfDsEVALHz/6UTWeSJCHq3v3Ztf5DegSrP4tlAWSPeUDIuF4gDAr7wxpfGfJPeQVW4R1eB1t4Xgk+VYripKICNeeuhDHikEiYXZgP8WKxgsla2givjSZ4S+/6pfukgmOOcLQojyuCTf4RzMT5KQKUn4B9vmLa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733840469; c=relaxed/simple;
	bh=vbCYVQK9u8EtPZJkiuKJss0G39vzyN+eThKf4a8hQdY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fFyqrwERRILA8et4Xg8oaWa7LeZoaTqDp86guWf+xGDa0/nxAW50qkfRidV1kjBy+KwmV84sr5TFc4Poq2pYHItbRP8pdoOvcRcQb/H+vFr2CpF2nwdEH7I+HD1zyrjNiOVaMsZIhep6QTIwc0Fao/2CNURB88oFFWtqpNHqbQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjTf4mur; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733840468; x=1765376468;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vbCYVQK9u8EtPZJkiuKJss0G39vzyN+eThKf4a8hQdY=;
  b=NjTf4mur/aVled4wPmg+LYLcY1Ht2OZTSWNIpAQzbcNOyfAkJSkXWc9h
   IP0Zg9lBc7xdscnyAJFlWTbuUNO1WJV2HQAH9QOX1nQUUfAfMvvkvBLJ1
   Vr9TeBW2qqoQGHyVvWYEwLEDJtdJQl27w2TN4h/hZxCK6d31Y7zRkXu3g
   yEa0AO6iF5pqsr4QhemOROnKfxGjJbNpcmqDYNXjT1QczjQBL2IX44dCr
   FWyQAssuvC6C0bENhemAMCe0XOa88Zd6QAD7QEuOpmZwfyEqzcbFzZOJg
   GFT47gCiqx6fidFiwA4qv71ofMRet1Z6Jcq1SQIickP4gKLBOx8QzeZDh
   w==;
X-CSE-ConnectionGUID: tAvSDHqrQFSQCkBUFl0OYw==
X-CSE-MsgGUID: 11HQ8QloRqGmo+F3vCEIew==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37017461"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="37017461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:21:07 -0800
X-CSE-ConnectionGUID: aRQFVUqcTxeOIa3l7zf+Ng==
X-CSE-MsgGUID: uqb1HqcVQduywpt1jMipmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95877032"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:21:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Dec 2024 16:21:01 +0200 (EET)
To: =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
cc: Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
    Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
    Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 0/4] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
In-Reply-To: <20241209185047.7nuweqmjensbhvvu@pali>
Message-ID: <ddaa1a6f-c087-f6f2-f802-8d02fa7ae929@linux.intel.com>
References: <20241209183557.7560-1-hdegoede@redhat.com> <20241209185047.7nuweqmjensbhvvu@pali>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1952583182-1733840461=:905"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1952583182-1733840461=:905
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Dec 2024, Pali Roh=E1r wrote:

> All patches except the last one are reviewed and should be ready, that
> it fine. The last patch is basically no-go, as it was discussed many
> times, it should not be accepted at all. As Hans said that would not
> respond to my emails, I'm also not going to discuss more with him.

I could merge the non-controversial patches 1-3 through pdx86 tree. Would
a I2C drivers maintainer want to give an ack for the patch 2 whose diff is=
=20
simply removing the code from I2C side?

(I'll have to lookup what's up with the last patch later when I've more=20
time to go through archives.)

--=20
 i.


> On Monday 09 December 2024 19:35:53 Hans de Goede wrote:
> > Hi All,
> >=20
> > Here is v9 of my patch series to move the manual instantation of lis3lv=
02d
> > i2c_client-s for SMO88xx ACPI device from the generic i2c-i801.c code t=
o
> > a SMO88xx specific dell-lis3lv02d driver.
> >=20
> > The i2c-core and i2c-i801 dependencies have both been merged into 6.13-=
rc1
> > so I believe that this series is ready to be merged now .
> >=20
> > Patch 2/4 does still touch the i2c-i801 code removing the quirk code wh=
ich
> > is moved to the pdx86 dell-smo8800 code. I think it would be best if Il=
po
> > prepares an immutable branch with this series to be merged into both
> > pdx86/for-next and the i2c-subsystem. Andi can we get your Ack for merg=
ing
> > the i2c-i801 changes through the pdx86 tree ?
> >=20
> > Moving the i2c_client instantiation has the following advantages:
> >=20
> > 1. This moves the SMO88xx ACPI device quirk handling away from the gene=
ric
> > i2c-i801 module which is loaded on all Intel x86 machines to a module
> > which will only be loaded when there is an ACPI SMO88xx device.
> >=20
> > 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) t=
able
> > between the i2c-i801 and dell-smo8800 drivers.
> >=20
> > 3. This allows extending the quirk handling by adding new code and rela=
ted
> > module parameters to the dell-lis3lv02d driver, without needing to modi=
fy
> > the i2c-i801 code.
> >=20
> > This series also extends the i2c_client instantiation with support for
> > probing for the i2c-address of the lis3lv02d chip on devices which
> > are not yet listed in the DMI table with i2c-addresses for known models=
=2E
> > This probing is only done when requested through a module parameter.
> >=20
> > Changes in v9:
> > - Rebase on top of v6.13-rc1
> > - Drop already merged i2c-core and i2c-i801 dependencies
> >=20
> > Changes in v8:
> > - Address some minor review remarks from Andy
> >=20
> > Changes in v7:
> > - Rebase on v6.11-rc1
> >=20
> > Changes in v6:
> > - Use i2c_new_scanned_device() instead of re-inventing it
> >=20
> > Changes in v5:
> > - Make match_acpi_device_ids() and match_acpi_device_ids[] __init[const=
]
> > - Add "Depends on I2C" to Kconfig (to fix kernel-test-robot reported is=
sues)
> > - Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_add=
r)
> >=20
> > Changes in v4:
> > - Move the i2c_client instantiation to a new dell-lis3lv02d driver inst=
ead
> >   of adding it to the dell-smo8800 driver
> > - Address a couple of other minor review comments
> >=20
> > Changes in v3:
> > - Use an i2c bus notifier so that the i2c_client will still be instanti=
ated if
> >   the i801 i2c_adapter shows up later or is re-probed (removed + added =
again).
> >   This addresses the main concern / review-comments made during review =
of v2.
> > - Add 2 prep patches to the i2c-core / the i2c-i801 driver to allow bus=
-notifier
> >   use / to avoid the need to duplicate the PCI-ids of IDF i2c-i801 adap=
ters.
> > - Switch to standard dmi_system_id matching to check both sys-vendor +
> >   product-name DMI fields
> > - Drop the patch to alternatively use the st_accel IIO driver instead o=
f
> >   drivers/misc/lis3lv02d/lis3lv02d.c
> >=20
> > Changes in v2:
> > - Drop "[PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell lapto=
ps"
> > - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBuss=
es
> > - Add a comment documenting the IDF PCI device ids
> > - Keep using drivers/misc/lis3lv02d/lis3lv02d.c by default
> > - Rename the module-parameter to use_iio_driver which can be set to
> >   use the IIO st_accel driver instead
> > - Add a new patch adding the accelerometer address for the 2 models
> >   I have tested this on to dell_lis3lv02d_devices[]
> >=20
> > Since this touches files under both drivers/i2c and drivers/platform/x8=
6
> > some subsystem coordination is necessary. I think it would be best to j=
ust
> > merge the entire series through the i2c subsystem since this touches so=
me
> > core i2c files. As pdx86 subsys co-maintainer I'm fine with doing so.
> >=20
> > Regards,
> >=20
> > Hans
> >=20
> >=20
> > Hans de Goede (4):
> >   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
> >     dell-smo8800-ids.h
> >   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_clien=
t
> >     from i2c-i801 to dell-lis3lv02d
> >   platform/x86: dell-smo8800: Add a couple more models to
> >     lis3lv02d_devices[]
> >   platform/x86: dell-smo8800: Add support for probing for the
> >     accelerometer i2c address
> >=20
> >  drivers/i2c/busses/i2c-i801.c                | 124 ---------
> >  drivers/platform/x86/dell/Kconfig            |   1 +
> >  drivers/platform/x86/dell/Makefile           |   1 +
> >  drivers/platform/x86/dell/dell-lis3lv02d.c   | 252 +++++++++++++++++++
> >  drivers/platform/x86/dell/dell-smo8800-ids.h |  27 ++
> >  drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
> >  6 files changed, 282 insertions(+), 139 deletions(-)
> >  create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
> >  create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
> >=20
> > --=20
> > 2.47.1
> >=20
>=20
--8323328-1952583182-1733840461=:905--

