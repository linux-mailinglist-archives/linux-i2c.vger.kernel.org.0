Return-Path: <linux-i2c+bounces-4378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233191838C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 16:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0831F216DF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 14:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBBE181B85;
	Wed, 26 Jun 2024 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiKW5po0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5BEC136;
	Wed, 26 Jun 2024 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410465; cv=none; b=XkSlnRtd39gpXLDHW/l3ygZhdnRV8est3KhfuzRfua1AUM4V3NIrJuQ8QY4CQ3JPilGx7nEMlz5y4UbaavR6OLMVmklUWwRhdoRmrONW293k022yltby8gIoUBd/IpvX/KrqpF30hEm8s3OpJcqQyNxwRn2k5Yd8Rmpr+eL6M/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410465; c=relaxed/simple;
	bh=Y6I6wohTOcfHXnc2xlk4UwZF0BqadzOjW0083GuqF7k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erUvF8eKk/Bhy9+hi5i7+WubPuMMxQ88ZjCYsZqZIz5SVzGRCxDiwS5YBRWnfygT2F4MBMvnOMXdaY+xllh5LAwTngWJYRg5z1lGgjONW+cYBXfX4ZyaHMStHeO3Rb6tHlzVxC8R+FIhljrzO9UJKXuKulFsq4jCXqUOk2S6jAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiKW5po0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D4DC116B1;
	Wed, 26 Jun 2024 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719410464;
	bh=Y6I6wohTOcfHXnc2xlk4UwZF0BqadzOjW0083GuqF7k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=XiKW5po0uVzl3fyqJ38W+/TlmxEg9XC09/fBEK6DxRXqogVwpf7icO+WJdgtyJMLo
	 JWV+2cDhv7amoguLF3e8456hJZmyDP3cPtM/QuPOj68CYX1+E2fOWLWdZTkljQsIcd
	 kAdOY+2Nti6TOIxuSp45UdRGnd1thejwYrxrrHdvbvuS/xy1F5Mz5LqQWzNBVTA3Vx
	 9aXRz1tu7adiOyb9uYIkKRsyZisywClVsletC5RQ6TO0KLQyRu4nFkLUXvsN0Sdcgj
	 nFjgE3x5iB0ThHpPTtiYPppQVoJyjjdCrkNxxZ/9yb3YTkTWgKrsPeCRUxEFsgwvNm
	 ibgNJb/FaGelQ==
Date: Wed, 26 Jun 2024 16:01:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Arnd Bergmann <arnd@kernel.org>, Hans Hu <hanshu@zhaoxin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Wentong Wu <wentong.wu@intel.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: viai2c: turn common code into a proper module
Message-ID: <zxdgdwtw5o7juwd45ydnjmswz4j7rwxw2xcr6psvph3wkdyzj3@4mto7xnuddiw>
References: <20240528120710.3433792-1-arnd@kernel.org>
 <bi3lwgeh5egvd4g6aspwvefibk3cviwuzinvgkmnwy4f3bvua4@nf5a6w77cr7v>
 <5shzq44g75xykn2tdbutbqa4u5by3sijvztam2x2scey5rglox@kgh7lul4j2el>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5shzq44g75xykn2tdbutbqa4u5by3sijvztam2x2scey5rglox@kgh7lul4j2el>

On Wed, Jun 26, 2024 at 12:42:03PM GMT, Wolfram Sang wrote:
> On Tue, Jun 04, 2024 at 10:00:04AM GMT, Wolfram Sang wrote:
> > On Tue, May 28, 2024 at 02:06:30PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > The i2c-viai2c-common.c file is used by two drivers, but is not a proper
> > > abstraction and can get linked into both modules in the same configuration,
> > > which results in a warning:
> > > 
> > > scripts/Makefile.build:236: drivers/i2c/busses/Makefile: i2c-viai2c-common.o is added to multiple modules: i2c-wmt i2c-zhaoxin
> > > 
> > > The other problems with this include the incorrect use of a __weak function
> > > when both are built-in, and the fact that the "common" module is sprinked
> > > with 'if (i2c->plat == ...)' checks that have knowledge about the differences
> > > between the drivers using it.
> > > 
> > > Avoid the link time warning by making the common driver a proper module
> > > with MODULE_LICENCE()/MODULE_AUTHOR() tags, and remove the __weak function
> > > by slightly rearranging the code.
> > > 
> > > This adds a little more duplication between the two main drivers, but
> > > those versions get more readable in the process.
> > > 
> > > Fixes: a06b80e83011 ("i2c: add zhaoxin i2c controller driver")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Andi, I am tempted to include this in my for-current pull request this
> > week. Are you okay with this or do you want to review it more closely?
> 
> Meh, I forgot about it. Andi, do you plan a PR for rc6?

yes, sorry, will take it.

Sorry for having missed it.

Andi

