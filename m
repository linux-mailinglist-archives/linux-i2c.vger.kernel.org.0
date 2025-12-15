Return-Path: <linux-i2c+bounces-14535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A07CBC979
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 07:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6517630155F5
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 06:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E91532549D;
	Mon, 15 Dec 2025 06:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tPGsXD6R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B77D256C83;
	Mon, 15 Dec 2025 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765778454; cv=none; b=E2i3ypfVgbiciaOQCAtNG80/O3dNZkl6OC2FdvQp8nBdQWbisacOiJDRJAf7zEu87nUaPTz5PPZYh882Wq4uLpjGzihyflj00mnXydJcQ5ftb7t7NZTAqNWZ5D4yznpgZCzpAKyHtYGcoJCR3HHPvpbOtz2rT/3dlDbg17Nrfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765778454; c=relaxed/simple;
	bh=svd+Ooln3r3KctFgsK7F6IRm8J5DFrs2RFE/4C3RVHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMVp3o46fridnxXK/737TFx7mIH8ADl7L9KVR81feCprXEy6oNwv+1oOPf33+/B1iiRYT4dSev+QrrxHRCJJtlGC2dKBkZmhBBKtZt45btBTi1VYkEpiHRKj8D5uV+l1Rm7qvpuTZ4mgp38XCLLeAuwU85mEub8whRGJVkjyw+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tPGsXD6R; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765778368;
	bh=PP435k1Moi0z4EBkvJTCU/m8kmHq4QkYw+IJYkzPe0k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=tPGsXD6RiQlgqnNtqs7mCdm609wygOmXEoeu/1CRAF96ubTWWDZsinZJBuHcjI+tl
	 QL78HR3YVYYJuubCjflORyVTCt0COJa74h7lNvxEZ8Q2dt5JilxTHyI73TMk4HssMN
	 Cit53pHBDUP31kNsc1ttVu0kBaFhSHUCfL7mIzHQ=
X-QQ-mid: esmtpgz14t1765778359tc591a1ef
X-QQ-Originating-IP: 20VGHZWwzR4r0y0UU+Vj3zPW9VBggOnuciFqjjlx1IM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 13:59:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11468608574858049404
EX-QQ-RecipientCnt: 9
Date: Mon, 15 Dec 2025 13:59:17 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <6ECB2C39812D3E23+aT-jFKR-o5RsJxD9@kernel.org>
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfLoTunDQXERLBdsYlJ+bBOwPuLE7UVXxS+9x68wt0TON9ctqQQl8f7H
	7e+TJoXk0nMH0zJVbH85piG7565BH+EalNtM26EO+2yBrlFYPwToEHglwCAzoYKkpmncc+g
	qliRdtpNMdg/aglNrpgG+C5sRexPYKk0DmC+yofOmciEuWqyzZUSjyO/soWfAvd5w2xpYYx
	vks8qS9ZZSAaTi19l562JW1JxbBURqzGnB5IsoZwqVZoyvsAG15uOWERRTI9JfbXAQZmhI4
	gpN0TYnBkWS2qfkA5/J1mUNEXAJcsohwcdXeKKjlyrVmoCOgvkbthyVKcnShC3A0WpDoSRu
	YEoSFiQf6ExEiT21QspsRy1zawhOFZY/+bY+Mb9E7Ua4mMJJbsjjhxr4YFJqKxw0S1lL3a3
	2rHqQf7iMRokUqk6fQiW+nC2Z17CDnksuUFy1foZAXfxGPOKR+O1ofU3BWzy3i+G8i+QJTe
	YK7ozm47DKMhL6aOF+TUq/wlABbuwrEdmrIWWXmO+oFtDbQpSVqOSuv/sOolepWU0bg6D2q
	YcAqefSp+V9R4rMdPWYEF0M1/DeA6wzmYPpXIpNSqLAQzNlLBFG5SmA/fhmj+NP7eNvNv+D
	M4kvznXnpUbSZKr4f2si4eu5Xk6Ykf75RbKhb7+Ml5fD8AZG0fpH30fiLP4GlnwtOVFe5qB
	rdoDCkHnmwfCcky23nywgi0sNX/0oLE24tX4pUwVSGdCdfCC008gOyj8WnwD1NUe63A6atA
	gJb/wHrcC4cEXdVhqcsCUI6EQFvekmTgxXZqakR0N7QODjHNtkCbpR0v+S3/nJU0hMnKbso
	m4dMrWdjFYKkOP5qpDSNJxFRKR2K+m3MxG2S1aIYXKOohXmFCbKk0KMN3Bn/v6SGpu+g5eb
	5q+uNxMNbBM/NEI3FXpB+QRsoduRfcfvQ6NMd710a3yvmgjeosvb+I2Oxy19J9kO47IT0Xh
	afA+g6zv1EVypZC8Ezyh6YcO6/ksKsBYTh6yZvs7zclDG6UySgImmy8bKIOSXLmksW09gMq
	/H6ixfwMFbVBfjxlh4mdkJGikCx9NllHu9UD/XYhB0YuKAG0uvwOoMYYDc7hL4rsAV7QIeJ
	qmKdbp0RHTyha7wYbMksx/8gWV2jhS/WRXynwuw0LMG
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Fri, Nov 07, 2025 at 09:50:26AM -0600, Alex Elder wrote:
> On 10/9/25 4:59 AM, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
[...]
> > @@ -125,10 +127,14 @@ struct spacemit_i2c_dev {
> >   	enum spacemit_i2c_state state;
> >   	bool read;
> > +	bool use_pio;
> 
> This is fine, but you could maybe call it atomic (to match
> the callback funtion name).
> 
> Actually, almost all uses of this field are negated, i.e.:
> 	if (!i2c->use_pio)
> 
> Maybe you could use a name that doesn't require negation,
> like "can_block" for example.

Most of the negation is unnecessary; it's my code's behavior. I'll
modify the code behavior, not this variable. I believe this variable
directly reflects the hardware behavior. Therefore, I won't modify it
here.


                                  - Troy

