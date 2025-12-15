Return-Path: <linux-i2c+bounces-14531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6312ACBC47E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 03:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBAAE3009941
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 02:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4990A3161B1;
	Mon, 15 Dec 2025 02:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Cu11vrnw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AF2D595B;
	Mon, 15 Dec 2025 02:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765767324; cv=none; b=OLA2SHEdZd6PBsZFTd/VSdAaNLiNFn91mBl1XVVwPOxKVW3/20ktFIlycf/HjMSyuEbv71jtU7TdlTeMbx+9B3SFdn5A9Q6je9flYEGjKgkqDG1+a4A2nKqD6VhL7gjS1KJR7YzXEW1BQKARs7MtNkoAYGWl7PpymrnRj7qR4u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765767324; c=relaxed/simple;
	bh=xTecg34zy/nnyTgChmdoL056fRer/+hnrfZuWnXbN0k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRCx6nWuykQyiprbsY0Yp0PMcR6xrnF0aPjLyllscisuyuCIB1VG0bCeKFTXGFYO53mQgesO3McxfvNWrInruokwQV+Ax5maMCHy9r9BF3osHl8EGdBH7/7AtsqWUEpx9ENPFwWRCisM5rzQlQIAUdvAhKNa/mV5bqg1+cr134k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Cu11vrnw; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765767183;
	bh=LiOFsrrj0KtqzqIbiahsWzPZsSJKwCxlNGMnrbqjcQ4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Cu11vrnwNr/eb++/XHQSyjkXNZMtfNEfU7a3ZX8ebT8q+E+nqsPIUqyhcWlbi4XyS
	 sfbuZpqWNLr7H6+HsFPomN8jj1UuAS0JchK1NhpbsIXXSKG/KIMFiWCwUTTfswJOGE
	 71bbJ4sDfd2sUpw8M1kVIZMYe4SOsVjsd8TtuK/E=
X-QQ-mid: esmtpsz11t1765767175t5383ce71
X-QQ-Originating-IP: XeUGLSypuNGU5v41rnfBMyEYp+WgNaRHp+98uR4Tggo=
Received: from = ( [183.48.246.103])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 10:52:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8115786445991593814
EX-QQ-RecipientCnt: 9
Date: Mon, 15 Dec 2025 10:52:54 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <7F2C864E2E9B876A+aT94BuAAOW_mzY3x@kernel.org>
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
 <aTs3eNLCKTR5boro@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTs3eNLCKTR5boro@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEbuyMJPIbYUrnFWuxHepkyOQxrEmHTrZknwel+/p4ifa7IGR4PPyMCk
	ntomL9JUBTuo8k9VhnI1Zg/wlAVoE96DGpwRwVsW7TefULgMnoRFd9mqhTKdq6y3DcJlmvA
	xDc4rp0kmAPIu8LD1O0HsldV0A/NNfqusFchmWTtVIuu7/G8jttxgfO2uUuh1MPeU5zzoVS
	l+Aj+N1PxtTUCp2Q7H/mWHvYl6HZxdl4aGMxwhrdX78zRooTeYllwwD/n3hOGufV7e9qkwf
	NCuxSFTQaoa93SZswOMx2VK2fA+maQt99NDFxNRZwTpqwDHR0hEFR6ey8AznZYIBN/nMVql
	C3DFqJqA4N33TetGxO7emkoKMfF5+JUNv23Ue5Q0JX+TwOAD4uDzsxgUha7eOv3Z0YJdbDU
	/w21/IviPrtFbOYM+TKB12ziBeYCxkGCXSUKVYiNKq4GwBli593+SnNMIyKM62lYhX0iAh7
	LExrjgQSwyyfCFOxNxjlFW1Akhffe4LSymQbp13/4jqfqOJ0BxC3T9GmdmP+7ltgZ7iExJi
	u3IbAuIClstZHjZg4IHlhDt7ddAaxJSSE3hGdhKJvrQpLkohkULeaMBVBe9yS5L4GtrCS8X
	zHTZe8Vii7xSY8YclAgBEsErvP9CFeULmPlsWDhwKmwZB8JVZcUjtF8I8Er9/Gy34I/Uk3T
	KrpGd8qH941SIZWskqUOxj23EsQoDmoNyQZ0x3lZKWxH1NQVBT2LmLYfea43tdRImjW8Plv
	BfF13Pb1TQAZgU640eqrU6SQ1gaz241Ra20dt6DpQf0Hj+ksMnCcGsidl3vV37X0II6QoAy
	ySrUXmZJ68linFfrMwC/wdRv1AiOknPSHwmOgY/Tdt6qPsRs3HeYocyHM8RGKgR8hNx5brx
	M9Z+Gxiz/vSsa9RoPN6rmJkT/VtAyePj4OxsjGohkVymcUPUpcx3O8nN50cSy9zMLbtKncj
	woVRLpRSOEhbwSbkL+WM9+lf+LNCyegh9N91+9XttBEiX+oypiEjfwkUkSZuGWSXt1M9C10
	+FVxXTmAtHkdoP4Mh3Q1B8mOUSJ6kePTV3a0bb8bzPMBDRA/Ve/jvytstuoT7Jk2C8xSPqr
	qO2Euo2NXoHKfVqaS4d+C93bSFECDD3P2nJ4waDaIei
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

On Thu, Dec 11, 2025 at 10:28:24PM +0100, Aurelien Jarno wrote:
> Hi Troy,
> 
> On 2025-11-07 09:50, Alex Elder wrote:
> > On 10/9/25 4:59 AM, Troy Mitchell wrote:
> > > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > > enabling the use of I2C in atomic context.
> > 
> > (Sorry I haven't commented on your earlier versions.  They
> > included other changes to prepare for this; I'm looking at
> > this patch in isolation and haven't reviewed the others.)
> > 
> > An aside:  I notice the #includes are indented an additional
> > space in this source file;  perhaps you can get rid of those
> > (in a separate patch) at some point.
> > 
> > You really need to provide more information about how this
> > is implemented.  This patch makes non-trivial changes to
> > the logic.
> 
> What is the status on implementing the changes asked by Alex? Do you 
> need some help with that?
I've been a bit busy recently, but I expect the next version can be
posted later this week or next week.

                              - Troy
> 
> Thanks
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

