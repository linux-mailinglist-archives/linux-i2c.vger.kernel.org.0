Return-Path: <linux-i2c+bounces-6241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F096D982
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 14:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA4E282A93
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 12:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDEA19C56D;
	Thu,  5 Sep 2024 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmIcRoh7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974419AD7B;
	Thu,  5 Sep 2024 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541073; cv=none; b=QCTtXPDAjfjJ8Sewb/o8fhY3sQq3tzTSsZp8ljq+N1rj225+M/DJjBhRcr+rnJSlrIK9YFhrE+oo1vs3wSlzgqNX2MJ0iHd+7O4PM54QO0NgP7eGhOfkFAHTo5gAiYDsuuL1O5WiKDJegSRuXe9JisjJLFMqEZQKsxg30bFkGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541073; c=relaxed/simple;
	bh=pI23NoHUC8+atdFizIb2aBMvncRicjoZ/lDeje3gwFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqyVOVig+sbW8sVWqlKilGRuhsakclqS9wvckTTCzyRx7UYtucj48HCsqzE9BBCwvp9Alymzj4/N+hsPiPT7z+tygFnxpEYSSEsJGjOHVK2cN4CQZPh+8Ukhvgw1gHG8OyX5DR+boOejWvK25ihkuT0WqF8TtYaxReG5oJfKirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmIcRoh7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F2CC4CEC4;
	Thu,  5 Sep 2024 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725541073;
	bh=pI23NoHUC8+atdFizIb2aBMvncRicjoZ/lDeje3gwFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmIcRoh7Gx5xrzM4F1VRnXn4GotpccZzWbZNmDFv2jZlAUaj+EzlS8A/wCYbRloBZ
	 LbdTy+kG5QoBvgEyjDa/Y6YW7X+XrchHaejRbpXAOfD4YkAupQ2fuHRnS4o0okm4s1
	 Ex3RGqc1Ko+aL0p2st0XsZR1LXAJ/HtZDqDVHu/eZsEBSgFOwFiMX9Y8B4LMpnISXD
	 mU/uE1cTC07LfWDduOSxgNxMJSi/86alqwjKdWQ8tWPN2sSdOggochuHd3mFwPGJsA
	 pHlKjv2cXJ9dhRbhJudWTeo35zlvTkmgLw8+zMiILHtmq2zq+TnsrBuhL0NtyD0EUT
	 FUrc79KzUClMA==
Date: Thu, 5 Sep 2024 14:57:46 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, michael.zaidman@gmail.com, gupt21@gmail.com, 
	djogorchock@gmail.com, rrameshbabu@nvidia.com, bonbons@linux-vserver.org, 
	roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com, me@jackdoan.com, 
	jdelvare@suse.com, linux@roeck-us.net, mail@mariuszachmann.de, 
	wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next 07/19] HID: shield: Use devm_hid_hw_start_and_open
 in shield_probe()
Message-ID: <bsjntlrlep2bzf3ttbvwkxznsryiygadlwixqd5t43jftsu54b@c6u5cxoknjak>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-8-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904123607.3407364-8-lizetao1@huawei.com>

On Sep 04 2024, Li Zetao wrote:
> Currently, the shield module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the err_stop and err_ts_create lables, and
> directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/hid/hid-nvidia-shield.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
> index ff9078ad1961..747996a21dd9 100644
> --- a/drivers/hid/hid-nvidia-shield.c
> +++ b/drivers/hid/hid-nvidia-shield.c
> @@ -1070,27 +1070,15 @@ static int shield_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  
>  	ts = container_of(shield_dev, struct thunderstrike, base);
>  
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDINPUT);
>  	if (ret) {
> -		hid_err(hdev, "Failed to start HID device\n");
> -		goto err_ts_create;
> -	}
> -
> -	ret = hid_hw_open(hdev);
> -	if (ret) {
> -		hid_err(hdev, "Failed to open HID device\n");
> -		goto err_stop;
> +		thunderstrike_destroy(ts);
> +		return ret;
>  	}
>  
>  	thunderstrike_device_init_info(shield_dev);
>  
>  	return ret;
> -
> -err_stop:
> -	hid_hw_stop(hdev);
> -err_ts_create:
> -	thunderstrike_destroy(ts);
> -	return ret;
>  }
>  
>  static void shield_remove(struct hid_device *hdev)
> @@ -1100,11 +1088,9 @@ static void shield_remove(struct hid_device *hdev)
>  
>  	ts = container_of(dev, struct thunderstrike, base);
>  
> -	hid_hw_close(hdev);
>  	thunderstrike_destroy(ts);
>  	del_timer_sync(&ts->psy_stats_timer);
>  	cancel_work_sync(&ts->hostcmd_req_work);
> -	hid_hw_stop(hdev);

There is definitely something fishy here. The 2 calls to hid_hw_close
and hid_hw_stop are not one after the other and at the very end of the
.remove(). The patch is changing the behavior, and this might be an
issue.

Cheers,
Benjamin

>  }
>  
>  static const struct hid_device_id shield_devices[] = {
> -- 
> 2.34.1
> 

