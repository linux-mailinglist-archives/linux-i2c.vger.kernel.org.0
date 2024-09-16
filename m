Return-Path: <linux-i2c+bounces-6782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053D97A09B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 13:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68181F24311
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 11:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F37D15855D;
	Mon, 16 Sep 2024 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQCxSoPw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818C15575B;
	Mon, 16 Sep 2024 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726487907; cv=none; b=FbnFRhYdWG1Vvos1N3wFo3lBgVnB9ARcehIWGaBVW54HvCL3BF+1YY1+ti/T2TU7Z23xVjssMeS+mjepAGQ4+xESodY/sTqurPC6ZEsGDvJmzWTjs3m5IWnWeVu+lU+IqQyU6+fkItIW2q/Bw1foeTJgEZNxdhSszSwemGvzPyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726487907; c=relaxed/simple;
	bh=cn4qiSXIffztlhZkpuG7otltZwk8uS66Sy7HbKtKITY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fav5R4OE3FWKba35MjuRept/xXpFpn0BqBWPuDZ2I/eFLK3EVr0K3STxUeN4NLST0mgmcNC5NeNSbCGmxR9FbmWc14Ebh9QtjVSNnkFwZazcNh6AqPK+Ct1PaeULQThKCSSHxO/BRWYdkfe5S7EfkKCZMbyhKk+FCNv9ON18ruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQCxSoPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69174C4CECC;
	Mon, 16 Sep 2024 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726487906;
	bh=cn4qiSXIffztlhZkpuG7otltZwk8uS66Sy7HbKtKITY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQCxSoPwzQsKG9vFV91ERoFLhlTDq7/ciItIJn3/7T/auMZzWe99x4M2DxvU2hfM7
	 m+M+WB1BIKrcMThag5k3saZwah2Y296itp1VeoQj+cwq+rrUkDFIzX/9SHjfJH1jkh
	 zqv0eDWZFt5mR5iDL8fu+uxVUlIxrmEGAKH2K/bWCBeGkamCLGQijDbAxnQuvc20Gp
	 ilCeWZ73lZfIRpJ1RubAywlyawWhlrjhSL7XvY9zl/52tQ7cJ3oQEvQnMIsMakrsso
	 n/KS9LOtE9nAIh3ulDZoFWTKc2Zj417r+HnUfJ/kc8kp3KQpspTbGRkAJj40xZsaEb
	 odvzrxBNp7hGg==
Date: Mon, 16 Sep 2024 13:58:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <uikfb52qduifmhnlkc43tgvmw2ok67eclqpokyrkp7sftetz3v@bs64p6aga6s3>
References: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
 <202409141436.QFCDQrRF-lkp@intel.com>
 <Zuf1UJ6K_8hL5x5U@smile.fi.intel.com>
 <leoyop42s4qmaytvwhwhpgfwfrkpm2xxabskz645r337jdjfml@zg5ql73tqidk>
 <ZugI2NCtaWKgcgh5@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZugI2NCtaWKgcgh5@smile.fi.intel.com>

On Mon, Sep 16, 2024 at 01:30:48PM GMT, Andy Shevchenko wrote:
> On Mon, Sep 16, 2024 at 12:10:32PM +0200, Andi Shyti wrote:
> > On Mon, Sep 16, 2024 at 12:07:28PM GMT, Andy Shevchenko wrote:
> > > On Sat, Sep 14, 2024 at 02:56:19PM +0800, kernel test robot wrote:
> 
> ...
> 
> > > >    drivers/i2c/busses/i2c-isch.c: In function 'smbus_sch_probe':
> > > > >> drivers/i2c/busses/i2c-isch.c:296:42: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
> > > >      296 |                 "SMBus SCH adapter at %04x", res->start);
> > > >          |                                       ~~~^   ~~~~~~~~~~
> > > >          |                                          |      |
> > > >          |                                          |      resource_size_t {aka long long unsigned int}
> > > >          |                                          unsigned int
> > > >          |                                       %04llx
> > > 
> > > Yeah, this should be something like %pa, but the problem with that that it
> > > always uses the same, fixed-width format with a prefix. We don't want this. But
> > > to make sure we have proper specifier we need to introduce a temporary variable
> > > and assign the resource start address to it and then use that variable in here.
> > > I'll update this in v2 and send it after we have v6.12-rc1 is out.
> > 
> > Feel free to send it, I will apply it in i2c/i2c-host-for-6.12,
> > that's where I'm collecting the next patches.
> 
> But I believe it's a material for v6.13, no?

yes, I gave it the wrong name :-)
I renamed it now to i2c/i2c-host-for-6.13(*).

But it doesn't matter. It will become the next i2c/i2c-host after
Linus has taken the actual for-6.12 patches into mainline.

> From the whole series the first patch is only a fix, the rest is pure
> refactoring and cleanup.

Yes, you can omit the first patch. It has already been sent in
the fixes pull request.

Andi

(*) https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/log/?h=i2c/i2c-host-for-6.13

