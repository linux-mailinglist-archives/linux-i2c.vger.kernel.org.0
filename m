Return-Path: <linux-i2c+bounces-13420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F42BC74F8
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 05:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5C14003A4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 03:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FE323BCFF;
	Thu,  9 Oct 2025 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Wo7Y9eJb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9550223BCE3;
	Thu,  9 Oct 2025 03:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759981156; cv=none; b=dq+xlZ9EtSY4UKfqEYdKU4uHeJikZ222yiQIIlPJJPF1ceBAk6izTPd371maHIxMeqMeYrrVoIRr1R6JeDjoW/UgEIHBleb2QJ1l0unCZKLK/U2I6dNeF1L6h06TelKKCovjBMfocKZXJ0ItcUBGe30lAfW4ov/FWUX7uHiw8Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759981156; c=relaxed/simple;
	bh=MWRKebex4pXJKTpbvnjqGtV1RpwhmuiP8laC1Omwa2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyR4SdDrCD+C45+2dbtpx8TTlvTTpBebZLX9CYFzkcSdMpGtwZPyrWmSLQr8nAtrrNkr4w5bSpanwksek1wn4c6yoNNSWHA1qbrQYXG4ioE4vQ5knzm4wi1QOuhopoZhQE4M09jyeSqYCl8B9fs3pxxhDgK54POIHloYFQ6ttb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Wo7Y9eJb; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759981068;
	bh=NYV08VwWK+VCWK8zEMUDzI03igsAPzvucgAerlP6T2Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Wo7Y9eJbYhAJRGSu/0iQXdk6tNTruo06GcROScR1vKqiaZ7V1BGvtrs9/Pps7MeGv
	 YKhvAtgGEOaI/hmLQH8VbxfxVD1ujjXAPG7BDo9SeKsB3LQOVHFtFStx8tHwuRl8Oj
	 7T8okYReD5OCoZ5jf7WowXtZpM8oqxsnan/zvNcg=
X-QQ-mid: esmtpgz13t1759981061t0d23b669
X-QQ-Originating-IP: X3ZKTjlO2Y/CL0fdpyofBlTObtZxrr4RfV1kqTHy5ZQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 11:37:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11439905582249369742
EX-QQ-RecipientCnt: 9
Date: Thu, 9 Oct 2025 11:37:39 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3] i2c: spacemit: introduce pio for k1
Message-ID: <B45BBF07F015D568+aOcuA7CwpD-u393R@kernel.org>
References: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
 <20250930012702-GYA1357001@gentoo.org>
 <F7785DF1AA531CA1+aOcQwrTLmAvlQ3ik@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F7785DF1AA531CA1+aOcQwrTLmAvlQ3ik@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M4lPCacZ9YleJLbPPknz8TcclJO70fmCUi6Z9jynNVdb57jDmRQIqLX8
	YmlVRyKxllxo9ot0IyXDWXtFOn4bkguU7xAucdBwN/UJy0tIo58AgGZqPx6A5NYRpw74TPI
	xKNqcx3mIgWmHVr0pdRc0VQZr+FAD1gV2QPKMGETizJ77diC51+POyA0crfw5LMWl/Q3GEm
	cx3MWgKk16yUdTHOPeYO3kFpg4aPG4Xtdn1vSrJwkIwwpv5WTVdf+PZlMtR4HsmGOTGWkyJ
	HqJ/rcC+ugGZFBUeDtQpjnRoiine7UohUMgH2fXy+j/KCN0CiAnVB+iQAvr71FAHfH0Me0Z
	iGWSgNutVShb8vjiFuf0E+a7wQfS35eNo/t6G9AL6+WOrXjRURERxX3ZJhDsFZxJiT7tttQ
	9luDhDW2X47V5ZuGjWiViBWfjPdTGvwIj98wZVT/YQMQj9UwaJnvC5szZZL50OL1YSmkw/7
	24T260W+ECnq4aoMDfbF4QRuSL3/HEUteeCoojCNgDlX7Eq5dpjNhhHnCyE9d/hMnFhqDVP
	xS9GZN0n1R4uA3ZC3AisM3k0um18RwnLp7tB1SG7de0PAo6qlEcyUjo0vvap4WlFyFzEilJ
	J9xRdIPdAA4cyka0hgnzarDyhjBZtaGs/5Rs5n0HH47f59Sgm+1dN1QoUuXp19CyxN1D3I0
	bvNo8ab1n+7IuzC3MDCNljpSPqe7x54sdb9KXlzIY02gp0DUE/KjW5UCQBOiXjyk7mKHRau
	v/mzGF659lIWTIA0k2LNDI8c785SiiXqn5b1yOaPo55vvVFkAeKQxc7443yN+0ec0n3zWcW
	MYDHkf3OIy9+4dj+R3QWDT0kxHvl7/NybXypB7lm7jWW+VOMyRmeHxS3uVoQzDK6RNexso0
	PdGx2Re+7k7VppLBIFkqu3gEfOjY9N1UaQsnfCPz4T4eFWhf6yO6L5QFvt9JhhnrwmzcLAs
	ZTXn40BSkTZuY003w4Otvf4PqC6FMfdR8XyM/IT0sukidubgnuBFmQX+9QVUnoIzuqJvBaK
	QPj5DXpRqyt2L430dBsAs0W1tzVt2Jv0GVdKFKc+hKyyjzZ1edVDoJshVuWz8=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Thu, Oct 09, 2025 at 09:32:50AM +0800, Troy Mitchell wrote:
> On Tue, Sep 30, 2025 at 09:27:02AM +0800, Yixun Lan wrote:
> > > +	/* To avoid being affected by the state of the previous transfer */
> > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > +
> > I've not see my previous comment has been addressed!
> Oops.. I forgot to delete it.
> I'll remote it in the next version.
       ^^^^^^ remove

              - Troy

