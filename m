Return-Path: <linux-i2c+bounces-4244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5DA91342E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D53DB20B18
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 13:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25C616F0F6;
	Sat, 22 Jun 2024 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5qaJ9zJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BA9449;
	Sat, 22 Jun 2024 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719062449; cv=none; b=lOeKWveMctZGM4lAOKEVLYtdhENa7nrmva6qjywPdnZv6c2DwUGUOXLJ3svJZGVcVJ/3fwf3uEDqvcyConYF4dwgjHmHeq/OOH4fzJ47JjR45h9RqsDDdNhaGV5px99udBg8twRrWEd/kNO6/POQYL2NVS1zm7wQv16n5q29dCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719062449; c=relaxed/simple;
	bh=ITJFyjYaGXiDiUwpSY/EXZgy56NFlJlFcevqHgf60/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYWSip88oIXFLeJRrN7tEXx5fhKrXJiY2K7vz5bIaIG4LVae2hNPPSySQ+oTfadJLwC0a+GyLUeBaanyOPo5STdhtC9EWYBFEHkh4lnF6yBoJeqntGJ3iMwj+QNxZlZWyQSWJhEKjs0Fzf3Pruok1wEDlu2PKNHVEWMW6GlMwIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5qaJ9zJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE36C3277B;
	Sat, 22 Jun 2024 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719062449;
	bh=ITJFyjYaGXiDiUwpSY/EXZgy56NFlJlFcevqHgf60/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5qaJ9zJ8Zp2UJNSvPMzReaRyqcYH5M8Lu0CDXwfdlvCQQXU9Kop3CO0Q6DPtGGZb
	 eV+RndiosYUOQlfTEmzr9D5fk1BiIpB6gI4ta5pzGrzIab6H/gSv5v3jdqKGcXp5B4
	 QaCQGRIP33NLnwcsmvSHJBMetGWAHgTjZ11ai5X306++gEQ3U3TuPlyjF0zY22om22
	 zDZqtU4W36BwMx2KzGrJKOQ0NONbTZo/eXLYJBoMKnbqStCIKDlCGhNtpwefGG9H/D
	 BCQxrCpl/H3ib9j1G3xE54Rpwi1t3y8CtIacpTWh8AuCgOZU/QciQkvzKdShq78g41
	 5PIuhuPxQbbpA==
Received: by pali.im (Postfix)
	id E158864C; Sat, 22 Jun 2024 15:20:45 +0200 (CEST)
Date: Sat, 22 Jun 2024 15:20:45 +0200
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
Subject: Re: [PATCH v3 4/6] platform/x86: dell-smo8800: Allow lis3lv02d
 i2c_client instantiation without IRQ
Message-ID: <20240622132045.tdm5os7ykdkdc3r6@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122503.10034-5-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 21 June 2024 14:24:59 Hans de Goede wrote:
> The Dell XPS 15 9550 can have a 60Wh battery, leaving space for a 2.5"
> sata disk; or a 90Wh battery in which case the battery occupies the space
> for the optional 2.5" sata disk.
> 
> On models with the 90Wh battery and thus without a 2.5" sata disk, the BIOS
> does not add an IRQ resource to the SMO8810 ACPI device.

That is a pity, but OK, manufacturer decided that freefall sensor is
enabled by BIOS firmware only if the SATA is present.

> Make the misc-device registration and the requesting of the IRQ optional
> and instantiate a lis3lv02d i2c_client independent of the IRQ being there,
> so that the non freefall lis3lv02d functionality can still be used.
> 
> Note that IRQ 0 is not a valid IRQ number for platform IRQs
> and this patch relies on that.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell/dell-smo8800.c | 67 +++++++++++++-----------
>  1 file changed, 37 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> index cd2e48405859..2e49bbb569c6 100644
> --- a/drivers/platform/x86/dell/dell-smo8800.c
> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> @@ -310,33 +310,32 @@ static int smo8800_probe(struct platform_device *device)
>  	init_waitqueue_head(&smo8800->misc_wait);
>  	INIT_WORK(&smo8800->i2c_work, smo8800_instantiate_i2c_client);
>  
> -	err = misc_register(&smo8800->miscdev);
> -	if (err) {
> -		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
> -		return err;
> +	err = platform_get_irq_optional(device, 0);
> +	if (err > 0)
> +		smo8800->irq = err;

This code should be rather change to fail immediately. If the IRQ number
is not provided by the BIOS then the ACPI SMO88xx is not usable for us
at all. So return error from the smo8800_probe function.

> +
> +	if (smo8800->irq) {
> +		err = misc_register(&smo8800->miscdev);
> +		if (err) {
> +			dev_err(&device->dev, "failed to register misc dev: %d\n", err);
> +			return err;
> +		}
> +
> +		err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
> +					   smo8800_interrupt_thread,
> +					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					   DRIVER_NAME, smo8800);
> +		if (err) {
> +			dev_err(&device->dev,
> +				"failed to request thread for IRQ %d: %d\n",
> +				smo8800->irq, err);
> +			goto error;
> +		}
> +
> +		dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
> +			 smo8800->irq);
>  	}
>  
> -	platform_set_drvdata(device, smo8800);
> -
> -	err = platform_get_irq(device, 0);
> -	if (err < 0)
> -		goto error;
> -	smo8800->irq = err;
> -
> -	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
> -				   smo8800_interrupt_thread,
> -				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> -				   DRIVER_NAME, smo8800);
> -	if (err) {
> -		dev_err(&device->dev,
> -			"failed to request thread for IRQ %d: %d\n",
> -			smo8800->irq, err);
> -		goto error;
> -	}
> -
> -	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
> -		 smo8800->irq);
> -
>  	if (dmi_check_system(smo8800_lis3lv02d_devices)) {
>  		/*
>  		 * Register i2c-bus notifier + queue initial scan for lis3lv02d
> @@ -350,14 +349,20 @@ static int smo8800_probe(struct platform_device *device)
>  	} else {
>  		dev_warn(&device->dev,
>  			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> +		if (!smo8800->irq)
> +			return -ENODEV;
>  	}
>  
> +	platform_set_drvdata(device, smo8800);
>  	return 0;
>  
>  error_free_irq:
> -	free_irq(smo8800->irq, smo8800);
> +	if (smo8800->irq) {
> +		free_irq(smo8800->irq, smo8800);
>  error:
> -	misc_deregister(&smo8800->miscdev);
> +		misc_deregister(&smo8800->miscdev);
> +	}
> +
>  	return err;
>  }
>  
> @@ -371,9 +376,11 @@ static void smo8800_remove(struct platform_device *device)
>  		i2c_unregister_device(smo8800->i2c_dev);
>  	}
>  
> -	free_irq(smo8800->irq, smo8800);
> -	misc_deregister(&smo8800->miscdev);
> -	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
> +	if (smo8800->irq) {
> +		free_irq(smo8800->irq, smo8800);
> +		misc_deregister(&smo8800->miscdev);
> +		dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
> +	}
>  }
>  
>  static const struct acpi_device_id smo8800_ids[] = {
> -- 
> 2.45.1
> 

