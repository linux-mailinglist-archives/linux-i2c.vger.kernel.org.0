Return-Path: <linux-i2c+bounces-1628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F339848C4C
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 09:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B29C21C233EB
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 08:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FCF171A9;
	Sun,  4 Feb 2024 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="RehFBpwb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D83171A2;
	Sun,  4 Feb 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707036881; cv=none; b=XJySIKNANYWX5xnpevNJ1JDQXX+tCwJnGoWBaJpvBRZUtkC2pQkt85+8mv0sWDOvXXCEYIxrPKKx4WxdETHZhdmgvAAxJXxN6X0PXm82DkZDA5/13X478fhZgSI4cemt3mRtgYkoJUXA7e9+OZQ/bhfl3rPYq9kAuHTrA7wA7iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707036881; c=relaxed/simple;
	bh=DjliCUFmLoTwtSCb38rk4kFcnS91lawm9czL/JzRkDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9TjBAl4xOO/4D9636icCLNKx4BNDHaRTPNEvmFH3/4Sh5rXgpzVzf3i1HiRQib+uwm8yOp1q5KpR5BMVkzQn4O3BvTjHMOVEIDWolyVIAxZiYMdR+lN52ba25QbOH8BsmSo7Zj4dKf74gE8pDqeVtuDwf+A4R5ZI3hiAgYn6Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=RehFBpwb; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [46.242.8.170])
	by mail.ispras.ru (Postfix) with ESMTPSA id 75BEE40F1DD5;
	Sun,  4 Feb 2024 08:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 75BEE40F1DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1707036873;
	bh=bdcbSUNCCZm49I2M6R9zeavTDLhu5z/DztFvKkbGu40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RehFBpwbAY+c6D3NP+7uYvFFOVC9FgQQ8c1IitjShCy9UP0vVPBBj+HOQ5sBlEYzu
	 nEV+R3mBnYegPhm+HDwMTC/dY1RaT2YaSltRjD2uiLIomQ/dpZTM1E0PwKtpt0UDKE
	 MKd8z3fGQfV1Due4aIPLu0o/OdLNz/rKZbgxEq5M=
Date: Sun, 4 Feb 2024 11:54:33 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Wolfram Sang <wsa@kernel.org>, Rand Deeb <rand.sec96@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>, lvc-project@linuxtesting.org, 
	voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, 
	Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Nancy Yuen <yuenn@google.com>, linux-i2c@vger.kernel.org, 
	deeb.rand@confident.ru, Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference
 in npcm_i2c_reg_slave
Message-ID: <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
References: <20240109145121.8850-1-rand.sec96@gmail.com>
 <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
 <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>
 <Zb6luAVHcnX2fXz3@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zb6luAVHcnX2fXz3@shikoro>

On 24/02/03 09:44PM, Wolfram Sang wrote:
> 
> > If I'm not missing something, npcm_i2c_reg_slave() is called via a
> > function pointer ->reg_slave here [1]. And seems `client` can't be NULL
> > there. Other drivers implementing ->reg_slave function don't check its
> > argument.
> 
> Correct, we trust ourselves here.
> 
> > Maybe we should just drop `if (!bus->slave)` check?
> 
> Yes.
> 

Okay, thanks for confirmation.

Rand, would you like to prepare the patch, please?


