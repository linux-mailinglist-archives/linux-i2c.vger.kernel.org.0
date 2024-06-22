Return-Path: <linux-i2c+bounces-4242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025AC913404
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E091C20A33
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A3816EC05;
	Sat, 22 Jun 2024 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjcY/ckR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653EA16EBE8;
	Sat, 22 Jun 2024 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719060408; cv=none; b=AzZv6DbjENr9lmplqQiKa/Auxb8ZRyrJ5llcdfqZxC2xsb3NrAMHK+aVeVrHMbh8eNBYNeUQXcY59OXD5GeKfXOp3k++DWVCf8QYTH1yL5wI+DJDynr89CEnUdsvsu4ZHhpJXgtZ66LF9HzGD4D6rb5EV1Yby4hoMxf77F8Aiog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719060408; c=relaxed/simple;
	bh=QqRuQnYNPX5C0jyr55ohvewvbvDjaUA3wkrzk5Be3+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFFleeplcbzsRhGvMMhQ1pEkdEUocBrBGbkUqmCiPjDG57bt15Iv3m+2+Yb+QUUOzOli2+/6ITje+LznmBfBGG1ys2N0ATmmEMroQblDELaSwcgOe3rT4Q4sxgAE9kq77y6x9ahAGW5sbyDHnV0qVCLro6kMiuAq+PMamS7GTPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjcY/ckR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07A3C3277B;
	Sat, 22 Jun 2024 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719060407;
	bh=QqRuQnYNPX5C0jyr55ohvewvbvDjaUA3wkrzk5Be3+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjcY/ckRJnajSC9NwKRbXUGwF0uOdPa6LPBxfUeHUOh3Tz5S74/c47Q6Qr4D6iwEt
	 L+RsxK0drrVq4o8Ikrb3cPAGmZjhFindlAWn3QdoiKxwNoyWxpBnzUffcp/vFhlvft
	 zw04aELarzE8rMTHc8VL72rzshEbYc9IXyIiWvBzrXdDCwlrf7uamZMoO3TvLe4iX2
	 KQ5anbk4BqwPawzlWomW8CBMNFGf9GJY7/8IwKnDSp98agFcmSOP+kYa4r0HSrmisO
	 +7ELU6ShssmoGgu3zJcvoBmrLgw5ZIKYBMm5vkeXKOp1dkzZ4g/h2LJervmPbVkao+
	 Gt7Wn3uqZDxOw==
Received: by pali.im (Postfix)
	id 68FB764C; Sat, 22 Jun 2024 14:46:44 +0200 (CEST)
Date: Sat, 22 Jun 2024 14:46:44 +0200
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
Subject: Re: [PATCH v3 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <20240622124644.hndwwp44sfbiiq7o@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122503.10034-3-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
> On chipsets with a second 'Integrated Device Function' SMBus controller use
> a different adapter-name for the second IDF adapter.
> 
> This allows platform glue code which is looking for the primary i801
> adapter to manually instantiate i2c_clients on to differentiate
> between the 2.
> 
> This allows such code to find the primary i801 adapter by name, without
> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index d2d2a6dbe29f..5ac5bbd60d45 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  
>  	i801_add_tco(priv);
>  
> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> -		"SMBus I801 adapter at %04lx", priv->smba);
> +	if (priv->features & FEATURE_IDF)
> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
> +	else
> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> +			"SMBus I801 adapter at %04lx", priv->smba);
> +

User visible name is identifier for user / human.

If somebody is going to read this code in next 10 years then can ask
question why to have different name for IDF FEATURE and not also for
other features? And can come to conclusion to unify all names to be
same (why not? it is user identifier).

Depending on user names between different kernel subsystem is fragile,
specially for future as rename can happen.

If you are depending on FEATURE_IDF flag then check for the flag
directly, and not hiding the flag by serializing it into the user
visible name (char[] variable) and then de-serializing it in different
kernel subsystem. If the flag is not exported yet then export it via
some function or other API.

Using user name via char[] for internal flags is misusing user visible
name structures.

>  	err = i2c_add_adapter(&priv->adapter);
>  	if (err) {
>  		platform_device_unregister(priv->tco_pdev);
> -- 
> 2.45.1
> 

