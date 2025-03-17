Return-Path: <linux-i2c+bounces-9859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31AA64900
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 11:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC2C1884E68
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 10:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36BE230BCA;
	Mon, 17 Mar 2025 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Dlo/SJqL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E14229B28;
	Mon, 17 Mar 2025 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206207; cv=none; b=b3IW84+pjB5RqzxdrXj7351RZXPNT0LZj8LDOlh/8ww8YOi1YxO8mgMiItvyLk0RaPZDESTkzVLqI/u35+15xZhXJVhA5FC34JMeTy2V8OpuOuz119u6VqJ6Fx4f2QKs+n0aPPlO9dBLLOzbhF38gTe/D8A/Pt+cDUnXy6+qtTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206207; c=relaxed/simple;
	bh=3Szj5wF5ZbUz39jIYuPbndv9xsYb6DgjUSNqDwEMsNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOladDsWe+S3BayPvB3c+GDlEHKDUaxnr04UN7rcXmSSHH0LVJvZaecWCzfBEyNLQcV2sFj5rb85o6ZjeRk1fFfUnWYwkooBjWbl6ru8Y+Va3olHXH4TObUPZrOLWwOISbzTryJ5+TdfqAkDMpwpngJaSbupFdsrZpk6kWrgiqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Dlo/SJqL; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A721A1F9C6;
	Mon, 17 Mar 2025 11:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1742206197;
	bh=P8Ujcum6E5ZyBkLtNFz3d+3PSE+5NcMmFP0XdAoXkTA=; h=From:To:Subject;
	b=Dlo/SJqLa+P+LMV5xO6L6O/4+Ulk9QlNrapzC/mGCPVv4EPNTRkIi7xFRujd8aXvV
	 L6OogSWKuRxLz1pWGMTNDGYJmf6KVwqAsSweu+JlYnyeVDyGtQ/Td5tnRSrmOWNx5S
	 1NODWvTgYktH8wGHQhNARQ3YppG3kjL8cyPX25UPJF1rixCB7JmlMIKGtvE1DV0hlC
	 soj3iSTa4h28gbj4B9av3+Df1z3xswRFberuFnM2N0AImutvfUNrrBvjcw8ExgjCIC
	 zV0CqPAC95+EusZxmOjzDwaMI+MUZvbQN413zE9DfhFCKYTWnNJrkOmXBaJVBYsnxH
	 KRvz1a9quwdnQ==
Date: Mon, 17 Mar 2025 11:08:56 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Andy Shevchenko <andy@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <20250317100856.GC17428@francesco-nb>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>

Hello Hans,
first thanks for the feedback.

On Thu, Mar 13, 2025 at 04:08:14PM +0100, Hans de Goede wrote:
> On 13-Mar-25 3:43 PM, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > This series adds support for the Toradex Embedded Controller, currently used
> > on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.
> > 
> > The EC provides board power-off, reset and GPIO expander functionalities.
> > 
> > Sending it as an RFC to gather initial feedback on it before investing more
> > time in testing and adding the remaining functionalities, with that said both
> > the code and the binding are in condition to be wholly reviewed.
> > 
> > Emanuele Ghidoli (2):
> >   dt-bindings: firmware: add toradex,embedded-controller
> >   platform: toradex: add preliminary support for Embedded Controller
> 
> Thank you for your patches.
> 
> 2 remarks, as Andy already hinted at drivers/platform/arm64/ likely
> is a better location for this.

Ack.

This driver is not going to be specific of ARM64, but today we have only
ARM64 systems that would benefit from it. We might as well use it on a
RISCV based SoM in a few years.

With that said we'll move it there, we can always move it out if
anything changes on this regard.

> The reason for having ARM EC drivers there is that these are for
> x86-pc-like laptops with all the typical laptops bells and whistles
> like EC handled battery charging limits / spk/mic mute-leds built
> into keys on the keyboards. Special key handling (like mute, kbd
> backlight) done by the EC etc.
> 
> Since all the experience for dealing with those laptop-esque features
> and exporting them to userspace with a consistent userspace API is
> in hands of the maintainers of drivers/platform/x86 it was decided to
> add a new drivers/platform/arm64 directory maintained by the same folks.
> 
> If this EC driver's only functionality is: "The EC provides board
> power-off, reset and GPIO expander functionalities." I'm not sure
> that drivers/platform/arm64 is the best place for this.

The directory decision / architecture was mainly inspired by
`drivers/platform/cznic`.

This EC is used on a SMARC SoM [1][2], so we are not talking about a
laptop nor a device with a keyboard.

But we do have a power button, a LID switch, some handling and
coordination of low power mode and more.
This device is between the SOC, the PMIC, and various IOs used for
low-power, power-up/down, boot configuration (selecting the boot
device), ...

The short term goal is just the 2 basic functionalities mentioned in
the cover letter available to the driver:
 - power/reset (already implemented)
 - GPIO (working on it as we speak)

Starting small, and adding features when/if required.

> Also you mention GPIO expander, but that does not seem to be
> supported yet?
Correct, coming soon.

> 1. A drivers/mfd/ MFD driver with the regmap stuff,
>    registering "board-reset" and "gpio" cells

So, we considered the idea of going with an MFD driver, but looking at
drivers/platform/cznic, that is doing something relatively close to what
we are doing (just more feature rich, as of now), drivers/platform/
seemed a better fit.

I am not 100% sure what's Andy opinion on this topic, from what I can
understand his concerns are about the toradex directory (that we'll get
rid of), not the drivers/platform/ parent you are concerned about.

Francesco


