Return-Path: <linux-i2c+bounces-11598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E0AE90A3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 23:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6DD1889176
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 22:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8768926E6EC;
	Wed, 25 Jun 2025 21:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVEL78pw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4A426E16F;
	Wed, 25 Jun 2025 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750888786; cv=none; b=TtYtK0uAnH34+Yo14t0ymuFp3TDqpLmtCsA0SFDGbPtTnYeWpBBLqMnrZ5XYzjEqbzGIlvzOmW1PJqBCqqWASisESa7/TL+Nb4k7unvJ6d6X9roMFNuibibuTM1N1+GC64m1sHYgzrasvvE/oixmAuQXCftAlRuyLuWX/GXgE1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750888786; c=relaxed/simple;
	bh=Dkppk9JvwG05l4vSydLpv8YsMxwQ7r1LZhfBvWErRdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVTjfIiUFUlK0+nWa5LcqTIoE/x7yA6jFvI7Pozo4RMNDstgYgdhuG6ZlI4E6xH5+mQ167gaTyr3w4HZ/pNdCiK3ASzQoRV0o5pWsusHrRTiUXOb7X93xYuVsWb8SNAXPN5PfOFA97vgLvWVS6q9uwVPDaFow2WEbqNYCjI7g5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVEL78pw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A65C4CEEA;
	Wed, 25 Jun 2025 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750888785;
	bh=Dkppk9JvwG05l4vSydLpv8YsMxwQ7r1LZhfBvWErRdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVEL78pwDAsnnPUEgVv3DyIkKJZyqe/I4BJbaG0TaP7+8Rq55PhuGE69CjfCLHj33
	 XjSwp6sUs8Kmqr6RxUrEopTn5ahzz0jtiUKDvnHE6QNEocjjUK/uOC1tQTEWoF89R+
	 uX0TOflnBjmI205Ua7rXCHsL07D8KusqFe61HYXYQ8Hl/szepi80i+BamMom2+ViGO
	 ISL8oaKlJ+6gb/MKXjzl4UKaLR2JX4QQdOxY0pcyNFiWxoXTaDJBtzWm5djw09E4uf
	 AqKNnYz1McHyg8GknlCRH35pXsEC/qAt3qxwlqDiMPHvXMf78kHaPFcGJO69LKh8gH
	 aEVecld0235KA==
Date: Wed, 25 Jun 2025 23:59:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Jean Delvare <jdelvare@suse.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 1/2] Move FCH header to a location accessible by all archs
Message-ID: <zkbd5qdfj3xrjh7l6sviqzsu6foyxpwsko47czrpet55kgqzfv@aw3igwk34irc>
References: <20250610205817.3912944-1-superm1@kernel.org>
 <c3d78272-c80d-47fa-a32d-151c137251e3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3d78272-c80d-47fa-a32d-151c137251e3@kernel.org>

Hi,

On Thu, Jun 12, 2025 at 10:36:31AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10-Jun-25 10:58 PM, Mario Limonciello wrote:
> > From: Mario Limonciello <mario.limonciello@amd.com>
> > 
> > A new header fch.h was created to store registers used by different AMD
> > drivers.  This header was included by i2c-piix4 in
> > commit 624b0d5696a8 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH
> > definitions to <asm/amd/fch.h>"). To prevent compile failures on non-x86
> > archs i2c-piix4 was set to only compile on x86 by commit 7e173eb82ae9717
> > ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86").
> > This was not a good decision because loongarch and mips both actually
> > support i2c-piix4 and set it enabled in the defconfig.
> > 
> > Move the header to a location accessible by all architectures.
> > 
> > Fixes: 624b0d5696a89 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fch.h>")
> > Suggested-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>

I don't see this series in yet. I thought you were taking it,
shall I take it through i2c?

Andi

