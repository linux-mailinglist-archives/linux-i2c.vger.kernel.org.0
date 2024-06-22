Return-Path: <linux-i2c+bounces-4260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D89134B7
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 17:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5A61C20DCC
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D500616F8FC;
	Sat, 22 Jun 2024 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StOnyCaw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE3E155CBD;
	Sat, 22 Jun 2024 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719069295; cv=none; b=cqC7WUY38W2+AHqsCGvl6NKW2O16jOSvGiOB5plsWr8W4E5C/ys2+Pjq1qAcyQLDFFXlPxYAbcGjdCRP45XY8iKNKxDVaIhfCUcOPwvjLPuRGy4sbltemdSOlDybZgZLJ8kL9dvQI2e7mUNrWk28MMvnWFbTHoT1FFRjPuToe8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719069295; c=relaxed/simple;
	bh=1VwO8ZV3s8A3c4QDwxu2Pe9NnSRf5cwe4qupATCX4vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+1GMROrAuUY54xONBkj0QcbOjaOiCjaQ/wH0q9ex4w63CyHrWPny0Bngh4rPVHSj8UUgmXSxriPHB9jh4RudScxe94/Jx23AXIb7bygiYhL2+lBHDoYWLL5vs9MJWiRsg6jqM4rIIGLwIz3CR5+noZdB5ZhPFuNY35XWBJo8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StOnyCaw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72E5C3277B;
	Sat, 22 Jun 2024 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719069295;
	bh=1VwO8ZV3s8A3c4QDwxu2Pe9NnSRf5cwe4qupATCX4vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StOnyCawOwA87nUDKg1Jbkc2seafuxGVmGeFJQ8tLiyw0WZUgc3uhSiN3yJnxu6cf
	 5iVgUqVzy1k52rjVUHUP4pgoeY/y4KCJ6xHBvNCjco4XDkhZRIFEzZ44IqWXBu2w/L
	 Wih04vRS5TYD4eYzyX5mcPxLH9XjyKHmfs0RtcCCVdiBqblvx1hm9jgcQV5d8YYwwC
	 i4tueos2F6bc5pdSrnO2rwQgGzBq7kO1iJVbLcR/CNQ0FVqyrB5JHJnkZS4FQaxkKc
	 CL7qZidquRMlkhFIONEEKUJxGWuaxeLT4H8w+hgC8ocfXKtQsKDdksPbKKBcreVOhg
	 zkTtMYpV4hS1Q==
Received: by pali.im (Postfix)
	id ECCAEBF5; Sat, 22 Jun 2024 17:14:51 +0200 (CEST)
Date: Sat, 22 Jun 2024 17:14:51 +0200
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
Message-ID: <20240622151451.auxinkfuwwgxzxdk@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-5-hdegoede@redhat.com>
 <20240622132045.tdm5os7ykdkdc3r6@pali>
 <5685ad31-f147-4478-b67f-d918b17ed9b9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5685ad31-f147-4478-b67f-d918b17ed9b9@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 22 June 2024 16:07:53 Hans de Goede wrote:
