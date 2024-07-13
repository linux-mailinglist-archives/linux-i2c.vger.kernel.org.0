Return-Path: <linux-i2c+bounces-4975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33977930543
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 12:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5411C211DE
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 10:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FB96EB7D;
	Sat, 13 Jul 2024 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwMa4si0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0E242049;
	Sat, 13 Jul 2024 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720867891; cv=none; b=QonnKmgqJByPBRAcMpyOa1U281H1pTNwgPibZBLBlfjntHvxGvZ2yx7s0C04MQJOo8toMkwFqGitqpH9A0rqXLiQHwnhb43aPjHTrM4KffMLxl5bP98d0IKHoTeqTRWgpDsro/Wt/HjRYLOSm/GjtO2oryY6+DDFQb1feDq1oCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720867891; c=relaxed/simple;
	bh=lzq/4jiM/oxrjPU/U096UwK4zq9pOS1EpExcMJhibKc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL27ry+seKUf7CVKLepwb8/j02nv241hwTLVacvEla99AQUlkx3W9sMO8tJaTznU9DjjSuXWs2PxoSS/bSQOL4IRMj2+YnmQO5aGkStzwU2YBMmSHQOrO0lJPuVx0cKOi3p7dzWUimwAyPoiPMqV5wuGbL0lMpJgk2XdV1Qsyks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwMa4si0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A91C32781;
	Sat, 13 Jul 2024 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720867891;
	bh=lzq/4jiM/oxrjPU/U096UwK4zq9pOS1EpExcMJhibKc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=OwMa4si0HRW+OM4Jv7OCHV3Hww2lSJg95C+Lxg270myVQgKdlSizbjYNQ3gMNMeBH
	 ACNkujgA1TLQsRZwKagu8aBhY4vS+q7Bpj+A7JjmIzONfQoS7sLKvbdHn70w4Yxqcz
	 wCkVi8Qbao8FzDDX/+B+auHXMYnNfAXMurmsJiVXGPvtWwd6c50lyqYH7tDEp0eaKE
	 89N5G7+JuHxfJCOKGxwz+Ghty27+mikQfqNdzrfAID0A+SiZ7oBhHqfDo4Sva/NIKg
	 79mbJmlbBx2SqL3twKH8K0zLPN5CUA1yUj4k7MsrjbnzwJOT/7aNtmgF+qukEwWGH+
	 ba2VP9oXZPDJg==
Date: Sat, 13 Jul 2024 12:51:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11
Message-ID: <v6aqbfui5v4p65dsqfhcg7mgcbixojm2cuw5kmawgvriu5xvcu@orrulkph22l4>
References: <yxymqbpeuhq52w3ie5nl5pkoojjuybaeodqtrd6uhe2rkmfhfb@3dqr6vefsdxh>
 <ZpJF39FFqnJfinQn@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpJF39FFqnJfinQn@shikoro>

Hi Wolfram,

> > There is still one pending documentation fix required for an
> > issue reported by Stephen that I haven't noticed. I need to add
> > the documentation check to my workflow. If you don't have the
> > bandwidth, I can take care of it.
> 
> I applied the fix on top to silence the warning now in linux-next.

Cool! Thanks :-)

> > I also have a pending patch for a v2 pull request from Hans de
> > Goede ("i2c: i801: Use a different adapter name for IDF
> > adapters") that is waiting for precedence.
> 
> Can these patches be included, too? I think they are good to go.
> 
> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=410673

I will include them, thanks!

Andi

