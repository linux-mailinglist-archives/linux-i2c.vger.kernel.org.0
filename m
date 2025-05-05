Return-Path: <linux-i2c+bounces-10789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767BEAA9EC5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 00:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 784871A81108
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ADB2750F5;
	Mon,  5 May 2025 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZANMyNE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C313AF2;
	Mon,  5 May 2025 22:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483184; cv=none; b=M8l1J34WuGV1NWXI2C8kKPJ5Vur2cth6fypfVmAtqypJnElwo+afZZYUWwrA1sw0PUJTW4JmDCBcqvkABP2fkdExkpZjx/45Fc2YcKJKtLP6B3JNmb0CfSoPisWCe8/8VQt193n8IOJg3EYVxI8RL+FMP/sw2t8fHziV2ISZVn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483184; c=relaxed/simple;
	bh=wyVv8r87sFQD3h4JxZbcpjjhi07POlfuqfD61jwf/WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4/sVdu9SciKf7uJEk7JnhWb0LwQCBNUd5WgzZSIKbHwgpyMySmX4ZUCwaQt3WxMDdZAAeOtyT+KtU/lu21uKXlV1hchl931vTBVRE+Eb+9WA78x2mIJrohLwPqjEvRJMnRfjXUE31GyeEqGDmo4qQxMCHiJvT9enUbXENiZI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZANMyNE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E369AC4CEE4;
	Mon,  5 May 2025 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483183;
	bh=wyVv8r87sFQD3h4JxZbcpjjhi07POlfuqfD61jwf/WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZANMyNEI1oG7oG8Lbnk5GKx+kYRPd8c8oPqrO9lTzLaEamqD+IznbrSMUeVs9yuh
	 nNDSW3vIph88Xbc0VVlZ0+dZLABQaupc/jqipV2tosqfK/66kDlNDI3L8P1vmD1leu
	 jgNiYfmoJ0y/hApMjRcRod2/FCSIev2PLpY3PSXKg7tF+rysIVI5xIjzODARRUAjxk
	 MV2CJSPY3T9VKAGWFAUNMU71o5yFphGWaiMP5mSTSItTQzQL0+S8IvYtCBhWVtzZdQ
	 gzVL7qxqOFHr6qEmBRPF8zFnrcKtOmtlQA8U11VJ//lldEf80oTMQMKyRp6Q+OtnUm
	 I2FGI/wEY8jIQ==
Date: Tue, 6 May 2025 00:13:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <6nn2l75kkbkdu3wf3kta4mezno6cy4e3zzwzdc4cpmujjhr6lp@ct7w72zwbrhu>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
 <vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>
 <aAIiJQVAUdWJFVy7@hovoldconsulting.com>
 <hn3gsrizar6xbr4seclnb6xot4fo4ztryks4w7exvztsdzj4f6@jhobhujf3ezi>
 <aBiMJ0z5q4K2xTGT@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBiMJ0z5q4K2xTGT@hovoldconsulting.com>

Hi Johan,

On Mon, May 05, 2025 at 12:00:07PM +0200, Johan Hovold wrote:
> On Tue, Apr 29, 2025 at 03:10:13PM +0200, Andi Shyti wrote:
> > On Fri, Apr 18, 2025 at 11:57:57AM +0200, Johan Hovold wrote:
> > > On Thu, Apr 17, 2025 at 11:41:51PM +0200, Andi Shyti wrote:
> > > > On Tue, Apr 15, 2025 at 09:52:30AM +0200, Johan Hovold wrote:
> > > > > Using of_property_read_bool() for non-boolean properties is deprecated
> > > > > and results in a warning during runtime since commit c141ecc3cecd ("of:
> > > > > Warn when of_property_read_bool() is used on non-boolean properties").
> > > > > 
> > > > > Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
> > > > > Cc: Jayesh Choudhary <j-choudhary@ti.com>
> > > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > > 
> > > > Thanks for your patch! I'm going to drop the Fixes tag, as this
> > > > isn't really a bug fix but rather a warning suppression during
> > > > boot time.
> > > 
> > > Thanks, but I think you should have kept the Fixes tag and merged this
> > > for 6.15 (i2c-host-fixes) since this is a new warning in 6.15-rc1 (and
> > > that does warrant a Fixes tag). Perhaps I should have highlighted that
> > > better.
> > > 
> > > If the offending patch had been posted or merged before such uses
> > > started generating warnings in 6.14-rc1 then that would have been a
> > > different matter.
> > 
> > I'm sorry, but as I understand it, the Fixes tag should be used
> > only when an actual bug is being fixed. I've seen stable
> > maintainers getting annoyed when it's used for non-bug issues.
> 
> You seem to confuse the Fixes tag with a CC stable tag. A Fixes tag is
> used to indicate which commit introduced an issue, while the CC stable
> tag is used to flag a commit for backporting (and the fact that autosel
> tends to pick up patches with just a Fixes doesn't change this).

(the Cc tag for fixes is not mandatory, it's more a courtesy)

> It's perfectly fine to fix an issue and use a Fixes tag when doing so
> even if the fix itself does not qualify for backporting (for whatever
> reason).

Oh yes, I forgot that patch was part of the 6.15 merge window. I
will then move it to the -fixes and send it for this week's merge
request.

Thanks and sorry for the confusion,
Andi

> > The system works perfectly fine even with the warning printed.
> > It might confuse CI systems, but that shouldn't really be our
> > concern.
> 
> You should not knowingly be introducing new warnings. The Fixes tag I
> added showed that this was an issue introduced in 6.15-rc1, and, unless
> discovered really late in the cycle, it should be fixed before 6.15 is
> out.
> 
> Johan

