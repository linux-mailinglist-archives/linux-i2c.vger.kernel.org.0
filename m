Return-Path: <linux-i2c+bounces-10809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D6CAABBE0
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 09:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 113D0189B26D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 07:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A6E21D595;
	Tue,  6 May 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNnbg1RP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCC2153E8;
	Tue,  6 May 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746514911; cv=none; b=uK4o49KMGkj615RziDQdCYbLAX4pxvocZT3/b53ZHtmiMad0HJuTr0CcqHja5Qo31HYKlESpxEYZGACCzvhgzfKZFCI/GNr8fB+PRtfkhNfH0pzKsYAGyivu1E3q7szd32n6/eO1qpfsEzZc7hl7Blhnz6nfNlHnDGEw5FcHwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746514911; c=relaxed/simple;
	bh=3e+bXisIVgWVW5HiHUl8/1fadTRryB6P+vRz6FYW0m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUG888kXqGAD7uaQdPUSr087E7cs5vOJVKMWOd/R60KYxOShM8oIgwJr9GLkVfSZNYUQsklRti7/b7YaSLiwaHcql3vDG60//hnqZ1JLFwEI8930TuaMl73gKiwkKU/LdjLj3Ow01yYXIrENu1+jRI3mXU63y+oTz/tO1Dh1354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNnbg1RP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188A8C4CEED;
	Tue,  6 May 2025 07:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746514911;
	bh=3e+bXisIVgWVW5HiHUl8/1fadTRryB6P+vRz6FYW0m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNnbg1RP+v6AaxdDJ0aFA4TWtGcGpc6wqQgXuji88MvtJv6q++0/k3JWsLEpSF0PB
	 iG1xEe/z3hYd/iUYCbp2OTFyWT6UgI5Kqaox8j+MqSEVdg3MO8/U4UkeHYKlYXLA2A
	 RhpFKe6BT8JW0mlKs7pBmZSrCYduS1YwnmNle8UYtI+Od1Cp9pdYEDjIg680+rCCCD
	 0zgFU/a/Zo7P8Ij3B1yn1L66z2SVE7xlNRsdk08pSRflVjly59euY/5rVZbJygWjJX
	 kQnqv92FUBVNJsOdRztnWkvsh09II9WxZZItN/CpwkyArno8WfrH7J355DykJmtkd0
	 C3kPvHfnD0JAg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCCJG-000000006rV-2OBA;
	Tue, 06 May 2025 09:01:46 +0200
Date: Tue, 6 May 2025 09:01:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vignesh R <vigneshr@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <aBmz2iDObAgendMc@hovoldconsulting.com>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
 <vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>
 <aAIiJQVAUdWJFVy7@hovoldconsulting.com>
 <hn3gsrizar6xbr4seclnb6xot4fo4ztryks4w7exvztsdzj4f6@jhobhujf3ezi>
 <aBiMJ0z5q4K2xTGT@hovoldconsulting.com>
 <6nn2l75kkbkdu3wf3kta4mezno6cy4e3zzwzdc4cpmujjhr6lp@ct7w72zwbrhu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6nn2l75kkbkdu3wf3kta4mezno6cy4e3zzwzdc4cpmujjhr6lp@ct7w72zwbrhu>

On Tue, May 06, 2025 at 12:13:00AM +0200, Andi Shyti wrote:
> On Mon, May 05, 2025 at 12:00:07PM +0200, Johan Hovold wrote:
> > On Tue, Apr 29, 2025 at 03:10:13PM +0200, Andi Shyti wrote:

> > > I'm sorry, but as I understand it, the Fixes tag should be used
> > > only when an actual bug is being fixed. I've seen stable
> > > maintainers getting annoyed when it's used for non-bug issues.
> > 
> > You seem to confuse the Fixes tag with a CC stable tag. A Fixes tag is
> > used to indicate which commit introduced an issue, while the CC stable
> > tag is used to flag a commit for backporting (and the fact that autosel
> > tends to pick up patches with just a Fixes doesn't change this).
> 
> (the Cc tag for fixes is not mandatory, it's more a courtesy)

You should still add it as described by the stable tree docs:

	To have a patch you submit for mainline inclusion later
	automatically picked up for stable trees, add this tag in the
	sign-off area::

	Cc: stable@vger.kernel.org

The stable team also scans through patches with just a Fixes tag because
some people forget to add the tag, don't know that they should, or don't
care about stable, but you should not rely on that (as I alluded to
above).

> > It's perfectly fine to fix an issue and use a Fixes tag when doing so
> > even if the fix itself does not qualify for backporting (for whatever
> > reason).
> 
> Oh yes, I forgot that patch was part of the 6.15 merge window. I
> will then move it to the -fixes and send it for this week's merge
> request.

Perfect, thanks.

Johan

