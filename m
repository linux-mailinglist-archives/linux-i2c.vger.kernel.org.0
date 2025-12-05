Return-Path: <linux-i2c+bounces-14461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF9CA997A
	for <lists+linux-i2c@lfdr.de>; Sat, 06 Dec 2025 00:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 873EA302354C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 23:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D412C234A;
	Fri,  5 Dec 2025 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZlo1laG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF5A3D3B3;
	Fri,  5 Dec 2025 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764976494; cv=none; b=S8+cHJKdX5/r6+F1wwC3nSMOAWp1eRBtZnCfovdQkxWqjXHectoCGAsFwSsz3MAVJ0W8ORbWI93GjYw5pqz9RktILnZNv1rD6bUEl5jvgQtnxE5Fk4urGV4iF6W0I8/gej0qGcHS6arVMrsyXgeVj4Hp/97XDDjN0ag4Kf5myM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764976494; c=relaxed/simple;
	bh=hOeUDHdzod0E6EFoFf5WfNRip5UjVzZqB83AREIU6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlVLjXXH/cekg82q56UDa1g0dIAP9N88PyzS3yt0CM45IRhD476xj2PAERoujSKH4S1NzRfLV6rzsaoZeXRNfT/UEqYB+nYivif3QbPGLesop0BIakQNHkrCKY0X1JGfqWNgzk+8zDZafROmaq1I0Hj3Na5BK3Ba25EKMd5qC9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZlo1laG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52230C4CEF1;
	Fri,  5 Dec 2025 23:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764976494;
	bh=hOeUDHdzod0E6EFoFf5WfNRip5UjVzZqB83AREIU6BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZlo1laGddarmi5ylsertW8BAZj6k3mkan/U12fKdAbLRa1GTYhZFjMC135Dv4UOq
	 LsalpM2imqpT+SyGmA/2Hsnd5kRvcFkvHn5xRgWLJiaV85EvCMwFZHLGana0Jy/SD4
	 5aMtul4XWLxuw4h0N8F7ZSN5U8FOrNupGanlPNZXuOAaqHSXcXsSKiRk/WcrXlj5dj
	 NhGzyIeO5ki8f6A+w2/HJmaQ20ZAcUk0U2Xrb2dSEXAShtEOPt15b4uUgTMtCRCN1B
	 3Umk21ic/6wXmZhNcHQjudtdkB3E8MM31yNsYkvfWLZ+yQCeSHuSvKj0ZSwlPTi+jO
	 0wlUP8015LrxQ==
Date: Sat, 6 Dec 2025 00:14:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: i2c-host for v6.18
Message-ID: <5sisddiomyxmkvm744h5luphomyadnenpjk5pf5kemqw7tcok3@qzmbc2cr42vw>
References: <zzuyemsikzpbntvmgxm2fu7p4vs7uwkawyd5rd732p5ralx2fg@wnqvjg2mi7vu>
 <aTLDJPD-4TLEuRI9@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTLDJPD-4TLEuRI9@shikoro>

Hi Wolfram,

> >   Linux 6.18 (2025-11-30 14:42:10 -0800)
> 
> Urgs, but this is highly problematic. I can't pull something based on
> 6.18. Usually, things are based on -rc1 or something early to show Linus
> that it has been in -next for a while. He won't pull something that is
> less than 48 hours in public and so won't I.

Just a note that I merged the last few patches on Wednesday. So,
if the 48 hour window applies, we are well within it.

> I hope you still have the ref of the branch *before* you rebased to
> 6.18. Please send a pull request for this old one.

As I mentioned privately, I can split this into two pull requests
and use the older reference for the earlier patches if that
helps. To me it feels more like a formality, since those patches
have already been in -next for a few weeks and were only rebased
on top of v6.18. But I am happy to do whatever you prefer.

Andi

