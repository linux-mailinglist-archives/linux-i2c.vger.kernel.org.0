Return-Path: <linux-i2c+bounces-631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3B806FA6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 13:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723AD1C20A25
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 12:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5188C364C3;
	Wed,  6 Dec 2023 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdeFo0ji"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736434556
	for <linux-i2c@vger.kernel.org>; Wed,  6 Dec 2023 12:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F61C433C7;
	Wed,  6 Dec 2023 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701865672;
	bh=dlj/YCXcrqa1hzDWlixfpmkm6MqvVIgbXbMVeW4nZlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdeFo0jiIjPqrDwRBwUjKRUeRAWf4059fHqTteSj0VHDrhWaMF+HEv2ZEZXedaDgD
	 cfBHYtyFxqH+JV5AqFf3PFYnIKwQyoMzTeMiltUvDH1l0gc/qxW1GK7pIXTfA0T3El
	 mGm2yANxGVzo6lPm0xnEorK/v8O5vDSn1LEbPeo6cpvQPXu2c4+U1a1P2kR9gSI7aP
	 WjdU8Z01ATLX+YfrqDuGqGiA3gCBLuKP/VezSEx399xilXDYKDIofqpyY3w3mbk3mx
	 cDTMB+pPNwGNwwomuaU2RETacF60AKssiVMh8BlQg5d/UF6h+gm2Ddam3/tXBs+euj
	 /3e7uFW/S993w==
Date: Wed, 6 Dec 2023 13:27:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: fix potential spinlock recursion on poll
Message-ID: <20231206122738.cnnjxszz4g6zak3w@zenone.zhora.eu>
References: <20231206090641.18849-1-jensenhuang@friendlyarm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206090641.18849-1-jensenhuang@friendlyarm.com>

Hi Jensen,

On Wed, Dec 06, 2023 at 05:06:40PM +0800, Jensen Huang wrote:
> Possible deadlock scenario (on reboot):
> rk3x_i2c_xfer_common(polling)
>     -> rk3x_i2c_wait_xfer_poll()
>         -> rk3x_i2c_irq(0, i2c);
>             --> spin_lock(&i2c->lock);
>             ...
>         <rk3x i2c interrupt>
>         -> rk3x_i2c_irq(0, i2c);
>             --> spin_lock(&i2c->lock); (deadlock here)
> 
> Store the IRQ number and disable/enable it around the polling transfer.
> This patch has been tested on NanoPC-T4.
> 
> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>

Looks good,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

