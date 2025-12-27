Return-Path: <linux-i2c+bounces-14797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1232CE0187
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 20:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 154C73019B9E
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 19:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E64327BE5;
	Sat, 27 Dec 2025 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyrU8F5Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40874327208;
	Sat, 27 Dec 2025 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766864344; cv=none; b=fPgbuaIPHHCxEMFdrsB4CLFdba5aMeGKZeXRkXlPXy4cwazIm7c6GlAeuAAdx7cNTSEoiqWAGAfWfiJa/k++VDHAyW+ixFmmqvBw1HS8vHxFBkmi09tBoejpNajSiVhktsmZ3G1grnVu/o+gEO8vJYF3cICvXxq3IEyymxLhIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766864344; c=relaxed/simple;
	bh=5UfU9wK/UiZIrl88vtYC0Bz1Q47olwIt+/+4hqtNt34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4FZDoCJ8kDEpxehNS8OfHzAoOhea3ANkWYlwwr2iTWfYjdhJpgIx+soI4AAZQlpombrpL/+Jm0TA/kZCsrUPW7ZIOCT0YnfyFozGfgHMPLNMGcCY/PCXf6c3qrHDmiWsUIwVZuOM2xlxNMymqXalSc/d0RE4sBcHXpzaDeRfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyrU8F5Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1827C4CEFB;
	Sat, 27 Dec 2025 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766864344;
	bh=5UfU9wK/UiZIrl88vtYC0Bz1Q47olwIt+/+4hqtNt34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyrU8F5ZzWWmPIpdjmw0aVcqJiF+u/bG5HdWZK6Kkc9E5GwCznMLSEVeqvr6Gtl6S
	 6Kth5oylNBE5owYyN43ACifqVGOUPewH3ozWBjJ4N0Wbgc0sXNiCiI0n3837FvigG8
	 bZozZUjbBV7klvMNJs3XCrheOPKfSAI/KjGhqfkhRKeGRPiBygtf1UsRpSTmcKLnY+
	 O1T4qlWhdyWWZRMK5H/ca4puTDtKoyodzvSNFT36Zym9a2gh6JOnmJA9okL4sFCc2P
	 EZlCDFQ3fh//+eTVHjnECSvUTDXf/cLCgTjZG/1xoyezGMTPliW8FaSAh1YlT85SMx
	 euTe352qzt0Wg==
Date: Sat, 27 Dec 2025 20:38:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <bjbt6gqnqtorlrft2oezr6mxuyywhebdmlnidtqlpf3qputojm@hkdp5a7boozb>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>

Hi Troy,

On Fri, Dec 26, 2025 at 11:31:09AM +0800, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: replace i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1

Do we still have RnB and Tested by Aurelien here?

Andi

