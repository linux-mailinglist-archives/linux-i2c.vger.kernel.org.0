Return-Path: <linux-i2c+bounces-4252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327E913469
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 562A61C2124C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCF316F0CF;
	Sat, 22 Jun 2024 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+0JXhF2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A13014B965;
	Sat, 22 Jun 2024 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719066019; cv=none; b=FhGgUswFTKVTfrZSB3CYTgvNaMzy+GeFpjGfmvLYFpHDep0yQfOxpRB0l4KFuA1wjVMkVqZLwXF+IimeKE2lo48k47bBFrXK67n9xaHT4Jao2ZgBvsERfo7/8QcbnyjdlkLglLHYIDKlIONpVVBcWtQFva61O7AeRi/AtZmtzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719066019; c=relaxed/simple;
	bh=TX76jcuX+rbLtzII88KW3wYd8QMtETXcrMuc96OT/Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7OnZuLMnpRjeb4msrhN8RkQufcw/UQ0FXpZeGxgrpHfgd3wYDxpSnC0Xd/+QmEv08/RICl7qeVU9IbYLxWZKofgdHAQmKTIA2whesFQNz0H8bPl+UXzWonOsled1+YZu5OEMDv4qrIsnfVLNzxtHiCG76rZx6X9UnX5GPDdK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+0JXhF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD2BC3277B;
	Sat, 22 Jun 2024 14:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719066019;
	bh=TX76jcuX+rbLtzII88KW3wYd8QMtETXcrMuc96OT/Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+0JXhF2crwiM5tAhF5ebOr+7pcO8dZMnfY0R1k/RroHV5tcbaI4ONZk7V/UNfb9N
	 5eVptz1d4qE7s9TTY/96JxlKoSmJCI6ZzToFb9jODG+Bg5eQiY46+D1SwqFURdpKuj
	 e4ruJ3KYJ9yoiwfzPc3qRKAk9c7PicwE1MA+jFnyqyqUxMnSPbiJrPGvwqpxylkUt4
	 N+CviAAW1lrC5jALkWRAw0I6K8GruAWDM/592+xESbypbtfyyB7Z7svUzCl/S0UJvI
	 +32ovH9Mufee+Ukr3jQLMdj6OpN6Yt+CgwsunowqwhnUrLctkN+4BL01WfefBccscL
	 T0Ei1zibRFJVg==
Received: by pali.im (Postfix)
	id 3DAD4BF5; Sat, 22 Jun 2024 16:20:15 +0200 (CEST)
Date: Sat, 22 Jun 2024 16:20:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240622142015.7cfl2onabpr6kl6r@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 22 June 2024 16:06:01 Hans de Goede wrote:
> Hi Pali,
> 
> On 6/22/24 3:16 PM, Pali Rohár wrote:
> > On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
> >> It is not necessary to handle the Dell specific instantiation of
> >> i2c_client-s for SMO88xx ACPI devices without an ACPI I2cResource
> >> inside the generic i801 I2C adapter driver.
> >>
> >> The kernel already instantiates platform_device-s for these ACPI devices
> >> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> >> platform drivers.
> >>
> >> Move the i2c_client instantiation from the generic i2c-i801 driver to
> >> the SMO88xx specific dell-smo8800 driver.
> > 
> > Why it has to be in dell-smo8800 driver? Code for registering lis3lv02d
> > and freefall code for smo88xx are basically independent.
> > 
> > lis3lv02d is for accelerometer axes and smo88xx is for freefall hardisk
> > detection. The only thing which have these "drivers" common is the ACPI
> > detection mechanism based on presence of SMO88?? identifiers from
> > acpi_smo8800_ids[] array.
> > 
> > I think it makes both "drivers" cleaner if they are put into separate
> > files as they are independent of each one.
> > 
> > What about moving it into drivers/platform/x86/dell/dell-lis3lv02d.c
> > instead (or similar name)? And just share list of ACPI ids via some
> > header file (or something like that).
> 
> Interesting idea, but that will not work, only 1 driver can bind to
> the platform_device instantiated by the ACPI code for the SMO88xx ACPI device.

And it is required to bind lis3 device to ACPI code? What is needed is
just to check if system matches DMI strings and ACPI strings. You are
not binding device to DMI strings, so I think there is no need to bind
it neither to ACPI strings.

