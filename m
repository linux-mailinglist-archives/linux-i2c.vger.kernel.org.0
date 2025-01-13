Return-Path: <linux-i2c+bounces-9057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39253A0BB9E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 16:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8688F18845BB
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 15:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855DD240223;
	Mon, 13 Jan 2025 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx00nY8C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36833240222;
	Mon, 13 Jan 2025 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781474; cv=none; b=ZApNYu2XFX2Xvp8sA9++pRQzrnO76apuRitWBVY/i1g/1hWF3koJCjtarFcb2OTOUCsjG3ogs7apaqSp5J0RB97T+lDeT3T+Tv1T2U9Psv8+EPCHQA2znaVuIlhvX+MSVZmGib7ampmzeT9aXEOkdxASHRxrkEHX9lk6ImqTvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781474; c=relaxed/simple;
	bh=naDPHqLdQMHjlFCMh7eKt+QOtGIY37d6yNI+eScVWMM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ja9s943ytpFw6q2+ugsjxl/fuNyka4ewW7SAcO57Etb58L2I7mbFSEXijgZmLKVpYZPKaU+N9uTdSzohW0TViIYeiMOs/CTohI73fgHgwOtf1GzIP8igAMSDahdkBi+y7rN7+VweI0xS3T6xzOf6fMiTDlG99suePIQDUjIIQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx00nY8C; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736781472; x=1768317472;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=naDPHqLdQMHjlFCMh7eKt+QOtGIY37d6yNI+eScVWMM=;
  b=Wx00nY8CsXO90jU25ZqopKXdfeeE/65MO8HQNuObaTaGsSpa3Ov4Ep/U
   kH2xzLcPjd8DVZpSRYcD+yyzBrKrDZPkMxsUAFA8bIBgm1Rrva9Zn0SQQ
   J962S+o2bUytzuw0PW93vbygMy3fungShJVbTN/qM/DLHpo1Ue7iXL6ec
   APvgCGy82I832vGVzSWDOTdpcJG6KFQCwxqaygm6/ZDo9k+jDn9Snd7qB
   /qtvyrubyJ4LDKCjefSt0tJ/k4s0EwtOk/4MiQRc1n6M5ddnvh/rGfr7W
   +dr5GtCesGSEBaVVjpcrr8ZgdBwYaEeJ8p72G2+Gx19UBWWsTGMWY758S
   A==;
X-CSE-ConnectionGUID: fxt34vH4TOuaFAMdHrsz7w==
X-CSE-MsgGUID: 6Qqf6KiORgu/1lzCXyogVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36263025"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36263025"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 07:17:51 -0800
X-CSE-ConnectionGUID: ojRsodK2T0ugYmq9ie1c1A==
X-CSE-MsgGUID: TSuSbTtxR/CqqdavuzOZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="109492520"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.121])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 07:17:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jan 2025 17:17:43 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Prasanth Ksr <prasanth.ksr@dell.com>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
    Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
    Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
    Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
In-Reply-To: <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com>
Message-ID: <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com>
References: <20241209183557.7560-1-hdegoede@redhat.com> <20241209183557.7560-5-hdegoede@redhat.com> <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com> <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-944221133-1736781463=:881"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-944221133-1736781463=:881
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 21 Dec 2024, Hans de Goede wrote:

