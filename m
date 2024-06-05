Return-Path: <linux-i2c+bounces-3836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CFB8FD78C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 22:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16E131C22C86
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BDC15ECC9;
	Wed,  5 Jun 2024 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNXEwxrq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE17347A;
	Wed,  5 Jun 2024 20:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717619582; cv=none; b=CWBrHp+7Y1TZoqoau1yV3yt27OWgH1sBpMyUUQv9BxebduTuWt6pOJYlPH+dzzM2SRI2rKe/DaJa6SM2wEoV6WRav6dVOXU3LUoYxFn+kWZB49XSSH8Xvbo3wkoWrb+KOAko+ofAVzJWJDQeFyWLGSelcZ+v5kWwHJ2FaxxLDYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717619582; c=relaxed/simple;
	bh=pxVHh32DoFTykGJNSWL1YSbeEc74Mjkrhq/pwmV4b+k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Okx1+y4lrmGx0ljqMLcxs7QB0ChxUGSTj52Ut8wbyVLQPPL6Xf8uHld4pU+j20gIp9NsK32btM+20UumoAbvIwYNqgQ2I2/P1RaBCA1fxJcqnQMkmya22LwyJHfL0C3GuEGHPeJJeHNow+80Foz8XAN9nktSAnQtm7MKzS/5LuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNXEwxrq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29789C2BD11;
	Wed,  5 Jun 2024 20:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717619581;
	bh=pxVHh32DoFTykGJNSWL1YSbeEc74Mjkrhq/pwmV4b+k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=DNXEwxrqtxeGw1A7p/P4+pvkASK2IfnqLzQAQMmc/tdXBwLME1yBgmz3j/tqep0hl
	 GmgJwxJszbSsOOeZi0hRktrTFOH1hv9bKTHzbLXONA4+P/h6Q67O2D2pIGVLRmHcg+
	 R+awe2DcprKObg+8yymg51FOEOdaSxWK4635Ag4bAWlf/6fI2h4cLe5IK17XqcWRpk
	 B2DGl5eJGYcZfMgkPbax21pdNSHBr4XCYCLm7yziuI5MibhLyaicDnZBDiW8M07YxG
	 4iOzWsHygumDt6X+mK+3em4OCdDuA8CtXLmakG6mTBNnlUXy/RVdyJOAw1wKcsYF+m
	 PQHiWm7mKmAIg==
Date: Wed, 5 Jun 2024 21:32:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wolfram Sang <wsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc3
Message-ID: <c2yw3oj6btmcd2jjqglgdqdyg3vyhvxjxyyf7yhksg5omfoayn@uxpmlei3gktz>
References: <ZmARnWliAuHLbwOy@shikoro>
 <xa6xj6rpt5uuyxq4psm26qs5ptjn3n2krpdhcevh2kv2tz6eft@4t2undxir6un>
 <ckglrvpcemoff55qlhj3naiyclsipujqumincgrxrfr4wlxiyt@ivvgtko2vmvj>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ckglrvpcemoff55qlhj3naiyclsipujqumincgrxrfr4wlxiyt@ivvgtko2vmvj>

Hi Wolfram,

On Wed, Jun 05, 2024 at 04:18:31PM +0200, Wolfram Sang wrote:
> > I have a few fixes more for rc3, though that I'm planning to send
> > you tomorrow.
> 
> I see. If they are urgent, I will send a second PR. If not so much we
> can wait for rc4.

Sure... will keep them for rc4.

> But I really wanted to get rid of I2C_CLASS_SPD as
> soon as possible before new "users" (copy & pasting code) show up.

Makes sense!

Thanks,
Andi

