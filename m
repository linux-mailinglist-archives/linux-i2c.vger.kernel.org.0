Return-Path: <linux-i2c+bounces-14511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629DCB740E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 23:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16C123011B34
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 22:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB09123BD06;
	Thu, 11 Dec 2025 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="tKxLktc6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AF818C31;
	Thu, 11 Dec 2025 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490788; cv=none; b=U9BqOy42oYMLc+iqwDe7ZW9V8/SsfUqi+NAklm71rOjMlUQIshLMrglFBUzfZvIo885rWz2s9aP4M3p/GvMpEMBF+W1NnL0XGydiXsf2r39aK7gjDljKJ9ZM78YIoLlkzMno1jqEyAoRBV1avZj2/6mOKtqc646zzX5hPCJjOtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490788; c=relaxed/simple;
	bh=HUwoC6CVTcbqumCXp/yxtfU4jvVFNity/lNoZPKkEa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlLbwhUU7D7HZnOlGN1yGFvZLoHmT55YJeicZKy3IBNjSdAsUNFWMV+ZeHRFifbxCCGIcURyTribjKVwfHFfoYOgYUIvLYRvVOfiQxemwEMjBifne44iNNpteP9c0/Zhz45oh4ZpMoVm4oPueGSwPdFw3/S68MLs6b0KzDNNqnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=tKxLktc6; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=6MsdFVVQ8jNSVrsm8cEGsnJYlrkCyq+u89Nh4N01Z3A=; b=tKxLktc6JJWcsUQBFJ9/YE5ABz
	0UiekIOO2eZG2uie0nZ2etX23Gn+vTBJzzBbcPRVQB3aOdLw3Frxmb7TuSMcjx0QgvhroYHV8MggF
	PvlN/O7RCIs0ZjO5IhwLeCD9EA2Opyig4gbDjI9hzU2SvNIiBzCzarW743CPSbdbF0FMR5mk67wRb
	iolpysIpPi7cQu+WvLeEe2IBheZzBY15qc+JQE+XNTi3XxcnF+MaJSMLfGWCjtofSnfitvfmO4JMW
	CNgP0ApCD3osL/sKvzXYrlaXvQRgS0wrlWM/x+w7OMoVsHyP8a64Tq212u6Hn+ntEIv4UndR3NkPs
	Qg8SmRVg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vToD2-0000000FzHb-3yBj;
	Thu, 11 Dec 2025 22:28:24 +0100
Date: Thu, 11 Dec 2025 22:28:24 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <aTs3eNLCKTR5boro@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Troy,

On 2025-11-07 09:50, Alex Elder wrote:
> On 10/9/25 4:59 AM, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> 
> (Sorry I haven't commented on your earlier versions.  They
> included other changes to prepare for this; I'm looking at
> this patch in isolation and haven't reviewed the others.)
> 
> An aside:  I notice the #includes are indented an additional
> space in this source file;  perhaps you can get rid of those
> (in a separate patch) at some point.
> 
> You really need to provide more information about how this
> is implemented.  This patch makes non-trivial changes to
> the logic.

What is the status on implementing the changes asked by Alex? Do you 
need some help with that?

Thanks
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

