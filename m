Return-Path: <linux-i2c+bounces-4976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D20930545
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 12:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4182826B2
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 10:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA77F6EB59;
	Sat, 13 Jul 2024 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHhhXguG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B942049;
	Sat, 13 Jul 2024 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720867960; cv=none; b=K6rowdRO5SCtuLnaS/rkNbjv0f+s2JXvoNxb1HIqumU25Y2parYdXGgkg+ujbl5lJafEybr/8/K1V1fdGBjeNR8m+n3Vqs2/KExqlAmFUt21168/fukV0h0Tt3xF++oCfGJg2xFHnwwgG0MOEVnaazDE0vGuPIDdndHuEitMjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720867960; c=relaxed/simple;
	bh=43LhFOxCK58+AQF+OdT4ENdqVuUYcC4IQilexjmq63Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqrTT2trcidV57nV4KUO+gWGYAC6+5wrCH2OxYxGBFPWZzMWF2fEcgOm4Jcp3VbPm9nUXFkZoKD+tOQgPpv8ouWhnqgmgfRcNwaqGvt/jRManqK+z/l2cHY54PTAmMzjOpGISrLDkGpBZbusVJEmBUUv5B9XL/ALgkWUyicM7Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHhhXguG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3558C32781;
	Sat, 13 Jul 2024 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720867960;
	bh=43LhFOxCK58+AQF+OdT4ENdqVuUYcC4IQilexjmq63Y=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=MHhhXguGZNIf8qXs5Dk3zmNoKO8I7+dY0QlSihXF/qZJcNOYo/JrzGR2ANQ9Sexsc
	 tF7X0zkeeadUraOHpsESY6PQ59bjW7On09ymuSn3WoSaa1x0SzyBQOITpbJnTxnvP+
	 Iw+d6fJ3xpJTfLfo1Hgr9wvV+nTAKoW287A5BCJFoULHGf1XXi7r2Kek1gJb50Dase
	 zcA9MiPrXtu+OQBcddadtpyRov76eNSMFzrCoLC8juySDi83oBBzJKZVhMoO6bLGEw
	 V9pX8dkv4c+LGgDJHqWOI1MkHN70r/E3NRi8hRTvsp9tGA1eP3QEL/y8b481tLLMdn
	 ktz6wzg7VIZtw==
Date: Sat, 13 Jul 2024 12:52:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11
Message-ID: <3q4w7de2eoiyhow7f3nzzfv5upkgnzbqrsc2g3kblnoetrb6xx@k4544sbfs5yr>
References: <yxymqbpeuhq52w3ie5nl5pkoojjuybaeodqtrd6uhe2rkmfhfb@3dqr6vefsdxh>
 <ZpJF39FFqnJfinQn@shikoro>
 <ZpJGNirkEoBFixQP@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpJGNirkEoBFixQP@shikoro>

> > Can these patches be included, too? I think they are good to go.
> > 
> > http://patchwork.ozlabs.org/project/linux-i2c/list/?series=410673
> 
> Oh, and these:
> 
> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=411205
> 
> Or shall I take them?

This was in my backlog, will take them with the requested fix.

Andi

