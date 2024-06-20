Return-Path: <linux-i2c+bounces-4152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7CF911617
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 00:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66E8F1F24080
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 22:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30A21459F2;
	Thu, 20 Jun 2024 22:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOyKtyGi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02E14038F;
	Thu, 20 Jun 2024 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924246; cv=none; b=OxWchpwePCg35fajydn43YMO9yixNRShy05BJEQ3oCqXRkRxdDmUHHIbzYw1xIzMSdvffG1wTNaClTMl0/Mz71neDdeMJig776CRSLCEi81VO/m78jXyDzye8kBr14+enmQzleuph8BKL5yoCMVtrbLxzFC2UXBvKAZJ+MXeoD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924246; c=relaxed/simple;
	bh=oL0lOl8UlorqgDe4N96CXSn6qERkQqsRkdEwKmnMLpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKu5iQj6kL/IL1Mz0GIOKb5V6GmVe2dC92sJUEW/ri1DhZaDK+6MCO98aQrZGlIilq4qsVg+pmy6L/RJUiE6Ipe0y2fJjhcGv18IDeBrqsyVm/cWkRWvo6tRCSTpOiVyWTsp8XXGVLPmutFCMDnrVcqwnfKm5CrQ1CQXJMYlzOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOyKtyGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B798C2BD10;
	Thu, 20 Jun 2024 22:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718924245;
	bh=oL0lOl8UlorqgDe4N96CXSn6qERkQqsRkdEwKmnMLpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOyKtyGiw4R35+cQwJzIRKbOUcM5jG2Lw029k3dBxiy3q5r1r0iBa1pT8T3JHsfuv
	 a7nj6hsTr7uKLww9GJRlRMomasDZ05PZYMJBeTXxYcIOU7n8AaG41zowyTmRcz+1wt
	 h5ykO0hla58PvGtVSXoUdDz2mhTPszr6H5PEnIWIVWYCq6kSsGez5GkzxSillNnGZB
	 Anok5gtr5T61ZSZgYrb/Adj+xTWapsNgVeXSM82qZ28UuoeU2sSaNWl8H7KhrlwUn3
	 +5tlGup1Pd1RWHTQ8tCYqmf/N5c93MmUKsDabdSqJXdEbBZ4q9mx1LBv9YPJtJKrZl
	 up3TkdcO9Qx4Q==
Date: Fri, 21 Jun 2024 00:57:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yangtao Li <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
Message-ID: <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>

Hi Piotr,

On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> When del_timer_sync() is called in an interrupt context it throws a warning
> because of potential deadlock. Threaded irq handler fixes the potential
> problem.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

did you run into a lockdep splat?

Anything against using del_timer(), instead? Have you tried?

Thanks,
Andi

