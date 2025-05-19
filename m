Return-Path: <linux-i2c+bounces-11049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D38EABC8E0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 23:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AB123B5F58
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 21:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0E021A459;
	Mon, 19 May 2025 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6EW31aI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FE4B1E73
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 21:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689038; cv=none; b=KS0SGx4EjXCGKHqxUuCe3043xFrwEfE5gfAEiRd+c3eyn8kZ+Deanb8z3JHb5IuFytZB8kAqDU5tEtf1uxC6fC88fcKT2TZpmaLuIVfQUXUiLW3453sP0Do/p5lhlvS2DzlZb2WVuwJm3Og9r/2lEkaKTJJGYeE08fzkrlEbBK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689038; c=relaxed/simple;
	bh=6ylGApTvXRNJ0yd+gCvBlu2ZqI+3RCAj0SMfmUTe+Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmugvyrf4+AtdotCIypQ+wAXX9uMIOdayZd6j6uVr9UqjOYLITdzboYSJcYEr5EZbz7yVeU3pWKIWYafAUkhbu6e5YrVr72Cd0TvOJgVR3UeqeQoGyPCdpsC31/ElhJdYoJRW5xl0HRyrwDdpDswJnJLjtVxb4Nr/Z3tdrEUMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6EW31aI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF0FC4CEE4;
	Mon, 19 May 2025 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689037;
	bh=6ylGApTvXRNJ0yd+gCvBlu2ZqI+3RCAj0SMfmUTe+Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R6EW31aI1KKJOPPMbF5K4ln7nu7dkhwouHU5WH5nK4m3oGv6GDAP6WDcN9/so/q2H
	 FG4oxoSKcyq+z/uj4UEvgaAN+aI7dYbtWB+etEkglz57yr0FVYv1dmKMN2+BKrXLgl
	 oX5qaUQSP0o+6GJq0/1+CajjUheBFPO7s/kFqy5BC9LaVhXAD9wqMEDHqq5P9D4e4Z
	 GvCpQt5OYnKTcoVNDfg32FfG2scbJ8XFABKtGuy5NchVqufSOrta67pduJJ+e+Sxtf
	 S2lHJSixwD6MzBQEqdo3vJcOb9SyIqe4oV6ir7KkSs8ZOK2VxXBZGf+TFY5DCWb8rc
	 +RupUhKJP5n9A==
Date: Mon, 19 May 2025 23:10:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/3] i2c: use only 'fwnode' for client devices
Message-ID: <quv4r2um72ngtkc4lzu2htjd5g2djzw7vv3z7v6juz3r6qcyn5@zpf75pcvqawg>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519111311.2390-7-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Mon, May 19, 2025 at 01:13:13PM +0200, Wolfram Sang wrote:
> No client sets 'of_node' anymore, so we don't need to handle the case in
> the core anymore.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