> Hi Pali,
> 
> On 6/22/24 3:20 PM, Pali Rohár wrote:
> > On Friday 21 June 2024 14:24:59 Hans de Goede wrote:
> >> The Dell XPS 15 9550 can have a 60Wh battery, leaving space for a 2.5"
> >> sata disk; or a 90Wh battery in which case the battery occupies the space
> >> for the optional 2.5" sata disk.
> >>
> >> On models with the 90Wh battery and thus without a 2.5" sata disk, the BIOS
> >> does not add an IRQ resource to the SMO8810 ACPI device.
> > 
> > That is a pity, but OK, manufacturer decided that freefall sensor is
> > enabled by BIOS firmware only if the SATA is present.
> > 
> >> Make the misc-device registration and the requesting of the IRQ optional
> >> and instantiate a lis3lv02d i2c_client independent of the IRQ being there,
> >> so that the non freefall lis3lv02d functionality can still be used.
> >>
> >> Note that IRQ 0 is not a valid IRQ number for platform IRQs
> >> and this patch relies on that.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/platform/x86/dell/dell-smo8800.c | 67 +++++++++++++-----------
> >>  1 file changed, 37 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> >> index cd2e48405859..2e49bbb569c6 100644
> >> --- a/drivers/platform/x86/dell/dell-smo8800.c
> >> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> >> @@ -310,33 +310,32 @@ static int smo8800_probe(struct platform_device *device)
> >>  	init_waitqueue_head(&smo8800->misc_wait);
> >>  	INIT_WORK(&smo8800->i2c_work, smo8800_instantiate_i2c_client);
> >>  
> >> -	err = misc_register(&smo8800->miscdev);
> >> -	if (err) {
> >> -		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
> >> -		return err;
> >> +	err = platform_get_irq_optional(device, 0);
> >> +	if (err > 0)
> >> +		smo8800->irq = err;
> > 
> > This code should be rather change to fail immediately. If the IRQ number
> > is not provided by the BIOS then the ACPI SMO88xx is not usable for us
> > at all. So return error from the smo8800_probe function.
> 
> The goal of this patch is to still register the bus-notifier for i2c-client
> instantiation for the lis3lv02d driver. Existing immediately here (as was
> done before) means we will still not register the bus-notifier.

If the lis3 part would be moved into separate module then there is no
need to add these checks. So it clearly shows that lis3 and smo parts
are independent and it could make sense to separate them as pointed
under other patch.

> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> >> +
> >> +	if (smo8800->irq) {
> >> +		err = misc_register(&smo8800->miscdev);
> >> +		if (err) {
> >> +			dev_err(&device->dev, "failed to register misc dev: %d\n", err);
> >> +			return err;
> >> +		}
> >> +
> >> +		err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
> >> +					   smo8800_interrupt_thread,
> >> +					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> >> +					   DRIVER_NAME, smo8800);
> >> +		if (err) {
> >> +			dev_err(&device->dev,
> >> +				"failed to request thread for IRQ %d: %d\n",
> >> +				smo8800->irq, err);
> >> +			goto error;
> >> +		}
> >> +
> >> +		dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
> >> +			 smo8800->irq);
> >>  	}
> >>  
> >> -	platform_set_drvdata(device, smo8800);
> >> -
> >> -	err = platform_get_irq(device, 0);
> >> -	if (err < 0)
> >> -		goto error;
> >> -	smo8800->irq = err;
> >> -
> >> -	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
> >> -				   smo8800_interrupt_thread,
> >> -				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> >> -				   DRIVER_NAME, smo8800);
> >> -	if (err) {
> >> -		dev_err(&device->dev,
> >> -			"failed to request thread for IRQ %d: %d\n",
> >> -			smo8800->irq, err);
> >> -		goto error;
> >> -	}
> >> -
> >> -	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
> >> -		 smo8800->irq);
> >> -
> >>  	if (dmi_check_system(smo8800_lis3lv02d_devices)) {
> >>  		/*
> >>  		 * Register i2c-bus notifier + queue initial scan for lis3lv02d
> >> @@ -350,14 +349,20 @@ static int smo8800_probe(struct platform_device *device)
> >>  	} else {
> >>  		dev_warn(&device->dev,
> >>  			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> >> +		if (!smo8800->irq)
> >> +			return -ENODEV;
> >>  	}
> >>  
> >> +	platform_set_drvdata(device, smo8800);
> >>  	return 0;
> >>  
> >>  error_free_irq:
> >> -	free_irq(smo8800->irq, smo8800);
> >> +	if (smo8800->irq) {
> >> +		free_irq(smo8800->irq, smo8800);
> >>  error:
> >> -	misc_deregister(&smo8800->miscdev);
> >> +		misc_deregister(&smo8800->miscdev);
> >> +	}
> >> +
> >>  	return err;
> >>  }
> >>  
> >> @@ -371,9 +376,11 @@ static void smo8800_remove(struct platform_device *device)
> >>  		i2c_unregister_device(smo8800->i2c_dev);
> >>  	}
> >>  
> >> -	free_irq(smo8800->irq, smo8800);
> >> -	misc_deregister(&smo8800->miscdev);
> >> -	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
> >> +	if (smo8800->irq) {
> >> +		free_irq(smo8800->irq, smo8800);
> >> +		misc_deregister(&smo8800->miscdev);
> >> +		dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
> >> +	}
> >>  }
> >>  
> >>  static const struct acpi_device_id smo8800_ids[] = {
> >> -- 
> >> 2.45.1
> >>
> > 
> 

