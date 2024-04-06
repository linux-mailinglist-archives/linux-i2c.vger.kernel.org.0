Return-Path: <linux-i2c+bounces-2793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9BF89A7F0
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 02:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DE0F1C21160
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 00:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F127C4A1C;
	Sat,  6 Apr 2024 00:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STywHha+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B6ED8
	for <linux-i2c@vger.kernel.org>; Sat,  6 Apr 2024 00:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712363404; cv=none; b=n2vX8fa8tgb0P5aM7Qo9kPxWK76No0KffOufRsaY/W6g4wf0j9FG0EEWK4ux32D7jmLOHeaAYY6CKruvoeRDnjRlk6dC6XqabIuIWuQ41XZxxHz26sKdBl3mm6038Yrisgf7t26eeoaDvAyUoQQZlEf7t52+UyBm53eOyJpaHuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712363404; c=relaxed/simple;
	bh=a7FEZCGQkur/5qk2mwU48B2tFnyH92f8Sc1GKLFECPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB3eV3o5OEeOWTafScQ45ah1jYTG1rFvRunc8+s2kR0SUzr/l00PAu5aNtvPMQp6PUgDwdmcYesLnb+z1fdoqtZzR17hI1HTE2ku9WMuv+r5fAPcOONU9sydgiubBMMG+tYyl7TCWMc4Kz5KdrA+g5CY1HEAWixbeAljDp41NcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STywHha+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAED6C433F1;
	Sat,  6 Apr 2024 00:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712363404;
	bh=a7FEZCGQkur/5qk2mwU48B2tFnyH92f8Sc1GKLFECPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STywHha+FdHE5XZZ7qehfU4RABG42WhdvEVGmB00tpPE+Ik0NIw69WmweEMpfjDEf
	 TnpTGNvbuCLzPLcFLiLb2DAJQBXUbjjiF0ASXXIPpRIJ8WTbxQmBXeCpmXycfPGu51
	 YzqbIaWp3wrIv/RdwMCqR8bo2/8pzi/nefbSnroLjh0KnDsdN8wpU70sjy7soeHH/T
	 fDBJPg82AhntXscsqv/i7MwlUlK67iStwRNflU4VYLVX42K9f52gWjPcWvy1iWzZLh
	 0krkn5ykBkxOVWP5cPGjDGLWyktzd1voh2bIpPJe6rQXYwY/+1vARnujyEFJIcorxi
	 HiKUvyXeTk5zA==
Date: Sat, 6 Apr 2024 02:29:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
Message-ID: <ilxot5cgzlivhmxpuiifpnyx3jxymlxy2avnkqjgfzcgmmk3wd@glnv7nlydz56>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
 <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
 <b31f445a-6f9b-47ed-94eb-b80360846625@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b31f445a-6f9b-47ed-94eb-b80360846625@gmail.com>

Hi Heiner,

On Fri, Apr 05, 2024 at 07:57:24AM +0200, Heiner Kallweit wrote:
> On 05.04.2024 02:54, Andi Shyti wrote:
> > Hi Heiner,
> > 
> > first of all, thanks for the fast reaction!
> > 
> > On Thu, Apr 04, 2024 at 10:09:50PM +0200, Heiner Kallweit wrote:
> >> The original change adds usage of i2c_root_adapter(), which is
> >> implemented in i2c-mux.c. Therefore we can't use the multiplexing
> >> if I2C_I801=y and I2C_MUX=m.
> > 
> > What is wrong with select I2C_MUX?
> > 
> It would solve the issue, but:
> We would uselessly enable I2C_MUX also if I2C_MUX_GPIO or DMI are disabled.
> W/o them the mux part in i801 is a no-op. The call to i2c_root_adapter()
> is in a conditionally compiled code part, controlled by:
> 
> #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
> 
> > And is this covering all the cases?
> > 
> yes
> 
> > Last thing, how have you tested and reproduced the issue?
> > 
> The CI bot report included a link to the kernel config. So it was easy
> to understand the root cause of the issue. I could reproduce it by setting:
> I2C_I801=y
> I2C_MUX=m
> I2C_MUX_GPIO=m
> This config was also used to test the fix.
> 
> Underlying reason for the issue is that i801 has a code dependency on i2c_mux,
> but not on i2c_mux_gpio.

Even though it might look trivial, I need to reproduce the issue
first and check the various cases.

Because I'm not at home and, anyway, the report has come late in
the week, I can queue this up in the next week's pull request.

I'm not extremely happy with the new _CONFIG but I understand the
reason behind it.

Thanks,
Andi

> > Thanks,
> > Andi
> > 
> Heiner
> 
> >> Handling the dependencies in the code would become unnecessarily
> >> complex, therefore create a new config symbol.
> >>
> >> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 

