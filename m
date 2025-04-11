Return-Path: <linux-i2c+bounces-10268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1BFA85DAA
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 14:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D3AB7A934F
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 12:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418682367A8;
	Fri, 11 Apr 2025 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Kn1uGhdW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DCC2367A3;
	Fri, 11 Apr 2025 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375874; cv=none; b=lwod2oU6l5U73cVjJNy7pZ19eVf0lBpRNLe3xkX6u4UjdEZP0TQQBvuMWz6vxoi8jIjSkW4ZXdeZPP51wyuSlhOyIHpZ5n0DNe66jcOEP/tLIqdc8K0CLyNOH6048FiVJdty53lvpNjDiT6djJIDr7mtxKUfpyAAlhW3QV77Snw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375874; c=relaxed/simple;
	bh=Zd9X6ms2PPVaSWHPxKlkLmz3Y+dnMS8sn0rcTdN+2GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEsIj4/iPfyVtGgJTcpjY36jQ5BmGrE13UvADkvPgwKUu7fHr1NyIzO9XTJyBDk/cUR8kYT7mfVKG2JJDwI6TKdc33I33x47iLRCmI6mFZDJmhZbvUBomzaDMQmtxfIBPoL5+eHzvbEpAckiHjAk8nv8HhDNrA1qHVVXB9kRTzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Kn1uGhdW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2CEE240E0244;
	Fri, 11 Apr 2025 12:42:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9j4WOiKffMp4; Fri, 11 Apr 2025 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744375342; bh=sM1Z4uPV8IsYPQ9EeFvzo3tn29PTCDuLZ44Imz8+4eY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kn1uGhdWpCzTeqFESFnAJ8uZQHcy2SugAeQyzqGTi6fbzlaw3JsjNugqcm2On3Grd
	 yxIm/YCx/+VsHnOOISoCvGChQKyAGXFA7LnPijvsP77NjiHMBTxtJlGzTKtPUul3+l
	 c8IzEAhoz7u/l9IZucXgXR9QLa+XMQY/RIUmwqod6ctTXbn5BPEgrwkHfw7IFImKgZ
	 8aEObKb5nn8KMnc6t42h2jJ3dZOKRCIgqdGFbD8GDEZ5vShMu/xsSr7JC8rTlwodhx
	 ZSJrf9GhJ4HmmcQEFLYRaSaOeKSh2nn+Fzfz1wbcuPdqQ+ryohv4iBX/kkn5ZrjhpP
	 iYhCuMeh0Xjtex3NZhGl1FskDl8FXVzqd3rk8cjYnO4uHnNAjWFzJPkTRJXugCc0Ba
	 PjGdguFZoiIWuJdc+OVIn10IGMKHMh45d0gAS2hKEpx+5p/+4CJq/GuJy+rZM8uVrK
	 AN1xT8R2xTCQeq6I3LJMYxikXHsDUj+u8IOm7Ai9gpSG+bwE1zQyZmHOAi4y1qHFJ9
	 VOpT6n4QuXE6WSCDUWuuahSyxY0rSnR2pJREeJae+XIgro7cMhw1rlmua8rKq9X1H2
	 RLyha3OtCjyB1Z80QGpUTCdgVYaBCI6cQTU93q7z2ol+uguyExoakgT91aO/qxLkoi
	 CywBM/0zUMYsII/uN+dsMISc=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EC9B440E01FF;
	Fri, 11 Apr 2025 12:42:03 +0000 (UTC)
Date: Fri, 11 Apr 2025 14:41:57 +0200
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
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
Message-ID: <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>

On Fri, Apr 11, 2025 at 07:09:56AM -0500, Mario Limonciello wrote:
> I was aiming for a header that we would conceivably use in all these places
> anyway.
> 
> Can you suggest a more fitting existing header?  A new one felt too heavy
> for a single register define.

No, the logic is: put it in the *right* header. Not in the "whatever-works"
header.

So you can easily add a

arch/x86/include/asm/platform.h

header which contains exactly platform stuff. And FCH sounds like a platform
thing to me. Or at least southbridge or whatever that thing is called now. It
certainly ain't part of the CPU so platform should be more fitting.

Unless someone has a better idea...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

