Return-Path: <linux-i2c+bounces-8712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DBA9FC712
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 01:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8467C162839
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 00:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB13749C;
	Thu, 26 Dec 2024 00:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoivcSeq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1BB629;
	Thu, 26 Dec 2024 00:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735174375; cv=none; b=sctWMHQ1R1OAE0Wf+/Z8cUd1XlM2H6gq7caBqzk1rgViGtroOIT5lb3DOKVCl5l2Nb+ziwO1snnTqseGw5DweFpXMjYEYKzw8oK5piGm5D1DWtwbvZHaYMaTu7riaqJF0XIuzf7b1Jp+RDB/E60WCQ1/UOx3imPNFftilBeA30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735174375; c=relaxed/simple;
	bh=JX36L1Nj3ZUHuxu/OyVh4TcWR6YGBUoPfpPDmIBl3fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXH+rXokjih4HTL8doMVuZsH8lXGEGbUzSxTDUPxE7Woes/5Cq4n1t2liXI1Kh3y8pb1rx7FfziJCKkIuSTVwnjcVlyVrc//+hF5kj273HJ8Mo1DC+wI8w/zlhJKjjxCLnLbIQ66XmykHQCC3IakmXxaF/tQ9/0NbcNiDq6zRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoivcSeq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696BBC4CECD;
	Thu, 26 Dec 2024 00:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735174375;
	bh=JX36L1Nj3ZUHuxu/OyVh4TcWR6YGBUoPfpPDmIBl3fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoivcSequk8qxuzf/zvdycU74YNWkqzK+qA1aWirl2LKhHK1WSCiFX3u2CgbZ6IpE
	 zGt5+x5co/I6V+zZr2tnlDDSRz9ME1Y6OVJuxzd2a/3N3/FPOkkv+ugXDfxA/4LBdx
	 gBPIpidt02pLHG/rM+DSEvkWF3AvggAHxK9jAnh3Ee3kFHBgebidQTHstuyP76fYHc
	 xqmrOuTkCG9nO02N5pl+ZZi5sfRc9WIzff569qa9S3lg6HvjjOWQyjBlPfKojrw7CX
	 k63exwZgFBkMFVzPbhF+er5qjDgRr3waAFISqtLEed2qL5sIVijv+ZpMstEXhFQ8Cc
	 nEsPXSTptI3mw==
Date: Thu, 26 Dec 2024 01:52:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/4] i2c: npcm: read/write operation, checkpatch
Message-ID: <kixnc5uo5yryn5zszx3khqx77cfieeq6fnamebrw2sne3kxnwd@4cc3zfajrpo6>
References: <20241219090859.18722-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>

Hi Tyrone,

> Charles Boyer (1):
>   i2c: npcm: Enable slave in eob interrupt
> 
> Tyrone Ting (3):
>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
>   i2c: npcm: use i2c frequency table

merged to i2c/i2c-host.

Thanks,
Andi

