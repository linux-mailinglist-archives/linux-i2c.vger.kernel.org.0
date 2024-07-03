Return-Path: <linux-i2c+bounces-4615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F1892698D
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 22:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 155AEB26702
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 20:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E54218FDC8;
	Wed,  3 Jul 2024 20:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tz5D54gt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739D18FC82;
	Wed,  3 Jul 2024 20:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720038437; cv=none; b=MBOeJUn7qZLDH8sd56242e3HIlZoxf2xNb3BaXS/6WDRs7TTZ5xRIZxy6VFrZZ7Eqyg8c10/vLwlL6dCU9CuBY/1hgwmAiWR5JuqQZfGPj/YykLy36hpJoOoHu+49WBfVgwvJs+8/mDpzQy619b+L29Z8qRu5nemolhgTr9QIJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720038437; c=relaxed/simple;
	bh=PBcTwQazTXxN3vJLe6dTXyZcwIjt4BiOfPqGEsTN/zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dh35IsoflcMcLKkzq0l4cyjma5j+F43+bAPsDG+Fny1yxAg66ZzmUX2f88AywjR97epmrVbEKi1+TeRC9Y1EY+7VkiZ0KJWi+LKngS5pHvK4RV+JsKbl4BpuarKxkAnK+9vPAqPPSDMC+QftAyibCACq482ot30CuV2VHsUHO8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tz5D54gt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D52C2BD10;
	Wed,  3 Jul 2024 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720038436;
	bh=PBcTwQazTXxN3vJLe6dTXyZcwIjt4BiOfPqGEsTN/zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tz5D54gt8BA9EpYZxEhBR8qDT+9suJQCZbvnn5LOIQihHHWwqxljPEYQlP5u0/c4a
	 r9JELjidYnoQGBzvZa1UbhwCOvyQ/Kb+QPDuNnLqQljbnl1JWXdFCIp+ZlDZh3WY3/
	 dPLTeMTuXx0Gaio0Fv1EJlsKDL9YNHio+Ue6RozA/pAWRZReRHV1L+6bd5eTr9YlHP
	 gtDfZQrh9midRBcAXpSpXAU8EONEBqfTWKLIsgCwTa40EyRe6RAdBZ0Bdj1AhgC6aT
	 d+z4X/GiBCnotCaUQy0JFK6WC8uLXPJCXTgugR7M9ZNNvSRTmaoBU5ecHEaKidjrwA
	 BPb3VAHoexFnA==
Date: Wed, 3 Jul 2024 22:27:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: rcar: bring hardware to known state when probing
Message-ID: <g6mthbu3bbg2vl3aobci2gx7lbfy4qbiy7cy43v7wwgjldauc3@qv4yrctu2bmf>
References: <20240703071625.5389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703071625.5389-1-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Wed, Jul 03, 2024 at 09:12:03AM GMT, Wolfram Sang wrote:
> Probably due to a lot of refactorization, the hardware was not brought
> into a known state in probe. This may be a problem when a hypervisor
> restarts Linux without resetting the hardware, leaving an old state
> running. Make sure the hardware gets initialized, especially interrupts
> should be cleared and disabled.
> 
> Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/r/20240702045535.2000393-1-dirk.behme@de.bosch.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Do we need the Fixes tag here?

> ---
> 
> Here is my proposal to fix the issue reported by Dirk. Build tested.
> I can do proper testing on HW only tomorrow. But so you know already...

Looks reasonable. If testing is fine I can queue this up for this
week's pull request.

> It is strange to add another "_slave" function to the driver while I
> work on removing such language from I2C somewhere else. "Consistency" is
> the answer here. The driver will be converted as well. But then as a
> whole.

Ack!

Thanks,
Andi

