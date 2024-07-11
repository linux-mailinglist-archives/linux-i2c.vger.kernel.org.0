Return-Path: <linux-i2c+bounces-4903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78392E473
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C451C216C6
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C04158D6F;
	Thu, 11 Jul 2024 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvNH7ftC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6A14F9E5;
	Thu, 11 Jul 2024 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693321; cv=none; b=gzquaVCCqLsXOSnZ1vS4pRciw26liraciXEWTZ7/8MX2o9TMLUtcvh7ZcW+hOrAH9C7PK4r+oOngiUTt7WTmh9Cun0zMYBK2tNDm14y9nJt5xsVVSXbxluTy3DdNSyUe5I4sjXRYxoMg840UF13cJ+Ew9KL1dXFyuVhzZN0pln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693321; c=relaxed/simple;
	bh=cKa9R9k08zpYUu66AgpuRXhMJExuql8UPFFlxs1RjZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiVPyMQpeDPx1p8yF2HXzvsLsbPuhynFGmbdKz5JRsBXX5N0Gm/WhZYkJA6uSz/HorLQY3C4sVevQJPWdukHzWQEJ1r8DMyc+400Pkne3lJaFM+G0z55Orza72cW0L6OU+F89A3WRDDZXfYxdo33Td4NGQUZwwC2/Hm5U6pIYT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OvNH7ftC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622B2C116B1;
	Thu, 11 Jul 2024 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693320;
	bh=cKa9R9k08zpYUu66AgpuRXhMJExuql8UPFFlxs1RjZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvNH7ftCBzrsiGkBe1RsrrQxxwnUzgvqy1b+U3Ps6n0OTjxwUDbyv/25XtkxT00Ge
	 7idyS8sQVDCLjljakmbk26mCTo3LpXD/UXKSji68nivUBeqDHxigRRQqOBn3sw8YXH
	 YNAT8LRw5Y8kB3WEuY86VYVJc3ZFbAr2BYuU/dFl2Wrw80B9jC9pqTwRVF+LCpLIY9
	 G6V4gqrYlylR/9rF+iK4f4K9ZPzIiNZh0ufTXHfMIGnu+7vWkghoKExiyzgEINXDxF
	 9UFPoLqyjEFwdoF8g5IKG0NdLuGPlHMl+p9ON855yTuSrwuEVy/y4IQQIN/0dv0T3A
	 n5HohtF3eW0Bw==
Date: Thu, 11 Jul 2024 12:21:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 41/60] i2c: riic: reword according to newest
 specification
Message-ID: <ttxuoeslf3ozkmd67wmioa4iy6gdhkyj6zph4f2votkkhznfar@dkrvt25sgpgm>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-42-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-42-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:41PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

