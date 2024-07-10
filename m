Return-Path: <linux-i2c+bounces-4860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B826292DB52
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1C71C215AB
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62AF13C80C;
	Wed, 10 Jul 2024 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TECaSot/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B6C12CD88;
	Wed, 10 Jul 2024 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648588; cv=none; b=iAqFKJZb/C6e3kVYwU0J+omhpO7F5/whUDYA7MjWsFBuTtTwnMV08Kn3fvroTEx+wICZdzyIEaA6+AiAInP7LjGFsbIH6TB5/P60cXNyRy3hZX716vGPBvBlEpT1WuJESIUkGkG1AcyBIMTKX7CUJi+mkGr99Svx8DepYI94Pc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648588; c=relaxed/simple;
	bh=f3pwRTbw+8TC7u8BN4p+ZxGF04f8V0va20I/q+MXNgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jd4DqtymrO+zuRIz+6kebbFxa3y1SqM2hBlEHFO90GWURsaYKllfCcMwWWozMMe0irsW6iC9L9ai8eQTrmI1fDVsYFK9uqwzX9bdLvS0unjN8IvCt2zG668JpRKEWgpv4EOetDeTCCZM+x9L6M79IAnxavKbo4wVwjIGiYqziBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TECaSot/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890A4C32781;
	Wed, 10 Jul 2024 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720648588;
	bh=f3pwRTbw+8TC7u8BN4p+ZxGF04f8V0va20I/q+MXNgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TECaSot/zkT/2SZeDyHFRWTMpWrm7LuBGoAFHlqll5EQbmKAByr1MvyBm9YWg4ADd
	 oGLyIIdx/jNA/SNBROc24fDcGvvCiYOEv+Z8vEs1trDdo4sJneF9v82/tXUuzQZsSp
	 oxvjim5FxyrgRIUH1QoexQsXPKF5u2JcwPTU/v6M0tFZ+oSpJusUkzNiI9Gkie5CrK
	 Mcp0C9Ey+3vWpJfmLRc0AG7FojzggA3UlD1ezBhhwLS8bi9GMlrl7TSfwsAeDYrCgX
	 vElTGtC71qU0SzJ8JF1D4tYLtn2BiNOPVF7abgi/H2B8v77QuIerd0TR0olpNfUsMo
	 cV9DmHa8dzv1Q==
Date: Wed, 10 Jul 2024 23:56:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 28/60] i2c: ls2x: reword according to newest
 specification
Message-ID: <fvj3rmm2zrtpdn73auqkecltr5f4tq7j6be2exd65hjbvdarke@yjlovdeprmiz>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-29-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-29-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:28PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

...

> -#define LS2X_CTR_MST		BIT(5) /* 0: Slave mode 1: Master mode */
> +#define LS2X_CTR_MST		BIT(5) /* 0: Target mode 1: Controller mode */

heh! I believe MST stands for master, but this is one of those
cases where it doesn't make sense to change as the naming it's
imposed by the hardware specs.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