> Hi Ilpo,
>=20
> Thank you for taking a look a this patch.
>=20
> On 17-Dec-24 5:48 PM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 9 Dec 2024, Hans de Goede wrote:
> >=20
> >> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> >> of the accelerometer. So a DMI product-name to address mapping table
> >> is used.
> >>
> >> At support to have the kernel probe for the i2c-address for modesl
> >> which are not on the list.
> >>
> >> The new probing code sits behind a new probe_i2c_addr module parameter=
,
> >> which is disabled by default because probing might be dangerous.
> >>
> >> Link: https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626=
161bfc@molgen.mpg.de/
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >=20
> > So what was the result of the private inquiry to Dell?
>=20
> On July 5th I send the following email to Prasanth Ksr
> <prasanth.ksr@dell.com> which is the only dell.com address I could
> find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
> does not seem to be monitored very actively:
>=20
> """
> Hello Prasanth,
>=20
> I'm contacting you about a question lis3lv02d freelfall sensors /
> accelerometers used on many (older) Dell laptop models. There
> has been a question about this last December and a patch-set
> trying to address part of this with Dell.Client.Kernel@dell.com
> in the Cc but no-one seems to be responding to that email address
> which is why I'm contacting you directly:
>=20
> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@mo=
lgen.mpg.de/
> https://lore.kernel.org/platform-driver-x86/20240704125643.22946-1-hdegoe=
de@redhat.com/
>=20
> If you are not the right person to ask these questions to, then
> please forward this email to the right person.
>=20
> The lis3lv02d sensors are I2C devices and are described in the ACPI
> tables with an SMO88xx ACPI device node. The problem is that these
> ACPI device nodes do not have an ACPI I2cResouce in there resource
> (_CRS) list, so the I2C address of the sensor is unknown.
>=20
> When support was first added for these Dell provided a list of
> model-name to I2C address mappings for the then current generation
> of laptops, see:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/i2c/busses/i2c-i801.c#n1227
>=20
> And later the community added a few more mappings.
>=20
> Paul Menzel, the author of the email starting the discussion on this:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/i2c/busses/i2c-i801.c#n1227
>=20
> did a search for the kernel message which is printed when an SMO88xx
> ACPI device is found but the i2c-address is unknown and Paul found
> many models are missing from the mapping table (see Paul's email).
>=20
> Which leads us to the following questions:
>=20
> 1. Is there another, uniform (so not using a model name table)
> way to find out the I2C address of the SMO88xx freefall sensor
> from the ACPI or SMBIOS tables ?
>=20
> 2. If we need to keep using the model-name to I2C-address mapping
> table can you help us complete it by providing the sensor's I2C
> address for all models Paul has found where this is currently missing ?
>=20
> Regards,
>=20
> Hans
> """
>=20
> Pali and Paul Menzel where in the Cc of this email.
>=20
> > Did they respond?
>=20
> I got a reply from Prasanth that they would forward my request to the
> correct team. Then I got on off-list reply to the v6 patch-set from
> David Wang from Dell with as relevant content "We are working on it."
>=20
> > Did they provide useful info?
>=20
> No further info was received after the "We are working on it." email.

Hi Hans,

So you didn't try to remind them after that at all?

This kind of sounds a low priority item they just forgot to do and might=20
have had an intention to follow through.

--=20
 i.

> >> Changes in v8:
> >> - Use dev_err() / dev_dbg() where possible using &adap->dev as the dev=
ice
> >>   for logging
> >>
> >> Changes in v6:
> >> - Use i2c_new_scanned_device() instead of re-inventing it
> >>
> >> Changes in v5:
> >> - Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_ad=
dr)
> >> ---
> >>  drivers/platform/x86/dell/dell-lis3lv02d.c | 53 ++++++++++++++++++++-=
-
> >>  1 file changed, 49 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/plat=
form/x86/dell/dell-lis3lv02d.c
> >> index d2b34e10c5eb..8d9dc59c7d8c 100644
> >> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
> >> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
> >> @@ -15,6 +15,8 @@
> >>  #include <linux/workqueue.h>
> >>  #include "dell-smo8800-ids.h"
> >> =20
> >> +#define LIS3_WHO_AM_I 0x0f
> >> +
> >>  #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr)             =
    \
