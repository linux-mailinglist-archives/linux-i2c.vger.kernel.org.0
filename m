Return-Path: <linux-i2c+bounces-10710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836AAA54C1
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23B2B502EBE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C851E9B35;
	Wed, 30 Apr 2025 19:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NKUO1YoM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BB31311AC;
	Wed, 30 Apr 2025 19:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746041964; cv=none; b=uJ0ohZ0LjrVAn5t35eoz666esCgLu2RYH8uwTOCC0qLW2dQHUAkh1nga2x7fjn2irDiPGytTrjF5Wvb6tZ7XtsIiMbmaNoa2OWu6BPF1MpzT54q0K6NGbCz8/8JY1G5t+nY0WrHK1+GdknED7ykCoDKVr49VzQiwqji3gXEnHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746041964; c=relaxed/simple;
	bh=dlNXOcS3mPmuaWRyF1GDszM8rv/KZApIPqIK9uyAltM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDSYGJKPFrCAPlag30ZZPZMrSxJ/k8YiYJHLzolC0giyj2ryImQ3UIqNlr3OV9x+pYZVKhkHdEPgm50phWRk24T/EnIfRCLXNbx9EhnrFAHP1X2KNxnFuoySPF+AluhWVeYNnEA2N1KJcJNoZhIjPACAH5OqW0WO8/bjNU6H5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NKUO1YoM; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F400540E016E;
	Wed, 30 Apr 2025 19:39:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZcdKoyjG8eAE; Wed, 30 Apr 2025 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746041956; bh=YFLxSoXeKy8FgOW8J6YT6rsVJGkCNHNn3z8jsXjYpWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKUO1YoMDix/mtf6wFucYAZjRhybjmJRI/AMPrtmspSYz3dBtMci9CYA1sLbRhIgE
	 HINSeA8Az0SSXFv22VSHpnnH0V/jzDzNEDnpyYnbMXSyKykWS9aG6PkuYsXUmstgea
	 xIKi4Vb/Y6xJkSSNqAKtBSB182hycY7sH1+LowVXVUYXu987zZSBYeapmTKfxOVrES
	 myQmzHZyRImisvLWmAX21bYk8mpHGcHiFNGeZ2er0zgRbG5Z6+aAveJz4FK8/4U7fN
	 IOUPIepyYwiN2fwQJj1G8r5J0W3TD0trk7sbkjhkZFzkVlbxMcdhPw2U3gMNLGAuEJ
	 VbzYciXP5+EF7JUJrQxZKFX+LxFjemX8jRdHXC9R0ymZ7Pit9BCWk6gy27itct2QGZ
	 /pbPbQ60gV60366V0XFS2YTunMSFX1kzn8ljCFXuNYbLO4ENMospo3WrowrdaQCQZf
	 ZmUI8Wi8MIpJ9hTvmFjA8B2OG9tGrgXjlCrBpxtq0RADDX74hTF4+t+dHqIMlXKnX+
	 WRmkVDIyY5ewhGX+BuBNbNO7eXA+UZIdgcyvId1zfewQkEmtB/YeBcmw2qOPyjGE1q
	 6kDzg39DMK5JUbNlNfPP9nWIPsZeKGqqJfwUADHk0xbjbChhfmF4lSRUhqMowX81z+
	 uGGPBLj3eCut2vQIDd1MLBuk=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AD77D40E015E;
	Wed, 30 Apr 2025 19:38:57 +0000 (UTC)
Date: Wed, 30 Apr 2025 21:38:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 5/5] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <20250430193851.GHaBJ8S3MrRAp7fcHl@fat_crate.local>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
 <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
 <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>
 <20250430191025.GFaBJ1oQjxCuig1vS6@fat_crate.local>
 <35bae46e-3b57-438a-a561-c93868120dcb@kernel.org>
 <20250430192538.GGaBJ5MuS4CEKa4kIX@fat_crate.local>
 <4bf62335-2e67-43c5-b2dc-4b0bed0521ed@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bf62335-2e67-43c5-b2dc-4b0bed0521ed@kernel.org>

On Wed, Apr 30, 2025 at 02:32:44PM -0500, Mario Limonciello wrote:
> This would work, but would still need to track if "no" known bits were set
> to emit an "unknown" message.
> 
> So the loops end up being for() and check a bit or while (true) and
> find_next_bit() and otherwise identical.
> 
> At that point does it really buy much more than the while (true) approach
> and find_next_bit()?

I have the requirements now, thanks. Lemme hack it up tomorrow, on a clear
head.

Thx.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

