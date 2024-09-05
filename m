Return-Path: <linux-i2c+bounces-6244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E196D998
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36B2FB21EAB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9CA19D07A;
	Thu,  5 Sep 2024 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzfT9hU3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB31119D06A;
	Thu,  5 Sep 2024 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541227; cv=none; b=P7VtbsYVvkV0C12IFigKhuZgtrpG8ipNuvigpsegQd03CjO69bHqb+Cpoqc3QRlSyJrQ3qBHJxYbZ4qB9butZoV9tOfoN/yFjAr4SWMiljfy+Xsre2lTkpgIPKBN7rjrRvtXs7cumOnOqCUfDUcwRmlmOwfv4jBRKW4Sp80UkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541227; c=relaxed/simple;
	bh=3wqaHI23Jwesidk2cJns3Jyp2S9llu3KpJl9oh0vI88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZR80o5lt/a21w5kSPVSy4but+b6jQrEIHf2rgzhlavANXRTTRS34wB5MzjD0nP9pz+Vlnr3yVB1lKjgsRYrTvbTu6ssGPNftR9Hg9QEGFQ4abPVqe765ZPs0EXCEwZhBayvmGb6nTyqD4jiOWd9Y8elfvoi6NUeHduNhp1HAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzfT9hU3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857DBC4CEC3;
	Thu,  5 Sep 2024 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725541227;
	bh=3wqaHI23Jwesidk2cJns3Jyp2S9llu3KpJl9oh0vI88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzfT9hU3cr1WJrF95NETfALO8tYSxP8HIsE4Qd5tIDjNL6R1i392JAkiXpqptYI8D
	 mYPGVC4FetGEeF5DJ3SFAM31MuJTz+E3K4Rny/1O6CkCmMnmz23qbKiftZlX8FPVL+
	 cXz3ae+XqEehwrephHMtP3DJlKmP1WOS7DKn3JsgX2WUDEl56/a6589mHagxQ/0wDA
	 wGIi213GSRogdIXV5oOZVY0KOjAytrpYXNcFOYCXUAhi0qPEaWmaV5hQCTi7snuuci
	 1ztbIcCekCQRq5Dc2cQZodYUqIgcGKlP47O6yKKQszD8DHMlliFLvzdB/cNAPq1PGU
	 naRYCzVf+WVaA==
Date: Thu, 5 Sep 2024 15:00:20 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, michael.zaidman@gmail.com, gupt21@gmail.com, 
	djogorchock@gmail.com, rrameshbabu@nvidia.com, bonbons@linux-vserver.org, 
	roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com, me@jackdoan.com, 
	jdelvare@suse.com, linux@roeck-us.net, mail@mariuszachmann.de, 
	wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next 10/19] HID: hid-steam: Use
 devm_hid_hw_start_and_open in steam_probe()
Message-ID: <udad6wcv7wikf46352ixutruyje5wqj7jviudc5nyogknxisde@enkogmc6aaqq>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-11-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904123607.3407364-11-lizetao1@huawei.com>

On Sep 04 2024, Li Zetao wrote:
> Currently, the hid-steam module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the err_hw_close and err_hw_stop lables.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/hid/hid-steam.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index bf8b633114be..d393762bf52f 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -1236,18 +1236,10 @@ static int steam_probe(struct hid_device *hdev,
>  	 * With the real steam controller interface, do not connect hidraw.
>  	 * Instead, create the client_hid and connect that.
>  	 */
> -	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_HIDRAW);
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_HIDRAW);
>  	if (ret)
>  		goto err_cancel_work;
>  
> -	ret = hid_hw_open(hdev);
> -	if (ret) {
> -		hid_err(hdev,
> -			"%s:hid_hw_open\n",
> -			__func__);
> -		goto err_hw_stop;
> -	}
> -
>  	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
>  		hid_info(hdev, "Steam wireless receiver connected");
>  		/* If using a wireless adaptor ask for connection status */
> @@ -1261,7 +1253,7 @@ static int steam_probe(struct hid_device *hdev,
>  			hid_err(hdev,
>  				"%s:steam_register failed with error %d\n",
>  				__func__, ret);
> -			goto err_hw_close;
> +			goto err_cancel_work;
>  		}
>  	}
>  
> @@ -1283,10 +1275,6 @@ static int steam_probe(struct hid_device *hdev,
>  err_steam_unregister:
>  	if (steam->connected)
>  		steam_unregister(steam);
> -err_hw_close:
> -	hid_hw_close(hdev);
> -err_hw_stop:
> -	hid_hw_stop(hdev);
>  err_cancel_work:
>  	cancel_work_sync(&steam->work_connect);
>  	cancel_delayed_work_sync(&steam->mode_switch);
> @@ -1312,8 +1300,6 @@ static void steam_remove(struct hid_device *hdev)
>  	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
>  		hid_info(hdev, "Steam wireless receiver disconnected");
>  	}
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
>  	steam_unregister(steam);

steam_unregister was called after hid_hw_stop, and now it's before.
Someone should ensure this is correct...

Cheers,
Benjamin

>  }
>  
> -- 
> 2.34.1
> 

