Return-Path: <linux-i2c+bounces-14811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC7CE5AA1
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 02:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D68B03005FED
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 01:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB8D212B2F;
	Mon, 29 Dec 2025 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="aVScxXB5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D9A3A1E99
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766971324; cv=none; b=iZpfGMmBvRb11TE1O2qaNORlq2WzyiDPpBymqKcDoKFDYWKQdfoOLDibkdeYbG7XMyQ6L7/tbuXJWrFc9jKnA1iHtcPFr5uMZmeQ0/fdDFLPEvfnzddXEDXucHmKwRhAUypanfTDxoyv4OJY0ED3SqGVU6mOywS2W8WeOVi8+Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766971324; c=relaxed/simple;
	bh=hsmClUGEQA7rZBxAXqKjeDz/XtsH0eUv/RPooz6i4Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjwIu0kP5zJ5TzvpBU7qqz3RrpGdwbSd9He6z9vb2V/fy44LfrGcJD2PGTHRZZqCJFUZSr2hHRR+ToaFCEmkFGmi5BDX+CogHDXhKi2Jcf9YOlGw6ITzAue8JJH+ZwlY/UgsTIP7MTeSviM2sSZmXBOUbf2lV+VpLmZZ72+ACY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=aVScxXB5; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766971218;
	bh=HjPCSciAn5sVVRUOoQBxpkF3fdcwbHn1thnE3om09YI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=aVScxXB5ajk8nsyHVbqyulChahzfyWHuZ6EOvh4MvFwVIc/AKTm5IIWPzh6kmQMSe
	 h0mCTaJGqJM8fchETHBns4nQJE/59IUULp6f1zgbJtvkQkDqqRELbYkwRoNkOv+3bF
	 YoiPVThoW4rTJ8Oj3JlkrtytPP5apOWe57ktXwD8=
X-QQ-mid: zesmtpgz9t1766971209t9fc9de5a
X-QQ-Originating-IP: fT6Q8r14RLfcZbpJL9RtazBttNJy4iPas1PtPR2xOX0=
Received: from = ( [183.48.244.56])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 09:20:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16357926230597589350
EX-QQ-RecipientCnt: 13
Date: Mon, 29 Dec 2025 09:20:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <20BB6D852C5C87DF+aVHXSI7Mn5GH-xBF@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
 <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
 <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OXvkGtaK08fGzVyBcvDPqJcIA53HT9A+ZpqG1btxeAnhOYGYpEPMnSfv
	DGcIhq5g6sZKK3vJAWTtne04ZOQZf0wbR/mNi4KJDfbl2N/KScZjlkpO986CQ5ZXGFPXIh2
	ioZ31RNhXYNUrliC1i49dquCM/I+1VmEy5OvhaKnzZ9YuMW69lowfvbHm421qbdZz77yJ9Z
	2c0xL1hKMdqFeAilR6kG6v1gDcsAW6r8mEa0zjetDJJTj7Vsn/q1GTeDkh4HNcVFGuZZGfx
	1z/g0hyvAfMSd0AlKytiaZ/gCFsSQ2RMYKpl2St2K4267pvYcdpCHShDj81scxHacKQ1UdX
	LdZEjdxVYnxzbHE1jAR3rp48orvIBnkeXQLtpkJER/JcJ7Hn12I+I9ka+5cb/5BfxIvoqut
	3BNB+DSfmrDKBarbE7cOtJ/A/13vzeYXawFnV2YIk61JQdGr+yJKcDMxD8XMC5ydutzL4JK
	kJnyc4xThYficgFm21pjvX0K9G6C7YfCsx5fm47mXiVUlMPtgZZZc6Aa1XKxY2mtQmffrJK
	re4yQsZkhJ2bt7mvtBPBZ1NH2k4G8+5C4jxYRt7eYaUtWvy7RLc+9a6fVS7LcUGnOpnOlhB
	2Uf0zTNCU9jTdkjAlp/kwJJhzol7zikVaPstUAGni4Fd/xWAz4jVd8BEKMHEj79ZqIVf+TM
	nSJsE0kqRK0TLN6jAUJ3ZHLGGTAC8HjhCf1zUhuoAPrCcDAh5WB/fivyEdLTWsU1ijvCAKM
	4V1lEzatn7S7NZNFizdcUQl0gM7w6GzhCJpYqo1xLcxZtOYoE6VJVxcgmrv42uIAL7+RuOP
	i5sxzZd49LDtE3DzkE3UGbLatJWn8aelU6qFOVUMMciafueaMlUIlJHNQX/k8EBtLr5CC3l
	xJnYAUAekK4F/JUI9miS35uFQMXXA5EzdozhP5RA2qUVedvSzrMT8VIFY332p5HGIVE/K72
	Qac2whpmTxtzBrAv+7eTPtz9gN+E+FoYKBHKzGzjheDFhCmZsEbFtnjdy/r0mIUQ7nuWVWz
	+fzla//JJ8r3Awr2Re3NMWV7UpHjrxrk0G1bjTm9pzFx9n/uYW
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Sun, Dec 28, 2025 at 06:58:00PM -0600, Alex Elder wrote:
> On 12/26/25 1:52 AM, Troy Mitchell wrote:
> > > > > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > > > > +				     unsigned long parent_rate)
> > > > > +{
> > > > > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > > > > +	u32 lv, lcr, mask, shift, max_lv;
> > > > > +
> > > > > +	lv = DIV_ROUND_UP(parent_rate, rate);
> > > > 
> > > > Would DIV_ROUND_CLOSEST() give a more accurate value?
> > > I'll test it.
> > Same result. So I'll keep it.
> 
> Is that true for all clock rates? 
I only test 400k.
> Anyway, it's not
> a huge deal, but especially when the number of rates
> isn't very high this can make a difference.
I'll test more. Thanks!

                          - Troy

