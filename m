Return-Path: <linux-i2c+bounces-10625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0B8A9C6FF
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 13:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B3D01BC39CC
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 11:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C3E23FC5F;
	Fri, 25 Apr 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rh1xpy8p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500523644D;
	Fri, 25 Apr 2025 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579905; cv=none; b=R71J4M3K+p/XpPvdMsJVzZbe7ad5kqToNbFQpPWwaUtgwWinCuwJ6flpDVj91lC/B5vMhXWiBm5qmOS1JeItT6ea1tcKrQg+x/LcoSuVVIxxUJ8G8wJaEb6p2Se8YNEcyzYVEuNcnp79D58lqcKYxCuZfHSB1U5n2+RtBRpn4DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579905; c=relaxed/simple;
	bh=Skktz0pyFpb+cPGjSKmPDKvIXMPRNAL8a111YD665lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M24SNQk+rssXVg/jrwUX/bTOGziiK6ws8OTrqkQbthZrHTFOcTn3dEcN2ns+tQscY9EmHn1HtN28zITfybFEsI5WUTjqYekbE07EoibQUq02KV8/ZUmzanDlS8NlR7VXinru7JljSHprJ31K7dAFzznBcRpqR94Fy8oDIVHjSao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rh1xpy8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DAFC4CEE4;
	Fri, 25 Apr 2025 11:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745579904;
	bh=Skktz0pyFpb+cPGjSKmPDKvIXMPRNAL8a111YD665lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rh1xpy8pu8DOTA8VkiHV5d0k05cWh7NwBgA5Fvkf6Scg6pEhy7boAMZwTjPioFXm2
	 W+CLAPli9G9KK4XOV6MlQlqFk0YW9+FR/8p6QQG6S1vXSiF4kcpW3XtcdkczD1+Xbn
	 mvz8w45CYX8hudbcwA+f+TSTgsGw5Ia09299ZfA2uIJBBHL2pl3M10ngd72azwepkt
	 C4CVpuMCawnpMF7ooUC8Gg7EVqOpPkc4EWnquGRCEhw1tkKLMbRk/TCB5/DaAbG8NB
	 gmywWi1IOylKin3S6MveDLGIbnITHDa7MVAX3cL3MMVdrCA3L99GzQ2OFoZqFxmnDJ
	 OS1gI3GFVqmQQ==
Date: Fri, 25 Apr 2025 13:18:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, Yazen Ghannam <yazen.ghannam@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, 
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
Message-ID: <qqrff4zx6eyoyppx3bmsujl4vzhmlwi2dldhoxxikkspmlbiiz@sabqjmjekv7w>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422234830.2840784-3-superm1@kernel.org>

Hi,

On Tue, Apr 22, 2025 at 06:48:27PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> PIIX4 and compatible controllers are only for X86. As some headers are
> being moved into x86 specific headers PIIX4 won't compile on non-x86.
> 
> Suggested-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

OK, so these are going through x86, at the end.

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

