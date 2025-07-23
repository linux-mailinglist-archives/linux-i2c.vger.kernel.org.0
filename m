Return-Path: <linux-i2c+bounces-12013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78844B0FD23
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 00:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF393170E38
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 22:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209A326C38C;
	Wed, 23 Jul 2025 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLz/eyru"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDEF221F29;
	Wed, 23 Jul 2025 22:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753311219; cv=none; b=NwX8CT6W8flNqAEywP4Nvnzq80YhiZvB3lHHSftd/Ybv/RMuuuqmJja9jF2QONLub0Cvj9t+a4+/au0k+P8tQOtciqWInCvb8gHEDHBQyRl/Y670CTY5BzfNunYDiXiNx0kEaowAiAB3ETn8x66/sYUVYmevVeX9StkxGWXIr7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753311219; c=relaxed/simple;
	bh=H9LloSRiugXBEdYC4N9Q/SYB3RgU55GOfsoctf+gWG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPzV0Wi+xGPRl22+L5QRYgi954Bdmugg49CJ8L6yn8hC/PKazaun1uxf86lbPbA9D5F5hBcWGxNQpKVGaiyMxGSj9cFOmPdvQsTaityrih+lpG4jGJh73KnBeufP/4/6xK4HsNjZW0MCjvxTg4aWE/4U2Iw2I5rgMRGj96KWw8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLz/eyru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16187C4CEE7;
	Wed, 23 Jul 2025 22:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753311219;
	bh=H9LloSRiugXBEdYC4N9Q/SYB3RgU55GOfsoctf+gWG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLz/eyrusc8ybCkp9nqH5av1ejQFs6TDjviXQSB+yuUmKzZdODC4fIAZVmQJ178f3
	 jUaQfOl+vrWme/Y5kkaBY/q2Cch+UZqEDDYUWNONsEiSL72JC1bv1d7qbkpt8OQh8r
	 +d48MaNHfA9bbD6bh7iyp/o+jqHzyrapnqt7jxGXCnOIrJ9g75PoR+5OG9XFm14p7k
	 3M79NHeuqKkOIgbsa8BKPpwXOK+E8Ks+FLOlkrcvgyf4GWoWxmaRFm8l5UcVwBqBe2
	 dSqCGDZow9m5QbmIYQONZMCDyn+Frc8wggvhsqE5o0+bWbm18XURlo3vzbglRjX1pi
	 wv+BfLrm11kMg==
Date: Thu, 24 Jul 2025 00:53:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <aysffqj3gzcjwgdch37aghudi6bg7vqwtg6ot7dxl23riuiafa@6mwakofxbbhx>
References: <20250718133429.67219-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718133429.67219-1-francesco@dolcini.it>

Hi Francesco,

On Fri, Jul 18, 2025 at 03:34:27PM +0200, Francesco Dolcini wrote:
> Emanuele Ghidoli (2):
>   i2c: lpi2c: use readl_poll_timeout() for register polling
>   i2c: lpi2c: implement xfer_atomic callback

merged to i2c/i2c-host.

Thanks,
Andi

