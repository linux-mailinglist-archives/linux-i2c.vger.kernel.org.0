Return-Path: <linux-i2c+bounces-6240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0EF96D969
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 14:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B361C22F03
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD52C19B3E4;
	Thu,  5 Sep 2024 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajEkP9cA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B817C990;
	Thu,  5 Sep 2024 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540804; cv=none; b=Dvv9+lj+bTcFlzyJxkKKrYmPXUEde/cf8sOqBJXpJRnG4za6GQEt/nzl/4vX5WYadOHNlQOBeJyPdOcf0eapArwKW3fMMT5dy9QFihsiq4qJqk18vLdpIORFPVjzcfwM3ysQfTXqlNVZisuXIoOvpZKqR0lZwJkFJHwW8fOnYyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540804; c=relaxed/simple;
	bh=oFGvPok7MsDliGzsy+zYXIB778PFeomkoWn56b3YJJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6XxqJz5F/Zo0W76ZoyUONePp39MgjSPwd2f1qL+/gTgFajK8H9O1mSZVgHIeLcWOIOHysu3zzSRGzG60mSciIes+yZxh2NNpJQ6GzYNQwTiNItdp/fjlqEKoVAgGzDRx1g6Qj/5PX+YRvK+I6blQwL0DR2RSph916Md8iUCy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajEkP9cA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19731C4CEC3;
	Thu,  5 Sep 2024 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725540804;
	bh=oFGvPok7MsDliGzsy+zYXIB778PFeomkoWn56b3YJJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ajEkP9cAcF2E3atqLWVwEeeU6UcZg2B6PUWDWaISsJn+gaQ2HjtQBs3pkrkN+Qsko
	 yIwJ9fz8D53CgYLd294O8DemjU6SzqH1PJ0qnr0VYMyUtrR2V/NPPmoqrH424JWflS
	 Bq2pi+sNxbQ3nItd7f3aeYkbgnqAT/TFS9iTzOrYWWt5AM3OXOjuIpYq6Kj473uBy/
	 eovbNheVbGkgM8WXK1MDm7XNeskgsskY5dkqm98sa2Ust7OiUeqcOMukmJyrK2kCyW
	 5cyY5qp8+AvZQq7UF1t0C56czZwIWB/3JS0RzdOzabnO1c5pXLVCl/AYYoINcsTEJj
	 RWfyT0gN/edAQ==
Date: Thu, 5 Sep 2024 14:53:17 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, michael.zaidman@gmail.com, gupt21@gmail.com, 
	djogorchock@gmail.com, rrameshbabu@nvidia.com, bonbons@linux-vserver.org, 
	roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com, me@jackdoan.com, 
	jdelvare@suse.com, linux@roeck-us.net, mail@mariuszachmann.de, 
	wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next 01/19] HID: core: Use devm_add_action_or_reset
 helper to manage hid resources
Message-ID: <cyils23bh4xaiw7bydlpapz4ngqpya3c4kesifrdpnme2t4bib@6elk7u3wvhh2>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-2-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904123607.3407364-2-lizetao1@huawei.com>

On Sep 04 2024, Li Zetao wrote:
> By adding a custom action to the device, it can bind the hid resource
> to the hid_device life cycle. The framework automatically close and stop
> the hid resources before hid_device is released, and the users do not
> need to pay attention to the timing of hid resource release.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/hid/hid-core.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/hid.h    |  2 ++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 30de92d0bf0f..71143c0a4a02 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2416,6 +2416,46 @@ void hid_hw_close(struct hid_device *hdev)
>  }
>  EXPORT_SYMBOL_GPL(hid_hw_close);
>  
> +static void hid_hw_close_and_stop(void *data)
> +{
> +	struct hid_device *hdev = data;
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +/**
> + * devm_hid_hw_start_and_open - manage hid resources through custom action
> + *
> + * @hdev: hid device
> + * @connect_mask: which outputs to connect, see HID_CONNECT_*
> + *
> + * Bind the hid resource to the hid_device life cycle and register
> + * an action to release the hid resource. The users do not need to
> + * pay attention to the release of hid.

The only problem I see here is that this API is not completely "safe",
in the sense that a driver using it can not use manual kzalloc/kfree.
It is obvious, but probably not so much while looking at the comments
from Guenter where he asked you to also remove the .remove() callback.

So in the docs, we should probably state that if the .remove() is any
different than "hid_hw_close(hdev);hid_hw_stop(hdev);", care should be
use with that function.

Cheers,
Benjamin

> + */
> +
> +int devm_hid_hw_start_and_open(struct hid_device *hdev, unsigned int connect_mask)
> +{
> +	int ret;
> +
> +	ret = hid_hw_start(hdev, connect_mask);
> +	if (ret) {
> +		hid_err(hdev, "hw start failed with %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hw open failed with %d\n", ret);
> +		hid_hw_stop(hdev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(&hdev->dev, hid_hw_close_and_stop, hdev);
> +}
> +EXPORT_SYMBOL_GPL(devm_hid_hw_start_and_open);
> +
>  /**
>   * hid_hw_request - send report request to device
>   *
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 121d5b8bc867..0ce217aa5f62 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -1125,6 +1125,8 @@ int __must_check hid_hw_start(struct hid_device *hdev,
>  void hid_hw_stop(struct hid_device *hdev);
>  int __must_check hid_hw_open(struct hid_device *hdev);
>  void hid_hw_close(struct hid_device *hdev);
> +int __must_check devm_hid_hw_start_and_open(struct hid_device *hdev,
> +					    unsigned int connect_mask);
>  void hid_hw_request(struct hid_device *hdev,
>  		    struct hid_report *report, enum hid_class_request reqtype);
>  int __hid_hw_raw_request(struct hid_device *hdev,
> -- 
> 2.34.1
> 

