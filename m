Return-Path: <linux-i2c+bounces-4910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148492E4A5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C9DEB211A9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8B81581E1;
	Thu, 11 Jul 2024 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcB+PVKm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95B158848;
	Thu, 11 Jul 2024 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693612; cv=none; b=Nxy4Sm+Y7uzJ825YqX/qlvu/1n+foOv6c9ZO93fv44EgWyiVp8YnqslzAc1prxswuZ6XPBiZ6MRure4GNlehmmeZ994JmLal5X7fE6hnmfyp7G3bnzvoKI3rfGhU2XyyLLRoc6e6p/L+/96YCQqaK6KTX3OWdGXmLG2LqKc7THY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693612; c=relaxed/simple;
	bh=wlAKga00AmflDbni8pz8GB7yjejPf0h5De8U+naCjYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdtnF/rIbTfFMBIKgqcdBBgvcTeVyA/XY+uoXeBzVNOZaaoYQ/BgECf5wJ02Pk98tNkJB2Cey7DeJKqNiUENB5fD8mb3jmypXOprN9H7+X5TlzXmZaBuGenn5pJt8/0GfPOyKOOzBdmHdT9VtZjWYjneLRiBGhluO9S+xnipTmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcB+PVKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31E7C116B1;
	Thu, 11 Jul 2024 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693612;
	bh=wlAKga00AmflDbni8pz8GB7yjejPf0h5De8U+naCjYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HcB+PVKmUaP/JyX9dauDHiTxRmfCrQPpDx+bgE4NCI2BJWckUmU7MWegiDOEY+axl
	 rtwNWrso0ng9BqTu2wi1mhF6MyizO3hleyyzIZu3H5UIXGn1osl72ZIPKKF7xyedDG
	 gYYwvZdGGBaWWBHNRg2H6+lkgjHyFSBzJQyJDRS//hB99O6nhnjQDLo/BkShC9Zmea
	 ANI5rB2zaECBEqJ9iNnAvAmuNxTVvXyxihM+TuG23sIu1eptZK8QLs1jVyLSssWRb+
	 Qrqb1YnstktnFS7r/hSK1YQ433TiuKC3KdyZysTfGSdYtA1MlsEZ4GESBNPgoeGRpb
	 en3EbmLcW4LGQ==
Date: Thu, 11 Jul 2024 12:26:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 48/60] i2c: sun6i-p2wi: reword according to newest
 specification
Message-ID: <hheateu4yyhbbft4jlw3aivlmf6nxs6gry3en7vcekvfjavnib@orxdxz2ufwys>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-49-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-49-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:48PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

