Return-Path: <linux-i2c+bounces-11051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2038ABCA9D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 00:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8172B1620E1
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 22:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C548620C469;
	Mon, 19 May 2025 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DG4M5PKs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8576C1DE887
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747692239; cv=none; b=TgVDWDfoRfKMMFKVhCeynewFK3eHlWWkxX3KGiYUFF+bkHjzmKQ4syOHPWBfXoy+m9z03wbhqYNSZldrxPdcgPNpLF1hSSfWVbDJel2rwvinnXXe3OMoLCrkG+1QOpWiRSBEggsr4dAC3KmuAH5EgdEkPO6HKKSbZnxMOnJYe5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747692239; c=relaxed/simple;
	bh=lG7yr7akkyy/8Og1W+0QQWxoqRcWGSbfq6/Uv7nAl2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KD3nPFhTGXpFkXoYJpnKdfQfBuV/1v7HW1LFB7f09zWZuQJLoX4mb2sYCHNk52dSzxOw95IFVFE4r1mQVaeSCx12uP24y3BZ3DpoTc4bzj8d8hCBuG8MyuiiI9tASdqqjnem/YSrArf4s8p0+YZfI9lJYhJT/3dgDiQiLJrY+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DG4M5PKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55536C4CEE4;
	Mon, 19 May 2025 22:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747692239;
	bh=lG7yr7akkyy/8Og1W+0QQWxoqRcWGSbfq6/Uv7nAl2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DG4M5PKsVyRbkosrzHCYgWWc1jWWAUMIro5zOorWPsk2DBX/iRH9Prn3sQt5P13i+
	 dbBHOt9TK8rYEhAMttkNbxm7atTBXaqWFI/FJRaAJveI6S04hdRqsvW7WYR5sVKfQo
	 jwajjyZRJcqhPR2BUACN8voNaOn4hzoibwMC4x2s1CTytz1kgtoQZjEHNGHpwTZ8VT
	 VGqJ8KYOAiO7R1sErQR2i0G4/xr8mD7jGV9784RyGvavcuHwXpvPlgx/OOJCXPnqCW
	 PpvfjlDRMhL56lrI67WN8IcuhDJXhum7wHO3FdHv/Wbe4Opss7e7U8+7DL/1LUbW9u
	 P2YfRBO5CNH0A==
Date: Tue, 20 May 2025 00:03:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <enlo2gjoh5qua4phd3lnmmfr65zgx47vto35abwuwtpdy7ocp5@yd6mrc2yepws>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519111311.2390-6-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Mon, May 19, 2025 at 01:13:12PM +0200, Wolfram Sang wrote:
> 'of_node' in i2c_boardinfo is deprecated in favor of 'fwnode'. The I2C
> core handles them equally, so simply convert this driver to fwnode.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I took this patch in i2c/i2c-host. Please let me know if you want
me to take also the others.

Thanks,
Andi

