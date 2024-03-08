Return-Path: <linux-i2c+bounces-2287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5011B876446
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811731C20B98
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5390556B8A;
	Fri,  8 Mar 2024 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT86/EPm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9644C84;
	Fri,  8 Mar 2024 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709900857; cv=none; b=cjtuxErSVyBl4Jd8PIS+0f97ZOKYjlBBQACE/hsxtAhWXynsG+HHKoHhpyPkrdgsSMZyhQqB71JGEZzv9PciPkfjHoFkTbWb6gN+j0lfTtL3w51o28SofYrmuD3FasIvmK0gLERXow1i2zYRdVR46i1Hwsn6Nh6BeOUmtBwci9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709900857; c=relaxed/simple;
	bh=9aWRkRp0aXxu1FToQ1QE8fJZnNk6EJp6E8aVbwyrDP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4GHDAL7SDit4ceNNuF8DRITNpFE+B7YHuXSAdtzqKX1+CMxk0p15bIbAaIygvy6HNQNqIDZAJ9tQIKbR/rCsT4WRPTbSsGoshARjd0IaJY1vnPtbfieBU5tS0cg+r6K6LujJWioBCPJOmNnuUgnrO312M+yCMxxAfRbTYs9xsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT86/EPm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1186BC433C7;
	Fri,  8 Mar 2024 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709900856;
	bh=9aWRkRp0aXxu1FToQ1QE8fJZnNk6EJp6E8aVbwyrDP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iT86/EPm5LHZwza+SQqVakxv6gjc5AGIgV0djoqUqkPu9XXrYq5Y+nnwcjEEipodv
	 0aN07GYrVHXA2whdiMbqINTItGFTGNDeoj2TRHocHSpN2zEixiT4o0s9+WBxYhMxY5
	 /QJrfWmiCM0RJUjpbxCAXRxsKbifep3nC3xYfk0o3ZvARqVC/NuDuDydqujQ38DDfJ
	 M+pyLQoBSSh6tSdW2q1F5M2cLfz/sUKFQlWpdki2YehLfBQVLuzBH0KzKeFXmqUK86
	 dYegQdStk7x25XwRK/BprvQJfaMXezwQybLbNoT1md3kuoNEmTw+UeLdUKJgquCREy
	 GuWrk5G0AnIxw==
Date: Fri, 8 Mar 2024 13:27:33 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 03/11] i2c: nomadik: simplify IRQ masking logic
Message-ID: <3f7zpl4yu5gsojmfhdrbieev3gatfcgag5tnmgmrv3u46y4pny@tamjf6cq5g3v>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-3-605f866aa4ec@bootlin.com>
 <422szb2dtgnq56xznfqsqtqs3dai2jipnntrp6yb2og353whs7@g4ia5ynnmqu6>
 <CZO8SUELNP4R.230VKX59UIHC8@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CZO8SUELNP4R.230VKX59UIHC8@bootlin.com>

Hi Theo,

On Fri, Mar 08, 2024 at 09:57:39AM +0100, Théo Lebrun wrote:
> Hello,
> 
> On Fri Mar 8, 2024 at 12:01 AM CET, Andi Shyti wrote:
> > Hi Theo,
> >
> > On Wed, Mar 06, 2024 at 06:59:23PM +0100, Théo Lebrun wrote:
> > > IRQ_MASK and I2C_CLEAR_ALL_INTS both mask available interrupts. IRQ_MASK
> > > removes top options (bits 29-31). I2C_CLEAR_ALL_INTS removes reserved
> > > options including top bits. Keep the latter.
> > > 
> > > 31  29  27  25  23  21  19  17  15  13  11  09  07  05  03  01
> > >   30  28  26  24  22  20  18  16  14  12  10  08  06  04  02  00
> > > --- IRQ_MASK: --------------------------------------------------
> > >       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
> > > 0 0 0
> > > --- I2C_CLEAR_ALL_INTS: ----------------------------------------
> > >       1     1 1       1 1 1 1 1                   1 1 1 1 1 1 1
> > > 0 0 0   0 0     0 0 0           0 0 0 0 0 0 0 0 0
> > > 
> > > Notice I2C_CLEAR_ALL_INTS is more restrictive than IRQ_MASK.
> > > 
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> >
> > You did answer my question in v2, thanks, Theo!
> 
> Oops my mailer syntax is telling me that the lines starting with '---'
> might cause issue as it might mark the end of commit messages. I'll fix
> that in next revision. If it gets applied before that it should be
> checked that part of the message doesn't get lost.

mmhhh... right! No need to resend, if nothing else is needed from
the series, please paste the commit message here and I will fix
it.

Andi

