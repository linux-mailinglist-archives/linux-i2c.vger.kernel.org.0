Return-Path: <linux-i2c+bounces-14804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64468CE4AD7
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 11:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C1AB300509C
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 10:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8A82C158A;
	Sun, 28 Dec 2025 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lSDwEc9M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0122C11E8;
	Sun, 28 Dec 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766918113; cv=none; b=AmTvNelV56L0aT5h6fiYLUYz7yPPblPgY1w4CnrW2vBUGb56jHc1NiAotgEzCEH13/XlRNTlah0kMBcPhcrCW77XNaCS/1DloX+LSZQdxQa/lxV6oKAHuE5H7c0J9Hh+fId5uc1wDb/49+1pwDtCObEScAxpN8w5pdWCih0byGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766918113; c=relaxed/simple;
	bh=76UcwWlqcOK+nEI2DgZAg5cga6p+3Mh4eTGLCjSoBfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iw8JWqq1gwlEhAxQK9BHTaXQiEDz7gBIeJgSc0m/ZR6i/W5EfzYenMFiq+UnId3H/X31WvyFGUFMhFJlb0kRY6ftngEJKS7CV0cXM+mXoyTG7MILn2FSdKWU4X0My6a0XHlp8PbQZN2BJyoZE69/hutVPVgItkaD3c5CujESjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lSDwEc9M; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766917992;
	bh=EzH4x/BNzr/lijse2yQMrkmiQWJgzq4fknJut0n9rrQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lSDwEc9M9qi7AA8fAkbd6uG2mJYbi2PNFedG+zsi3Bg8favhMBp6KnrxiCuy+yzI4
	 KALZB+drN1o0k8xu1a9qAu8yO+j/3DCTm4vZgeBtbPsCuMcv9A7jbbb8Ad75sJzzqC
	 H4R4ZvAcoXW9gpy4CYVnjkLlsLhnVCJGSW1GqexQ=
X-QQ-mid: zesmtpip3t1766917984t9c041ffe
X-QQ-Originating-IP: ijGSZ0W9HF/cKHoSJdDGWVc9A8Zuav/z0wDMfel/LEU=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Dec 2025 18:33:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5019635549963342539
EX-QQ-RecipientCnt: 11
Date: Sun, 28 Dec 2025 18:33:03 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <F15FE03F15DE1BD1+aVEHX0IU79i-bRot@troy-wujie14pro-arch>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <bjbt6gqnqtorlrft2oezr6mxuyywhebdmlnidtqlpf3qputojm@hkdp5a7boozb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bjbt6gqnqtorlrft2oezr6mxuyywhebdmlnidtqlpf3qputojm@hkdp5a7boozb>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MjQ00mYXMHtu+WVdgHLTKemwh1i5Q/wdKEshUjUgljgotNbntG2k4Bzo
	ya4JxyJ2S3XiDcZ7QtelwazLwmyLfLT3OfmHkQlv4scpu51hsHGqrUIo4hZCOBCtDhR5jvc
	65K1uoDZRdZTS2rIGXpY37NEyXlVhZWiqftfFab+gWcb9YHGrPreWM+L/SPRggWCSsQQP/g
	IwbrM9ZNdVK/oOdQcx/YVc87ZF4dkE2kR7t+bFUUMR5Mqln/YQganX74qaE83FVE4VwcBQK
	4pXWOI4yypIjZ0hLRGNgIuz4dRuxtv0gUrB/j1zA33j5zY6WwZFNUDvv6SNq3nUgtkiUE8b
	v0GJ8bIoTgT9POLtuNSCYQU3Hir+9aMIUNYhuYDd9wEE6Hs5pM04ixyuWYL+uhU2MXpYA0z
	FJgwGw0dCYBIHdgFsoetqhE9jzGYjuDGBmqM3gBl6f5rBs0UU5ZftbDJjYykp2L4RHMMFBl
	b0T8ATYKPIRJ8azTrn4TfTf2KaXCTbWTip7KssK8OuR7kALCfUy7Hj4JFy66nqCm/aQKE7v
	Z/uz9aYFsMCoxHwqwNfTF6AxuEn1gpDmhMVrGVJGMc+MHv8XkVjqy51Fn3sU4i1195UBi4f
	PGXBpruTXW66UU5eoAttFZ4cttXMm/AzhuN+cZZsnNzMKt8RU+SS7rG8b2rcc2Pyzql+3B5
	RvfJBAQtO4XG3lq+IKPBtknf8tJSHwNBHzN1z2zigqwY1uqB2vmjxaP7KZso6T8QLJzYyre
	OJPeyIeQHvtoO6dmGur7wkPe81RiXP4qXGhf+i6kXjEjRV8/3/cP4dyygvfvnsn4RLNgW9E
	IrcUSgTBcDWTMYzEGJrw6nYmszTz9Bl2GooTcMGbpg8FLpQ2lqNxzWJhkDkZSmbIE2Zj0kJ
	2MtBS+NrWXd4VTWA93pgR/HGqPlzuQbpqLj3QnftBMX9lJP8OIJZ8F8fB5EHm3PMVB0m8IK
	xwd+jPUZt3iVLwCsLoXfYBaS70j7mAQgsmIIcWzE0Lk4E6URxHp5lOjfLOWKHVgqeT9OyxF
	GaFtbV8sRRMxBxUNxxrk7pw3paKr8BoQdw4LfV5EsaXWknEa1lLImuI+RyL+z3tWm8mLhIl
	n9bKjBy8vOi
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Sat, Dec 27, 2025 at 08:38:44PM +0100, Andi Shyti wrote:
> Hi Troy,
> 
> On Fri, Dec 26, 2025 at 11:31:09AM +0800, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> > Troy Mitchell (2):
> >       i2c: spacemit: replace i2c_xfer_msg()
> >       i2c: spacemit: introduce pio for k1
> 
> Do we still have RnB and Tested by Aurelien here?
No, I removed them.

wait_pio() has been reworked, which results in a significant change in
the underlying logic. As a consequence, the old RB and TB no longer
appear to be applicable.

                          - Troy
> 
> Andi
> 

