Return-Path: <linux-i2c+bounces-5639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133195A7D7
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 00:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6FD91C2187A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 22:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3007317C213;
	Wed, 21 Aug 2024 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pi3Pxaz1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC190176FAC;
	Wed, 21 Aug 2024 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724279518; cv=none; b=RdlmEOOu+8VwEkzVXNoY8SqzXnSBNYP1LpTrWzoAxcntOGiYFOxdR3wRUcCHDFCaPDO8nK/vDPzt+rc3ze9HtO3D+aAZLf8yjE/BywyQjlt0YqY2TuWHZ0qiaj3nhRlEcNonpehsoJkvZpnkF2EXjRL0TAuGJ6fjPFQDv3gXW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724279518; c=relaxed/simple;
	bh=ceYKa9Fo2UqkhS6Q7NCDDpDLpaW9SLoPxqmcrFgYv9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4K6+YmuE4jhouzhcZ9lpJoPJ9Mvxdee2oaFtHR4fEGj3XwkxzKl70yoeHVPhaG2T76vwO2q9vDGWwR0AZM1smFIn9sKre53oyzNVHqb3QDGFI5UFEQUkbUHV+1MuqiVUmQXjavcAJ/Gml3bayWjVNNG4WqrPLDLyWRRBwU/BJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pi3Pxaz1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54163C32781;
	Wed, 21 Aug 2024 22:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724279517;
	bh=ceYKa9Fo2UqkhS6Q7NCDDpDLpaW9SLoPxqmcrFgYv9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pi3Pxaz1r2VFHsEdTYQOU0Droi2ntt7POTr8WrhjTM+uwhK5wqQmC4gwiKc2yp3kn
	 H1yUGY/4FdBJ/OStVnth6v4KdrmXUZvy0tZblJSnT9IeFPp5vOsAs/PvHPhMFat47U
	 Wu6+7Ah8IeSWFYbg/s4Nk0JwuHpJnLami93tgeaELbF6BlNmRQEDZC4U8biT7rxLU6
	 +E8tCcf3alrT6DSm/XSQEynfK8WBMRBiF/Vtfdj1OJhciX9x473mjriJXhMt+WDz3N
	 KXXlqkxDz/caD2SPigWQklyaBaUKCIF421RZi2pIx8ZpGmHB/2Msl9t9GubNTwVe1Y
	 AXCy2t1d8ZwWg==
Date: Thu, 22 Aug 2024 00:31:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, Frank.Li@nxp.com, francesco.dolcini@toradex.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <i5fkv3gx5mmegefc6ttydrwmsebozc6dcjzg7doc6vozjvekuv@hsn3mzobjggm>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
 <ZsX8KzkQw0wJUCbc@pengutronix.de>
 <ZsYGbN36jwxyMAvE@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsYGbN36jwxyMAvE@eichest-laptop>

Hi Stefan,

On Wed, Aug 21, 2024 at 05:23:24PM GMT, Stefan Eichenberger wrote:
> On Wed, Aug 21, 2024 at 04:39:39PM +0200, Oleksij Rempel wrote:
> > On Wed, Aug 21, 2024 at 08:01:20AM -0300, Fabio Estevam wrote:
> > > On Mon, Aug 19, 2024 at 4:20 AM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > > According to the i.MX8M Mini reference manual chapter "16.1.4.2
> > > > Generation of Start" it is only necessary to poll for bus busy and
> > > > arbitration lost in multi master mode. This helps to avoid rescheduling
> > > > while the i2c bus is busy and avoids SMBus devices to timeout.
> > > >
> > > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > 
> > > This fixes a pca953x probe error on an imx8mp board running linux-stable 6.6:
> > > 
> > > [    1.893260] pca953x 2-0020: failed writing register
> > > [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
> > > 
> > > Could you please add a Fixes tag and Cc stable so that this can reach
> > > the stable kernels?
> > > 
> > > Tested-by: Fabio Estevam <festevam@denx.de>
> 
> Thanks a lot for testing. Are the other patches required as well or did
> only introducing the master mode flag solve the issue?

The other patches don't need the Fix tag.

One question, does the issue happen with atomic transfers or any
transfers?

> > It looks like with this patch, the I2SR_IAL interrupt is not cleared.
> > I would expect some kind of interrupt storm. Can you confirm it?
> 
> This is a good question. i2c_imx_trx_complete was never called in the
> interrupt handler. So that would mean the storm would already be there
> before just for a shorter time. We only clear the IFF flag in the isr.
> 
> > This causes a processor interrupt request (if the interrupt enable is
> > asserted [IIEN = 1]). The interrupt is set when one of the following
> > occurs:
> > - One byte transfer is completed (the interrupt is set at the falling
> >   edge of the ninth clock).
> > - An address is received that matches its own specific address in
> >   Slave Receive mode.
> > - Arbitration is lost.
> 
> Unfortunately, I don't have a device that uses multi master mode and we
> would only see it on such a device. However, also from the reference
> manual:
> 
> > IAL must be cleared by software by writing a "0" to it at the start of
> > the interrupt service routine
> 
> So most likely it was wrong the whole the time we just didn't see it
> before, could that be? I think a fix would be relatively easy we have to
> clear it at the beginning of the isr but after we read the status. I
> could add this to the series if you agree.

Please, if you can't test the patch don't send it.

Oleksij, I need your ack to apply this patch. What do you think
here?

Thanks,
Andi