> >> Moving the i2c_client instantiation here has the following advantages:
> >>
> >> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
> >> i2c-i801 module which is loaded on all Intel x86 machines to the SMO88xx
> >> specific dell-smo8800 module where it belongs.
> >>
> >> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
> >> between the i2c-i801 and dell-smo8800 drivers.
> >>
> >> 3. This allows extending the quirk handling by adding new code and related
> >> module parameters to the dell-smo8800 driver, without needing to modify
> >> the i2c-i801 code.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Note the goto out_put_adapter, which can be avoided by moving the DMI check
> >> up, is there deliberately as preparation for adding support to probe for
> >> the i2c address in case there is no DMI match.
> >> ---
> >> Changes in v3:
> >> - Use an i2c bus notifier so that the i2c_client will still be instantiated if
> >>   the i801 i2c_adapter shows up later or is re-probed (removed + added again)
> >> - Switch to standard dmi_system_id matching to check both sys-vendor +
> >>   product-name DMI fields
> >> - Use unique i2c_adapter->name prefix for primary i2c_801 controller
> >>   to avoid needing to duplicate PCI ids for extra IDF i2c_801 i2c_adapter-s
> >> - Drop MODULE_SOFTDEP("pre: i2c-i801"), this is now no longer necessary
> >> - Rebase on Torvalds master for recent additions of extra models in
> >>   the dell_lis3lv02d_devices[] list
> >>
> >> Changes in v2:
> >> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
> >> - Add a comment documenting the IDF PCI device ids
> >> ---
> >>  drivers/i2c/busses/i2c-i801.c            | 124 -------------
> >>  drivers/platform/x86/dell/dell-smo8800.c | 214 ++++++++++++++++++++++-
> >>  2 files changed, 213 insertions(+), 125 deletions(-)
> 
> <snip>
> 
> >> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> >> index f7ec17c56833..cd2e48405859 100644
> >> --- a/drivers/platform/x86/dell/dell-smo8800.c
> >> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> 
> ...
> 
> >> @@ -103,6 +112,184 @@ static const struct file_operations smo8800_misc_fops = {
> >>  	.release = smo8800_misc_release,
> >>  };
> >>  
> >> +/*
> >> + * Accelerometer's I2C address is not specified in DMI nor ACPI,
> >> + * so it is needed to define mapping table based on DMI product names.
> >> + */
> >> +static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
> >> +	/*
> >> +	 * Dell platform team told us that these Latitude devices have
> >> +	 * ST microelectronics accelerometer at I2C address 0x29.
> >> +	 */
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5250"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5450"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440 ATG"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6540"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	/*
> >> +	 * Additional individual entries were added after verification.
> >> +	 */
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 5480"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 3540"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
> >> +		},
> >> +		.driver_data = (void *)0x1dL,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 5568"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> >> +	},
> >> +	{
> >> +		.matches = {
> >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
> >> +		},
> >> +		.driver_data = (void *)0x29L,
> > 
> > At least for me, casting i2c address to LONG and then to pointer looks
> > very strange. If I look at this code without knowing what the number
> > 0x29 means I would not figure out that expression "(void *)0x29L" is i2c
> > address.
> > 
> > Is not there a better way to write i2c address? E.g. ".i2c_addr = 0x29"
> > instead of ".something = (void *)0x29L" to make it readable?
> 
> struct dmi_system_id is an existing structure and we cannot just go adding
> fields to it. driver_data is intended to tie driver specific data to
> each DMI match, often pointing to some struct, so it is a void *, but

Yes, I know it.

> in this case we only need a single integer, so we store that in the
> pointer. That is is the address becomes obvious when looking at the code
> which consumes the data.

Ok, this makes sense. Anyway, is explicit void* cast and L suffix
required?

> > Also does the whole device table has to be such verbose with lot of
> > duplicated information (which probably also increase size of every linux
> > image which includes this driver into it)?
> 
> struct dmi_system_id is the default way to specify DMI matches in
> the kernel. This avoids code duplication in the form of writing
> a DYI function to do the matching.
> 
> In v2 of the patch-set I only matched on product-name, but you asked
> in the review of v2 to also match on sys-vendor and you mentioned
> we may want to support other sys-vendors too, since some other brands
> have SMO88xx ACPI devices too. This more or less automatically leads
> to using the kernel's standard, existing, DMI matching mechanism.
> 
> We really want to avoid coming up with something "new" ourselves here
> leading to unnecessary code duplication.
> 
> Regards,
> 
> Hans

Ok, then let that table as you have it now.

