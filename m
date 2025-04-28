Return-Path: <linux-i2c+bounces-10664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15741A9F85D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 20:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88BEB5A3D3E
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 18:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3842292928;
	Mon, 28 Apr 2025 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZvnI5Ih"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583B7082F;
	Mon, 28 Apr 2025 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864323; cv=none; b=WnFi16Jb8VR1cGz7QlWM4a29P36ymuaiQTCI77aQJRp09Cgw7DDOtufKs/uuywNPjUTanTdgOkWjY5iWXHVUePrrNdPJn80zV9sFs7n0Y3L0KF/T6tDYs8OQI0efooFE4gxKE0z1KyNku4pGo39B1WaLfmXTQDOWKs53pCM5fuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864323; c=relaxed/simple;
	bh=/Vu7XwLvcl6LR01XsjGOWP/RXqs55bcqqo9kZyYmSX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ib9tL/A6cYqANybSsADCmGM18xrkArb/5rQ1KaAdnF6CbsGDtBnUPNmCop9s7SfhKkbgFoderAYPBW7sESTXQTeSvlNrcwm7FqV/BER+h3qSSD73f3YXhlolodRTa/aqA5KUGBktFAJnd8c5vkkQIJ8WjTwPJ/mCIbzATyYulLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZvnI5Ih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1025AC4CEE4;
	Mon, 28 Apr 2025 18:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745864322;
	bh=/Vu7XwLvcl6LR01XsjGOWP/RXqs55bcqqo9kZyYmSX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZvnI5Ihvnk3TYlNpqQ9scQQTCWMateTTv3kzlBLtNM+nwK/73/fO7vQf1nYKDW+f
	 XVom75PksM7bSjnbJWBtVTugNapJpnVjxoFG46DQVPbefO6i6oZnDLf6yqivUq3VHx
	 V1rhPjD4NaQKdMn3bHq/kkL5jvbOjFkAxY8989qfOBAGXxR2NwlPRIh2JQrulqyZkz
	 Hpnx7xNI19agZTb4lFNlfBpxSesCYfZ0V4M9mD+5aDqN3nPwmPi6RV+RvKGbQqpWpO
	 Z45gtuhgCzrnFNItFi1a3gHlD9dirvDDAbnW/uyZSVOAFYO0Low7IoN1Su94yuXWPH
	 8lAnwabxaeGRA==
Date: Mon, 28 Apr 2025 20:18:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Jean Delvare <jdelvare@suse.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
Message-ID: <e347jcmmcbajeajp5munnlqoshjkrtqp7y4fbfykp2o5vzwiwg@jtnesfw3wkh4>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-3-superm1@kernel.org>
 <qqrff4zx6eyoyppx3bmsujl4vzhmlwi2dldhoxxikkspmlbiiz@sabqjmjekv7w>
 <aAyqfaz4-_9qOG-x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAyqfaz4-_9qOG-x@gmail.com>

On Sat, Apr 26, 2025 at 11:42:21AM +0200, Ingo Molnar wrote:
> * Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Tue, Apr 22, 2025 at 06:48:27PM -0500, Mario Limonciello wrote:
> > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > 
> > > PIIX4 and compatible controllers are only for X86. As some headers are
> > > being moved into x86 specific headers PIIX4 won't compile on non-x86.
> > > 
> > > Suggested-by: Ingo Molnar <mingo@kernel.org>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > 
> > OK, so these are going through x86, at the end.
> 
> Yeah, if you don't mind. There's a later x86 patch (5/5) that depends 
> on the new header.

sure!

> > Acked-by: Andi Shyti <andi.shyti@kernel.org>
> 
> Thanks! I've added your acks to the commits.

Thanks!
Andi

