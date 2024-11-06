Return-Path: <linux-i2c+bounces-7864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C165E9BF9B3
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 00:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A1D11F22735
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 23:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837E920D4FF;
	Wed,  6 Nov 2024 23:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txc3ZoIM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073E20D4F3;
	Wed,  6 Nov 2024 23:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730934438; cv=none; b=qm+ADRjub6m5a+/dWkY3KCqQkb6ewpi4TMFJYqNwrDQsUkLqdMs/mz/hvh7mzJHCpXm4NKphMUx0y0uUllJwfURqfJhaThKTr+U5P7jrEppaozzRm+Ag8qU9/w2zJs+LmuEzxgLrJPEW2wrpouOY1FEHk5SOdA+vp62CcBu3VI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730934438; c=relaxed/simple;
	bh=wIIbG4HBtF/QnSBpGWhtAa/2wNmL/eOhrcjiodQmo2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8zBmjLB0q+wrHOZ6m18DScID/vW6QTgLI5OFa359FkyNT6S55eeWfR0PTIfhLzcysQ1u4geESNvec/lL2ekMD+nNchN43VwwZOnZ/BgNJKqskI6uapQGhUPn23juM6sd/Nwes8q5syiAR8XdaYiXH1/42cYXG/g76H1tBBqEuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txc3ZoIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0EFC4CED0;
	Wed,  6 Nov 2024 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730934436;
	bh=wIIbG4HBtF/QnSBpGWhtAa/2wNmL/eOhrcjiodQmo2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txc3ZoIMdJNZaTMn5sa2IDgyh3R+wYMdLO+B9Rng85nDfUqpjtovj9XdBg+hDn4Qd
	 pomlK0VMiSgJOVtKafdw4qyi+wj03IUlo6eepwuTpEl9ZT3XvB6Lsua1M6ZuwTIqUR
	 rCwgRCI80GHNaf+vASphy/8pefK5kw81zS6z0yyKkUtMvp5QZzN2Yv50uyaHuu96bX
	 Te/YrJR9kBeen5E6m0p+Y77Si00+QJTU3fZ3j3hszp7wUCCNa9C25ztwa48nmalaCI
	 cwVKpdzRL3MlHM4p8a4n7DYEgoZLx5GOoFf7a2lMNSMaGTPwHH9hvO/yYfGoL+XKHz
	 gkYyCIrTX+Cug==
Date: Thu, 7 Nov 2024 00:07:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Liu Peibao <loven.liu@jaguarmicro.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, "xiaowu . ding" <xiaowu.ding@jaguarmicro.com>, 
	Angus Chen <angus.chen@jaguarmicro.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master
 holding SCL low when I2C_DYNAMIC_TAR_UPDATE not set
Message-ID: <2ewlbioeyidznkkreuomyyav5bqfy3tx7svzheqvgrwsbv7gkj@gn7kyyhuxnxa>
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
 <ZySU7bEvct4_FbBX@smile.fi.intel.com>
 <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>
 <anhqlov5vdsicmopulnvbaerhctjaauwsvl6nlc3llsh4hi5sn@d3jmeqxnlhpl>
 <d2abc63a-884d-4d48-b652-56989e55d0cd@jaguarmicro.com>
 <lv7hm72ngmjohh3hd3tsiawh47pjcyq76iw3weboytfcywttmt@jjrcuwan74rw>
 <bfc14b55-35e1-479c-bd9b-d40d1ea88377@jaguarmicro.com>
 <bac8d1ea-ed0f-42db-a0f8-c36d7c571534@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac8d1ea-ed0f-42db-a0f8-c36d7c571534@linux.intel.com>

Hi,

On Wed, Nov 06, 2024 at 01:53:17PM +0200, Jarkko Nikula wrote:
> On 11/6/24 12:09 PM, Liu Peibao wrote:
> > On 2024/11/6 17:46, Andi Shyti wrote:
> > > > Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
> > > > Co-developed-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
> > > > Signed-off-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
> > > > Co-developed-by: Angus Chen <angus.chen@jaguarmicro.com>
> > > > Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
> > > > Signed-off-by: Liu Peibao <loven.liu@jaguarmicro.com>
> > > 
> > > Thanks, this make much more sense now.
> > > 
> > > Just one question, do we want to keep xiaowu.ding or Xiaowu Ding?
> > > Can I change it to the second way? It looks better and that's how
> > > it's normally signed.
> > > 
> > 
> > I have confirmed with Xiaowu, and that is surely okay.

Thanks, I fixed the commit log as agreed.

> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thanks Jarkko for acking the patch.

Merged to i2c/i2c-host-fixes.

Andi

