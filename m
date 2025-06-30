Return-Path: <linux-i2c+bounces-11693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8915AEDA3E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 12:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9621F1899122
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 10:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC53825A342;
	Mon, 30 Jun 2025 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHvPJy1A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DF4222597;
	Mon, 30 Jun 2025 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280407; cv=none; b=h8fIzE6BI6g4HyvNkW3wa0sDHaqrjNxXz7+WV2jhe4gLC5ajWT3vO4HQVgWcmrToSl6MJsixDb0NvoGIyfCxnTtMHVFzFkS6VWty8QE5tlQhoDa71o8tFWhLnjVMAlJBXXU8BD3LKhwZBFvw12g5IVVsjE9IsurUZbceQs58K9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280407; c=relaxed/simple;
	bh=6hn4Jcbt8dG1IC3Ga4bKV/Nz0qNkj1yaEdy0zsmucXA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QGMgBiw2uJ1qMRpVddLNq+ndqg8BZ9kSkadoF7SQj+yyDMUzxvjDJhmUVCgCtQtoTJoTyBVNOduvoQ6B3uoEwtEX9Eq5j7oMh7Ym+RgxzAOUyBGE4/Rq5frNpIIV7JU1RhiWPyWNFMtrBHPSCQuBZTxlqrfJJbB044J3Q0PEGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHvPJy1A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751280406; x=1782816406;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6hn4Jcbt8dG1IC3Ga4bKV/Nz0qNkj1yaEdy0zsmucXA=;
  b=HHvPJy1AA/3QdmIJaPRG86gjPg8HCmT5hEakBz4LZdsdwMVD4BydsnP7
   +GPdIHwcTvyB0u+QzrIvUYAjqqk7tLty/XyzvVWKegI4bCxjvc0HS+va5
   pIkmeaR5NtXd0zEywj20p1Vy3Cw+10Va14F0iiczXLHfqdJzvmCGHRYfe
   CVcl7Zk7hjv8qFmVDnsaLSC047/6CpR4TRuqI3kFi+Af1Iq7B81eE8+4k
   0KDZiSD7vR8loAVuv0W+292MGZKlh60rj8LZqawf6PgKpckoWhAhGvYUV
   b1R1P7uhL106LQ5ojGBwe+D3X4IXxRxZQC93OyPXkWgqWwhMPK2zZZQdw
   g==;
X-CSE-ConnectionGUID: 0iqG9NrnTgyTcZDv07LyVw==
X-CSE-MsgGUID: KkyV/3MdS2WUoyOs83Bk5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64555063"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64555063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:46:45 -0700
X-CSE-ConnectionGUID: BbPfNzhxRAC3i0+5+4jLQA==
X-CSE-MsgGUID: miiu3+DXQFmp+ecZ65NmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="184348456"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:46:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 13:46:35 +0300 (EEST)
To: Andi Shyti <andi.shyti@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mario Limonciello <superm1@kernel.org>, 
    Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
    "H . Peter Anvin" <hpa@zytor.com>, Jean Delvare <jdelvare@suse.com>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, 
    "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
    "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 1/2] Move FCH header to a location accessible by all
 archs
In-Reply-To: <zkbd5qdfj3xrjh7l6sviqzsu6foyxpwsko47czrpet55kgqzfv@aw3igwk34irc>
Message-ID: <a6ccabd7-1436-ff73-398f-b92e546d3701@linux.intel.com>
References: <20250610205817.3912944-1-superm1@kernel.org> <c3d78272-c80d-47fa-a32d-151c137251e3@kernel.org> <zkbd5qdfj3xrjh7l6sviqzsu6foyxpwsko47czrpet55kgqzfv@aw3igwk34irc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jun 2025, Andi Shyti wrote:

> Hi,
> 
> On Thu, Jun 12, 2025 at 10:36:31AM +0200, Hans de Goede wrote:
> > Hi,
> > 
> > On 10-Jun-25 10:58 PM, Mario Limonciello wrote:
> > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > 
> > > A new header fch.h was created to store registers used by different AMD
> > > drivers.  This header was included by i2c-piix4 in
> > > commit 624b0d5696a8 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH
> > > definitions to <asm/amd/fch.h>"). To prevent compile failures on non-x86
> > > archs i2c-piix4 was set to only compile on x86 by commit 7e173eb82ae9717
> > > ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86").
> > > This was not a good decision because loongarch and mips both actually
> > > support i2c-piix4 and set it enabled in the defconfig.
> > > 
> > > Move the header to a location accessible by all architectures.
> > > 
> > > Fixes: 624b0d5696a89 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fch.h>")
> > > Suggested-by: Hans de Goede <hansg@kernel.org>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > 
> > Thanks, patch looks good to me:
> > 
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> 
> I don't see this series in yet. I thought you were taking it,
> shall I take it through i2c?

I'm sorry I seem to have missed this inquiry until now. I thought x86 
would handle it this but apparently they haven't.

(I'm the primary person handling pdx86 patches, not Hans any more).

I can take this now.

-- 
 i.


