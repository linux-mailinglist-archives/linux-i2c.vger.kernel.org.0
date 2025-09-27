Return-Path: <linux-i2c+bounces-13219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D04E1BA58BA
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 05:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802404A74E4
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 03:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4642248B9;
	Sat, 27 Sep 2025 03:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UOFpMPy3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D3B21FF36;
	Sat, 27 Sep 2025 03:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758945584; cv=none; b=DDjqYA9Y3O4ju+MA2D7pyCqlDlk7wZOTiruoxS8yhvIFKmZvenxo66nxKjvKzMvJknmLLNmTJ9Wjm+q7wgtxqBBnDcDUCzPhloPO/DcOaHccAjuve0yVq7JmT1mOPyRugs7RJ79OkqITC9LFdPIySNqxJ+ylLjbPhC4ayXg4HHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758945584; c=relaxed/simple;
	bh=5cmCJV8IXUrzQfabGxOZEojhspqJzFyaldj3VNbfoGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUpJR2cx/pcbPrvMIvln97rxbg/WmH649VPyajL0Z2K0en7jlEBD7YwQLLVMATtGPg+KfVjYGcwJliIXaqIyIuVtHKxm31u0iuB1ZCF1E2bZ/FHYLxQ9uKKXqqIjglLzLVGlOyyKCD3Cjm1DYImdwgqjWCczBc04LEaGfnQHBls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UOFpMPy3; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758945483;
	bh=tZd0GByrmUmEmv/KTM2Z/9NM+LpY4Nwqa49uosFrd3c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=UOFpMPy3wgMi6DtJR3u7O0In++mZqwplfaHoHtHz0B0qn6Mj0Rb5Vy0HIZwIgZI6E
	 H+zxZ9ma/gtXNXlVRO1fCSO8pkttMC1GGOHyNL79sCkHtFCUcJLIkLD4tfsKD29eB8
	 wLJ/YkOCGZY0AXc0HUlXEdOZZTwIFFlX0RVIf/ek=
X-QQ-mid: zesmtpip4t1758945481t77f69a0a
X-QQ-Originating-IP: 4hAQJEdGIUHUtFK8Zm7CAj82QXu40PWPNzuez6mX62s=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Sep 2025 11:57:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6486326469717875745
EX-QQ-RecipientCnt: 10
Date: Sat, 27 Sep 2025 11:57:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <578DFDF368D5EDF5+aNdgx8bKJy0dGekS@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
 <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
 <aNajJ0RZ4Ku0eDXr@shikoro>
 <20250927012429-GYA1330052@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250927012429-GYA1330052@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NV33GuG3VJ0Z1N1s6G/QbDuKdURcurS4b7zhGxcTBGaPWW6CbvXUG02E
	W8M3rX+hKgQEAOIrvqc++usFmyTg752MhsTcMCZKJn3oQMXkcaYckmyLeIZ8PHxX3EI6vpn
	VVg7zxVol159KLE7Qkb9T9W+SqW2HGnprUOl+on9q04armE/fPXG/xfd0iwtpm43m4ZNV94
	Gz4MMS8Z95L0okZD3eBHgWdeSp5p7uShFWzC2mzhB0EdLWMJV7hzR5m9YH0xyVYR0l3kw7V
	jX5Osdd2wfgGZbH9sX81N49TNLoxCEcJiqjbO4QqQRiWp1kiw96aolzOsu4ASk8iCeKp8kq
	0sD76vr0V36z8p6ws1DUKhrEYrtxLj9bHKXpYntz4nb7lKsUHPvB76LIlkxP3xLW3Qboj2K
	kzmMPtEARxb8+boX6apVeSigjqrbxFvf9AXHHzL7A5dcknZ21xrXw79y8QbPNg4AerLz7zz
	vrLm0cG7Ms7w4YZAmwpsV14xqEhuVfboDv+kJb/pmVh9pEObm/O9gFAc4OVOgKS91AYME2a
	uwrehyvBMhs5YJ6tOQNU5/T/+Qvp47u7Pyiz2OjcBdoTcah3/uDn7+JPmyUdh591n7oQfz+
	QTf7/dB/Z1Arug0PSon5z/r9qFmz0KzLytsEZVOEz+nZXFQ8+WdISRItvnZVD6AHOSjV9Hk
	eIPZSjHf3gdiy2QU68IPObp0/AXj69WW8z805jVnxpTOEQDXm3b4sylr93gc6oa8HgqiHIE
	1Chb/VLGBJwdSAq27xnUP3MSQO88F86S1v/YRTS0qhh9FZQEarx68g5LPARinzdLHecLYAk
	bc/OXdoUeVhhj1xZjHrVng7HA8c9LnPKmeOhsmchPRdhWBTIDYia1F4fcmjWiLCPb9MtKyk
	vqj45tI0lrjIgNG9VR03t1JBXkfa5g29et9553t73y8FpUxBsQpk99LSpwLak7Tf6Lis2je
	SqsyZR34+j7pponnNAav3NbCEJcwswMwfAmcQ3bNI4Qv95s4jsKY/4EPfEZkD+MnFq4Ju0U
	exzSVlSbjv7eIZbqmoEHrUjpwKifXDCOH9N+wJsps9Ol9NDGax3lD8MbyNJlz73xjqo2fxo
	kmbJUVVBYLRk000UZyTxZ7/ShIdahJCNA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Sat, Sep 27, 2025 at 09:24:29AM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 16:28 Fri 26 Sep     , Wolfram Sang wrote:
> > 
> > > Since patches 1–5 have already been merged,
> > > should I keep the current version number and just send this single patch ?
> > 
> > Yes, please.
> > 
> I agree, please do increase the patch version, have a formal cover letter,
> document the changes, and add old patch URL link..
Thanks. I will.
                - Troy
> 
> -- 
> Yixun Lan (dlan)
> 

