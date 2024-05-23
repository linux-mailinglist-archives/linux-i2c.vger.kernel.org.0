Return-Path: <linux-i2c+bounces-3663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4C8CDB6A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 22:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A127B281EE0
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 20:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D354084DF7;
	Thu, 23 May 2024 20:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="v5SIrry9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9D584D3B;
	Thu, 23 May 2024 20:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716496440; cv=none; b=G0GzDjYMVOdIszpe/fOqVbk2KQJIB8BnXuZM0zyBHV9riPgSrO5ur2S5a1rhNIVBHfawCJ5ZZFOSOXli6/jiUjSamuR2ApIevumr5BkJm0tKK0ZddpdBDZts48mQd2ZRcmGlpWVguqDWYzFuBR20dbaOne00UF20WfmVkeSL09E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716496440; c=relaxed/simple;
	bh=+4B+O3Aw4Sfg8AK5WRHfCt9FlwQ2zU3xpqnsewfYaD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnKonR3E2OTBYkFrKh0drLl1pkbVTCU3EKKc6ieaIDwWuuX4TnT5OHAvtnc3uJTz9L5D0ET/Oc7k4ELcWFZL7zrZZTKgkLTyVOkBqUxmbDXpK0MGeP2rXK8y05Lq36NKFMeIm3cxqpNGo/YNtRMabW4uVNh9YJJMc0o8MPjdysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=v5SIrry9; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=izeBpVR9zkGYZYzcEzW+5qmgjUEU7HHob31bUa9JVsE=; b=v5SIrry9+IaF99OePM7YUdRyno
	cVsnEhHNr06WRsn3NW3lZXPn3htbxeR9HAUu6+CDRP+jAmogdmV5o1iUD5U/Th9lL7Oliw+sE2dfI
	x6nkflNw4E8ORRP3CMNmMdgBsn79rBkZD0FJ438NyPEhhtMQImA8vBHAqGnjWeMtKkJlEAd1R7tQi
	ek+ntVHCA9RYzp8MdYd07xm0rgABte/5PVRL9cBFude4gJiAmHofpkSCogAkWv7UXym/J1wPgbM5Y
	Aj+L4JCdSWpJ6X+BYhnUwdp4xiHAfp+89RISTbqoPXXfjBIKLr6yJXw3Hc7fUH8DzfFwFmwuz+0ga
	Uvu5+nEQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1sAF88-003rgV-03;
	Thu, 23 May 2024 20:33:40 +0000
Date: Thu, 23 May 2024 21:33:39 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Conor Dooley <conor@kernel.org>, linux-fsi@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Eddie James <eajames@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Message-ID: <20240523203339.GS2118490@ZenIV>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
 <20240523-rinse-sturdily-7c78d8517884@spud>
 <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, May 23, 2024 at 09:46:48PM +0200, Markus Elfring wrote:
> >> Would you like to mention in the changelog that a hardware description
> >> should be extended anyhow?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94
> >
> > You are talking absolute crap here. Stop harassing contributors with
> > your inane comments.
> 
> Why do you interpret my patch review contributions in this direction
> when the official Linux development documentation provides special advice
> on affected wording details?

Your "contributions" are garbage in general, and this thread is not an exception.
More specifically, you are picking an advice that is inapplicable, transforming
it into a question and "contributing" the result.

And your entire modus operandi fits that pattern - you spew random garbage and
expect the contributors to spend their time and efforts on checking if your
(contents-free) "advice" happens to make any sense.

That.  Is.  Worthless.

According to people who'd met you in person you *are* a member of our species,
and I can't exclude the possibility that in some other environments you might
be capable of sentience.  Unfortunately, the kernel development is clearly
not among those.

