Return-Path: <linux-i2c+bounces-13710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6FBF791C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 18:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88E8E1893290
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 16:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E6C3451B3;
	Tue, 21 Oct 2025 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ7ImcdN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718B341AC1;
	Tue, 21 Oct 2025 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062618; cv=none; b=NQnrScfFWUi3hFblTOpVgECIhR95eZ079cobU+SQ7AqqBN41/pOVxtEsSoMpgJhOJKGxyAT4P4m4KKNzt03xwG4Z8IkMtfdrHXGuVjLT3gSjaa/f0RhjGJxisIYDCnoiRk4F4r5lIvQwTzIhrLtkBCsUznuNlNUE1cwb3VBztkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062618; c=relaxed/simple;
	bh=zoulm8EJmHkp5upUtaKeojnxWqc+0aK6cJfLOtxU50w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhkfQ1CcpDNH5iRsRg/MN6DRHtmGEr42geda/gugLc3ZIhNVRG8V+XHU5gesGPcvWi6QlCiEHHd1uqCWLcppPRw8U8Uo4cwuKKspBe5UpSRl/NPoTKGlGt6akAxUfPJ4crD5GxVO/kQnQwesJy+rOFPEaZe7ESjF1dpRuoY/yj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ7ImcdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27765C4CEF1;
	Tue, 21 Oct 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761062617;
	bh=zoulm8EJmHkp5upUtaKeojnxWqc+0aK6cJfLOtxU50w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJ7ImcdNqkvgbz/NjNhcAVJX3kDtbZQM9JuSFDwKztdNqFiQIWb5iLKwmjzbrQW9Q
	 xKtpRev8etsG/CLdiNGOMNcyVTDxNPoE91iYm83cw5ynjO1Ey3rPRYnYOzqgmvSlWd
	 iPEARZLqjbyCAObZTGNtIT/fXkvfACdMk8F/zhf10Zm8kfoOZmmZUU36Gy4gnJI7ax
	 K7Br4HxvlX7GAOml1zyFc72yqYaOG3fwHk1UyF7Sj+nTBmuDeuuKeX+vTkLMneclwN
	 aXN5P2pXQRKRTQHf8gHq9VT7Dld5EY9tFCz0gahJeXjKRIYgZNtssG/SmLlyzqdbMg
	 UvlubZmRdNhgw==
Date: Tue, 21 Oct 2025 18:03:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
 <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>

Hi Troy,

On Mon, Oct 20, 2025 at 11:28:45AM +0200, Andi Shyti wrote:
> On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > master mode operations is determined by the ILCR (I2C Load Count Register).
> > Previously, the driver relied on the hardware's reset default
> > values for this register.
> > 
> > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > frequencies lower than intended. For example, with the default
> > 31.5 MHz input clock, these default settings result in an SCL
> > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > 
> > This patch integrates the SCL frequency management into
> > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > which acts as a frequency divider for the SCL clock, is now registered
> > as a managed clock (scl_clk) within the CCF.
> > 
> > This patch also cleans up unnecessary whitespace
> > in the included header files.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> merged to i2c/i2c-host.

I'm sorry, because of the report from LKP(*) I reverted your
patch. I2C_K1 is selected by MFD_SPACEMIT_P1, so that we get the
following warning:

  WARNING: unmet direct dependencies detected for I2C_K1

and compile I2C_K1 without COMMON_CLK. Please, fix it and
resubmit the patch.

Thanks,
Andi

(*) https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/

