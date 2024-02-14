Return-Path: <linux-i2c+bounces-1715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DE585551C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 22:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F9A28B397
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 21:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B3213F00D;
	Wed, 14 Feb 2024 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNqQt+rG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FC13EFE8
	for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707947057; cv=none; b=IB6bob798+VAFZySIRbcLXjQ6GkNCVBooLYn6uslT0rdgBO4s4n7QonSH4WnjltsLZJxnnkmTocJw5bRAR2q2/fs5b8citsDJ5+XO/YZbTS/yYHmhzw5BR35nOR01A7HxDNMfOYEHw6a3z1LzxaHGiDQHQ9RNk7erDjSqw9xDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707947057; c=relaxed/simple;
	bh=0eFsW/wcDhHKODbWjWM2li7CWyZ2eECl12+4Nxu2gLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7C50eQAsFkgm+OyWg5S87D3NSS0TA4b7o6DoLM+B7saEer25n/EjIMUj8e09ElPUD98JOg5IDUZz+odq5QQyy538IYZnukKP9TrGaGrM1jxxSlfbQoOh2fDZpPcm1/58kiUFSqzEak0uOAS9QKr7ULWoM4EGwoMX+zElcDGGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNqQt+rG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9C3C433F1;
	Wed, 14 Feb 2024 21:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707947056;
	bh=0eFsW/wcDhHKODbWjWM2li7CWyZ2eECl12+4Nxu2gLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNqQt+rGsZCS+6u1GGqC47LnAyYb9ljDt5+s0z9VIlOoSYpkaCbTwxcACU+8hovTL
	 ibRO8w0bIIJIx8B2ErUT+/KtGpK2z1Pbi6jbxW715AyPNQ/jwx5eyiOgoi0h2y6yEH
	 GRdjwM/1DGBA3YqM67OER1LOZe67Fh2RhrRUBY8grn3ROFWXQjLthqhsfAN/PVacwO
	 MppOGkBt3zdn99vH4SGJwC/KEcB9YHpDcbL9b6UwbDECnXK4i25xSKbJLH1pH7gZrp
	 9aLL39PW3T8uKoGNytKKjrb/Ed7dlk6myrVdg5AhXC/jPdk+Pg1Eu2QbYcAVNphhwx
	 zj7qJezRqLsyQ==
Date: Wed, 14 Feb 2024 22:44:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, 
	Piotr Zakowski <piotr.zakowski@intel.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Shepon@zenone.zhora.eu, Kozlowski@imap1.dmz-prg2.suse.org, Pawel@imap1.dmz-prg2.suse.org, 
	Usyskin@imap1.dmz-prg2.suse.org, Alexander@imap1.dmz-prg2.suse.org, 
	Radtke@imap1.dmz-prg2.suse.org, "Jakub\"" <jakub.radtke@intel.com>
Subject: Re: [SPAM] [PATCH] i2c: i801: Fix block process call transactions
Message-ID: <22rwbtavuntbe77bstk3wjsdm366csa43nied6u7w4q6o6sveg@jkqor7zklayg>
References: <20240214155939.728155bc@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214155939.728155bc@endymion.delvare>

Hi Jean,

On Wed, Feb 14, 2024 at 03:59:39PM +0100, Jean Delvare wrote:
> According to the Intel datasheets, software must reset the block
> buffer index twice for block process call transactions: once before
> writing the outgoing data to the buffer, and once again before
> reading the incoming data from the buffer.
> 
> The driver is currently missing the second reset, causing the wrong
> portion of the block buffer to be read.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reported-by: Piotr Zakowski <piotr.zakowski@intel.com>
> Closes: https://lore.kernel.org/linux-i2c/20240213120553.7b0ab120@endymion.delvare/
> Fixes: 315cd67c9453 ("i2c: i801: Add Block Write-Block Read Process Call support")
> ---

applied to i2c/i2c-host-fixes.

b4 ty failed to send the thank you letter because there are some
addresses that were not accepted
(Kozlowski@imap1.dmz-prg2.suse.org?)

Anyway, it's applied :-)

Andi

