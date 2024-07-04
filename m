Return-Path: <linux-i2c+bounces-4642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98262927EAD
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 23:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88891C225A6
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 21:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0659314388E;
	Thu,  4 Jul 2024 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxLWZS9R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5586143741;
	Thu,  4 Jul 2024 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129025; cv=none; b=KPhBnELCJFZgC19O19qPoC2aP1K/pU/2w3WgH5McwcwmEj8RjbnITRPfzvbMGD6vSUM4N+zXLMd3DeUX4kcUAWo4iofCGrmuPCEMccLL4Wjeh13SpYXxtmtzvp+WMVEdCgGRmbCCBtwYLh8VqM5EKvzvVLVtMRXX/pbHxhRmTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129025; c=relaxed/simple;
	bh=ODygpwHX2YO+0VpJmxitBnALQ9zwjjMtHmbBqbyH5Jc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOoVpHUIOlIJnmHkhwySGfh/tV0UHdLK20f6rDuaABBJb8H48BI5KL3fLY6rFcM9++XXxIrRCVzRNoaedG7wBBPt47xWOgsHaKhBVZIMiTDNKxpPAVR+3J+WE4VP4KEiksa4X1FnvBT2cyJpJz8oT+XHuMSVlzw08hVWORv9x24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxLWZS9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA33AC3277B;
	Thu,  4 Jul 2024 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720129025;
	bh=ODygpwHX2YO+0VpJmxitBnALQ9zwjjMtHmbBqbyH5Jc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=XxLWZS9RlXA13YaE7j2aJSeLaNvsnBN+rxsTDKNZb8z57zbLTvzpR1mVAZ3EV80VA
	 w9FSpy8A+pl0F4OXSAUYtvmwhgPzUBD8BWS3aILAZ2KwX6uZch9ezhE4guOKTklGeV
	 IAp5hluEiqDSZAtOI6QwsAYzZQAKu/sKClzhxShdudTu7iU9KwKNNsPltd4ZYDKwZH
	 kqFM+Qo77MiFTlU0fW//H9lhYdukhzG9WhFwjsxxA+C10Q6EnSIFT1btGGy38GV6RI
	 Vy8M0mtWpMIxhdnaXf1sH335S5mWZ+zLQYiRMHeIh1JIycL4ecCDGpTdMHvnnFdwV9
	 b/SrD++VGr0Gw==
Received: by pali.im (Postfix)
	id A0DA8A5B; Thu,  4 Jul 2024 23:37:01 +0200 (CEST)
Date: Thu, 4 Jul 2024 23:37:01 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
Message-ID: <20240704213701.gtkgfnmahgeridir@pali>
References: <20240704125643.22946-1-hdegoede@redhat.com>
 <20240704125643.22946-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704125643.22946-7-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Thursday 04 July 2024 14:56:43 Hans de Goede wrote:
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

NAK.

This is a hack, which should be avoided as specified in previous
discussions (e.g. it can cause regression for future or also existing
products).

Author refused to improve the code, also refused to ask vendor about the
details and proper implementation and author also refused to do any
future discussion about it.

Based on this state, this patch 6/6 should not be merged at all.

> ---
> Changes in v6:
> - Use i2c_new_scanned_device() instead of re-inventing it
> 
> Changes in v5:
> - Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
> ---
>  drivers/platform/x86/dell/dell-lis3lv02d.c | 52 ++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
> index ab02ad93758a..21390e6302a0 100644
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
> @@ -57,6 +59,38 @@ static u8 i2c_addr;
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
> +	pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);
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
> +		pr_warn("Unknown who-am-i register value 0x%02x\n", smbus_data.byte);
> +		return 0; /* Not found */
> +	}
> +
> +	pr_debug("Detected lis3lv02d on address 0x%02x\n", addr);
> +	return 1; /* Found */
> +}
> +
>  static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
>  {
>  	/*
> @@ -93,10 +127,18 @@ static void instantiate_i2c_client(struct work_struct *work)
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
>  		pr_err("error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
>  		i2c_dev = NULL;
> @@ -167,12 +209,14 @@ static int __init dell_lis3lv02d_init(void)
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
>  
>  	/*
>  	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
> -- 
> 2.45.1
> 

