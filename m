Return-Path: <linux-i2c+bounces-3014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662C8AA28E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 21:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CA31285D53
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 19:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85B017AD9C;
	Thu, 18 Apr 2024 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6c3XuEf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612BA17A93E;
	Thu, 18 Apr 2024 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713467564; cv=none; b=niC/lmoM+Uoyye6AjjQfU9pPxyt31po09d/n6yjkWFAegEJjWqvr/TeDeWB5dZJ/4OArnTQ0UN9jtzwvwplnGgqBN8S607/2bXqKy1FR9Kp++8qR5ZsqtHXJ7sABVJ4hDDTSIOcHewf2JcdYFlapemKmYiwHzZl+NGzSIXcPnuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713467564; c=relaxed/simple;
	bh=Xf7SPq6XyvmePWusI/MC6x61q3Kj6qK9pS9dZ3LkypI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2WHMoOW6tqFK2fQP3dhyQFhd2oRRUFoy5nv++WG2QJfWWZUEcjOKOu9ZR7ENtsS3FFcDSFHV6DTWGwWzhvqDgZUnM3BwFZ5v2zZ3fD9/lDbcZihcJsk+h0hlmgdAn9e2CTG8HCon5fZ+Q6kw3JlL84tQb0C1jHalcht2wqXAGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6c3XuEf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBC4C113CC;
	Thu, 18 Apr 2024 19:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713467563;
	bh=Xf7SPq6XyvmePWusI/MC6x61q3Kj6qK9pS9dZ3LkypI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6c3XuEfQurje/t707E9xyCJQUoeKl+BvbIEQvphsQH2O7Cpbq9FPHoHKH/EKtH2h
	 LAH/KSBDoqLbT51Kl2OIWDHUgz9Q6Fa8uClFXIb63m3S6zL3WNV4iO883SAm7fcmMA
	 r/90ECcC92zsQ86tbWaY4wuJN/PK602C4fe5txDRtfJmEDoPTp07R2aTmI5ERy3vaw
	 hVn7IIqCq+Wp9XdstpEh+i+9liQW3AxWbKcaAz/HLVrm4ACDq5pysYaU5SmSxB8OII
	 maTvDGmF8toj/EDFOw8CEnzP8YYGwtf3X7nHzPm1CKPhe8cVp1uMawTmO6Wp+Zm65H
	 nj41SDVYP+rLw==
Date: Thu, 18 Apr 2024 21:12:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v6 2/4] i2c: thunderx: Support for High speed mode
Message-ID: <wdnzttdq5gqthmzztylpu42ps22hpbbwev6onevxl76d5zf7em@bjiryyhqcj6f>
References: <20240402134018.2686919-1-pmalgujar@marvell.com>
 <20240402134018.2686919-3-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402134018.2686919-3-pmalgujar@marvell.com>

Hi Piyush,

On Tue, Apr 02, 2024 at 06:40:12AM -0700, Piyush Malgujar wrote:
> From: Suneel Garapati <sgarapati@marvell.com>
> 
> To support bus operations for high speed bus frequencies greater than
> 400KHZ following control bits need to be setup accordingly
>  - hs_mode (bit 0) field in Mode register to switch controller
>    between low-speed and high-speed frequency operating mode.
>  - Setup clock divisors for desired TWSI bus frequency using
>    FOSCL output frequency divisor (D):
>    0 - sets the divisor to 10 for low speed mode
>    1 - sets the divisor to 15 for high speed mode.
> The TWSI bus output frequency, in master mode is based on:
> 		TCLK = 100MHz / (THP + 2)
> 		FOSCL = FSAMP / (M+1)×D = TCLK / (2 ^ N × (M + 1) × 15)
> 		FSAMP = TCLK / 2 ^ N
> where,
> 	N is <2:0> and M is <6:3> of TWSI Clock Control Register
> 	D is 10 for low speed or 15 for HS_MODE
> 
> With high speed mode support, HLC mode usage is limited to
> low speed frequency (<=400KHz) bus transfers in hardware.

Thanks! :-)

> Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>

...

> -#define SW_TWSI(x)	(x->roff.sw_twsi)
> -#define TWSI_INT(x)	(x->roff.twsi_int)
> -#define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
> +#define OCTEON_REG_SW_TWSI(x)		((x)->roff.sw_twsi)
> +#define OCTEON_REG_TWSI_INT(x)		((x)->roff.twsi_int)
> +#define OCTEON_REG_SW_TWSI_EXT(x)	((x)->roff.sw_twsi_ext)

This is a good cleanup, can we please put it in a different
patch? This way the patch gets smaller and it's easier to review
and bisect.

> +#define OCTEON_REG_MODE(x)		((x)->roff.mode)
> +
> +/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
> +#define TWSX_MODE_REFCLK_SRC	BIT(4)
> +#define TWSX_MODE_HS_MODE	BIT(0)
> +#define TWSX_MODE_HS_MASK	(TWSX_MODE_REFCLK_SRC | TWSX_MODE_HS_MODE)

Thanks!

All the rest looks good.

Andi

