Return-Path: <linux-i2c+bounces-2479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8E886314
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 23:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35BAC282280
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 22:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECBF136662;
	Thu, 21 Mar 2024 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faPUSI/K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78257135A55;
	Thu, 21 Mar 2024 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711059176; cv=none; b=tdc+leCAoYUeKkbeXPOwAdv0QktK40zGoS9Zoq5TblO591Civ9+UAwIwWouYOpjTfe3zWhSkwG0xv0R2bnANY2Azch0Dt7Al6ZZd/ZoDOYCg7w3ZHi0Pi+tnW7SBq9lhqKdnvsbMNxHggKzHhe+G5/9uQXM8i09NDmGYdrim1dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711059176; c=relaxed/simple;
	bh=Yikr+1vj8fY80kav9WDX31DAxm6R4H3KaQjmHZjkUmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUkgMaIN5deRTTYWAY/MXiZDyrSY9FqpVWatdzJhonEwZnl7utpMkQiJ0QBopgWQXibBLL9xrKygoDMbOfy0jP6oImgXIENIcd221NGg+7SAueffVddJtqiTM3F9GaGbBtsM0Beas3oopcu1Rms4jt0LYC0rx6MqHfzdxnQLrss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faPUSI/K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31987C433F1;
	Thu, 21 Mar 2024 22:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711059176;
	bh=Yikr+1vj8fY80kav9WDX31DAxm6R4H3KaQjmHZjkUmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faPUSI/K+lur8km8vnRh4pTp7dGAl3JSuiAGXU7d8ee2sEBnvbR/fWh8Z/950565f
	 KmjNO4/l7Xko34i2wIF1U/wy8sNBKCRUoVcnbAMO7YK6WZZecxtSflREZpEXKGJeBk
	 iILLHItA2SIAVDaLmpzcJ+2O68WcMdLPiJ3wv+1Q8K48VS1PYKK7aH0E6nEHcobPT8
	 7Vb7wwtuNL/MjLiteG6qLyNAYHjYOIKXO5ucLHcut4jTPXkgwMcVS2kbDEt3W85QPo
	 OoUjEMAjrw4XD5HLwNCKx0Cc22lqyUaCkNryGyAcElbejRY2ULbUssZrvrm8TvBRoy
	 TwGrMskCToXKA==
Date: Thu, 21 Mar 2024 23:12:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v4 0/4] i2c: thunderx: Marvell thunderx i2c changes
Message-ID: <52e7mokolqm4yrsgi24pj5nppi455sist6bogkohfbmwwsgzam@3cqogd6nk2kj>
References: <20240223125725.1709624-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223125725.1709624-1-pmalgujar@marvell.com>

Hi Piyush,

...

> - Removed the MAINTAINER file change from this series

I was not against adding Suneel here; on the contrary, I would
appreciate it if someone could help with reviews, maintenance,
and testing on this driver. However, I need to see a bit more
activity, especially during code reviews.

Thanks,
Andi

