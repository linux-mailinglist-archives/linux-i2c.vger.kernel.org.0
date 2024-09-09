Return-Path: <linux-i2c+bounces-6439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A95972283
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FC921F23F5A
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59308189B81;
	Mon,  9 Sep 2024 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dnoar1lJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAE51714D7;
	Mon,  9 Sep 2024 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909857; cv=none; b=XJBKH/Kt88SGGTBk5H95dM6f4pMI/wZtqqvPvEKXEN/4XgmnqZZl65bEyr6xGhCvXH15iARgCgRZ2lPzDwkBBfEvD4P2vmVs11+8g6kHHMnSycB5WJ96ed2obaEQao8gND9dVC5qiODr1OFjOh0XWyUaIOZmvSduB50wNm6P7Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909857; c=relaxed/simple;
	bh=IHxw6tmrIYGllghMPvXxzs+/E4dPSVrGXy3erKlhryE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D01mc/uiamlWVeflE+w2umZRW0f0Yh535itc9LYf1wW+YiR4u8dgXdSbtp5e9kW1q+iqU0FvPzwW7IvhD1/Vhp34F8AAqgiPHmYdP73l7LE3BvkZPmau3abgoaA6NctoiVkj+tgD0xpbTBFYT/aXiF4NB069BSw2VqPtP3cyxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dnoar1lJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06443C4CEC5;
	Mon,  9 Sep 2024 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725909856;
	bh=IHxw6tmrIYGllghMPvXxzs+/E4dPSVrGXy3erKlhryE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dnoar1lJDbuc3eJ/MmpKHyMgTWSC9YqTrdFunzI/1mM7cjRkvJjj/dSvT3q5Gfkly
	 6rZo1q4T1eTp1yjI42p+ASZfAvXaWlq9gqWZmL35sHyKvNiWL7QR8EJ/b2Y1JoOaq1
	 atxbPbuRHHWYSanCN7rRXoyl4NOffa4jD7SxPE3vQ3ienfpOUPRUFrcwHiq/ckxoXR
	 qkyxP2f28eljsbxjQTf97HEp1WcK21oAY8u+Z88AeCZWZviKydVxzvLJ2d9tFwXKxy
	 pYyzm38hNw34vv8iajnp+nwYDKsG7URhv3b+4W7RC13FX9e1K1D7f4uvJuZIuhLTob
	 QQxS6GxzkK/sw==
Date: Mon, 9 Sep 2024 21:24:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Rong Qianfeng <11065417@vivo.com>
Cc: andriy.shevchenko@intel.com, biju.das.jz@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, opensource.kernel@vivo.com, 
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: Re: [PATCH v4 3/3] i2c: jz4780: Use dev_err_probe()
Message-ID: <fr7km2zhizkjshvgsw2vjmk2boglrhvcfpc7iqxvilzdvxqemm@lka7dt3iu3y4>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
 <20240827034841.4121-4-rongqianfeng@vivo.com>
 <aqigucchbgq2tblnu7gdkpiw35ezqbmgbl6a5ptzzezngnihsi@iny4xyzkjyz4>
 <2c666489-a39c-4963-a7bd-688dae666f56@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c666489-a39c-4963-a7bd-688dae666f56@vivo.com>

Hi Rong,

On Mon, Sep 09, 2024 at 04:58:10PM GMT, Rong Qianfeng wrote:
> > I'm not a big fan of this change. There is not much gain in
> > polluting git bisect in order to shorten pdev->dev to a single
> > dev.
> > 
> > However, I like the /dev_err/dev_err_probe/.
> > 
> > I will take the first two patches from this series, but I will
> > leave this if anyone else has a stronger opinion. If you want,
> > you can send just this one patch with just the dev_err_probe()
> > change.
> Thanks for taking the time to review my patch!
> Please take the first two patches, I don't plan to submit another
> patch that only modifies dev_err().

Sorry, I forgot to write it, I merged the first two in
i2c/i2c-host.

If you want to send one to change dev_err with dev_err_probe
separately I will take it.

Thanks,
Andi

