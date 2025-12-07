Return-Path: <linux-i2c+bounces-14466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566ECAB370
	for <lists+linux-i2c@lfdr.de>; Sun, 07 Dec 2025 11:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 694AA3004D38
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Dec 2025 10:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC082D6639;
	Sun,  7 Dec 2025 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLeJ2876"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696AD281525;
	Sun,  7 Dec 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765102706; cv=none; b=OxCsfVQCv7QZ3lPzVB/whOaXe8USMU/K/pMzA/l+idSCGm6KSGKcNHxdqLh70YKPOugl9bYgQMe7lYIgg+ZeQ2ugJdsR/N7D7h+F9GnoZ0e/vWGdJEYPHyNCrE/ZHla8OiRqdSdkQH1/Dm4eqW4pHLKwc+eX8xxctVZIQMcnBU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765102706; c=relaxed/simple;
	bh=ohfUErXnHDL7zLjEi2IBpBa840o0gRbi4RyrVEjUPio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxJ2IYBOriJGTy8RPrBUumk/xpIeb8eGEykQuquv1QitMRwDFznINoizuXQrL7eSgZkexitbAFTPP23/909H8oEtxphpJ/EyBGtdlrA21oY6oerNZak7Vup8JkJfFprnZ0nPsT6bufj5t+Gj61sMVFWvy1VBp0K4B4Aady5PTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLeJ2876; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765102704; x=1796638704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ohfUErXnHDL7zLjEi2IBpBa840o0gRbi4RyrVEjUPio=;
  b=CLeJ2876qoKFL9M9b6bsWagenUb14UfMjaVSWPQYRqu+WWb+xQOhLsua
   P2R3D+qMyqi8gUQ6O5ArbmiTibaKB+QVARJ/jiztgwdOnansmPmXkNHoU
   M84ZC9fuG8hVu60mrU2tVNvGqpkRRJyroc2mSLH/FxD614bw+TqyededF
   guGxlRf1PNGI+kZFPhngGnyjRdbhW192N4bZ3B+/9iCjQy9g0SiP2X6ql
   qPaF20TQuw8CnSB6e7z69a6vSBHt2sUAwklswsaCTUHoBUZyMlRzxnVXh
   cI5FO3MBz0VWf0iN84pqt/YM74We3KwgT8mmvY0i/bWmsgAeo6h2esPNO
   Q==;
X-CSE-ConnectionGUID: 59/l0rIpQpyfpc+ZBmaTjA==
X-CSE-MsgGUID: B99a8wHvQ6ucpM0elN6B+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66070472"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="66070472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 02:18:23 -0800
X-CSE-ConnectionGUID: 5adE1stOSp6Ymx8Pbuf02g==
X-CSE-MsgGUID: 5L41niC1QV+mmANoYj789w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="194734567"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.218])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 02:18:21 -0800
Date: Sun, 7 Dec 2025 12:18:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev,
	rrangel@chromium.org, superm1@kernel.org, wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aTVUakljrd-sysxP@smile.fi.intel.com>
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
 <20251207040459.3581966-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207040459.3581966-1-safinaskar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Dec 07, 2025 at 07:04:59AM +0300, Askar Safin wrote:
> Andy, Mario and others.
> 
> During these months I found zillions of suspend and hibernation related bugs.
> 
> It seems hibernation is not well supported.
> 
> For example, it seems hibernation is not supported on Chromebooks [1].
> 
> And Fedora intentionally disables it by default. [2]
> 
> Other operating systems do similar thing. Hibernation is hard-to-enable
> in Windows [3]. macOS on Apple Silicon hibernate in very limited scenarios [4].
> 
> But I still use hibernation.
> 
> So, I have an idea. Maybe we should remove as many as possible hibernation-related
> code from kernel to make sure that remaining code is easy to support?

Maybe not.

> I. e. maybe we should remove some even-more-obscure-than-hibernation features,
> such as hybrid sleep mode, to make normal hibernation easier to maintain?

Hibernation is not only for workstations. And I believe it works in Linux to
some extent. You need to discuss this in Linux PM mailing list.

> If you like this idea, then I will happily write patches for removing
> some hibernation-related features, such as hybrid sleep mode.
> 
> Other ideas:
> - Remove uswsusp (i. e. kernel/power/user.c ) in favor of normal hibernation
> (or vice versa, i. e. remove normal hibernation and keep uswsusp only)
> - Remove hibernation to swap partition and keep hibernation to swapfile only
> (or vice versa)
> - Decouple hibernation from swap completely (i. e. hibernate not to swap
> partition, but to special designated partition or file)
> 
> In short, just tell me what should be removed, and I will happily remove it.

I think nothing. It's better to try to actually fix the non-working scenarios
rather than remove the feature completely.

> [1] https://www.reddit.com/r/chromeos/comments/y5pol9/anyone_know_what_the_status_of_hiberman_hibernate/
> [2] https://pagure.io/fedora-workstation/blob/master/f/notes/hibernationstatus.md
> [3] https://www.groovypost.com/howto/enable-hibernate-mode-windows-10/
> [4] https://www.reddit.com/r/chromeos/comments/y5pol9/comment/ism352k/

P.S.
I'm sorry, but why are you so eager to remove something? While in many cases
removal of (potentially dead or unused) code is considered a good thing, it's
not always the case.

-- 
With Best Regards,
Andy Shevchenko



