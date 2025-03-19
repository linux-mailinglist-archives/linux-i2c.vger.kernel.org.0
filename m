Return-Path: <linux-i2c+bounces-9908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E7EA688A6
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C89747ABF5F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 09:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEFC2566D1;
	Wed, 19 Mar 2025 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBWLZRsn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EE253F33;
	Wed, 19 Mar 2025 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377664; cv=none; b=SvfOxlfcgCoNRqJYLNfL9Fd1NxpeXZrE7HOi2lt//4h9inrJRCuW+P6y7jTMCLIkAiMWnW2Kh9fIUnIPEKgmmjKehBpgya994LfmRepOEe4q15rCGljZQn+MM5zoD07ROj+3lPGQXbJ7OdCwHGUGRbd7UrlG25jODo7EXrS4gTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377664; c=relaxed/simple;
	bh=A+7i8lDvuIwBOp1wOF5vw2fs19ibuLwowfXmp1Iy/Ag=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js+ewGzj4eO2oOXXqCvZs5wAXTsZxW3W0A/MUdVViFfjk4xFTg7dIIAKe+71aubWrDSf2qeWzzZk3zD9PGyxTuK5S9S7ymIZSi7PoDMSoPl9zKPoOt1d6v7ikQxXds/CvFcYS215wEf6R+ReRCT3tKgA+Mq0YRPn7XmFBd+yFEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBWLZRsn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F27BC4CEE9;
	Wed, 19 Mar 2025 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742377663;
	bh=A+7i8lDvuIwBOp1wOF5vw2fs19ibuLwowfXmp1Iy/Ag=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=qBWLZRsngwbivci6IWv1UytjX6ohj8fM7hZYo+ovrhHY13wHAt+mjAQtziqMlqAxW
	 JnK+3uCuXjSWwfNgAT7h29OMvOEJlQ4a/M5wRiXuybZJsmu07n8lgXBgNPiKCwJbHi
	 qTDC2B7yspJJ94mI8kS/414y9VD3OYu+1eFp3RerLiLOxIp7iv0/ciyNhZdT8Jn62+
	 8+WtTfOZ++kpTyKKwCOm6YNV6dgO+8BOOH03Sqa6RSHhJ/puUVD9m/giY24tzdpx6u
	 2TJPMPUBq8ag6jp08LWR4kDg4vWmzA0KOIO3HRmJtFNCkV9AbTvtMEEwYKIk8zYepp
	 Lb4+M4SRGWM6w==
Date: Wed, 19 Mar 2025 10:47:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v13 2/3] i2c: octeon: remove 10-bit addressing support
Message-ID: <beqo7xnbo3obxxkop6rq3awzsdcjb7sioeapqj3naekqes2bk4@3ojtbocdejca>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>
 <j2w45gphxir2hmzr6nhzyrlgj55lhsbkzczpf5bq72pzk26kwp@zncvv3hpfcoc>
 <Z9pZBDbI2MD7ybEL@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9pZBDbI2MD7ybEL@shikoro>

On Wed, Mar 19, 2025 at 06:41:24AM +0100, Wolfram Sang wrote:
> > The datasheet I have isn't very clear on this part. Also, I'd
> > like to know if there's any product line that could be negatively
> > impacted by this patch.
> 
> In my whole I2C life, I have neither seen a target supporting 10-bit
> addressing nor a a system that uses 10-bit addressing.

mmhhh... I have to work with my memory and dig into my
documentations, but I think I've seen some STM sensors supporting
also 10 bit addresses.

> I am even tempted
> to remove support from the kernel omce in a while. If the support is
> broken in this driver, it can be removed.

The documentation I have is in line with the patch (I had to read
it twice, though), but I didn't want to exclude corner cases.

> A working version (if
> possible) can be added again by someone who needs it. I am taking bets
> it will be "never". Besides, the driver never set I2C_FUNC_10BIT_ADDR,
> so it really shouldn't have been used anywhere.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

OK, I had a little hesitation here, but if you are sure about it
(and Andy as well) I'll take it in.

Thanks, Wolfram!
Andi

