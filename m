Return-Path: <linux-i2c+bounces-9964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DBBA6B0A0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 23:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBE0C1690FD
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3665C2222B6;
	Thu, 20 Mar 2025 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mn+ulCet"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7C15D5B6;
	Thu, 20 Mar 2025 22:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742509103; cv=none; b=k0nVQr7N/H1mbV2JBuBPnbAE9clCwH+lM07Y3cK+FYfgqh/N7ubG962G+Fo1OMXrNym9fKsT271/x2RsXZqm5O17yN5Fvp9qpRf06D/ONmWuZPXzQey2QRNVPvZkbIvTLhKHsHW2oJgmHkw177x4IHz2+SjzBI3ABj4Mqa3Mcmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742509103; c=relaxed/simple;
	bh=9O3RydOB0ZVkYcXG0exlOsEH1A3gmr9V7HhCFrKPCOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huM0zhy6589XK5jxHloYg1AQZRZdZHRvGWvTelXz6KmzQ2b5kLQmCbnCi0DltUfsYnUczqLpBOCGFdV5oYF7mz2MTYS8I3HFOC2TEVF+xThjV3+4Ok3iobEHCOVijcHxEPzZ0ephaG2El4YJgh7S50ZtkB/X95AlzfxMr4Pzd/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mn+ulCet; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79299C4CEDD;
	Thu, 20 Mar 2025 22:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742509102;
	bh=9O3RydOB0ZVkYcXG0exlOsEH1A3gmr9V7HhCFrKPCOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mn+ulCetMTCG/4qlZQDzsJJ76CiHhF7e65TYAlrI3mDPFud0vAmTpVdCb7ysQT4ty
	 EipVvGI55DH1LqgdhCekIm/e+uose39lI9y7t8pjUjhyKeQtr8+YgYv1JRUas7mbgv
	 MeZb58JTBta1WtCD8N1RO3jxAn4PqepAnXCHvGVFfWGZrSl1so86czajaryIsZaUUc
	 Z4Dm1UPlPQ/+pv7sOy/Rz5yPNERuWeutubxfMq5pOFlKIw9fRutQcIqdzYfBSHfUNY
	 gvtA3qZX9G21P3GfnnrZYDa0Sy+/T21l5wEOZH6b4GVeT7+hypJoIQcJ/bYXjiTRoM
	 bBBuLTYPXhkMw==
Date: Thu, 20 Mar 2025 23:18:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	ludovic.desroches@microchip.com, andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org, 
	wsa@kernel.org, peda@axentia.se
Subject: Re: [RESEND 0/3] i2c: at91: Fixes and updates
Message-ID: <odbnk4zvjprs4ipdtxjeurdrubx3eu7zcmxkpwodlz6idnw3t7@6d2a4hl4dpe2>
References: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>

Hi Codrin,

> Codrin Ciubotariu (3):
>   i2c: at91: move i2c_recover_bus() outside of at91_do_twi_transfer()
>   i2c: at91: keep the controller disabled when it is not used
>   i2c: at91: add advanced digital filtering support for SAMA5D4

if you still have interest in applying this patch, may I please
ask you to resend it?

Thanks,
Andi

