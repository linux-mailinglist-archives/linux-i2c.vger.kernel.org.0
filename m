Return-Path: <linux-i2c+bounces-13435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F5BC9426
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 15:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A0554F8ABF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 13:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27FA2E764C;
	Thu,  9 Oct 2025 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="FY1D9SnI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1A134AB;
	Thu,  9 Oct 2025 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016069; cv=none; b=Pze1dns8J9PcAS4qojAS1zzzaLBSa/YrpUlsfEImS7r645IokI9Dbw8eg/pd3JteIaNWaZo83lHS4TTQFUJjStkJ8hsI6eaUzhpechVW2LVuz1XJS8QUGlYQXY4H8SPXk/9ywJnlONdMUvj1t7Nyq3JJz1R+BshFOW0v/zP0618=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016069; c=relaxed/simple;
	bh=zW1EJ5TTkdJ1CjZ+/aRiJApHAOhQIg8jvCgVAjwV4Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1MZbkZvXCC90/k1p9ahq2B0kceqJmDxxgfY8xcZAE/B+I9M3s1hf1NmAx/OSUjDugjKmYUe34iw6n55Bq/ILDhXvtTy6cDzWpWcwjgTatMHigjtkbFFdTx0Negy0bwIrym4RSPSdT02T4K513V2FaRPLxPEdqZxPmpna7tpLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=FY1D9SnI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1wiFO2sNfqvSiiMPv1AlU/plyvYaurafslXyqRLXqHg=; b=FY1D9SnIx+u+31uSwWu1HR4CiU
	uU4VuE9cMJCTpYc7FZpDnHReret/ec8lUmbgQtRdwiEbNdHIMrXa/b77xPOOUwmCsDAwL3w4E1NNa
	NQpauUw1DCQLAQW3nbUyP8B0C5rz2PmoNheyd1T4YYdaVue0JIbgD327dX4QSxTgaDf8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6qZr-00AWze-Gu; Thu, 09 Oct 2025 15:21:03 +0200
Date: Thu, 9 Oct 2025 15:21:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/2] i2c: ocores: respect adapter timeout in IRQ mode
Message-ID: <fa7dfe79-2425-4c82-af21-ac59c282bcdd@lunn.ch>
References: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
 <96e4ef171bc710abde215c50dd5dd4fffa98a2b2.1760000254.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96e4ef171bc710abde215c50dd5dd4fffa98a2b2.1760000254.git.matthias.schiffer@ew.tq-group.com>

On Thu, Oct 09, 2025 at 11:19:50AM +0200, Matthias Schiffer wrote:
> While the timeout field of the i2c_adapter defaults to 1s, it can be
> changed, for example using the I2C_TIMEOUT ioctl. Change the ocores
> driver to use this timeout instead of hardcoding 1s, also making it
> consistent with polling mode.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

