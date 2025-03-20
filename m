Return-Path: <linux-i2c+bounces-9941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55884A6A428
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 11:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D940189DDB8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 10:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B901224AEB;
	Thu, 20 Mar 2025 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCbuytOz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641A224248;
	Thu, 20 Mar 2025 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742467908; cv=none; b=pkFRl2Mm8610fdoBZv38/+1XiVKHeFvcNu51iW02RO4kEDyO56zNLCsdzaxPAnBM83mF0RmSWcmzxetmqJWf0U3B7tKQJL/1K94T3R6ySm6O8A1NUpXAIVY4rUd3p8kWOXR7IRHlzHW8o5zNzCiqylnTuV23PtCzyfiYh/MgU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742467908; c=relaxed/simple;
	bh=BjEhoxtDCErQXGy2WEbecrbbxNslFRLf4Yqb1mj6EZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7n8MLUmpnvMzO6NvfR2IrvM9xIYSvxFA+DSiPwyZregOnyzIBO6kxj72ykzM/n47tK4m+etucHvYCiieWi9IvpPwzllBD2JplYvqH9BZIdj+5rA9F91J5H0cu1casiLEBPW7Yrz8G9FWwHtWrwK81/DOaMrtkWRpIPrKnPUgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCbuytOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76726C4CEE8;
	Thu, 20 Mar 2025 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742467907;
	bh=BjEhoxtDCErQXGy2WEbecrbbxNslFRLf4Yqb1mj6EZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCbuytOz9HgKZDUhN4GWwBdEBLaiXIZ7wayseGh4188F8/Q6oTy3VhOEUtF9i9y9K
	 QmBXIe/BzbxNAZ0BarQ4W2AL9/LwEnOcWusaZCaNzTZGg/2zair+uJw3VFke5hl+zY
	 IltpYXKo4Vrs22iRXA+aNyJgFBaJr1kGCyNxOTyAHazaTduxLUwJjwJfxrpmQwNQBR
	 a+5AiypOzL6nbWZwKSH4YLpgUDyLXUC4krep2X6k2WZ+aK6dNUIkIAYl6TJ19rmP+K
	 pufIEDx5AT93z4mWK5+ee+oMG7ruiqzvJ52bZkyntEJlslHPMIf/u0wgRn7lV0jLmF
	 hfgUW78U8iVZg==
Date: Thu, 20 Mar 2025 11:51:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v7] i2c: riic: Implement bus recovery
Message-ID: <co7wju4k5lrg5vx6sakm2m7fkmvupjkjuniz6rjdb77kbqidgp@bryc2akucoaz>
References: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Lad,

On Mon, Feb 03, 2025 at 02:35:11PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement bus recovery by reinitializing the hardware to reset the bus
> state and generating 9 clock cycles (and a stop condition) to release
> the SDA line.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

I think you forgot here:

Reviewed-by: Andy Shevchenko <andy@kernel.org>

he sent his review in patch 0 on your v6.

Wolfram, if you don't have anymore concerns here, I can take this
in.

Andi

