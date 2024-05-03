Return-Path: <linux-i2c+bounces-3407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F18BB30A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB162811D9
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C5E15821F;
	Fri,  3 May 2024 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJf22kax"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45B4157E86;
	Fri,  3 May 2024 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760811; cv=none; b=NDThuHtJDuCsWQqZy7NALWU3kZzabej4Fi2WfHYCdFfVhHGu0rDqYJVzKC5etJg+dIMsF0fVr4eEAWGJCBLPDrwgk689gbK0WtwczQy6JP3NW7i62EcizjD1hbsyGdIoJctND9aO/kdhAa04EF3ip7GxV41+S+vT7nz9I/sVvGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760811; c=relaxed/simple;
	bh=SOG7o9z18SvGYvQ66OwqhJa+YPPtSLT6stc3mlthlIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYEkkbnMNIUSvPQfH+Krv8WLE97i6Z6ahhNwhqpsZJfIRJg2krJ6x2hFC5QRwtBU4SojTDvJvH7U+n/15QpwoX9NEY8iKHLtFHOG5t3hpr97dWC6sdiO5U7MUmox4NHtWqqMclDbGPbgdXQv6JH8a/0+65dzawyvDmEtKz407DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJf22kax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED91C116B1;
	Fri,  3 May 2024 18:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714760810;
	bh=SOG7o9z18SvGYvQ66OwqhJa+YPPtSLT6stc3mlthlIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJf22kaxjIu7FgXMpv3xeFug/s7siQ6f+B/Us04bYRsqibsthOYfxwOGRyreOz0+y
	 grs27ZjifFEOwwQmYRVS/zOrxg8u8Lj1KVm6t0OX8y1Hiej7Gzigbdrn8IrK1tL0Jt
	 lZXUmRwDxgRDsSIEWjPphKpiuXUf6ZlvSPHMFKxWZB9TH0Nse5KZ8/g2OibEzsc88X
	 N5KNG/pTUSTl/kcojTR8ZUnPZFWyNCN4SjDhZ0pSvq4eqyYhKSwnpvyTrjrZwH7ZSj
	 jKgJ046GdUJmL++tGhsT/ak34WTHtpld5ALEVD5Ph9l3S1JLgrXKusgdbnV2xZ10KR
	 W508gCESMtfrA==
Date: Fri, 3 May 2024 20:26:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Lee Jones <lee@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Duanqiang Wen <duanqiangwen@net-swift.com>, linux-i2c@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/5] Define i2c_designware in a header file
Message-ID: <ehnondviupey33ekumcizrbcptujdutum7asaaaryaxwte76ws@vjqgp2lkxhtd>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
 <171469134545.1016503.10207141192762647093.b4-ty@kernel.org>
 <ae872161-d725-4604-9d03-a36a426d0d1b@linux.intel.com>
 <ZjUE2fYc7AV93is-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjUE2fYc7AV93is-@smile.fi.intel.com>

Hi,

On Fri, May 03, 2024 at 06:38:01PM +0300, Andy Shevchenko wrote:
> On Fri, May 03, 2024 at 09:30:39AM +0300, Jarkko Nikula wrote:
> > On 5/3/24 2:09 AM, Andi Shyti wrote:
> > > Applied to i2c/i2c-host on
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> > > 
> > > Thank you,
> > > Andi
> > > 
> > > Patches applied
> > > ===============
> > > [1/5] i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
> > >        commit: 91647e64f0f5677ace84165dc25dc99579147b8f
> > > [2/5] i2c: designware: Create shared header hosting driver name
> > >        commit: 856cd5f13de7cebca44db5ff4bc2ca73490dd8d7
> > > 
> > Was the second patch applied accidentally?
> 
> +1 here, asked the same in private communication.

yes, it is, I had this applied in my branch before reviving the
thread. I then pushed and thanked for everything.

Thanks for your prompt reaction :-)

Andi

