Return-Path: <linux-i2c+bounces-10269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CFA85DE2
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 14:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E898C3AFF50
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 12:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936DA221264;
	Fri, 11 Apr 2025 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="H4nAZ3Iw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8C2367C8;
	Fri, 11 Apr 2025 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375877; cv=none; b=ijLwK+B3TKf0QRL3kt7dMbX8EbeYLoK9gCru4A3nUK1YTUj+s2ejFhIPtRNypBGyCGjWTsu1MZbzMOtefcJdaBG/eRoo4KMvC5h+MM6N68K4BtfabmlpakCK7i2Zrx3SSKuUp4pUIqaTyen4W8LAkRF3z7CnbmWNCUrTabN5ltQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375877; c=relaxed/simple;
	bh=Dz14sGHHnu0hkqwQ3vEpnjbNomshNLM2BARAXqV07dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pb1kkDbivwoegGo9uy3d3dW7kbrDZW4qKO/TUH8SMfqAjRaeR7b0J54SOii1dshjEX58XLQDkahCQxbsGzxItXP93b+DLlMakXuW6bMN1f8Ym6Crm3X7EbCgf9bpJVUeeakAH+5rQuxapSa6x1kCAiTd5LBxLzj9iaU0C1kTzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=H4nAZ3Iw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 60D0040E01FF;
	Fri, 11 Apr 2025 12:51:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mUQid5vNaHYI; Fri, 11 Apr 2025 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744375869; bh=ot8rBley/E20N27sAp7ML+RVP6Nk7oyOk3yJvuyKeZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4nAZ3IwtbcSIpkYEwhdRZEA4Ih78krvyGndmBpzTmb75xdSXauU88mL6YjvPuqzr
	 UHGzfxqrRnPDWJxJmWD1qzOIv56GEoGgdWW89Efe9+FX4Ld6v67EUi8BaRahNv45ZP
	 I5hG+d7I0oCz6lXsTyLSDWM1woW7yQkIh2SE0D2l6AxYEzi8sCAEna6icWpxqj8euA
	 k0f2b9IsRvQxKEyjB17R7lqGLxhB9gvTDPDOLq52zbxNWPoMs1apLT5R3cRNLFwn3p
	 X+mp/TNDGAJkPVo8LfSk4UN9siImds2+jbLomNAKSnAdBC1XCJEKsHiA/fxwWIz2R6
	 hri+bqEMyMStJ4VBgX+ramesTlZkyiZM2flquZj0ruC2gAz938S8SkZDDviCiJUz+w
	 MVaNFH7mwG+5uh03TLIfEmUCy7gD67sBAyz1lsrrIPwQu3EjOQJtUeVZMaKwAOg7HO
	 Jl8a9ex4LJcQNRfRuq9x/CMPUatN7iOaKar0vMjUhetRU0W2t1LfDCLgGBgQPMuW/4
	 KHZMYDGlc+ZLBaBbq01hnQA/X9vii2r3kj1aVY86VSLzSt4uR+T7T9mysTaELTkSuc
	 23S/E+V1ix+g9tPLikJPHaTJYIxEBUzrd/XKd0DAltowQ2vzkPU25qnLLEqZKUB7vS
	 ictJtWz4AJahL6/Yv4EekSf4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 153D740E0242;
	Fri, 11 Apr 2025 12:50:51 +0000 (UTC)
Date: Fri, 11 Apr 2025 14:50:50 +0200
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
Subject: Re: [PATCH v3 4/4] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <20250411125050.GEZ_kQKtYBfEMDQuXU@fat_crate.local>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-5-superm1@kernel.org>
 <20250411120617.GMZ_kFucLFQQ7LJkys@fat_crate.local>
 <42b7547d-c1f7-4509-a381-7bf0a485a5f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42b7547d-c1f7-4509-a381-7bf0a485a5f5@kernel.org>

On Fri, Apr 11, 2025 at 07:12:24AM -0500, Mario Limonciello wrote:
> The idea was to walk all the bits and pick the first one that has a string
> associated with it.  I was finding that sometimes the reserved bits are set
> which would get you a NULL pointer deref.

Uff, that needs a comment at least.

But you can write it a lot simpler instead:

	for (i = 0; i <= ARRAY_SIZE(s5_reset_reason_txt); i++) {
		if (!(value & BIT(i)))
			continue;

		if (s5_reset_reason_txt[i])
			break;
	}

Simple loop, simple statements and all easy. :-)

> Right; I was worried about that too but find_next_bit() will return the size
> argument when it doesn't find anything.
> 
> So that should be s5_reset_reason_txt[32] which has the "Unknown" string.

Yeah, that definitely needs a comment above it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

