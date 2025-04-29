Return-Path: <linux-i2c+bounces-10678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D21AA0D33
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 15:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 047887B65A7
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B76C2D322F;
	Tue, 29 Apr 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtnUICMD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1312C17A8;
	Tue, 29 Apr 2025 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932219; cv=none; b=a+hoMbwLy/qdCIIxAnR9dv2sXY34mrkHS6MBap5vOLe6sQDcoAe6wFgJBzX3nshvoCuLyFLVdtNMV8oekiIXogT85gJ3DgpMACeIhDwfEOG7D65xNEgKz/jWMedY1SMUgD1UjyNI7t7W15PJ+VaH8fUdsmqz67RgfCyoohaGrQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932219; c=relaxed/simple;
	bh=IzrxC7he26apAHDDvv+KYJMiYGUo/4A40rCRLAjQJbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWT3bWwr1w6hpWLpipZJ58NfqOngIdvb9BfVDlivFJ3zpgpngrVlHWFhlcb4WyDoH2KT6xPL9R1HXVdF5wPRzYcnwBnfy9pP6VDDSUDXuNqCun/aU9QPdWvDcQ2HJbqFzBFs8FSvO9sDHBH9ULnsDKn5frcbI8m3flcgpBeQ7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtnUICMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB6C4CEE3;
	Tue, 29 Apr 2025 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745932217;
	bh=IzrxC7he26apAHDDvv+KYJMiYGUo/4A40rCRLAjQJbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtnUICMD6mSY/gijnrYmtmk1l0kXZTjRECImDuNETF/3jr6KvOb288LMMQzSqezBb
	 xrFOvfejp1VzhEvBqj4sCz/b5qmaw2BLK9iGSJP9ShIUGgb1AsaiK5Bs5hS3849HLo
	 a2acwngDr1jthX+8M0vjdtIaw5NneU+REYx+okI5MYXKvQQl3C5OWjJLMkK+PKcY6f
	 VDhPZDAJtaPu6fDmWJfeWlvPjFvtW9T0UYaAZkjGcFzJxYOtQCJu9bS0LfFxzKgKE2
	 a4Hrn7rC8gyRorCpdS2Int/7F4r0xkmH76xaXisBI2aNZOkDuYqJgm0VBR+rsFBZKe
	 tBTVd+bWt0MVA==
Date: Tue, 29 Apr 2025 15:10:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <hn3gsrizar6xbr4seclnb6xot4fo4ztryks4w7exvztsdzj4f6@jhobhujf3ezi>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
 <vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>
 <aAIiJQVAUdWJFVy7@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAIiJQVAUdWJFVy7@hovoldconsulting.com>

Hi Johan,

On Fri, Apr 18, 2025 at 11:57:57AM +0200, Johan Hovold wrote:
> On Thu, Apr 17, 2025 at 11:41:51PM +0200, Andi Shyti wrote:
> > On Tue, Apr 15, 2025 at 09:52:30AM +0200, Johan Hovold wrote:
> > > Using of_property_read_bool() for non-boolean properties is deprecated
> > > and results in a warning during runtime since commit c141ecc3cecd ("of:
> > > Warn when of_property_read_bool() is used on non-boolean properties").
> > > 
> > > Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
> > > Cc: Jayesh Choudhary <j-choudhary@ti.com>
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > 
> > Thanks for your patch! I'm going to drop the Fixes tag, as this
> > isn't really a bug fix but rather a warning suppression during
> > boot time.
> 
> Thanks, but I think you should have kept the Fixes tag and merged this
> for 6.15 (i2c-host-fixes) since this is a new warning in 6.15-rc1 (and
> that does warrant a Fixes tag). Perhaps I should have highlighted that
> better.
> 
> If the offending patch had been posted or merged before such uses
> started generating warnings in 6.14-rc1 then that would have been a
> different matter.

I'm sorry, but as I understand it, the Fixes tag should be used
only when an actual bug is being fixed. I've seen stable
maintainers getting annoyed when it's used for non-bug issues.

The system works perfectly fine even with the warning printed.
It might confuse CI systems, but that shouldn't really be our
concern.

In any case, I see your point and I'm open to hearing a third
opinion.

Thanks,
Andi

