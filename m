Return-Path: <linux-i2c+bounces-7431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7369A0DFB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 17:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36B31F21A38
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 15:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1DC20E02E;
	Wed, 16 Oct 2024 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2IpjDmQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C96C2076B3
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729091996; cv=none; b=usn49LpwuByfG1hp3YTFxETy+5m6SaUFP7U1Z2ibPd1Oim+UrHuPfLGXufL+OyBF9FufvfB6VDe8FQQ66ZSjlidm4HeJI6gqRr09SH15Sp7fgmRR2qdHPvUx6c2CRDn42dNwvAOVgCdOdSDWbcSWNc500pZ3zvsxBT/akraa0Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729091996; c=relaxed/simple;
	bh=b5H0V3OFbggVfzCmhCzjx42NBkCzcjELWDmB+kJXDO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHoqZPk/mdzVEGMSqsmpNBreiaEUCtUc9NTAXTC/Lt6+zCY3uxiolyAMT8qSK/Qg73SPmmOKn35H1lUt4P226IqFjiV5QI6n0WICV5tMOWsdpnLQPGh3fq0xwZaReInobuQGoiQsbOD7SkVokm+BKT0TdobJ9DUbuKsBD6MkMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2IpjDmQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABF0C4CEC5;
	Wed, 16 Oct 2024 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729091996;
	bh=b5H0V3OFbggVfzCmhCzjx42NBkCzcjELWDmB+kJXDO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2IpjDmQl9EvYzpHDhujlgc0p5Y7J3V4yWdwOT3+1J6AqSSZHeq9pSzn02IXXc7+b
	 0fIC/kpvnmHBK1Lqp0DRyFlSH6lIE7g/Qj5orKRNOd6RaQ6MOZ+crIFVfps70RrkrC
	 pJHgI162HjFDUTfbgMja0hwk65Kt0drD23+MbHjbEU2lH12ObDvxqxXos525IJU+Gf
	 4EA0pS9VkAkmvGk9R+FYCNS6yO1HlCgEyKXRn0fJQ7CO89Zs7kdUEvjYWQ6t7gZUF1
	 bSnpt631kSidD8lov3HGbY9uhVb2glXswNWLbMsTsuxaLqHGvykintD9OW5nBgmhtb
	 QCe7QhPmry22w==
Date: Wed, 16 Oct 2024 17:19:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Wolfram Sang <wsa@kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <rlund2gzoohjwzrjecmebddwyzuftrw65hq62tiise7xbfzj5t@lnimuogxr4yd>
References: <20230928101655.47d3dd2a@endymion.delvare>
 <ZRZ9v3GTLcH3kBnw@ninjato>
 <20241015134041.4b7ddb6f@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015134041.4b7ddb6f@endymion.delvare>

Hi Jean,

On Tue, Oct 15, 2024 at 01:40:41PM +0200, Jean Delvare wrote:
> On Fri, 29 Sep 2023 09:33:19 +0200, Wolfram Sang wrote:
> > On Thu, Sep 28, 2023 at 10:16:55AM +0200, Jean Delvare wrote:
> > > The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> > > written at a time when the i2c core did not support muxing. They are
> > > essentially board-specific hacks. If we had to add support for these
> > > boards today, we would implement it in a completely different way.
> > > 
> > > These Tyan server boards are 18 years old by now, so I very much doubt
> > > any of these is still running today. So let's just drop this clumsy
> > > code. If anyone really still needs this support and complains, I'll
> > > rewrite it in a proper way on top of i2c-mux.
> > > 
> > > This also fixes the following warnings:
> > > drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
> > > drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?
> > > 
> > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Cc: Andi Shyti <andi.shyti@kernel.org>  
> > 
> > Applied to for-next, thanks!
> 
> What happened to this patch? This was one year ago but I can't find it
> upstream. Should I resend it?

I tried to apply it but I get some conflicts. Can you please
resend it and I will queue it up for the next merge request.

Thanks,
Andi

