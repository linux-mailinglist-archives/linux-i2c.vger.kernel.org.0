Return-Path: <linux-i2c+bounces-4312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C791565B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 20:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34EB1F25220
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 18:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D011A00CE;
	Mon, 24 Jun 2024 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWLyXYuP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512AF19FA8D;
	Mon, 24 Jun 2024 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719252864; cv=none; b=QtQXjI1m+rTvLEmqco9nnoB3Hz+ecZaG2R1L5rGeqnrb/5JznLbUYhrLz1fcXAZ6H3EY2UBQun1fjpBrAV1or4uf2UpVV9c2X1no208kKdHk3ctFD6xHyLTjtAGJTye5LLMVPRX9MeK6mtWA3H4CxjYeYkmZ8MspmVAPTYktj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719252864; c=relaxed/simple;
	bh=nHA/AtizboEsp3XmR5RQc6k7NdByPNZpD06ds46SfgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQEJe2apTRmN6R7DEfa9pcKTbluXadTtbPqP52mfI5+euhqMdcB4aCxJ3+zA8Vg65P+gIpAkeFQ2JEE5eulUH0z3Y7zR5DEFO9UEXzK2JMllRhVIaOzOACV/64H6kpCtdu3lYaWo26AD6v6Tguj47NUtzP5ppe4Z1V5NS2pFCvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWLyXYuP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07713C2BBFC;
	Mon, 24 Jun 2024 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719252864;
	bh=nHA/AtizboEsp3XmR5RQc6k7NdByPNZpD06ds46SfgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWLyXYuP3RwDzSdF1wmoZ9p/qs+hVVHAnLpFcjvrpOfKALw9eFHyXHPDoBtfOyTBv
	 p4z5moJWhcdfuhDZGqi+u7lwH+CQ7/3t0t5chvh3bE/SJiow7ZN5v7fHeW/vBgw7Bp
	 dYXjb2JYtxWxAmy52J/tPVSXxrhEU5vcy6gmqRLTnb604S3Q7AcqXJb2zNawm6WSi1
	 NlYAkjR6BnAACxnNE9j+iky8p/+/TSkt0/7sQivz9hgTjIw/kmBueQ/ZWYIpyqWeTm
	 JQG/7048ljk/6gVMiXPmdngooqKqNKm6mXmkpSYfw02YmR/vEMwwFVPUYpKQ9WcbyH
	 lAQ+L1TTg1MuQ==
Received: by pali.im (Postfix)
	id ECC8EBF4; Mon, 24 Jun 2024 20:14:20 +0200 (CEST)
Date: Mon, 24 Jun 2024 20:14:20 +0200
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
Subject: Re: [PATCH v4 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <20240624181420.nvdszjycejdc5fer@pali>
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624111519.15652-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624111519.15652-5-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Monday 24 June 2024 13:15:16 Hans de Goede wrote:
> +static int match_acpi_device_ids(struct device *dev, const void *data)
> +{

You can mark this function as __init as it is called only from
dell_lis3lv02d_init to free space.

> +	const struct acpi_device_id *ids = data;
> +
> +	return acpi_match_device(ids, dev) ? 1 : 0;
> +}
> +
> +static int __init dell_lis3lv02d_init(void)
> +{
> +	struct device *dev;
> +	int err;
> +
> +	/*
> +	 * First check for a matching platform_device. This protects against
> +	 * SMO88xx ACPI fwnodes which actually do have an I2C resource, which
> +	 * will already have an i2c_client instantiated (not a platform_device).
> +	 */
> +	dev = bus_find_device(&platform_bus_type, NULL, smo8800_ids, match_acpi_device_ids);
> +	if (!dev) {
> +		pr_debug("No SMO88xx platform-device found\n");
> +		return 0;

Is zero return value expected? Should not be it something like -ENODEV?

> +	}
> +	put_device(dev);
> +
> +	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
> +	if (!lis3lv02d_dmi_id) {

You can cache the value lis3lv02d_dmi_id->driver_data instead of caching
lis3lv02d_dmi_id pointer and then you can mark lis3lv02d_devices array
as __initconst to free additional space not needed at runtime on x86
machines without accelerometer where CONFIG_DELL_SMO8800=y.

> +		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> +		return 0;
> +	}
> +
> +	/*
> +	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
> +	 * i2c_client instantiation.
> +	 */
> +	err = bus_register_notifier(&i2c_bus_type, &i2c_nb);
> +	if (err)
> +		return err;
> +
> +	notifier_registered = true;
> +
> +	queue_work(system_long_wq, &i2c_work);
> +	return 0;
> +}
> +module_init(dell_lis3lv02d_init);
> +
> +static void __exit dell_lis3lv02d_module_exit(void)
> +{
> +	if (!notifier_registered)
> +		return;
> +
> +	bus_unregister_notifier(&i2c_bus_type, &i2c_nb);
> +	cancel_work_sync(&i2c_work);
> +	i2c_unregister_device(i2c_dev);
> +}
> +module_exit(dell_lis3lv02d_module_exit);
> +
> +MODULE_DESCRIPTION("lis3lv02d i2c-client instantiation for ACPI SMO88xx devices");
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.45.1
> 

