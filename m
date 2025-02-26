Return-Path: <linux-i2c+bounces-9596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB28A46E24
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 23:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D3E1884CF6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 22:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4577326BD83;
	Wed, 26 Feb 2025 22:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUyHYisr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010082561D6;
	Wed, 26 Feb 2025 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607550; cv=none; b=MronYjVvN7kpJfVb1tGozxNjiWr0ClmtJEe5AIop/DUpuR5YO1vlc1TZweEVYwHWwM6g7YRMEwNs08HGqv8TZFPDr0ti7m50qVfN5hebTQ/AKXU1Mnb3OCbfo7bMrq62B44dHECKrDtjSyzUuKDPOIQVq4n0Kr8jr43QUjEjMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607550; c=relaxed/simple;
	bh=0mZBwIxYD27TMvy56/rcSgtri5T7io0oksko/OUBjJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJ0CFZwrhg2vO1CgVZ5uKj4Y5jxcXBYmVD/OqqhMR/Eb3csLQDIiyqAAkcc7qNcV5QB9jy3bamsiJTGf8HuGE2yEOPdveEMVNoibga8Fa3iWAujPJvM+3uffrL4aPLgJd8L+M2pMGBLMcy8L31re8MFS1urFgiv5u+yyGTID9es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUyHYisr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F63C4CED6;
	Wed, 26 Feb 2025 22:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740607549;
	bh=0mZBwIxYD27TMvy56/rcSgtri5T7io0oksko/OUBjJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUyHYisrJn0D9cL+IErFrO3ndrAYf9+/K4MeAskJ0O76R4p6CbfZt4JS8B5dogLl/
	 pI3jF98i1zEBsDI1xP5GIxScws7E4Lv3xD02lLoiMjMHE7mNDON741L5koRNiYMkxM
	 ANJHCJndYowIszpqMvfKvHmainOTFa2/LTY/8ie6CBDMqq/PZrb1cKs5YRlP/PPzny
	 nsJDwQAJPU5rlXqemMlM6b+8MBEHCZ91QyoZBsjHieoz9ofyJPpJq695zBOjQ+Fb2o
	 5DcRkMtq63qd1g/VlUBlZRhuRo/3dcaEGz5LgQfNlA2JzFSS9sPgm85YO2XsZoZaSk
	 wLnBh+300hykw==
Date: Wed, 26 Feb 2025 23:05:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: remove incorrect of_match_ptr annotations
Message-ID: <nzophlddlsqyngkvjpgy7razrbzb5nv3sbtwvsy2nr56g2hg57@ptvn2gansyum>
References: <20250225163700.4169480-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225163700.4169480-1-arnd@kernel.org>

Hi Arnd,

On Tue, Feb 25, 2025 at 05:36:56PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with W=1 shows a warning about ltc4306_of_match and
> i2c_mux_reg_of_match being unused when CONFIG_OF is disabled:
> 
>     drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
>     drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]
> 
> Acked-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

merged to i2c/i2c-host.

Thanks,
Andi

