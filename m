Return-Path: <linux-i2c+bounces-7862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EDE9BF977
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 23:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136511C21217
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 22:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E574120C493;
	Wed,  6 Nov 2024 22:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8HolJVn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AB2645;
	Wed,  6 Nov 2024 22:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730933467; cv=none; b=Y4TBWq93vjVsqIeSAoi81B6ylr9OtgFnxfxSKMjZvGOh/YHjXrh3tDgdrSmbmfEO7LUN+0VzqoI29hdFzBGWUgSBz68Z9IaYn9vef0l+K+aM9gAywC4peM0btEB7K2jui6RufJ4RQEcKvvaWSZ4+dJgrr7+Y9vsXuEhz5D+Fmcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730933467; c=relaxed/simple;
	bh=E/ODYE/ywA2Cf3WzILMrMNxcnC1oEYAE5QrdYiNFvK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StFTf4PKVOgTPFfH86LrUJ5fepbbiiH86QtcX0rylBs/irDm/1nA2/ncTSNpdUETMU53fAaDhC75+Pkwk3CwrCnMGg74vvcWQPBf5Xi+Qmg/6V7Ome9HBhbkXhm5F/CVOkpSr1PTGrfVFDV6EaLuIlrXyXWBCmJDwBhfzXJKDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8HolJVn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D13EC4CEC6;
	Wed,  6 Nov 2024 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730933467;
	bh=E/ODYE/ywA2Cf3WzILMrMNxcnC1oEYAE5QrdYiNFvK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8HolJVncn6CKk+vzhFUCoI5ooliC6ctEQu0fiZC28MiF6+8PhBOlstDYZgUfohYS
	 DjzliJZY+wT2MIlplkTTBCn9Yxxh/SHeEFGN3TMNvz3wWG4sqZZZdVK7WVOWv4H+JR
	 ZHVdHELmaqzptLS1GMbXf4OMMXmSmXgloO1yL4/ojlblC1KXNPqd+a0QL2NOmQdZv/
	 K+9/V2zBS60ADB23npqa+Tkf+40RnqkEM5J/OUoLCl/hsrpOlBmrWFQ1bo2rtH9fRV
	 bqE7z5vO7D9XMxdNgIO+DNXjVUOQ8iipKXf0/AQBgEN02ZA0eoERybBPgDBKsnKd04
	 nluYMgqGHQNHg==
Date: Wed, 6 Nov 2024 23:51:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] i2c: Add driver for the RTL9300 I2C controller
Message-ID: <jwwh6m4z3xjqczn5tcf2jt7v4qhx6e6atvxyrxrauynfazzghn@cxy7ugncaesn>
References: <20241106001835.2725522-1-chris.packham@alliedtelesis.co.nz>
 <20241106001835.2725522-5-chris.packham@alliedtelesis.co.nz>
 <vn6t6qxqry2ay4tbvo3cb4rbjv53pnyl56vangul36vvvxibwp@q3pssbthesef>
 <d7ceaf59-8e39-4c76-9b9f-88746a22176d@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7ceaf59-8e39-4c76-9b9f-88746a22176d@alliedtelesis.co.nz>

Hi Chris,

On Thu, Nov 07, 2024 at 08:47:42AM +1300, Chris Packham wrote:
> On 6/11/24 22:57, Andi Shyti wrote:
> > On Wed, Nov 06, 2024 at 01:18:35PM +1300, Chris Packham wrote:
> > > Add support for the I2C controller on the RTL9300 SoC. There are two I2C
> > > controllers in the RTL9300 that are part of the Ethernet switch register
> > > block. Each of these controllers owns a SCL pin (GPIO8 for the fiorst
> > > I2C controller, GPIO17 for the second). There are 8 possible SDA pins
> > > (GPIO9-16) that can be assigned to either I2C controller. This
> > > relationship is represented in the device tree with a child node for
> > > each SDA line in use.
> > > 
> > > This is based on the openwrt implementation[1] but has been
> > > significantly modified
> > > 
> > > [1] - https://scanmail.trustwave.com/?c=20988&d=pL2r5zHAPsW8d92uECdR2T8Eh4fYX_ZwrCyklfTCzQ&u=https%3a%2f%2fgit%2eopenwrt%2eorg%2f%3fp%3dopenwrt%2fopenwrt%2egit%3ba%3dblob%3bf%3dtarget%2flinux%2frealtek%2ffiles-5%2e15%2fdrivers%2fi2c%2fbusses%2fi2c-rtl9300%2ec
> > > 
> > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> > Thanks for following up with v9. I think nothing prevents us from
> > already merging this 4/4 patch, right?
> > 
> From my end yes it's all good to go. Lee's just applied the mfd binding.
> 
> The only thing outstanding are the mips dts changes. I'll wait for a bit and
> chase those up. Hopefully they can make it in the 6.13 window but it's not
> the end of the world if they don't.

Cool, I just wanted to confirm. Applied to i2c/i2c-host.

Thanks,
Andi

