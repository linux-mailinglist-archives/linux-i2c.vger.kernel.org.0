Return-Path: <linux-i2c+bounces-11994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB53B0DB2E
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 15:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AFAD3A5ED4
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 13:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD4D242D8F;
	Tue, 22 Jul 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y22bl0eW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807172624;
	Tue, 22 Jul 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191931; cv=none; b=ntFtUEJBKJMkcaU+fIN3GioOrwxtvs2AeGgTaEgcNRXFHguSc+rtjfVBYt+nhfkuKyTFS1Xhbl18OwVgfAlmRaL0KhqAx0qwY0WUvJlWHQPkXZavueKeILkKGfLmq6/ZBhZv/AUtNt5uY426C03TWCftpW8fGeUjMmDBj8PkVwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191931; c=relaxed/simple;
	bh=sfAWqqVOyewgocr2//DhDzraJRp2DIpL9qG6LOpMwuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0wJ3yVuZ8jbWhxiSPfcNBTR4VlynBluQaGvYN0oDp6p5y1QXoxDNmD8M9uAtlfKjGITAOAE3Epd9xpDFSCuKRZOguePIG8Rki/mG+5P6R3IsKSuFA3ExyXRB0+oIeJhLeBR7Tw0PQWwKQK4mFraucyxKxMqtnIjqSfbNG4QoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y22bl0eW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE5FC4CEEB;
	Tue, 22 Jul 2025 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753191931;
	bh=sfAWqqVOyewgocr2//DhDzraJRp2DIpL9qG6LOpMwuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y22bl0eWsGv86R2Jte5IQjy42edUn48LoY0DNFpqoKfu97wZNzIIEigIDCJ1RwG2y
	 dY22z/C3WOMMUSzt0notL5JDhHYg8gZ7GhBr053bnTb+E2xA07Zu5GzhXP5aJFAEGA
	 WbvttXa2lywD3zJNVsOCMbBtY7Eb5Ev2odAk5EwnBNiHwif+oP1LuMHHj/d3d6uLX6
	 BvYPQviqY3ibNQd3xigJpLvSTgC+AlqHjzSkKApH9TzRVgDGyjzpAb3Uvz5mPdkvJH
	 uXL6wkGTOfMGNtKomsL+bGNBP9XWxwxcFKHIYdQkLsobx56g5bGZ80jwbhyt3YEgfl
	 9XOWXwgclt/aA==
Date: Tue, 22 Jul 2025 15:45:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc7
Message-ID: <wxsmvpqszpz5rcutlqzuznmur2snfgvilpukxmlzdtvqxmlv5u@njfcqtmmbrio>
References: <2lbfr4r4icozrhnh5vgitzc6dylnxvh7x6fkdytacsy3oncsfe@7usj2u6nbk45>
 <aH0zRiDe75dAPHkk@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH0zRiDe75dAPHkk@shikoro>

Hi Wolfram,

On Sun, Jul 20, 2025 at 08:19:50PM +0200, Wolfram Sang wrote:
> Hi Andi,
> 
> > in this pull request you have included also the previous week's
> > patches. Everything is rebased on top of rc6.
> 
> Sorry, not pulled. Maybe they slipped through the cracks, but I wrote
> two mails *not* to send me a rebased branch but an incrementally updated
> one [1] [2]. Rebasing public trees pulled in by someone else lead to a
> number of problems e.g. original mail of thread [2].

sorry, I missed your second e-mail and I misunderstood your first
e-mail (I thought you haven't pulled anything, yet).

> So, I just sent last weeks PR to Linus. If that is in rc7, then you can
> rebase the missing patches from here to rc7. Because that one I haven't
> pulled yet.
> 
> Makes sense?

OK, I will now rebase everything missing on top of rc7.

Thanks and sorry for the confusion,
Andi

