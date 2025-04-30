Return-Path: <linux-i2c+bounces-10708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A6AA54AA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE8194E07AC
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354C026B2B1;
	Wed, 30 Apr 2025 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VJC/hHsw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BEC1411DE;
	Wed, 30 Apr 2025 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746041177; cv=none; b=J2pNI1bxFUmyc0JvVDBeDm1xtoQot5qQybduPMe+ZHRAnM9nqBglcG7YLLCKVlOHEVNwKwKEdTnuhDjpwjgm6E58j1gFcbdB93hEWwCYJLW42haIwUQhUBhF3vKL3d4+7x1XrBYcJYaeugKmnrtt+K9np1At6ertazTN8/cXZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746041177; c=relaxed/simple;
	bh=XinLSOkBMQdQBRgEhcCCm2L1iNXuYCwt1EID1NhFDVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQWCWbkKdzqcHbg+ct63MwWgfiv13cHEaMRFANQFfVs56TA3EhQHuJ9qI0aPbUFCSz8IxFCOpE1R2tVCVFafACV2shkmAqnoNXeKGwj1z5qvVilD2KOyIj+yxMSjvB2fK2ZiGTmzKgU8P4Nvu0O+U5F6gJQyslw4MbeLoukbt9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VJC/hHsw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EB17440E0174;
	Wed, 30 Apr 2025 19:26:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4eJb29RrQEls; Wed, 30 Apr 2025 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746041163; bh=ly6VJgXfFUkhF8mQipOR+qcvdJTX3ZQtGsvUQTTpZ0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJC/hHswyjfKbGNOEaFoisUPlKsEpkgdrthZqX0/AeQsbJxBQ35fN056HyP4abKQv
	 N6BpaoJqIbpY3a4Y6K1wHkJ+N3fWtHDNAAGnQfDaKP86bAxeRMtfSBjZFYY1NsWnmq
	 bILCuoCXy2kGz8H+oiznMORD3X22OOLyHweoxtIb7qJsVnAXN45E/6ikUA8HCqwYU3
	 sBo2Q9sFUdNhZS31e4t5/cl9+w15XuJIXaLfWok7AnlPo+YJN1tND/rV4TbUFlYGN/
	 /yaiKdlXxDfGaO/V09EdGUJFIKRAk0nr5aVLrLQ/5FVr3kn5yBYG4fTsSb99GnbtKH
	 gaeMRJzTP/QxkAJmt1aWJPE2VwXPqfQwz247WU0mvPUHvVdRByCG8oTCsUbBp0h7LB
	 1qx32gIC8u4eSYAZtiqdiI83xyCosavqjozyUR++uJT7HC774KzXUFKDnFXaDG4oiu
	 o0oIJuENyJ4ODzTmRlg2zIqeJ0YNNs6rOcDh2PfS8pgP2Y5L2JbbdYEZcxH8jkOVfH
	 oWalzoNpcAp1zar7h5zeBZT7IU9mneeQ6St7EvrknuyBuGMrJ7XF4an+yZFSkQXHB4
	 d/0nsmQl81ehirzJTy2fuhndW+mrAahPSDDzmni75Vtnrg9kwoz+p3abyjiyfr7oI6
	 1fhGgshHiWvV3BYgEh5aoIDM=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D8D2740E015E;
	Wed, 30 Apr 2025 19:25:44 +0000 (UTC)
Date: Wed, 30 Apr 2025 21:25:38 +0200
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
Message-ID: <20250430192538.GGaBJ5MuS4CEKa4kIX@fat_crate.local>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
 <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
 <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>
 <20250430191025.GFaBJ1oQjxCuig1vS6@fat_crate.local>
 <35bae46e-3b57-438a-a561-c93868120dcb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35bae46e-3b57-438a-a561-c93868120dcb@kernel.org>

On Wed, Apr 30, 2025 at 02:17:43PM -0500, Mario Limonciello wrote:
> Well with that approach once you got a known bit set you broke the loop and
> would print a message for that known bit.  But if you have two bits set you
> either need another loop or you only get one message print.

So I gather you want to print for *each* set bit?

If so:

	for (i = 0; i <= ARRAY_SIZE(s5_reset_reason_txt); i++) {
		if (!(value & BIT(i)))
			continue;

		if (s5_reset_reason_txt[i])
			pr_info(...);
	}

Still a lot easier instead of calling some function and dealing with from
which bit to start etc etc.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

