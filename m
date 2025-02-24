Return-Path: <linux-i2c+bounces-9551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1FA42AEC
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 19:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F18B178B60
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 18:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D704266571;
	Mon, 24 Feb 2025 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="aduryPCe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394FC26657E
	for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2025 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740420863; cv=none; b=qjnCQ8T1FTLQ/g4uAtLXmGmM25EmzGND68wsIlnKYWnl1ow7MlaWl5+M3mmPyb3zPHZGPvJR0B/Qc5HArpDJ27FgFE7EM7NXw1Juh99Mn0iQ3viLHkhRB+h/pfI0t5FKs5pJj4n02jvOg7EgZ3Myjfhqpc37ir9NL/sAkO+kVFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740420863; c=relaxed/simple;
	bh=ZN3Ihn6EsLUJTBURhLPF5P8bSUi7bCUUU5fDPoRxWfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kID3tHhXW7KD9qqCISh92HthfSX6XanJJexl7phPbSV/rm0hcQMHkgXDsybOGnJOHyrzASzeSc9dmji8TBqUKHipKke3ks/NbsGJZK3cZ2LofQnf5Ar9ivWOQeKDo/cgxsEpJ+eq8qvrWUGx1iZ6YSAnNiIBQwRCgu2jaw06dsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=aduryPCe; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Mon, 24 Feb 2025 13:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740420849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyfu63sfgIIzRlQ97A+OgOAA0wyg2MUg45/jU8ca2fA=;
	b=aduryPCeM4tYkhcg7JxYGA3aRnwlpUI1Cqzuy3sVeDAA0L48aQpcZ1bZwNGSlWhZ3w1dNr
	M22gflzi1zaZGF+1ATAGhaYUrHhRiDO5bcWElFAMfvY6sYED66CiygBcpjtoQJCCierjoo
	WHw3oT1zrv2m181ST4yvz2KBT7q4tAfHUCFo8tFyafzjfV1GBF9GF0V3XFFRifqDZQGF2L
	MMt+13+CjKteS6y3hyeQRFtMDCjcYm/sjxyw1j59m5aZnMa9YQ+tbPkGsN/r46yRo1FXGg
	wRPsPIBQzcKuVIX+3mn0W5aZFiFJYBSS6hqAvwg9t0xibzpOULojUQ9SDljZnQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
Message-ID: <Z7y26r88nrK2QKVN@blossom>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , Feb 22, 2025 at 01:38:32PM +0000, Sven Peter via B4 Relay a écrit :
> Hi,
> 
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (1):
>       i2c: pasemi: Add registers bits and switch to BIT()
> 
>  drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---------
>  1 file changed, 92 insertions(+), 29 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-pasemi-fixes-916cb77404ba
> 
> Best regards,
> -- 
> Sven Peter <sven@svenpeter.dev>
> 
> 

