Return-Path: <linux-i2c+bounces-9794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A558A5D2F4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 00:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD3617B24C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D7120B208;
	Tue, 11 Mar 2025 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+yl8DNW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2015C1EB182;
	Tue, 11 Mar 2025 23:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741734449; cv=none; b=AOj0r7A4AhqjjbbtlPcmWOE9PredMB8kcONkfx9YGFF85rXM5TMIYBLQjIqnGGNyUXZ6qYtXljRHzn3rFBv+m53sZa4KE9DzzJZj2IgQ15hBY6xJroOoiGUj4cWNPhIGkKGomY1iHCW07/Z5yLA0QFwi529Or5EWvsdap45KyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741734449; c=relaxed/simple;
	bh=JKtR2OfcFlJmQ2H9GtGU6Or2zdvl7EwY8Pksb6KXXDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEKaLmZ3tNANylRrgr8yG0pGdENG7Y45/hpaFSd0odS9Xk/CwWMWqfg9Ds6NwITEuQ2xbYEOmgk8CHudSRMkXfWPy4pyq1xiY7fd18eoD61c8h/vlA7OOCf37OTMaOPRAc+xLR1pkH2ntu7GAMMjWs/c6OWbEoPLrampJQcJJuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+yl8DNW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19EEC4CEE9;
	Tue, 11 Mar 2025 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741734448;
	bh=JKtR2OfcFlJmQ2H9GtGU6Or2zdvl7EwY8Pksb6KXXDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+yl8DNWWT/Giw+JMdkciOKG5orbN2+nkPPqzk+z80/h6MvOEiWpSai3Sk2HSFag7
	 Nzx+lRy69c4cIdxo8aKp35fxH3mymstbP/OxHyUk7lViU6KOmVeXg3k28PyLd+d+mq
	 vSSOd9CR+xq7zLjRvxtg0inljQMFp91qRGbkGFUGCel8e7hDP438SmSFGzZKuIhCrz
	 FEJYOkF3/rzf5My6O2PvyFX7v3AqArrMhkiI454Y8pYTSfPCsznUx7nETgEP6E4rmd
	 GkdDVGp8ZYFZc8gFULWnAyRB9HusVppzQ8CemTY8M0r4XVlTJLequShLsSlONOekOW
	 Mxu4pm7WiDKwg==
Date: Wed, 12 Mar 2025 00:07:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ali15x3: Fix an error handling path in
 ali15x3_probe()
Message-ID: <cyjxo4ad3l6eturvwdhtsdqob4bvlq3ccavr3bicnrd6gxcaky@yxuhqhxyscsy>
References: <9b2090cbcc02659f425188ea05f2e02745c4e67b.1741031878.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b2090cbcc02659f425188ea05f2e02745c4e67b.1741031878.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Mon, Mar 03, 2025 at 08:58:06PM +0100, Christophe JAILLET wrote:
> If i2c_add_adapter() fails, the request_region() call in ali15x3_setup()
> must be undone by a corresponding release_region() call, as done in the
> remove function.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

