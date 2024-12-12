Return-Path: <linux-i2c+bounces-8469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4049EE960
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 15:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 985FF282F6F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 14:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F82121571B;
	Thu, 12 Dec 2024 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYl9/Vp5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4022135AC;
	Thu, 12 Dec 2024 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734015105; cv=none; b=Gn6Zoxvy6xufaIHouqcvMqLJ9Rrzye6IDfkILM7nzI3nI0TUw68DkqNB+cZOCHq3lg/6kLJd5wcltdio0eEeEwRQVh69YA4TYLf6DSoIwJdBOuRmS8gL0T+OBe02Y47l3U/8LxnglIjGaHwa5YArtycACTDzNFojwZg/ZZ+S0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734015105; c=relaxed/simple;
	bh=C3UueoPQb5TI3q2csvi7noxJa26+vSnj4JeStgcfWGk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qHhAW8rYNUAnQMFs6gKWpPFi+0QM5EXIL9VDb/ky38M+FYLl7YWp3OCqEASVQZjmSGJpKxv6buoTgnyIo7xDPNBfzvu7sTMf8Yq3Zb+XAmH2L06NtkBuXcZ6qSdCoVvAnEEzfs08tPponUh4F8NwvHo3XZZP+Iu1riV2OR5Q1m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYl9/Vp5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734015104; x=1765551104;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=C3UueoPQb5TI3q2csvi7noxJa26+vSnj4JeStgcfWGk=;
  b=nYl9/Vp5C6fC26vv9DQiEPfFazfSI8YNpRdHTvx90OLfuq3oYf/k84ke
   gfFT/Tl225BjLaufMCsygNEYHCjOGp2o07vcDawVSeW8XAaTxmWugZhUT
   GeW3QxaR5ZH1tt6N0SPlb4L8tzORXVJFMO+WlrmboruGI8zeTW5droljN
   S7IBchM6wmhisWZz/glRh5LShNjw4ob9R1xUdUq+lfInd/TLfkJY9LvkC
   p2x/Sk33AaZLq2NZnZ86B1KGBaRF+VQ/GonyxzU0HcyFdSxCxbsEPLOp9
   D/JSSJh9jOvsXmoyabNdvra0DUyQyx1ZhianZf2yFKz1aLX/rwz1JLvuo
   Q==;
X-CSE-ConnectionGUID: 7xDymELcQxq40+HDZQDqlw==
X-CSE-MsgGUID: 2itc7dgHQLuL7WDYXZJzmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37278178"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="37278178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:51:43 -0800
X-CSE-ConnectionGUID: dqfj+1xRR/CawK0/CXYT+Q==
X-CSE-MsgGUID: ITA4j0XbQr6FBxs2XSLmbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="101267889"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.137])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:51:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Dec 2024 16:51:35 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
    Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
    Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
    Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 0/4] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
In-Reply-To: <20241209183557.7560-1-hdegoede@redhat.com>
Message-ID: <ec2de47c-ec08-7aa8-4caa-0a4d80ba7701@linux.intel.com>
References: <20241209183557.7560-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Dec 2024, Hans de Goede wrote:

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

Patches 1-3 applied into review-ilpo-next branch.

-- 
 i.


