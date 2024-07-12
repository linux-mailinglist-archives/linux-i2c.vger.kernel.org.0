Return-Path: <linux-i2c+bounces-4962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087592F8C2
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 12:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA591F236C1
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 10:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325B9154BE8;
	Fri, 12 Jul 2024 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJsLT8bE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA281179AA;
	Fri, 12 Jul 2024 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720779328; cv=none; b=VFxxtnNiDCwKelxQw0/OVouhI1VtmIf8TCbzyj0Vp8PMju/5r2MSzTxgB8Zn/rZ+OELrJ9K9T3tIa8vu88tMP8qGLuvHyUq6hdPvmnhZgaF10LragyfP7RuM87YHyO1UpbhbqB9wTuV6K82f6IR1VPs+J9RXbYF6amOoeEn7ZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720779328; c=relaxed/simple;
	bh=AGn3G50o8OB3jWdzmtWhuLVvRg27O3BbS0LxxOGFq+Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaGQskmpNRp2ThGeVhbe/xxMeBsfLw/uuZ9+XksH9Cf2f3cJR7/B6F7tikJPW2h/IGq4WcBA+mNJtULwyYsoGLpUGIyJv921hXllTS2x9KfqfOpx1QKsUihlmbPV6b71ONVjn2hv6EaZQA9zoftzVPT5OHym2oDMWpAfg7WGlVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJsLT8bE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB57BC32782;
	Fri, 12 Jul 2024 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779327;
	bh=AGn3G50o8OB3jWdzmtWhuLVvRg27O3BbS0LxxOGFq+Y=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=tJsLT8bEHV+dXhgp7ER0pEtG1a6L9jW1vISOGbmwOdzpuunMQSf4ny35qkyUAC878
	 FtVPJfgyFX3NrDAicb9Y4p9TsDRI8HA8B/FggigPCYP12GhlOGZMtcWJE8aC/C2nJz
	 NmgW5lhfrPV31YA7Ynsmo4h430Ya+EDRlCOkpuAApYOK0NwHwkjKJ4RE4+2OouGh1A
	 s/dhWrH0Wl4rsufI/xG3WRqRNPPnc8EpLvNKf2ATH/tMo8xikJlbPpnGyd+jzXAmDg
	 eKEoOwFTZKWL9a4YuKk8Yl2+DqRi3+I5r3RyAZ+16MRyIllky3UsuVHZh2WVv3bVy7
	 YDFnhEzb9cmXQ==
Date: Fri, 12 Jul 2024 12:15:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	lkml <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	virtualization@lists.linux.dev
Subject: Re: [PATCH 0/2] Cleanup the MAINTAINER's file
Message-ID: <f2ur5lj5fkliwoab6rcpnxraqcueyh46j4p7ckgn3ced4mgajt@lj53dwinzpgu>
References: <20240711231927.3103820-1-andi.shyti@kernel.org>
 <ZpDOY5KKee93lToM@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpDOY5KKee93lToM@shikoro>

Hi Wolfram,

On Fri, Jul 12, 2024 at 08:34:11AM GMT, Wolfram Sang wrote:
> On Fri, Jul 12, 2024 at 01:19:24AM +0200, Andi Shyti wrote:
> > Hi,
> > 
> > while reviewing Wolfram's series, I received some delivery
> > failure notifications for e-mails that don't exist anymore.
> > 
> > With this series I'm removing:
> > 
> >  - Conghui Chen <conghui.chen@intel.com>
> >  - Thor Thayer <thor.thayer@linux.intel.com>
> 
> Fixes for these two are already in my for-current branch. (And the
> patches were on the i2c list, Andi ;))

oh yes... sorry, completely forgot. Please, ignore, then :-)

Andi

