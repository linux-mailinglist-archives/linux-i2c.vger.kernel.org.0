Return-Path: <linux-i2c+bounces-555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F3F7FE421
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 00:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340C72820E7
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 23:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11A047A49;
	Wed, 29 Nov 2023 23:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czyY+fkO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D847A44
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 23:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263AEC433C7;
	Wed, 29 Nov 2023 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701300032;
	bh=YXXUetntHaoD/oZOG6nHngu5pIoCCOvIwSu2+9ObcQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=czyY+fkOLMklJdZ7Zkn+OXhMF8fk8zJmtbIPKzSRViHsA6ibYGWCyOX2SjD4mJrej
	 z2zBQrXU53T8qKfkxklZ+P5HShDm5DSIJ8+nWDgFqPA/RfzK6CyngSUKAvpsrwaLSG
	 qUFtjdGHYVBf0DpLgy+BBtOXOnQQnQXTII2rNBrFUwEWlUzuAL+Km3uCDXjRzbkRNH
	 vbGxWnm3OmiGlnk247GQl7AjTsDRuEnQ94vsAqZHucKaJNtaMMjvy46iDvJFpbz6H0
	 wfoN+o67vEdLmG06cK96HahHiE8tcCAVTkjsjBpbC6ZM4fqQm5jApykxGUJVpwYVRw
	 V9Kz5ltsQWYTg==
Date: Thu, 30 Nov 2023 00:20:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 24/24] i2c: designware: Fix spelling and other issues
 in the comments
Message-ID: <20231129232028.nvcucoapxe4fhraw@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-25-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-25-andriy.shevchenko@linux.intel.com>

Hi Andy,

[...]

> @@ -210,12 +210,12 @@ static void psp_release_i2c_bus(void)
>  {
>  	mutex_lock(&psp_i2c_access_mutex);
>  
> -	/* Return early if mailbox was malfunctional */
> +	/* Return early if mailbox was malfunctioned */

has malfunctioned?

>  	if (psp_i2c_mbox_fail)
>  		goto cleanup;
>  
>  	/*
> -	 * If we are last owner of PSP semaphore, need to release aribtration
> +	 * If we are last owner of PSP semaphore, need to release arbitration
>  	 * via mailbox.
>  	 */

as we are at this, perhaps we can add some articles and pronouns
to improve the grammar:

	/*
	 * If we are the last owner of the PSP semaphore, we need to release
	 * arbitration via the mailbox
	 */

Rest looks good.

Thanks,
Andi

