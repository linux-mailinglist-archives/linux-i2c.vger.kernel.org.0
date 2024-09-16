Return-Path: <linux-i2c+bounces-6799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D8897A2C1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 15:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466D81C21B5E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 13:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C2B155741;
	Mon, 16 Sep 2024 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MX5WFvVZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8B2153BEE;
	Mon, 16 Sep 2024 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726492330; cv=none; b=ZTDSyXtQoAbaK+THrVoDc2rdgbwU/ZBSwBIBH0EKMYL94QmD0wtFqr1hkBXQOaSkGaEFEW7X+xg3nPnZK/40t3OK4Nvr96XDqZk4lDUxFpTcei00weNlfRyV2GqzoR366ilP7QUgbv2qdm83PWqGzSbufiJ8jj2+yNlLtPhjWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726492330; c=relaxed/simple;
	bh=OqKkx4zwBTU7LgS6g8asbX93LnfyZoSTfQ2YqxcIbQI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Labk8Ok431AWy18w2IXL1NEXa5UgoIgsyA0T+vfzP8Eyi4p8gwNXhQrobHTI71DshNlKLsTlIZumLzEseDtMaNDEoed+T3vSuWwnaQmKd6YkBbo1gZ1WsqDo/H5au/d7JmrvlWt/+wKlKSTtU2vemj10M+Pv3NKoC4KgwgLolSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MX5WFvVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89631C4CEC4;
	Mon, 16 Sep 2024 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726492329;
	bh=OqKkx4zwBTU7LgS6g8asbX93LnfyZoSTfQ2YqxcIbQI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=MX5WFvVZ5hjfmzxVjQYjJ4qilbdDUJXxfHdzHGN1mgNo6b6KcUpFpC/+Lic5/XFgm
	 dQj8V5MNEc4akPDwTnlz6GgZdof1IbWWXJFNduxCAi05jk5V7GwASSalMgGnCgDkQ9
	 jhSg5MHQcmd/dqLlu0M1Zpxefv9tWAouEMTSi6bnkL6z1aeZ6vsvRJVohyg6QxK5p4
	 NUk2vPm+EHVSnqzL46jVuL7wvXFqbbCHh3fv79/1k72H+JIdM1qm63QCagHoE6g9w9
	 u9xI5rxetM1pbf23c6Q5Tyzw0LDPE+yqBgoStTa0IJxJ4Is2oJ1R6LIdSxiR8sHToj
	 nwWqbWru0dn9w==
Date: Mon, 16 Sep 2024 15:12:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.11-rc8
Message-ID: <jlebwv5qchjbu6q2g36a7ilcnyt2o2zc4i2vw55vyqfmfnkkre@yrqezt3ufmkt>
References: <2itivkfhp7s2dzmihtlo67w53wpdiukmmrcf625isex5rrtu23@4naen2rzimxw>
 <Zugg26oB74biYTwN@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zugg26oB74biYTwN@shikoro>

Hi Wolfram,

On Mon, Sep 16, 2024 at 02:13:15PM GMT, Wolfram Sang wrote:
> Hi Andi,
> 
> > Here’s the fixes pull request. It’s funny, after a few weeks with
> > no fixes, right at the merge window, I’m sending in five!
> 
> And sorry for not getting it into 6.11-final. I was on my way to Vienna
> to the conferences but the weather conditions made the travel quite
> chaotic, so I didn't have enough bandwidth to handle the PR in time.

No worries, Wolfram! I figured things might get a bit hectic for
a while, so I expected it. :-)

> I will send it to Linus as the first I2C pull request right away. Before
> our "main one". Sorry for the troubles!

I can take the opportunity to include a few more fixes and send
a new pull request.

Also, there’s a patch from you (a fix of a fix) that I’ve already
commented on, which can be integrated as well.

As you wish :-)

Andi

