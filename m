Return-Path: <linux-i2c+bounces-8454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C09ED02D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 16:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD17188C5B7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC23B1D6DB9;
	Wed, 11 Dec 2024 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVCqsxzr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2D1CB9E2;
	Wed, 11 Dec 2024 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931834; cv=none; b=DHF3urjIsfBs2HKoEX6nznraJsTUmLWGFfXuouBep+nYxm9eCxPjN42klkiw6mbL+NZTc0H/S5oy/Vm2lAa/j3ZRvISUWtMpHy5IGe7umLuj7GEmmg2wQ19CbpYN//jUVjMWvQcfmH/6+t3zTYERj/WP6d6bhbuESc+UtBDzVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931834; c=relaxed/simple;
	bh=ihqJgg4ViF/2U+0OuafIFdGach6E61cp287CKWukMbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+Em58WuwONdNiexpqsaowyOOKiQWqK7tUi/W+0NcMw0Vns7q8vkaM+o/OQ9oVWnGlicXQKHtzJmBw1w/1fHEnk+zn1+K1mRsSedrYGuZ98C8wE6o8OzHjBUfXazBTSlF6pv+gqIjJIH4azuE4TY6vFFEvw6VkI3bHnFJY0Hf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVCqsxzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9334C4CED2;
	Wed, 11 Dec 2024 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931834;
	bh=ihqJgg4ViF/2U+0OuafIFdGach6E61cp287CKWukMbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVCqsxzrYTkljE3ai6pLpq0vPFwgzzPnT2pemWeaAm6FL0BzuQlmDes50ShAMSFbE
	 HWYsqFFz6VEtl+fw/9D4gBYKp9qUAEbiYh4/8bNNNiJSzJ9o5NaGpEygMgTO5AN8hQ
	 sPpl/32vxX1L20NMk7W/6U/+EpBk6a4dsXN9aksq0UCgWbnftNKvThFM0j22psrdLi
	 vbXzRyjbM9wbaYm04vgoiZhYw1mYhQV9JqVgJOZ7L2tE355hnmuY/YBmO3qFKzI+nw
	 kK25dZfzIS5cnQ46MCRRIFXKESJZStXfRMwWbLpPzUvEdBkSG8QVtA+Jd08lJaUvHc
	 GuIOW/jxL8QHg==
Date: Wed, 11 Dec 2024 16:43:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Always round-up when calculating bus period
Message-ID: <nlk3esdnddvnfxj3peuldcblxnbninnmhpfu7n26tbyq2swqzp@z456toyekd6z>
References: <c59aea77998dfea1b4456c4b33b55ab216fcbf5e.1732284746.git.geert+renesas@glider.be>
 <ljyho2ftsxmjkyi44hgc5zavxv3ytbvi2iuoht3gjetr3b4jq3@mjuvcrwm4klt>
 <CAMuHMdWc63Q47=4Z5_zDLy3BfGaaV8RyQRAcQbhC8PFvtz4z7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWc63Q47=4Z5_zDLy3BfGaaV8RyQRAcQbhC8PFvtz4z7A@mail.gmail.com>

Hi Geert,

[...]

> > It's a pity that all this description is lost. I love long
> > explanations especially when they come from test results.
> >
> > Can I add it in the commit log?
> 
> What about starting to add Link: tags pointing to lore to I2C commits,
> like most other subsystems do?
> That way people can easily reach any background information (if
> available), and find the corresponding email thread where to report
> issues or follow-up information?

To be honest, I'm not a big fan of putting links in commit logs
(not even 'Closes:') and was happy not to see any here. If the
domain changes for some reason (which always happens sooner or
later), we'd just end up with a bunch of broken links in our
commits.

If others want to have the Link added I can definitely add them.

> Thanks!
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/Documentation/maintainer/configure-git.rst#L33

b4 can add the link, as well.

If you prefer, then, I will take this patch as it is.

Thanks,
Andi

