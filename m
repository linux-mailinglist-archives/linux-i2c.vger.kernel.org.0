Return-Path: <linux-i2c+bounces-8569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8A9F515F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 17:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64AC168506
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 16:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8795F156F20;
	Tue, 17 Dec 2024 16:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnE8MLNl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613CD13D891;
	Tue, 17 Dec 2024 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734454147; cv=none; b=AvRZ8C9h/tYch7QXw0EQnmZnhMkl2VlKgJaWa1OXzq7mB6FrcRSfcwbc2eIdz3dRwKck9+S8uoYjhJDjG5tfxyy+mIq4U5dGxseWi1ugLiXeTUrwO7Uv/3oEOqsAx22V95Jnw0si2DU/h6y6VxCF9cbJhCWLsJgiM8ot6EVRNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734454147; c=relaxed/simple;
	bh=ffP/A1FwqZUN0fq401ch5jHCfiRHhidUNp9QFwcD2vQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mYJTtMvLRxm4/RUVkmX7FzTgwulmNXIOcNf978omRiZ/0D9qgZTHQhUjOdHMX6I29qN1G7UZXZW0ioGMS8m/WDYlPWXxpDbzPXxBWg4Q8OKU/l0NZ3pprCrS09ZdF0LiGNVLhK4zH9OgcHhfLRcfXDguAYy/oPm6IMxgtfBqz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnE8MLNl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734454145; x=1765990145;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ffP/A1FwqZUN0fq401ch5jHCfiRHhidUNp9QFwcD2vQ=;
  b=gnE8MLNl0kibLtSE7ctt+D0L66LZBNM2eJ1Rq2rgACqKFFIwX/JFmLpm
   uv3wv8F1HHKTY1jEhiiT1MnI3jfqSzdHzGpAFlollOVp2Soxg1puCJG41
   C4q6kPpXVq+eWeT9veD6lZxCFf9Nh3INcbu8y7yGNEljJPJceDYXkvIY1
   vF/BU0S8EsP0LCTqBxKvnY8bdWKqPuHp+f85nUglqu9dFN+3Ns4H3AY9t
   sa8tRh0cI3nKkRD7bUiTNaxSeZdk8M18DkLSm3YBN4cUQcLeY8Eg1AL+m
   XN3o4w8dnEVVGU3zuYYtMzCEkh7GU83TT85DouIYiDOscbuxJ7mKNs2QE
   Q==;
X-CSE-ConnectionGUID: JXErsGX0RLqRlXLHU7SBGw==
X-CSE-MsgGUID: XHHpCPejRROkyIDmp8u5Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34784572"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34784572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:49:04 -0800
X-CSE-ConnectionGUID: 2FhLg9n4SU+ioYE6W89gog==
X-CSE-MsgGUID: T0CD/t+OSTSv9GSg0Qo1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120834384"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:49:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Dec 2024 18:48:55 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
    Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
    Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
    Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
In-Reply-To: <20241209183557.7560-5-hdegoede@redhat.com>
Message-ID: <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com>
References: <20241209183557.7560-1-hdegoede@redhat.com> <20241209183557.7560-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Dec 2024, Hans de Goede wrote:

> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> of the accelerometer. So a DMI product-name to address mapping table
> is used.
> 
> At support to have the kernel probe for the i2c-address for modesl
> which are not on the list.
> 
> The new probing code sits behind a new probe_i2c_addr module parameter,
> which is disabled by default because probing might be dangerous.
> 
> Link: https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

So what was the result of the private inquiry to Dell?

Did they respond?

Did they provide useful info?

> Changes in v8:
> - Use dev_err() / dev_dbg() where possible using &adap->dev as the device
>   for logging
> 
> Changes in v6:
> - Use i2c_new_scanned_device() instead of re-inventing it
> 
> Changes in v5:
> - Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
> ---
>  drivers/platform/x86/dell/dell-lis3lv02d.c | 53 ++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
> index d2b34e10c5eb..8d9dc59c7d8c 100644
> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
> @@ -15,6 +15,8 @@
>  #include <linux/workqueue.h>
>  #include "dell-smo8800-ids.h"
>  
> +#define LIS3_WHO_AM_I 0x0f
> +
>  #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr)                 \
>  	{                                                                \
>  		.matches = {                                             \
> @@ -57,6 +59,39 @@ static u8 i2c_addr;
>  static struct i2c_client *i2c_dev;
>  static bool notifier_registered;
>  
> +static bool probe_i2c_addr;
> +module_param(probe_i2c_addr, bool, 0444);
> +MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown, this may be dangerous.");
> +
> +static int detect_lis3lv02d(struct i2c_adapter *adap, unsigned short addr)
> +{
> +	union i2c_smbus_data smbus_data;
> +	int err;
> +
> +	dev_info(&adap->dev, "Probing for lis3lv02d on address 0x%02x\n", addr);
> +
> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
> +	if (err < 0)
> +		return 0; /* Not found */
> +
> +	/* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02d.c */
> +	switch (smbus_data.byte) {
> +	case 0x32:
> +	case 0x33:
> +	case 0x3a:
> +	case 0x3b:
> +		break;
> +	default:
> +		dev_warn(&adap->dev, "Unknown who-am-i register value 0x%02x\n",
> +			 smbus_data.byte);
> +		return 0; /* Not found */
> +	}
> +
> +	dev_dbg(&adap->dev, "Detected lis3lv02d on address 0x%02x\n", addr);
> +	return 1; /* Found */
> +}
> +
>  static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
>  {
>  	/*
> @@ -97,10 +132,18 @@ static void instantiate_i2c_client(struct work_struct *work)
>  	if (!adap)
>  		return;
>  
> -	info.addr = i2c_addr;
>  	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>  
> -	i2c_dev = i2c_new_client_device(adap, &info);
> +	if (i2c_addr) {
> +		info.addr = i2c_addr;
> +		i2c_dev = i2c_new_client_device(adap, &info);
> +	} else {
> +		/* First try address 0x29 (most used) and then try 0x1d */
> +		static const unsigned short addr_list[] = { 0x29, 0x1d, I2C_CLIENT_END };
> +
> +		i2c_dev = i2c_new_scanned_device(adap, &info, addr_list, detect_lis3lv02d);
> +	}
> +
>  	if (IS_ERR(i2c_dev)) {
>  		dev_err(&adap->dev, "error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
>  		i2c_dev = NULL;
> @@ -169,12 +212,14 @@ static int __init dell_lis3lv02d_init(void)
>  	put_device(dev);
>  
>  	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
> -	if (!lis3lv02d_dmi_id) {
> +	if (!lis3lv02d_dmi_id && !probe_i2c_addr) {
>  		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> +		pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
>  		return 0;
>  	}
>  
> -	i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
> +	if (lis3lv02d_dmi_id)
> +		i2c_addr = (long)lis3lv02d_dmi_id->driver_data;

If somebody enables this parameter and it successfully finds a device, 
shouldn't the user be instructed to report the info so that new entries 
can be added and the probe parameter is no longer needed in those case?

-- 
 i.


