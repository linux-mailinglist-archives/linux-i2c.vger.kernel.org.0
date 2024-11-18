Return-Path: <linux-i2c+bounces-8026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4049D1274
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 14:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3252AB2D6AD
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 13:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFE21BE87C;
	Mon, 18 Nov 2024 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrwFVUoR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD85319F111;
	Mon, 18 Nov 2024 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731936836; cv=none; b=Osr71x4L8kGE+Eoh5yWdtx1z5tlHyuRd713NhDBH9KEbzhN25rTbuhXTtLHeMjR/USXYi8uxViUjK6ODYCJntCeU5fOX4QgNXUSSMqaIpG3ilSq9cB/MslW6sLyCzqetSImIrwCVFaF6NQYbTt0fDtFUkpDGYaSh+DhwnwQ6EU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731936836; c=relaxed/simple;
	bh=50BrTvbKl0Bn3Acq51dzp3gUvAzOPPzoalASKi7FbNU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8qvDtbz8OKQmgKm4BKk92y4leERTNO0yxX26Ago+yAwLrGqcc05wVZMf9ByLO+uFB3bUJ0rUNPM+ccKM6/tJI8Bq+h3bJjsFoyjHWBRYhr/lxl0DPJrWW4ATaKyYxNtAHwOfDdVrztpMG8rY9yqAtcZChz0TMrGWkw2jYeRI3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrwFVUoR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01681C4CECC;
	Mon, 18 Nov 2024 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731936836;
	bh=50BrTvbKl0Bn3Acq51dzp3gUvAzOPPzoalASKi7FbNU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=rrwFVUoRj5jljHvqbeu8sVmt39XYzqXAC2dReWtObRtNQ3M+SmyBN8bwOFwYy/WHQ
	 79rRNyX46kcWclRqB6LINdaFu8JXDEVuPjlXQBc1RCbqB4nIkT8BMjcpOz6pAc8jiY
	 dA3hVAodVgRe1zQj6jKMcuxsDMUEoVwJePDuhJLLwaDhHxzm31aSIs6DpCSGKwhm9b
	 ielzkazKRGTO2g/nlIOOBH0LNYy+itkjXon1cQCwkUSIENQ+WwGPONPiHbXGqgG1rH
	 sE9VbbsnJVhnfM484Q0qFqdlUUGum1GspTxHSGeFKH8908jezot9zDr9jEpOBNIJwG
	 WIvp8uer9Nksg==
Date: Mon, 18 Nov 2024 14:33:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.13, part 1
Message-ID: <grol4cvrgnq56jvbog5fmlcq4zv26qysm64dn5os4xdyvlb24r@45qd4lwqojod>
References: <bzixz2b4zkjl2szbrvt7hz2y6txoyhi2wveh7fcprhwnx4rujr@3yqp6aumrjr7>
 <Zzrxy6Bjt73OU-Qo@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zzrxy6Bjt73OU-Qo@ninjato>

Hi Wolfram,

> > I've checked the tag description multiple times to ensure it
> > won't upset our big boss :-) I hope I've struck the right
> > balance — descriptive but not overly so. Please feel free to
> > suggest or recommend any changes.
> 
> My feeling was that it was still a tad too long. Please have a look at
> my shortened version that I just pushed out and let's discuss it.

Thanks :-)

> > In the meantime, if anyone needs me to take a closer look at
> > anything I've missed, don't hesitate to ping me on those or
> > reach out privately.
> 
> I sent you a mail with some patches I suggested. I assume you got it?

Yes, but I planned to insert them in the mid-term pull request. I
will now update my branches on top of your i2c/for-mergewindow
and work from there.

> > The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:
> > 
> >   Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.13-p1
> > 
> > for you to fetch changes up to 1922bc245541bd08e3282d8199c8ac703e366111:
> > 
> >   docs: i2c: piix4: Add ACPI section (2024-11-17 11:58:57 +0100)
> 
> Thanks a lot, pulled!

Thank you!

Andi

