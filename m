Return-Path: <linux-i2c+bounces-9926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29686A69D32
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 01:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F72D1886AE7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 00:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25402282F5;
	Thu, 20 Mar 2025 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwvDFVYe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D7B65C;
	Thu, 20 Mar 2025 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742430208; cv=none; b=aCXPdG7EqemSvN+fs2fsr4T2qCZYRuiBJAGcTUH30MobsJm0yRJ6FhRZnngmo8rz9sDJoRtnych4P3Z6fGrBlV/RTGSP5yeIuQ+y7cAEUOIlGUpYWTThi3rbuADBkJKNYHqrEIKX9bO3y5pFYTHr2R48nUHJeLwEhP4Zs6GlU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742430208; c=relaxed/simple;
	bh=PLlGPu13lwUvjhab9LGjWlYnOdDLh4IYoJeW/dS/6H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4o9L6tX9Fa7p/T9+DbRMluiM4JAnR9qEfFgtxtieMG1ANGahuVRh6h5xM/aAa7roK3pqUs8mKzcmy7DoxZD3+vksx1RS1nNSNRrDBNcTU6jb8sHn0JkReMPv/HRbpXKrSCsPHyj9wPZ6DuqRceoGeucm9zYvG1xDqNPS6MH0U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwvDFVYe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48C9C4CEE4;
	Thu, 20 Mar 2025 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742430208;
	bh=PLlGPu13lwUvjhab9LGjWlYnOdDLh4IYoJeW/dS/6H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwvDFVYeRWNt4Go1WWNiDAksolgD/KKL9rClnuDhtRjnwagIXpaa34ntS/3ezBdt0
	 G90wIpvGRNU31jdHgMw6uqDScCnm3ptixfAnRMVRbVXd3wBVlxwRiMISO8h2nnLNMw
	 H+WT0q5X7YaN+1oyrlrBFCFuUVZc0UpiE/kzm1m58ywZ0xONuF/3tEkCYKqOkS8QSw
	 2xEStXdqjyZ0VqODkhM93DgOD0ueevOGWrU2ewNrUkJahusGrXO17Y4sqEYBch2P4I
	 7rAy/W0uMURLicaK2gwD6Wqn54om6hu1507zYiKACDS+wXEeP7DtEXcIhQeomsCxOh
	 FJvtfP3tQ+Ogg==
Date: Thu, 20 Mar 2025 01:23:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Message-ID: <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>

Hi Sven,

On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
> From: Sven Peter <sven@svenpeter.dev>
> 
> Add the missing register bits to the defines and also switch
> those to use the BIT macro which is much more readable than
> using hardcoded masks
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

Just this patch merged to i2c/i2c-host.

Patch 3 and 4 look good, just some comments on patch 2.

Thanks,
Andi

