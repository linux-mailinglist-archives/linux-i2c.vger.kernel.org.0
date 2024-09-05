Return-Path: <linux-i2c+bounces-6245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D032E96D9CC
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AB061F27C83
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 13:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58A719B5B8;
	Thu,  5 Sep 2024 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwlAoow7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C32198E84;
	Thu,  5 Sep 2024 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541566; cv=none; b=a3AR7dCdO5LUcMNjno1FwKOsGsu3yU+A9ITtfqHHdljZQRA5YbDiiSEKHEGeuSiDqTQBj4mfhzVwtPhwPk8dhnhyR5qJZj1SJmWpNRlt02a5sn+x23pkRp3B2O0MtSL/kZ9lzNluwfc3TAFvRBDN5LRt12ivkWcJA3XTNjwZNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541566; c=relaxed/simple;
	bh=acZXG+NEgGbApdzreqH4x4D0viKe34CEFUdlqrespW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew6denpvZznELDxmdAZYcuz1+R1TTrgmgoc6C/5sDCeUE3ACHSKGNLM76K/9OE+1yTYcv/KSc4poJlCEc2+7baI+BtQoFQtAiQYgvq8229ZG3Ai8x46cdTnJ6c8KJdk+WebWAIuQa6dAXA40dw0XdizpeX0at/QYqxAiPbx/8j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwlAoow7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19F2C4CEC3;
	Thu,  5 Sep 2024 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725541566;
	bh=acZXG+NEgGbApdzreqH4x4D0viKe34CEFUdlqrespW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwlAoow7cYEVPsHIvj0yOvl1bnOUA3eEAvCF/HaFuNwX+cPkZQzavDZXoP3Hoj/UW
	 JtboKqflaU0zurhFBBDFMUtNuBgW7wzpWxyC5y/e6OzYs+8yvty0bHUgyYiZfd9dDW
	 RF1Lz/kBWnwOOLPOACwBtZ2/r5mZktezwy9vZwK0vZHHQE0OQKXOGCmARUJ2JIRvO0
	 H2CPtyPT4VuLzSJFo6W4DJgmvU5lj3TjB1LdT57pvBgmkHd2flMNvy7yUC6jN0Y2wW
	 tXlSEiu4dvex4IgZrkJf9DfXE8rdm5iagtLkrprqwU2Jg1nh1jAv4W71zqgWwt2EWb
	 ilKNHPf87/IEQ==
Date: Thu, 5 Sep 2024 15:05:59 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, michael.zaidman@gmail.com, gupt21@gmail.com, 
	djogorchock@gmail.com, rrameshbabu@nvidia.com, bonbons@linux-vserver.org, 
	roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com, me@jackdoan.com, 
	jdelvare@suse.com, linux@roeck-us.net, mail@mariuszachmann.de, 
	wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next 11/19] HID: wiimote: Use devm_hid_hw_start_and_open
 in wiimote_hid_probe()
Message-ID: <lgebzerb6e4tqnblwnt7zj7ysj5av2w5sqwieiugrtswm3ffmi@kxdhv72rsakb>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-12-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904123607.3407364-12-lizetao1@huawei.com>

On Sep 04 2024, Li Zetao wrote:
> Currently, the wiimote module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the err_close and err_stop lables.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/hid/hid-wiimote-core.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
> index 26167cfb696f..28cd9ccbb617 100644
> --- a/drivers/hid/hid-wiimote-core.c
> +++ b/drivers/hid/hid-wiimote-core.c
> @@ -1780,8 +1780,6 @@ static void wiimote_destroy(struct wiimote_data *wdata)
>  	wiimote_ext_unload(wdata);
>  	wiimote_modules_unload(wdata);
>  	cancel_work_sync(&wdata->queue.worker);
> -	hid_hw_close(wdata->hdev);
> -	hid_hw_stop(wdata->hdev);
>  
>  	kfree(wdata);

This is wrong because wdata is not devres managed.

So there is probably a race condition where it gets freed while the
underlying bus wasn't stopped.

Cheers,
Benjamin

>  }
> @@ -1806,22 +1804,14 @@ static int wiimote_hid_probe(struct hid_device *hdev,
>  		goto err;
>  	}
>  
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> -	if (ret) {
> -		hid_err(hdev, "HW start failed\n");
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
>  		goto err;
> -	}
> -
> -	ret = hid_hw_open(hdev);
> -	if (ret) {
> -		hid_err(hdev, "cannot start hardware I/O\n");
> -		goto err_stop;
> -	}
>  
>  	ret = device_create_file(&hdev->dev, &dev_attr_extension);
>  	if (ret) {
>  		hid_err(hdev, "cannot create sysfs attribute\n");
> -		goto err_close;
> +		goto err;
>  	}
>  
>  	ret = device_create_file(&hdev->dev, &dev_attr_devtype);
> @@ -1847,10 +1837,6 @@ static int wiimote_hid_probe(struct hid_device *hdev,
>  
>  err_ext:
>  	device_remove_file(&wdata->hdev->dev, &dev_attr_extension);
> -err_close:
> -	hid_hw_close(hdev);
> -err_stop:
> -	hid_hw_stop(hdev);
>  err:
>  	input_free_device(wdata->ir);
>  	input_free_device(wdata->accel);
> -- 
> 2.34.1
> 

