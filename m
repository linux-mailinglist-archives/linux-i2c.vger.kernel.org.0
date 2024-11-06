Return-Path: <linux-i2c+bounces-7835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0A9BE348
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BD34B21A81
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952091DBB13;
	Wed,  6 Nov 2024 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OD+DetET"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451701D7E37;
	Wed,  6 Nov 2024 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887072; cv=none; b=cgOXSPekcQb71IRfpwdacEQ1zgqjBUxobxzCn0eiWmIJmAX+ASciIPzkdKMJTNmkUqETjZdwer8zYPOym2LHutzu79DfyBsWZd4FLnHzPobKpzQCdwosw2j6B5S27aMJOJFlLdy+BUFobxZGXif+uLDohLvPWHz2BIosbov8ypk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887072; c=relaxed/simple;
	bh=qctm7T8Rzv8QohIR2jqbK/UyirlBjD1wQg4/rIfL5Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oExxFmKZOCYfbVPUPaUkTKLp+A7Qr0tn6HXyy+0cNGBR6J2d2xlzQIczl7yT+x1ue1nFEGNz+NWLBs0csBX4rrRt+qxImiXcVWqQDrWB5anwj6osLbc4uvl8mGM3VAbXbrHrNZmEhlLeUYO/uT9aR0jQD3z5+e+g4HlJww6H/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OD+DetET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73970C4CECD;
	Wed,  6 Nov 2024 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730887071;
	bh=qctm7T8Rzv8QohIR2jqbK/UyirlBjD1wQg4/rIfL5Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OD+DetETDubPKJ+uYxAOj+65R38iRall8sppLYQkvgPaiqCCHlZK25NhnbvqwPJI4
	 0UG/yR2JtqOtBvZ5N7bVbGEl/14SZsvieFM96Fc31vmJbJ+5/7d5uq6Shc1Lpv/1Du
	 EO7fcb4JDuir81lbEkuSeTE9IHlOQ5IyzpXRhk/3wJB+QkR6XXG/mCdeZh59eA+GLF
	 Fe5/VbmB/6zhzTBkGjIsbTixEILNQrVx7578Kq37k3kWFGzDjEmAOvrFxNPeFFzoR1
	 urdCFjczMJnelSKaaHWbXCmq8PFIZBJbz1lWl+T5OQSEOQiy+2USyX/ZzKZdMyAqaw
	 ZykObvm+Nk8yQ==
Date: Wed, 6 Nov 2024 10:57:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 4/4] i2c: Add driver for the RTL9300 I2C controller
Message-ID: <vn6t6qxqry2ay4tbvo3cb4rbjv53pnyl56vangul36vvvxibwp@q3pssbthesef>
References: <20241106001835.2725522-1-chris.packham@alliedtelesis.co.nz>
 <20241106001835.2725522-5-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106001835.2725522-5-chris.packham@alliedtelesis.co.nz>

Hi Chris,

On Wed, Nov 06, 2024 at 01:18:35PM +1300, Chris Packham wrote:
> Add support for the I2C controller on the RTL9300 SoC. There are two I2C
> controllers in the RTL9300 that are part of the Ethernet switch register
> block. Each of these controllers owns a SCL pin (GPIO8 for the fiorst
> I2C controller, GPIO17 for the second). There are 8 possible SDA pins
> (GPIO9-16) that can be assigned to either I2C controller. This
> relationship is represented in the device tree with a child node for
> each SDA line in use.
> 
> This is based on the openwrt implementation[1] but has been
> significantly modified
> 
> [1] - https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/realtek/files-5.15/drivers/i2c/busses/i2c-rtl9300.c
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks for following up with v9. I think nothing prevents us from
already merging this 4/4 patch, right?

Andi

