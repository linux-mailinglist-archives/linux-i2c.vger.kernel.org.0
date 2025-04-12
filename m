Return-Path: <linux-i2c+bounces-10289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 526EFA86FFC
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 00:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8785219E1206
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 22:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6191A23A2;
	Sat, 12 Apr 2025 22:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MgRnyNbZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C6188A0C;
	Sat, 12 Apr 2025 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744497028; cv=none; b=n2HTTT1wVnfvimmMHni7M1ooIyantzXygRA2pFXzsBVr09pvYDMBDmq8cmtGPA4bczyWPCPAYE9aFPooLdre/bHyrKBJT6Q086ysQGXAGdpY1T0vBqsYw1hLRJ3TWEkWvgkjVWmbbp9ousiYJ4T+xA6JZQNUxxO9lIIt4eb9AO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744497028; c=relaxed/simple;
	bh=fgM9g8YgFdwLq5azORwymy8IjXW2p4LaTGSja8GFWBk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=U4OwVYpyXKQVTBvo4ZnlCMM4WI2EhxcI7WOeGWGY+xSLX9Qx5u1nodb1GjRgI7Eez5NJ6gxUllVsToGDwoHGjpR9GvHLxJuGwibh9WnBcUXDKy+0uaLSiBhxXVaEQrZOonAeCjBMc29pfpX9LxDeiclb5VfEn+oPpi41Gf1/E+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MgRnyNbZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D8C5740E0246;
	Sat, 12 Apr 2025 22:30:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lFCTngavlAfn; Sat, 12 Apr 2025 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744497011; bh=79WROknjgzL/p85Gq/nIuNnilYKiczPAyh8PISeeOnk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=MgRnyNbZaP73CeNWPdjmsI6bzHZj85bt418JwJSLVe4kyqeAK4yTQ+uG5XmHeMxwW
	 UGg+/7INMZjvuH6FQMS4NbFYCgdppnud+soaJjN0EdPFBMxm52asidyTBseAC65VW8
	 IDear1ebrdhv00FcUmbdUXvNSfIa8zbyOqn0OTLkmvVIzggni7AO8HZjTkFR9wcqxE
	 ApIOs8L0MmezOCHcl4y3yBKyMiwWyD2BNuFTtHtz+scF5NdzH2eXd7GuTyEFbwIG57
	 wXQviOk0GqUg6RZGMOM1lcuvkbA3LG56WizorNv4hSmdZM/E9hEDdK2FFRELVjKy1a
	 cDMgjf9coaMNYDwBazh2KvPs9S3jKkEOMTe59JQdOLzOlDBfrzrOXownKRDgQljSwz
	 uJSV7Vz55sd8zjyqlSpBLa/3r94rH/EdOxuTEDxP6gZR0WBOPxrPi21I44R/fh9ONZ
	 nUDThDY67PF8VAQLKqjmJdslgr2zTwuuWloZJdJa1LXMWkQnqUTOnoqKqkNZIgG0Lg
	 +9vEalBiY3EiYusx61ziY1lMtshS2XJftmD4VsDKvF0nDt1gtzY/7S/SUCq4vWoL2p
	 a10+eU3zQOqJ2vantx7BGqx1BC15nRQtSU3NIUztydieegXMJ2gAd24neuWegtXaSY
	 cOnITsUdo4Oq4yi+uy3ddkvs=
Received: from [127.0.0.1] (ip-109-091-218-137.um37.pools.vodafone-ip.de [109.91.218.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4BB4F40E023A;
	Sat, 12 Apr 2025 22:29:52 +0000 (UTC)
Date: Sun, 13 Apr 2025 00:29:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>, Mario Limonciello <superm1@kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/4=5D_i2c=3A_piix4=3A_Move_SB800=5F?=
 =?US-ASCII?Q?PIIX4=5FFCH=5FPM=5FADDR_definition_to_amd=5Fnode=2Eh?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z_rJ37er9Dc25ne-@gmail.com>
References: <20250410200202.2974062-1-superm1@kernel.org> <20250410200202.2974062-3-superm1@kernel.org> <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local> <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org> <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local> <Z_rCuLD56IZ4hsNw@gmail.com> <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org> <Z_rJ37er9Dc25ne-@gmail.com>
Message-ID: <BE7BBBD7-BDFF-452E-8FAA-669970950B27@alien8.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 12, 2025 10:15:27 PM GMT+02:00, Ingo Molnar <mingo@kernel=2Eorg> w=
rote:
>
>* Mario Limonciello <superm1@kernel=2Eorg> wrote:
>
>> SB800 is pre-Zen stuff=2E  It's "before my time" - I guess that's the=
=20
>> precursor to FCH being in the SoC but has the same functionality=2E
>>=20
>> So I'm thinking <asm/amd_fch=2Eh>=2E
>
>I went by the SB800_PIIX4_FCH_PM_ADDR name, which is a misnomer these=20
>days?
>
>But yeah, <asm/amd_fch=2Eh> sounds good to me too=2E Boris?

I was aiming more for a header which contains non-CPU defines  - i=2Ee=2E,=
 platform=2E But the FCH is only one part of that platform=2E But let's sta=
rt with amd/fch=2Eh - "amd/" subpath element would allow us to trivially pu=
t other headers there too - and see where it gets us=2E We can (and will) a=
lways refactor later if needed=2E=2E=2E

Thx=2E

--=20
Sent from a small device: formatting sucks and brevity is inevitable=2E 

