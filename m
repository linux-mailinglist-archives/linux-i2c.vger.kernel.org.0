Return-Path: <linux-i2c+bounces-2583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D828788B5D7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 01:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D4A303419
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 00:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3D6634;
	Tue, 26 Mar 2024 00:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5b6k24f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B3636D;
	Tue, 26 Mar 2024 00:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711411964; cv=none; b=OJ2ftDs91yDVt3IgvFLbKzkROroO1bFVop0/aeJIxJm1rklC9FTWDaGmkiUKLLN+ljb1YgUbFEFI0gMpCruPUUMEPisJ6ynit+yWjOjjhLN3Zn+nQ5KrkB/LYxojZ0dj5InLhKOhS6JXStElF4FC87aZ5CGmylKfQbqPfYzksW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711411964; c=relaxed/simple;
	bh=38BViPcr287PqJSxGsmycQaovvgq4LmbAc+A/1zx+nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYuGdgr8kB5lsBfdOewmt9o88eRA6W3R4rRnLeZ0+b/3FmJDf9J7rzzh35xkSe0gZf261KDPmPcIRjZHmcdM2GeG8080PbEmu4BicGnmKFbPTx3319WVGrHl4RS+N+d8HubbCXqulr5/UACNyv2P7dGPvGeMYzDLBazBkVTR3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5b6k24f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CEEC433C7;
	Tue, 26 Mar 2024 00:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711411964;
	bh=38BViPcr287PqJSxGsmycQaovvgq4LmbAc+A/1zx+nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5b6k24f6sz/sP2M9JD5Jj4W3vsDbRNZCjD2v7Kc1uwBn33wIKjV1kZEP36K7XoVY
	 xYG+Q7CelzC27t3bwme1+eL+lXeLNgXCOPS1a6HXAzW/uJb3c/ysbpYb2yqv7w92jg
	 Ujt7gM8b8OdMBPIvcU0zkdjydC6M5B3dC0Mgv1Lf2HBWonPnA1GOzwrynKaCgnZ+ao
	 bO8/25sf5AJ0fVXRhLjRDI82uGCPoCQk4YVhyAOUKfND5jzAZb4bKUpseVZy4zk68u
	 Z6jc1bBVsiYcx18pvutCvB70bPC9ui8AqlrgonqfJotV7xAlL9Nv+6nSe+9HyJFSFH
	 NhtJeXXjyQUeA==
Date: Tue, 26 Mar 2024 01:12:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/64] i2c: altera: reword according to newest
 specification
Message-ID: <uqps3hwqhiugfkzqzzyqq5g63tpqqsmio3as2x6inqxaskw22k@jid5tzpkeike>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-4-wsa+renesas@sang-engineering.com>

Hi Wolfram,

>  
> -	/* Mask all master interrupt bits */
> +	/* Mask all interrupt bits */

"Mask all controller's interrupt bits" would have been redundant.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

