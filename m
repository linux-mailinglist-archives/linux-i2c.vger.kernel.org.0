Return-Path: <linux-i2c+bounces-11591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D1AE8FA3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 22:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFF3C3B8E2B
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 20:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCF32DCBEC;
	Wed, 25 Jun 2025 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKNaIsye"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537BF20E031;
	Wed, 25 Jun 2025 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750884221; cv=none; b=KYQiBBX6n5Gg4HHhvHHE7lc9hsZY9Rf/OvRZxUcd22+AZq21l4UYCFayGhslKPkaLfyt+ocjbOb28lq6Oig9ivrT6cEv/tPNH34hZphEnmvhM1YQsCvW43TlED2N0qU/uNnXl+D7hHJjm+OJpwouNd52c4LelDKQGRi//ULIdlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750884221; c=relaxed/simple;
	bh=Rmz67o9XCjNjggKR0sYTYAf42AfBsHBAtQO+D5/ooAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqLN9PN2EY4C3bc1k+ccJDe6tPKUoiJLbhuhZtk3fe13UvJZIbmLWnaao2YDIWaSFBCJwYLzDhrUzPTrrMHdKnCJDFMZalHkMEorXXVQksq5B02eBc4vVLFAhP9kJt2PT1+S00lAkQyIXfFyR5H85+2n82gsF3k73hD/W3l/Fh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKNaIsye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AB8C4CEEA;
	Wed, 25 Jun 2025 20:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750884220;
	bh=Rmz67o9XCjNjggKR0sYTYAf42AfBsHBAtQO+D5/ooAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKNaIsye7g8Rg3qVVbuy2Lk5kWIddPlp9RSWtHLoIoZM0aT0NMFPWTb9E4jueZxMr
	 T2Dpq++mzgkhWNxKX7VS5VzdMTaN/FKR7CgYHHbpCQgJ8v/sVQ4a3XKzrUWjfExafm
	 PCMsJ70wD/o+qHdYujGiK5WB7MvT/EJdRsSME4dgxldcmuGoPf7Kv3HpE8jMT7GQRW
	 hxvG8PJh7avy0zPYxweVD9qL/KK/keR7GuXoSosvye75e6Cbm92HVSEXBf3l8dhxyu
	 b+Qxroxc6Mc3vpWcT19fEy9ntSvzPJamySh874XFmCStND03I2dqNIV972IZRZbfzt
	 7I2P4Ppfq5cAQ==
Date: Wed, 25 Jun 2025 22:43:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	stefan.eichenberger@toradex.com, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	bsp-development.geo@leica-geosystems.com, customers.leicageo@pengutronix.de
Subject: Re: [PATCH] i2c: imx: fix emulated smbus block read
Message-ID: <mp3b6yjebdqgkatx5wnezmhmdbmhhkdyddy3yr24ryla36ozmr@4wyb2y3zura5>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>

Hi Lukasz,

On Tue, May 20, 2025 at 02:22:52PM +0200, Lukasz Kucharczyk wrote:
> Acknowledge the byte count submitted by the target.
> When I2C_SMBUS_BLOCK_DATA read operation is executed by
> i2c_smbus_xfer_emulated(), the length of the second (read) message is set
> to 1. Length of the block is supposed to be obtained from the target by the
> underlying bus driver.
> The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
> after reading the first byte (i.e., byte count) while processing such
> message (as defined in Section 6.5.7 of System Management Bus
> Specification [1]). Without this acknowledge, the target does not submit
> subsequent bytes and the controller only reads 0xff's.
> 
> In addition, store the length of block data obtained from the target in
> the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
> byte of actual data is erroneously interpreted as length of the data
> block.
> 
> [1] https://smbus.org/specs/SMBus_3_3_20240512.pdf
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

