Return-Path: <linux-i2c+bounces-6292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB696E883
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 06:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B76E8B2341F
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 04:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266663B1A4;
	Fri,  6 Sep 2024 04:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="mswdmC2f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D49339FEB
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725595433; cv=none; b=VHhLt0lCTiQibYKDsrSOu+UGLt+gDBW59nQcIeRfDiIqdspeXBaxS9+kJbSwgLsJ346CU56KrXecmBYHxxSJyvjDoOgNRrvDlmb3IlnKaoCombXEuTjhrdopbYFrFJCgZZ2WrwHbDPNCsur5WtW0OJdJeBtnEHCskQl75NgSAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725595433; c=relaxed/simple;
	bh=Cl+XZOT8hYc3b65NiZ1qivtNXFlq5W1ZUyAoyCh1HDg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6KjU9rHe4zEyfzMmMZeSVF5E8A2MVzJaL/HXkrEDdzTLnP8Pi9HB+QwLjTtL89maF3AynUhtMVui5ln1RpIKG7CrONxaaemm1S1EZem6wvZ7l2tBiM1wFS/YYeE4LHMQqduQfS6M968AwrqDKKWdy21teoQSgkLtOOB/9qvYiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=mswdmC2f; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D6A7D240101
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 06:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1725595423; bh=Cl+XZOT8hYc3b65NiZ1qivtNXFlq5W1ZUyAoyCh1HDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=mswdmC2fmYVjYwiROheRTF3zuvXiwLFHC8Idl/PllEgHkKzORWlHHzcfulipFPIsA
	 0FPKPsTFQT3r1xTFiaC7JNf9ooEg83iZ9w0nYMK+8pboLO+ZYrtARkG1PUpQ2AeSUQ
	 eKCRP38t4z8g8Lx7lpMw6Pi0PE2Q+UMFPpQ/olIdIpva7SBQYv3K+KVSa0G/cBpyN4
	 jpvJ+bp9cpo0JK2FsmM6SvZFtS+puRTE1HFczcK99Ax5AiP8tq8FD48FLpIsoGkbgD
	 5hNpp3ATpURw1tSuzjagsIkQpOLQQjFdxkvdr8eor7RCq/U6o/jR45httH+YmAdA0g
	 y+GBCcYKL4mvA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4X0MzG6gcxz6tvl;
	Fri,  6 Sep 2024 06:03:38 +0200 (CEST)
Date: Fri,  6 Sep 2024 04:03:38 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
 <gupt21@gmail.com>, <djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
 <bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
 <david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
 <jdelvare@suse.com>, <linux@roeck-us.net>, <mail@mariuszachmann.de>,
 <jonas@protocubo.io>, <mezin.alexander@gmail.com>,
 <linux-input@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH -next 15/19] hwmon: (corsair-psu) Use
 devm_hid_hw_start_and_open in corsairpsu_probe()
Message-ID: <20240906060338.0e1aecdc@posteo.net>
In-Reply-To: <20240904123607.3407364-16-lizetao1@huawei.com>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
	<20240904123607.3407364-16-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Sep 2024 20:36:03 +0800
Li Zetao <lizetao1@huawei.com> wrote:

> Currently, the corsair-psu module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/hwmon/corsair-psu.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index f8f22b8a67cd..b574ec9cd00f 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -787,14 +787,10 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
> hid_device_id if (ret)
>  		return ret;
>  
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
>  	if (ret)
>  		return ret;
>  
> -	ret = hid_hw_open(hdev);
> -	if (ret)
> -		goto fail_and_stop;
> -
>  	priv->hdev = hdev;
>  	hid_set_drvdata(hdev, priv);
>  	mutex_init(&priv->lock);
> @@ -805,13 +801,13 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
> hid_device_id ret = corsairpsu_init(priv);
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "unable to initialize device (%d)\n", ret);
> -		goto fail_and_stop;
> +		return ret;
>  	}
>  
>  	ret = corsairpsu_fwinfo(priv);
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "unable to query firmware (%d)\n", ret);
> -		goto fail_and_stop;
> +		return ret;
>  	}
>  
>  	corsairpsu_get_criticals(priv);
> @@ -820,20 +816,12 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
> hid_device_id priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsairpsu", priv,
>  							  &corsairpsu_chip_info, NULL);
>  
> -	if (IS_ERR(priv->hwmon_dev)) {
> -		ret = PTR_ERR(priv->hwmon_dev);
> -		goto fail_and_close;
> -	}
> +	if (IS_ERR(priv->hwmon_dev))
> +		return PTR_ERR(priv->hwmon_dev);
>  
>  	corsairpsu_debugfs_init(priv);
>  
>  	return 0;
> -
> -fail_and_close:
> -	hid_hw_close(hdev);
> -fail_and_stop:
> -	hid_hw_stop(hdev);
> -	return ret;
>  }
>  
>  static void corsairpsu_remove(struct hid_device *hdev)
> @@ -842,8 +830,6 @@ static void corsairpsu_remove(struct hid_device *hdev)
>  
>  	debugfs_remove_recursive(priv->debugfs);
>  	hwmon_device_unregister(priv->hwmon_dev);
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
>  }
>  
>  static int corsairpsu_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data,

So far looks fine to me.

Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

greetings,
Wilken

