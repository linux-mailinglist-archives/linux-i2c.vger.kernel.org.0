Return-Path: <linux-i2c+bounces-6278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B0F96E42A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 22:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF489B25668
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 20:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FDF1A38C6;
	Thu,  5 Sep 2024 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2O6pYIB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DCF16BE15;
	Thu,  5 Sep 2024 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725568434; cv=none; b=WI58tXGpeXG6il3geGO3oeKyVWdAB18mGSRN8QgCDRa9jhz4BO9ZisvIbQ/JTR+SK5ZwKJDlBbBa7/U8PzxxPrQP0vCfwIG643WwQv+q/o2CHJ6SpPsOiJoqqK3GbduwD+iJXRAa9MPNTQ9jMXe8lH4yCxAqctGtIOnBbBRQ430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725568434; c=relaxed/simple;
	bh=H49BPIC9s3SPzT/V3Ja0oEGR0PhQWoDW/01521CaypU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieye2vDFvbm1XQEYyl5S6wKr1UZULxjfHVCtFhMAgczi/zMeZvv9avKMAIt2AftPzcaR5Q3EIyIkvbIqoMoodF26YxBkIIVFjlIAW/FKxUCcduTtokz8dQzxMm9/K9sMo+xZdli70gZiFzLhWvOj0ZsdxJP+D8PXIMB5V+D6OWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2O6pYIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C681C4CEC3;
	Thu,  5 Sep 2024 20:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725568434;
	bh=H49BPIC9s3SPzT/V3Ja0oEGR0PhQWoDW/01521CaypU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2O6pYIBtWf7JOB8act6rnR56J4AlqXUypgCXmH/ESWWU6+OhvKbRFxokhuy2lq50
	 gUUaToEoCTsIk/EpEyS4kc6N8zt8hDvpAVKE/XfTgSceq5m/aPZX1FZn1j2EUx6aX9
	 Ifoag2Nbe+JSC4TKESBxtxQ/Ym/rrAqeBmtWQzzLzvfAesuLoOFenmi6j6pB8Zr8MZ
	 35MMl81Fpn1ZSeJtUEcDyD2oAjqQJM+vk1/99ewMB80uRnm1nijIKPliBYh6+nWrVR
	 De++5WSsivgg/TdRytFRkRlpRzGj3kAcpJSj+5LLBmL03cwfUJytxg94Y94cv+SV32
	 7kqoA3NEYXumA==
Date: Thu, 5 Sep 2024 22:33:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Message-ID: <wncr3gah2qsakgvqj5c2rj6ovm5kja3di2ybqemd3t6i6v7hdv@arkg6mvhozxj>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
 <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
 <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
 <b12ac5ac-306f-4f36-895a-e1472ff86271@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b12ac5ac-306f-4f36-895a-e1472ff86271@cherry.de>

Hi Farouk,

On Wed, Sep 04, 2024 at 12:23:56PM GMT, Farouk Bouabid wrote:
> On 03.09.24 17:13, Andi Shyti wrote:
> > > Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> > > among which an amc6821 and devices that are reachable through an I2C-mux.
> > > The devices on the mux can be selected by writing the appropriate device
> > > number to an I2C config register (amc6821 reg 0xff).
> > > 
> > > This driver is expected to be probed as a platform device with amc6821
> > > as its parent i2c device.
> > > 
> > > Add support for the mule-i2c-mux platform driver. The amc6821 driver
> > Along the driver I expressed some concern about the prefixes.
> > 
> > You should avoid prefixes such as mux_* or MUX_* because they
> > don't belong to your driver. You should always use your driver's
> > name:
> > 
> >   1. mule_*
> >   2. mule_mux_*
> >   3. mule_i2c_mux_*
> > 
> > You have used the 3rd, I'd rather prefer the 1st. Because when
> > you are in i2c/muxex/ it's implied that you are an i2c mux
> > device. But it's a matter of personal taste.
> > 
> 
> Are you here referring to the commit log, module name or function prefixes ?
> (because  later you suggested that we use "mule_i2c_mux_*" for functions)

I made a general comment that applies to all the functions,
defines, and global variables you've made here.

My suggestion to use mule_i2c_mux_* is based on the fact that
it's the most commonly used prefix in your code, but you don't
necessarily need to use it. That's why I listed a few options.

> "Mule" is a chip that requires multiple drivers that will be added later on,
> and I suppose we don't want conflict with other module names ?

It's an unwritten rule that you should avoid using overly generic
terms as prefixes in your driver, like "smbus_read()" or
"i2c_read()". Instead, you should incorporate to the prefix the
chip identifier as named by the vendor. If this device is called
'Theobroma Systems Mule,' you should stick to that naming as much
as possible.

Using the correct prefix might seem like overkill, but it's
essential for debugging, grepping, and avoiding conflicts in
cases where other developers haven’t used unique identifiers in
their modules.

Lastly, if you're working within the i2c/muxes directory, you can
omit the 'mux' prefix. It’s already clear that you're working
with an I2C mux device.

Thanks,
Andi

