Return-Path: <linux-i2c+bounces-13188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CABA1AF2
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D617D16CC28
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80FF25CC4D;
	Thu, 25 Sep 2025 21:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K4rKGIUZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2DD3FC2
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837038; cv=none; b=NAy8xWRgKyWuxZPQKsOwPYtbnw7enpkWBOL67DCDzZoFbAE8n3+MZB/9RQzLUhn9bMWocIMRutvwvHpMiyKDUZVnvRwBblGJ/hTYIAg4cqe/ekwy/U4jT5kHqFMIO8i4NkmELSYBFj4+wKoGHu8Hni49/fFAm3WNDu+u41DpqJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837038; c=relaxed/simple;
	bh=HR7hwetkz0c1EUFPcN8G6uamvejgsOJWri6jDhJgftw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYQRFmhLheoTakBW1jx70MyTqbb5FhVcKfBT1bW5x1mQaxz+3Qwq1Q5S/+jfiZfa7GuM6zBRpgaVnW5V85gzibiBl8J3RsDhjl6pFybLHL6LEW6GAnRRXotinSSiq4Nv8W/i8hvFmFQxphtlmkjeUj3RIP+vp0RPZ1uJTPU7DJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K4rKGIUZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ai2u
	ZshFLzPCn4qE1mOlvZEOK2ArYuQo3ep7ThaPWcY=; b=K4rKGIUZEBre9RgdW2Y2
	c+/PC+w9UKQ5bPz1xSY2SfGsQCOLqa6TTkVf5LB3wmLlHDxWT8nK6mmlxsKKmouG
	JusFHRCS6dWfwdKtsTC66jM0JaN0QRAe67emZigp2WSucV0oNQfZccjiPtjpu517
	kkHLdX0vs+53rGjouUOQumR+o2kzJW6hsGqlPYDLPjlDZ7DY1j92iKyt3qahZTja
	qEOYYFg0U/5f3kF6lcS4I8CUfye/5BRo0N+GVkimYQfeTCuePlrRNG7HM0JA+etD
	1VtrSjsBez7nNSbQzqHvbedP1f9aPmHeyIpAiysOuQLl2Z1wBGZrFABINjORQXAL
	4w==
Received: (qmail 2024078 invoked from network); 25 Sep 2025 23:50:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:50:34 +0200
X-UD-Smtp-Session: l3s3148p1@TMKiKKc/BtYujntx
Date: Thu, 25 Sep 2025 23:50:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <aNW5KfIg-_4-Et1S@shikoro>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>

On Thu, Sep 25, 2025 at 10:02:24AM +0800, Troy Mitchell wrote:
> Previously, there were a few latent issues in the I2C driver.
> 
> These did not manifest under interrupt mode, but they were
> still present and could be triggered when running in PIO mode.
> 
> This series addresses those issues and adds support for PIO
> mode transfers.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Applied patches 1-5 to for-mergewindow, thanks!

Waiting for a possible review for patch 6.

Troy, maybe you want to add yourself as a maintainer for this driver?


