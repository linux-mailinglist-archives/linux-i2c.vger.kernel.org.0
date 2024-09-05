Return-Path: <linux-i2c+bounces-6242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DC96D987
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 14:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC3BBB20FB5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 12:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF42919C555;
	Thu,  5 Sep 2024 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SijhBsCD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1419AD7B;
	Thu,  5 Sep 2024 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541152; cv=none; b=EuB6E781Yl2FqaYhpyEoF7y+dWeeK7QTXiKFSsxYG/cBNIzveDdZf0ORDaSzmWKDEls77rD1WgoWRib/MU3IAhe+QYzBy6nQmB8m1SYe3yzVsRhupCSUYoWO36iHhPYr4EoVmlawBL9RktBurzyvJsISl0QKkcdvSoF6kMA4URM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541152; c=relaxed/simple;
	bh=fSCmk7AAoxfpZD5qco5XiZ2ONj8/YnFat3TDMN7ocyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdkykqEJ0obOCtFVqIXT4SKbRAdp3PAn/hgHree0q3vV+GTPnExTZW5YhiUFYV2shpA2HNrUyEPNaC8Pz1Om3eOlMWCppvda3/lGK+zgdQpOebGFlOMS75fmmE1d+KDY6DqXVrewsjPokAXa7qzICGPDRxWARHcfcTQVRue9Yv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SijhBsCD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7739C4CEC4;
	Thu,  5 Sep 2024 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725541151;
	bh=fSCmk7AAoxfpZD5qco5XiZ2ONj8/YnFat3TDMN7ocyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SijhBsCDaZ2BTiy/lw0WWMQisj0hej0rt+JEB3g/cwL6Vr9uKHbTYYaOsRvBhkYLw
	 N16yPUQL7dq6O0YS0V5EDXEvUT5zUthHmH1p+pOxDBho9lUkZqY4nzU3RvhOaj0so9
	 gLhK0deB5QZJ3rEaQ2Kn+eNf21oEeYs1tFW9ojwHbLAqAMStfIyCjhEOgXoPGFPrtd
	 FrR4ToevwPhwzD7qAHNGeJEYVNo0OH3vsRYx6Rya33EWa7gUoG+EMLmwb2pNZ6d+dJ
	 xHlZ5wZT8XyC3lwJ0V3fYq9NYL64MeY8Sz4rzJEPVkO4U54YMoLMy1MgS/UriHea/8
	 R8u4ky/T/rZ0g==
Date: Thu, 5 Sep 2024 14:59:05 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, michael.zaidman@gmail.com, gupt21@gmail.com, 
	djogorchock@gmail.com, rrameshbabu@nvidia.com, bonbons@linux-vserver.org, 
	roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com, me@jackdoan.com, 
	jdelvare@suse.com, linux@roeck-us.net, mail@mariuszachmann.de, 
	wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next 08/19] HID: hid-picolcd: Use
 devm_hid_hw_start_and_open in picolcd_probe()
Message-ID: <35iaar3zylzs6gijfetid5rx65qehxtn4laiwqeefrggbwsgp5@7s3zhulv6pf7>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-9-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904123607.3407364-9-lizetao1@huawei.com>

On Sep 04 2024, Li Zetao wrote:
> Currently, the hid-picolcd module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the err_cleanup_hid_ll and
> err_cleanup_hid_hw lables.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/hid/hid-picolcd_core.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
> index 297103be3381..973822d1b2db 100644
> --- a/drivers/hid/hid-picolcd_core.c
> +++ b/drivers/hid/hid-picolcd_core.c
> @@ -551,23 +551,15 @@ static int picolcd_probe(struct hid_device *hdev,
>  		goto err_cleanup_data;
>  	}
>  
> -	error = hid_hw_start(hdev, 0);
> +	error = devm_hid_hw_start_and_open(hdev, 0);
>  	if (error) {
> -		hid_err(hdev, "hardware start failed\n");
> +		hid_err(hdev, "hardware start and open failed\n");
>  		goto err_cleanup_data;
>  	}
>  
> -	error = hid_hw_open(hdev);
> -	if (error) {
> -		hid_err(hdev, "failed to open input interrupt pipe for key and IR events\n");
> -		goto err_cleanup_hid_hw;
> -	}
> -
>  	error = device_create_file(&hdev->dev, &dev_attr_operation_mode_delay);
> -	if (error) {
> -		hid_err(hdev, "failed to create sysfs attributes\n");
> -		goto err_cleanup_hid_ll;
> -	}
> +	if (error)
> +		goto err_cleanup_data;
>  
>  	error = device_create_file(&hdev->dev, &dev_attr_operation_mode);
>  	if (error) {
> @@ -589,10 +581,6 @@ static int picolcd_probe(struct hid_device *hdev,
>  	device_remove_file(&hdev->dev, &dev_attr_operation_mode);
>  err_cleanup_sysfs1:
>  	device_remove_file(&hdev->dev, &dev_attr_operation_mode_delay);
> -err_cleanup_hid_ll:
> -	hid_hw_close(hdev);
> -err_cleanup_hid_hw:
> -	hid_hw_stop(hdev);
>  err_cleanup_data:
>  	kfree(data);
>  	return error;
> @@ -611,8 +599,6 @@ static void picolcd_remove(struct hid_device *hdev)
>  	picolcd_exit_devfs(data);
>  	device_remove_file(&hdev->dev, &dev_attr_operation_mode);
>  	device_remove_file(&hdev->dev, &dev_attr_operation_mode_delay);
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);

Again, this doesn't seem correct. the spin_lock from below expects the
hw to be stopped, and this patch changes that by postponing the stop
after the remove.

CHeers,
Benjamin

>  
>  	/* Shortcut potential pending reply that will never arrive */
>  	spin_lock_irqsave(&data->lock, flags);
> -- 
> 2.34.1
> 

