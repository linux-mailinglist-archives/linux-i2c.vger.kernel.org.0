Return-Path: <linux-i2c+bounces-7133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BE998B8D1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 12:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B06B9B215D6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 10:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C6A1A01BB;
	Tue,  1 Oct 2024 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pvq/iy8E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17715099B;
	Tue,  1 Oct 2024 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727776837; cv=none; b=eoTd9BDIyenGXGRWarLF3hyax7avBTMADOXtVMzVmZT0nV6OzvKqB1f1FlTh5AsfMMt12Q+ZQM6oTQtUhReQV/0UBZjBZ0msN0AIaxCJOF0emqXsK8VfZlNgbxvgcrmS4nGyXWiwSd7/8GG88jXASPFbmoXxxzHzDtRzMJhiCZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727776837; c=relaxed/simple;
	bh=2jTuUAoq/iemeSo5+3g0EVbeIkOfrJIs/UTTPj0ZmTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxTkX4vRMRr3TmOx32xV/JJ5J3scbDESgiSSc4QQ5LjUOFZ8y571fGyHMvXkZvp1Xrh2NsqdeH1Me8+qmSSRmmTtgs+gpUTDKCywRWvPxXjy6T20pglfTuN/Fooytn5CdDZzYmivhRTOxxwPgVIpk+ujsNm2gW9FKKH9asdcBQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pvq/iy8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8A0C4AF09;
	Tue,  1 Oct 2024 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727776837;
	bh=2jTuUAoq/iemeSo5+3g0EVbeIkOfrJIs/UTTPj0ZmTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pvq/iy8EKRUpLkoREafWI39iXy9Ns+1FbbizIXPNBQclIPxI2zcNBmRpPZtXz1Feh
	 xEL06KG+l+sygrxBvHMSAfH89k/KiVYWuLQ08ZG5rGbttjT699h6wVoz8tEhxvdpJ4
	 sGVKDvtw46ygiwb7/iLpC9hVA4bBAdT40uSC7WQHgFoJ4egdzAezo31ThNajxB4ijl
	 TBZPsNxqETNOsTKnq+djywbNPD+loiIJkfOPnAkYF7WcMLo1G+DkNETeFMPcBMb9CQ
	 7s4LnwOzAkeqMnbldFrvShmkL39staPoyxi0A3/74BjyCuFugMi+7fgusRsvJRzUmR
	 JqZ77OAhMGD8g==
Date: Tue, 1 Oct 2024 12:00:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com
Subject: Re: [PATCH v2 3/5] i2c: Congatec Board Controller i2c bus driver
Message-ID: <cw34hrjd3cpbn6ju5puz5hexafvk4bs4uflvtfmqs54xmxw26l@s2npnwwfv3w7>
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
 <20240503-congatec-board-controller-v2-3-681511a01c8f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-congatec-board-controller-v2-3-681511a01c8f@bootlin.com>

Hi Thomas,

On Tue, Sep 17, 2024 at 07:00:49PM GMT, Thomas Richard wrote:
> Add i2c support for the Congatec Board Controller.
> 
> The Board Controller has two i2c busses, a General Purpose bus and a Power
> Management bus.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

I skimmed through the patch, didn't see anything wrong and fancy.

For now, as a self note, I'm going to give it an:

Acked-by: Andi Shyti <andi.shyti@kernel.org>

I will check it once more at the v3.

Thanks,
Andi

