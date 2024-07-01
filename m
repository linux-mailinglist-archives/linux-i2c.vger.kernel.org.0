Return-Path: <linux-i2c+bounces-4756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B592A61E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 17:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3701C217F0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20E7144D1F;
	Mon,  8 Jul 2024 15:51:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC8C139568;
	Mon,  8 Jul 2024 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720453865; cv=none; b=sH25REIhoEGY60+VpLRglS6+DAOx5QZB8wdkJ5u5YmNzici2Zu4FO5E+G8dSivLmW8hee+a6amnF/RbREUvmL/cKGQwQlFVIlawMIRHOXx4rtmu/NLdM5LrXi8U+yE040RjatC+5PTfF4jFrEgzvV5VyaD4Y5UrtbAobyAFZRYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720453865; c=relaxed/simple;
	bh=ECmc62W1r8d4yhRxll02yvEPSMrRpCCmAb5dzYrKc8Q=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvGkIfABcOQMhPzUWiDwHzh0uJmh1emM6H7EDS3dbY/OCeT97t5Qyn0uKSIJetz3r/wcLe/XJdkUb0wbRHy6xv/+S5WR5P7Ix5z8PI3DBVB2OmYpI4dHROcipA9eUs3+YRGF74bHy/V835Q1neZY8mu/UD93WCPUdRMHhJZ0fGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WHpV81ty3z6J9dh;
	Mon,  8 Jul 2024 23:50:08 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 66BC11400CF;
	Mon,  8 Jul 2024 23:51:01 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 8 Jul
 2024 16:51:01 +0100
Date: Mon, 1 Jul 2024 10:12:04 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chen Ni <nichen@iscas.ac.cn>
CC: <gupt21@gmail.com>, <jikos@kernel.org>, <bentiss@kernel.org>,
	<matt@ranostay.sg>, <linux-i2c@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: mcp2221: Remove unneeded semicolon
Message-ID: <20240701101204.000065ca@Huawei.com>
In-Reply-To: <20240701071639.846169-1-nichen@iscas.ac.cn>
References: <20240701071639.846169-1-nichen@iscas.ac.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 1 Jul 2024 15:16:39 +0800
Chen Ni <nichen@iscas.ac.cn> wrote:

> Remove unneeded semicolon.
> This is detected by coccinelle.
> 
> Fixes: 960f9df7c620 ("HID: mcp2221: add ADC/DAC support via iio subsystem")

Fixes tag not appropriate for this one as it's not a bug.

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
Otherwise looks fine to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/hid/hid-mcp2221.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index da5ea5a23b08..0f93c22a479f 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -1048,7 +1048,7 @@ static int mcp_iio_channels(struct mcp2221 *mcp)
>  			break;
>  		default:
>  			continue;
> -		};
> +		}
>  
>  		chan->type = IIO_VOLTAGE;
>  		chan->indexed = 1;


