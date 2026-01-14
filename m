Return-Path: <linux-i2c+bounces-15163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF47D1FC30
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 16:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEE943093511
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 15:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2547138E11C;
	Wed, 14 Jan 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bBclkT4U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48293939BA
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404152; cv=none; b=OcpykawW6QVeJqyHgRJ6I6sA1NmNZbCwcyjW0P9TLPjNpmiNWCwfAGRX0nstppQ+BnbX1hD6l6PlsrWSRnz03GUsZJLJ3lCG9O8hGlIvthx/8UqbfwZrNmP7w0UwLXlwcUiq9wmcdL5dEyuDfI3SxiQpyC3olr+kuCuIaM497Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404152; c=relaxed/simple;
	bh=m4v/R7D3jy8vrI2Fks1W5QkC0M+VIHll9pL494k4YqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxm7nRtSRoboMr9xPTclV/yRUwpRdO1DvNT0pHSI3DvGusBd3yoMNvcgrGzZa4u4/xp8N4T5rzmb93ttqAnFeDyj5phZx7Kq3f5cIRMAYH/N/35+09XZumzvoqNP3qO2YdtoxZZr59a6yItTEh1I3osGHl5NKl1HV4j3QG54/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bBclkT4U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E4Fb
	p1gWprjaWwTIF67PnzL6ErW/s4uVu2YzVoPvCqc=; b=bBclkT4UKNVbybJbFbtT
	2IDSjfq04crf0WEXCzSgltWp6wpqj0IOcdpzcamA3rcrrPUCv+MNqmhDSkzgCpG2
	yyUwkpFnxeiwWAsDNIjvzpXCnAKA7CfPCL6C/npvQA4uZy1ffvHBROEEWiILU9LQ
	T5fieVkn9r7JIKV3w9VndZef1veocFlhmQAS4lhzcPxSvtPjH272MMONUlJRjdJp
	0oBKq5rFA2R7i8VND/Ovz3Osry5WRtbS33bnNHtrOtvIqUGOXGrACp1MRRFz7UDn
	VR5kCfSzjz3kuQKrzSlOZBOoYuNaAEV9BRlqH5T7WrM24MhSiotV6b5jeW1eXHro
	5w==
Received: (qmail 2192941 invoked from network); 14 Jan 2026 16:22:18 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 16:22:18 +0100
X-UD-Smtp-Session: l3s3148p1@2rR5rFpIEqgujnsM
Date: Wed, 14 Jan 2026 16:22:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWe0qYCOFNww_wSL@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aWYiJbtueA8g3srn@ninjato>
 <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>


> FYI: I think the road-map will look something like this: v7.1 will get
> new interfaces and most controllers under drivers/i2c/ converted as
> this can be done within your tree exclusively. For v7.2 (with the new
> interfaces upstream) we can think about converting all i2c controller
> drivers treewide to the new helpers. Once v7.2-rc1 is tagged, I would
> try to remove struct device from struct i2c_adapter locally and send
> it to autobuilders for testing. If that goes well, we could create
> struct i2c_adapter_private or something like this and store its
> address in struct i2c_adapter. This new struct would be controlled by
> i2c core and contain struct device. With that out of the way, for v7.4
> we could think about adding SRCU into the mix (possibly using the
> then-available revocable).
> 
> If all goes well, we should be done in early 2027. :)

With this plan, what could possibly go wrong? :)


