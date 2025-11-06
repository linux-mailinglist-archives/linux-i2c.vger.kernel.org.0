Return-Path: <linux-i2c+bounces-13971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E834BC38A64
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 02:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B843B390B
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 01:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448151F09A5;
	Thu,  6 Nov 2025 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="N1RHxR5V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E3D57C9F;
	Thu,  6 Nov 2025 01:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762390905; cv=none; b=ubZ55TEzlt9j8K97UYpoorZ4devLylv7FgPHqTlOBbOBeMvxvLHvvUP7B/q4uc08uJOEGcTlqGUfgfASxcyJlUB3XQ4fATQQUtqIgu7E2TXgtURbDhYlHQER6Toi2fQt2q7NHzfa36W7DWzsyNtq1u62tev8yJrB5XP3rlvBZ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762390905; c=relaxed/simple;
	bh=qalR+9DmlQsAs3IP1SwoablOTDBE9IfXJzETuc/4s0M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD6FUrBATxN+UzGPlkkH2CBU0cYnxNeakmhV4N9Ibyg+TiaCEb32NQscbrScZPZuaZWrpV34h7IiQKjZHyhbD1sdGahL8KlVOz795Cu5MnVilaKlKQQB8dMhrL14vss8cSMND3WY1TaR96x1fgYZUPzouf3GLoEAsXWqktBCOqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=N1RHxR5V; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762390822;
	bh=3kT/wXXpOECHC7SoUGMt7kZX+LFSbhnovtqEAlsizPY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=N1RHxR5VgrwIuATZpZeh0hUZQJPYuvxXvoCLicfLJhle2/ECrTHKJU0rjbJ3DqBcm
	 suwKGnx/n1O/s0YTgSDpL1T5WBX6In7PkQxfMdXmKCrVLiThAu4pvFXdHE7fc+iRR4
	 aexziE0V1pju3QYuLrqzoZLbid7rrbcm3mFbo3lo=
X-QQ-mid: zesmtpsz4t1762390815t94e38ff7
X-QQ-Originating-IP: jh7uI1plMvRhjrULDkiB/2I1zCGQl9LYTt+0qWnurlM=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 09:00:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5046835240228934872
EX-QQ-RecipientCnt: 9
Date: Thu, 6 Nov 2025 09:00:13 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <723F1D1C8151FC6E+aQvzHbueB3FgfaU7@kernel.org>
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <aQvP4HVcpX-MDZBJ@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQvP4HVcpX-MDZBJ@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NqDbsGEQdAdVWmRY0+uVZ1oy2a7MxfPjSr0Bqs2Ob3JkfXtg8+ca7AJZ
	PiBCOvKObdKuIytqdC7OM0UWEFuT5Zst37ZDa2GHWR0dEutKgVBNWHkMZeFQkw/opEVyBRk
	W4yXRJTr9dW7fNL5XSyylS/71ZyARQrzdELIYMXaVX9uJzUQRBexWzSeHrmV4wwEYBNXPLB
	KMi9bEzd+zZiKEeGy0+XYEHruag9e2YNbWd0XTbtNQSLDJQpobezJAOWx9wj3ssLlBY2d6u
	uK0FGpfCwcB5CKKfb9orvdWXHcG/qT9GqB2ILzpQqLKi/BJjzSysX4CC0NpvfiU7hhKlo3P
	EUpbhjbuSh72UUicnuSM7QMHrpto155/nU5lDz59HkS+X36luCrVqbgDclLmvaTlNov2QIv
	KzbE4NMe2joRDd+i5Skh8b2WQIp+tEmZBJqTd4B8fOPhROtXuJWYF5iNd6WXoIUmPInSWIi
	ZSsu3UaGKzU+Q3rD5UoKHwaGcyfC4sJy9XJBo6T2rHAP/QJdhcfbqNUPTFWXAvP11WdowQW
	xpBcluaSA7R5JNV6IwfGtOr/jeTrA3endI4QgR5MJFlXfjriuQCayHZjKXk/dVfwDpbxcNK
	BDpF7oEQLmmwZaYjJy0fHegpTMppyHv3wCnM4cws5iZaZPTnUN9VLm7YIbxmaidQA1GpLD7
	t8zJq0WJRRMmmIyWXqcegJgx/+HTV6az1X02EdWPRF69VyFqzqvuXgjgfFwSEjVpW/UuxSq
	hH0WsWeCeKdd/OZX2jYHgM2nFjtDb9SY8UHqUk3/r6yf3IvfggqzJxI+UBm6Co6bLRmOeGE
	nIG1qUF9uthzPFNtj0pgdGlLxS+EMGwq3yZxuwnX4K5mx1wy9M5vL+T8s0NBGcUePWWh0SI
	xvJWi/1N3Qx05psgI9Iu0vU4kHblet5WGKvlon01nrHYx2j2XBgyZBNtee1fSlqS98YW8Rr
	KCW6Jl9VASmVNF4T5GznHczR7aguCHu/JZ2B0Uah4pAWJkK5y0a8i4tUkn5ewyLtotIOQ4x
	y+AVLoqdrLAGMRpQav3G9vlpoydBYnIqKhlbiUfwM8XUafnzKtt7ZDmhjcSODEVmGp2djLr
	Upggly6TeL1
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Wed, Nov 05, 2025 at 11:29:52PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-10-09 17:59, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
[...]
> > +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
> > +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);
> > +
> 
> At least for spacemit_i2c_err_check, the forward declaration can be 
> avoided by moving code, which is anyway probably better done in a 
> separate patch.
Maybe I'll handle it later.
> 
> Besides this nitpick, this sounds good, so:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks!
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

