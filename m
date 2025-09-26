Return-Path: <linux-i2c+bounces-13192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0DBBA22A0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 03:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A4A1C2403E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 01:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEDD1B4247;
	Fri, 26 Sep 2025 01:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xfEP0tWP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD859C8FE;
	Fri, 26 Sep 2025 01:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758851407; cv=none; b=e93M2+3RMlhTn2T35PVlrtB5xwUnWgmMctTTHcvJ0qlTvB5pnXnpNf0I0wu69tTXQwJwtQB4QMuIIk6iaoDfXxzPv0g3VAROwFpacxLmcLh/HZXKoOdhqHenqQKQ77iiHxxTFR4PyZ2yw4sLm6fUBx32qIYB4+W9Y1NK/CcHhf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758851407; c=relaxed/simple;
	bh=6EIDKLJ0T64U8JaYB87sh/AYgFFzAStLXb+PhWgo6XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/jjpc6wCBLBhewD+YiDZsdIJKYlOsztMwxVKwd+KYvybTtnl1Ymil3PmGsUnM+5oxDg2kbvBWHwnb5h+jh2keb9aFZlmdextPfuo8Wuz1u8I3DnpajAwNaIML2XT0ry1tpxgUJTqwpRRopBX80J5YswxdGOwVNGrXFJrTVoYbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xfEP0tWP; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758851246;
	bh=f9pOdE67HES7VaiKOaqJeSWoyMdjon32UaYW5I7wfMk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=xfEP0tWPqxSsv+wZERQL+pimB1qwKBdtDvv+TcDGaASGMPZMluqmTSHM8A1WIhzWe
	 heRtll9kIgtKbi4STFKylQtAaEEyg7VzPKa7eAYXfx7XYsWEmifnN2/aSnlKplVWDF
	 oC4H1VwRbUjgvxcE3upD28bdWjRes68BMZ80BJBQ=
X-QQ-mid: esmtpsz19t1758851244t6712949d
X-QQ-Originating-IP: WYNt+5eiH0pKnAuyyFLmJQkwXQ0+Zpro86iKA3t0UVc=
Received: from = ( [14.123.253.220])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Sep 2025 09:47:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 817829598830566685
EX-QQ-RecipientCnt: 11
Date: Fri, 26 Sep 2025 09:47:22 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <48B175EBF0F1A347+aNXwqlO1mD-7BGtE@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <aNW5KfIg-_4-Et1S@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNW5KfIg-_4-Et1S@shikoro>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OUC5DGN0mB58BnpMipajIoeGxqThYQSyy4jSZq+zXnU7ySETUPRJ7rRr
	RN6Izm2Nt7Cnp14wllbMbZ4PVdToTVoPysUyzWK2QpWNcXlmYLB6xSO1sEJG2fkeECptSAK
	fJqsexHwABot6bJU657ddIMblpp3aJa07r6T8OzttncbXsR1dvILGLe+7s+44wuCXVo5Wu8
	tn2GHViK/1Rl4kIDely8TG6VZUDnWrD++I3q5vusRs1gMbxtet544Z/y/rfeUV9zyLsuVsF
	+mQkIjOhhLmjl9IWs3NqBOP55AFoHmbURMUgNniT9beaJrN3xNaC6AXyOZisgqbnp0XTEiy
	9dugW1iUpbwynfgBztxXTsgejay0MRLSgagg6JGsmJA9M4sFFVnDWX9mP7C2Uftv2NW29u7
	gL0cenrQ3NK9ksSdinn3zH7PtOt0Hrrhr1xX/w699cEcuXFd29Bqppa8gTGwKvU0GNUIiaZ
	Sy73UmrUJu5kDyzF9QBo2XksNeBGRvDZWfnC4qnxBIKUt9h9+6vc/8kwqwXX/BhQZnuc9RN
	h7VAJc8zuBVtdd3I2yhKi8iYwItLTCurG1bCT98rgJIp4ktqc/0+zeYfdtT090B+fmVJYBg
	FIzM6B/17dB0DSE1x2npGCQyKy3FxI/IDUveZMJmu5V8McVQrgRep6Gy0wnSB9wTeccIsls
	E4tw4meDRnZweh476O+5r85M0Ug6kd5JFr1HmcAk5x4Ai+ztz7M5Q1SAukQIHcGrIOYEzRC
	xTsQnAIcb7QVQByUgY3llkss6chRI+QXcGPJG845LZ/oEHarScC/91AxMwhmY7h/aMB0lMV
	n4pFK4hHn+7jEm1Cq0y36QTAkER+is/b07U/yuOSTDX+9rZDzsywzOMIRT9oc72V3RLQ9PC
	9iPxDmDNBaD0szR48nAcrb/qpMPgKbYyIWLde9pMV1WRwbXPa9qur0ckFGj2DG3w2zlQi0l
	r+Pq4HcAVzXaNffBdsKFX2cqyIpWwH/OtpHzluPyEGMvuDcZ3dvhLs117LBVjvmD8Fd29JJ
	SxwJIk4/q8to42Uh9f
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Hi Wolfram,

On Thu, Sep 25, 2025 at 11:50:33PM +0200, Wolfram Sang wrote:
> On Thu, Sep 25, 2025 at 10:02:24AM +0800, Troy Mitchell wrote:
> > Previously, there were a few latent issues in the I2C driver.
> > 
> > These did not manifest under interrupt mode, but they were
> > still present and could be triggered when running in PIO mode.
> > 
> > This series addresses those issues and adds support for PIO
> > mode transfers.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Applied patches 1-5 to for-mergewindow, thanks!
Thanks.
> 
> Waiting for a possible review for patch 6.
> 
> Troy, maybe you want to add yourself as a maintainer for this driver?
Yeah, I'd be happy to.
I'll add myself to the MAINTAINERS file ASAP.

                - Troy
> 
> 

