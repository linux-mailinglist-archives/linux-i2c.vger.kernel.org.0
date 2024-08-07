Return-Path: <linux-i2c+bounces-5202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D732B94B395
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 01:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DEE81F2200E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 23:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7C3158D63;
	Wed,  7 Aug 2024 23:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7sPAhbY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18718146A60;
	Wed,  7 Aug 2024 23:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723072890; cv=none; b=EIA5LfTpm0mySS2ke5jnT9z/MM47dEEPuZffjFGfLVXXq0J7354HzfdRhI5z32NZfeNtL5CCx1wqWg7ohjrRzJoVRLc8TBL6Q72OKbaulUaVakR0uGoi6nS2qWfiQD6UhGx9p6qXW1Yhf9HcSqliPgpX+a16OUvtW78aNqnDjGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723072890; c=relaxed/simple;
	bh=sL6nt31vEY8NGpejZHT5zEO11srx1m6LapA9AXQqFts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6heYyY5Wa8EUoyyRkLDXvHqv8LTivTSS1SUJ8P9b55auavwTjUf8FE4hH30B4gYBnTR+zmXiH4Jl9wpz7g5XhYjDN4CmCoSuXCR01fiN011WDg7kAfJN1PTVKlQSBjSBQR6HDvWuOSmPLyEpoWr5Kg1aTF5iuJuub2w6cftrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7sPAhbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4324AC32781;
	Wed,  7 Aug 2024 23:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723072889;
	bh=sL6nt31vEY8NGpejZHT5zEO11srx1m6LapA9AXQqFts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7sPAhbY/94UVLGwl0I7dBDTs/5s6hYdfDQQ5IniD1vIZtzwbifD3IKjZrYkkRuhI
	 4PLRIY8Ic6iFKJTSohS8oNjRSoKVlqZ2t0q3yaeJwuFqtYjMu0mCrMIJKk2ZsZc4Pq
	 jO9xBkw5xGkm0zbomY80o4E4psy76RGKXQxy3lVlJG8J39dBkNF33u8KYBrLnEWTZl
	 ehbee3g7E44z9sfA2JBQ1t65u9Zr4Phl6SIABbhR3tpZJQEf9XPCc4GVJ93Qfq9Ofg
	 fnV1MPafSAsUZFDALgoB3NnH0mEL/HbSOvsF1J2kpf8/QTp6qg0kBR1cUNd1N5Ukl8
	 r5Par9Ws+HHjw==
Date: Thu, 8 Aug 2024 00:21:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org, lee@kernel.org, 
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH v2 2/2] i2c: Add Congatec CGEB I2C driver
Message-ID: <p3g2ikhn54roye5t7moatrqbaudl65jarpimhoguojz5f7gnz2@2i4npjg3jdrv>
References: <20240801160610.101859-1-mstrodl@csh.rit.edu>
 <20240801160610.101859-3-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160610.101859-3-mstrodl@csh.rit.edu>

Hi Mary,

On Thu, Aug 01, 2024 at 12:06:10PM GMT, Mary Strodl wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> This driver provides a I2C bus driver for the CGEB interface
> found on some Congatec x86 modules. No devices are registered
> on the bus, the user has to do this via the i2c device /sys
> interface.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
> ---
>  drivers/i2c/busses/Kconfig             |   7 +
>  drivers/i2c/busses/Makefile            |   1 +
>  drivers/i2c/busses/i2c-congatec-cgeb.c | 189 +++++++++++++++++++++++++
>  3 files changed, 197 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c

Thanks for your patch, doesn't look bad.

However, I'm going to ask to please run checkpatch.pl fix the
suggested output and resend it.

Thanks,
Andi

