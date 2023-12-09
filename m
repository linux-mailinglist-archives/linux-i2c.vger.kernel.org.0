Return-Path: <linux-i2c+bounces-697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377EE80B0CF
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 01:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 650391C20B19
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 00:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5078373;
	Sat,  9 Dec 2023 00:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyp1eqJc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A0184
	for <linux-i2c@vger.kernel.org>; Sat,  9 Dec 2023 00:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54C5C433C8;
	Sat,  9 Dec 2023 00:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702080611;
	bh=XwpafKSxSIaU9fO0Z1UPvQPkXRe7CXV3jWPAij1MXpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyp1eqJcUWRaLF+8m75gLOK//4mNJy/GuZHSvYCaXRgJz9esiNNrjvs+umzyX9dqU
	 LxkG5R2NuGxY8iNhia+dC8pzM8O1iMzrpx79tD0UxIQSmmauB9VjAKNAQV7XQTgZX1
	 mhvs54RCEGnSFYldR2F6PZij6IlDsx9fLXFaajWViQ2rSpv0VzOo6ZKH0Wg4WDQ2RN
	 w+Fy8HE4TwXztb2YZLZnfteLXRI37sDiuiNCGp0m6XIttof0K2RaYcfj5ycn2QGGkY
	 px1E/jOzxzhSMKWu22gsrHkYucocPl1lm1KsQ7utaP8cMCKEoZD7JCtESAvYEZx8DI
	 LhxTREBtKbX3g==
Date: Sat, 9 Dec 2023 01:10:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jochen Friedrich <jochen@scram.de>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
Message-ID: <20231209001004.n6dcdjwf2dqjctap@zenone.zhora.eu>
References: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>

Hi Christophe,

On Wed, Dec 06, 2023 at 11:24:03PM +0100, Christophe Leroy wrote:
> sparse reports an error on some data that gets converted from be32.
> 
> That's because that data is typed u32 instead of __be32.
> 
> The type is correct, the be32_to_cpu() conversion is not.
> 
> Remove the conversion.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@intel.com/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Use u32 directly, remove be32_to_cpu().
> ---
>  drivers/i2c/busses/i2c-cpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 9a664abf734d..771d60bc8d71 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -658,7 +658,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
>  	/* register new adapter to i2c module... */
>  
>  	data = of_get_property(ofdev->dev.of_node, "linux,i2c-index", &len);
> -	cpm->adap.nr = (data && len == 4) ? be32_to_cpup(data) : -1;
> +	cpm->adap.nr = (data && len == 4) ? *data : -1;

thanks!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

