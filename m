Return-Path: <linux-i2c+bounces-8385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F49E9E52
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 19:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6D916419B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 18:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F9715666A;
	Mon,  9 Dec 2024 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyjoZoUy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B313B59A;
	Mon,  9 Dec 2024 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733770257; cv=none; b=XpriUeXIW8T0Dlz/p4o9A8yjAEmRuvFnQailoqy5+PfmvMGKGAo/MOQGtBXj9cWWTlN98CdLatiycxGfaXJMEer6NZtuWTWg9loBb2CvOZIuBv0FxUM9PmRHUQdDjRybPv0n4sgxbmaEe6kiTKknQ/kLwuxRt7MclZfZunSRUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733770257; c=relaxed/simple;
	bh=NC3oH/77mCDm31MTZiTtgd3GAXV/566oYMAClHvpl/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaYDXX3LRCnbTVwfuKsbNf/OQq1IrKEIPrv/JeT1qZFWS236nvBHA/6R28t0TtatVqN4ql1oGOiR5xw4isj6t/4XOK+vFoF1o2J/pQaOOsm2GXXe5JXlPBwoYv4NlajHQhv+JN5eFVq/Lx3acNjFaMVM9ykpXWT+/ky3s8QqNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyjoZoUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C085C4CED1;
	Mon,  9 Dec 2024 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770256;
	bh=NC3oH/77mCDm31MTZiTtgd3GAXV/566oYMAClHvpl/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyjoZoUyQB7gb0tHau4yLQfXVqIj3vuEo60pTAXxiiXgggZ7SZBZTsOqdhw7g+rfT
	 50pkh/PAo/8nDQxehCk0lhRjhEn9QtsKegbsX+PEw6HA1E/u55IK5XgfbvSDc8Iutm
	 HX43RhA7/oLKK/xoh71nkH2in8aJKzVaCHA081S5Nyg0o9pYHXxU++TnnOW3AsrrOZ
	 IugUCnGESkZJ/QQjLbIo4JDhBjXk2bD59EJ4IYJo00MzdZbOiKVLmsxyA0YziUAiza
	 rMqUB4AIeHLMzsmyXECqVdG8TvAj7JTklVSMTHPANj5bOR9XAEMMH4ZnaBAtNYP6K5
	 ESfb9kwHmOgwg==
Received: by pali.im (Postfix)
	id C933C8A0; Mon,  9 Dec 2024 19:50:47 +0100 (CET)
Date: Mon, 9 Dec 2024 19:50:47 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 0/4] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <20241209185047.7nuweqmjensbhvvu@pali>
References: <20241209183557.7560-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209183557.7560-1-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

All patches except the last one are reviewed and should be ready, that
it fine. The last patch is basically no-go, as it was discussed many
times, it should not be accepted at all. As Hans said that would not
respond to my emails, I'm also not going to discuss more with him.

On Monday 09 December 2024 19:35:53 Hans de Goede wrote:
> Hi All,
> 
> Here is v9 of my patch series to move the manual instantation of lis3lv02d
> i2c_client-s for SMO88xx ACPI device from the generic i2c-i801.c code to
> a SMO88xx specific dell-lis3lv02d driver.
> 
> The i2c-core and i2c-i801 dependencies have both been merged into 6.13-rc1
> so I believe that this series is ready to be merged now .
> 
> Patch 2/4 does still touch the i2c-i801 code removing the quirk code which
> is moved to the pdx86 dell-smo8800 code. I think it would be best if Ilpo
> prepares an immutable branch with this series to be merged into both
> pdx86/for-next and the i2c-subsystem. Andi can we get your Ack for merging
> the i2c-i801 changes through the pdx86 tree ?
> 
> Moving the i2c_client instantiation has the following advantages:
> 
> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
> i2c-i801 module which is loaded on all Intel x86 machines to a module
> which will only be loaded when there is an ACPI SMO88xx device.
> 
> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
> between the i2c-i801 and dell-smo8800 drivers.
> 
> 3. This allows extending the quirk handling by adding new code and related
> module parameters to the dell-lis3lv02d driver, without needing to modify
> the i2c-i801 code.
> 
> This series also extends the i2c_client instantiation with support for
> probing for the i2c-address of the lis3lv02d chip on devices which
> are not yet listed in the DMI table with i2c-addresses for known models.
> This probing is only done when requested through a module parameter.
> 
> Changes in v9:
> - Rebase on top of v6.13-rc1
> - Drop already merged i2c-core and i2c-i801 dependencies
> 
> Changes in v8:
> - Address some minor review remarks from Andy
> 
> Changes in v7:
> - Rebase on v6.11-rc1
> 
> Changes in v6:
> - Use i2c_new_scanned_device() instead of re-inventing it
> 
> Changes in v5:
> - Make match_acpi_device_ids() and match_acpi_device_ids[] __init[const]
> - Add "Depends on I2C" to Kconfig (to fix kernel-test-robot reported issues)
> - Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
> 
> Changes in v4:
> - Move the i2c_client instantiation to a new dell-lis3lv02d driver instead
>   of adding it to the dell-smo8800 driver
> - Address a couple of other minor review comments
> 
> Changes in v3:
> - Use an i2c bus notifier so that the i2c_client will still be instantiated if
>   the i801 i2c_adapter shows up later or is re-probed (removed + added again).
>   This addresses the main concern / review-comments made during review of v2.
> - Add 2 prep patches to the i2c-core / the i2c-i801 driver to allow bus-notifier
>   use / to avoid the need to duplicate the PCI-ids of IDF i2c-i801 adapters.
> - Switch to standard dmi_system_id matching to check both sys-vendor +
>   product-name DMI fields
> - Drop the patch to alternatively use the st_accel IIO driver instead of
>   drivers/misc/lis3lv02d/lis3lv02d.c
> 
> Changes in v2:
> - Drop "[PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell laptops"
> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
> - Add a comment documenting the IDF PCI device ids
> - Keep using drivers/misc/lis3lv02d/lis3lv02d.c by default
> - Rename the module-parameter to use_iio_driver which can be set to
>   use the IIO st_accel driver instead
> - Add a new patch adding the accelerometer address for the 2 models
>   I have tested this on to dell_lis3lv02d_devices[]
> 
> Since this touches files under both drivers/i2c and drivers/platform/x86
> some subsystem coordination is necessary. I think it would be best to just
> merge the entire series through the i2c subsystem since this touches some
> core i2c files. As pdx86 subsys co-maintainer I'm fine with doing so.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (4):
>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
>     dell-smo8800-ids.h
>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
>     from i2c-i801 to dell-lis3lv02d
>   platform/x86: dell-smo8800: Add a couple more models to
>     lis3lv02d_devices[]
>   platform/x86: dell-smo8800: Add support for probing for the
>     accelerometer i2c address
> 
>  drivers/i2c/busses/i2c-i801.c                | 124 ---------
>  drivers/platform/x86/dell/Kconfig            |   1 +
>  drivers/platform/x86/dell/Makefile           |   1 +
>  drivers/platform/x86/dell/dell-lis3lv02d.c   | 252 +++++++++++++++++++
>  drivers/platform/x86/dell/dell-smo8800-ids.h |  27 ++
>  drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
>  6 files changed, 282 insertions(+), 139 deletions(-)
>  create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
>  create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
> 
> -- 
> 2.47.1
> 