> >>  =09{                                                                \
> >>  =09=09.matches =3D {                                             \
> >> @@ -57,6 +59,39 @@ static u8 i2c_addr;
> >>  static struct i2c_client *i2c_dev;
> >>  static bool notifier_registered;
> >> =20
> >> +static bool probe_i2c_addr;
> >> +module_param(probe_i2c_addr, bool, 0444);
> >> +MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the acce=
lerometer on models where the address is unknown, this may be dangerous.");
> >> +
> >> +static int detect_lis3lv02d(struct i2c_adapter *adap, unsigned short =
addr)
> >> +{
> >> +=09union i2c_smbus_data smbus_data;
> >> +=09int err;
> >> +
> >> +=09dev_info(&adap->dev, "Probing for lis3lv02d on address 0x%02x\n", =
addr);
> >> +
> >> +=09err =3D i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_=
I,
> >> +=09=09=09     I2C_SMBUS_BYTE_DATA, &smbus_data);
> >> +=09if (err < 0)
> >> +=09=09return 0; /* Not found */
> >> +
> >> +=09/* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02d=
=2Ec */
> >> +=09switch (smbus_data.byte) {
> >> +=09case 0x32:
> >> +=09case 0x33:
> >> +=09case 0x3a:
> >> +=09case 0x3b:
> >> +=09=09break;
> >> +=09default:
> >> +=09=09dev_warn(&adap->dev, "Unknown who-am-i register value 0x%02x\n"=
,
> >> +=09=09=09 smbus_data.byte);
> >> +=09=09return 0; /* Not found */
> >> +=09}
> >> +
> >> +=09dev_dbg(&adap->dev, "Detected lis3lv02d on address 0x%02x\n", addr=
);
> >> +=09return 1; /* Found */
> >> +}
> >> +
> >>  static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
> >>  {
> >>  =09/*
> >> @@ -97,10 +132,18 @@ static void instantiate_i2c_client(struct work_st=
ruct *work)
> >>  =09if (!adap)
> >>  =09=09return;
> >> =20
> >> -=09info.addr =3D i2c_addr;
> >>  =09strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> >> =20
> >> -=09i2c_dev =3D i2c_new_client_device(adap, &info);
> >> +=09if (i2c_addr) {
> >> +=09=09info.addr =3D i2c_addr;
> >> +=09=09i2c_dev =3D i2c_new_client_device(adap, &info);
> >> +=09} else {
> >> +=09=09/* First try address 0x29 (most used) and then try 0x1d */
> >> +=09=09static const unsigned short addr_list[] =3D { 0x29, 0x1d, I2C_C=
LIENT_END };
> >> +
> >> +=09=09i2c_dev =3D i2c_new_scanned_device(adap, &info, addr_list, dete=
ct_lis3lv02d);
> >> +=09}
> >> +
> >>  =09if (IS_ERR(i2c_dev)) {
> >>  =09=09dev_err(&adap->dev, "error %ld registering i2c_client\n", PTR_E=
RR(i2c_dev));
> >>  =09=09i2c_dev =3D NULL;
> >> @@ -169,12 +212,14 @@ static int __init dell_lis3lv02d_init(void)
> >>  =09put_device(dev);
> >> =20
> >>  =09lis3lv02d_dmi_id =3D dmi_first_match(lis3lv02d_devices);
> >> -=09if (!lis3lv02d_dmi_id) {
> >> +=09if (!lis3lv02d_dmi_id && !probe_i2c_addr) {
> >>  =09=09pr_warn("accelerometer is present on SMBus but its address is u=
nknown, skipping registration\n");
> >> +=09=09pr_info("Pass dell_lis3lv02d.probe_i2c_addr=3D1 on the kernel c=
ommandline to probe, this may be dangerous!\n");
> >>  =09=09return 0;
> >>  =09}
> >> =20
> >> -=09i2c_addr =3D (long)lis3lv02d_dmi_id->driver_data;
> >> +=09if (lis3lv02d_dmi_id)
> >> +=09=09i2c_addr =3D (long)lis3lv02d_dmi_id->driver_data;
> >=20
> > If somebody enables this parameter and it successfully finds a device,=
=20
> > shouldn't the user be instructed to report the info so that new entries=
=20
> > can be added and the probe parameter is no longer needed in those case?
>=20
> Ah, IIRC that used to be there, but I guess that was lost when
> I switched from DIY probing code to using the i2c_new_scanned_device()
> helper for this in v6 of the series.
>=20
> I'll prepare a v10 of this patch changing:
>=20
>         dev_dbg(&adap->dev, "Detected lis3lv02d on address 0x%02x\n", add=
r);
>=20
> to:
>=20
>         dev_info(&adap->dev, "Detected lis3lv02d on address 0x%02x, pleas=
e report this upstream to platform-driver-x86@vger.kernel.org so that a qui=
rk can be added\n",
> =09=09 addr);
>=20
> to address this.
>=20
> Regards,
>=20
> Hans
>=20
>=20
--8323328-944221133-1736781463=:881--

