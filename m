Return-Path: <linux-i2c+bounces-3145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C628B2464
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 16:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 001F8B26440
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5880D14AD3E;
	Thu, 25 Apr 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZv8YRIx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507314AD35;
	Thu, 25 Apr 2024 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714056688; cv=none; b=PdXTjHSQF73MXJo/1aP4v+S6PfhDIaO9KDhbYIrz5ra6f2f4hK8amQhOd4bkoELYJIP2PBloOiWI3sJq6vOHc9Ovuwz3Fpk6eBOOQ3J1UNQXozdXrh1b0k7qN0neJm+OYqdoaAGEtYGtBLhGV2I+YT6FmudZT0oyIjPCzx/PVVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714056688; c=relaxed/simple;
	bh=8dRgSlgyKdCib/XND4kmdZuDizI/UOhr07F15qMIYPU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=RqCIaqK/8KYGlN4M5lEVf782SPszTXUYgEUlUL3q2HqDBtKIkO2QmC7RJmB1pNolnajwY+VoSTRUDsyChIirvLujtyhEG2L/H5y7Hbrv3raQLIN+3J+ASYpPa5ifoQXMu2Ee2fguPfh9gr1KQ9qPabKJEdjhv0GWpnRBgS/HV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZv8YRIx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616ACC2BD11;
	Thu, 25 Apr 2024 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714056687;
	bh=8dRgSlgyKdCib/XND4kmdZuDizI/UOhr07F15qMIYPU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iZv8YRIxXsiS0/U/AjsJ2jKOqFhqz58EVRl2afTzNoeFgRS6bzdsSrw6Pxgg3rHZ3
	 25b+r3LQ6pbEHq5Y6qqSdqjWv1KIZVVbbg9RJd+VVL7shgzzkIJ9TlDj0r8YMIBW7g
	 zkmKhKTrh4Xt9xa2k7h/azJknkOuaaw6YmDQiV+6zG2RcGdDsvNC4zDwCXJ5b55F37
	 cknwoekAC65eEx5dnbcnxUnLbU4DcR7vdMsn++8JH0Eo1DPWAhnOikLHiWTafkWQis
	 eFh3EL+o/3R5n5OsxjPb3h1CDP/q2yc73SHk0wtehzTqMUvVI80m3LXUDw9D/jOuz9
	 nxvGxNvf8i14w==
Date: Thu, 25 Apr 2024 09:51:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: andi.shyti@kernel.org, jszhang@kernel.org, miquel.raynal@bootlin.com, 
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, guoren@kernel.org, wefu@redhat.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, 
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
Message-Id: <171405653346.2527762.16827325392956038580.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add I2C support on TH1520


On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> As there is no clock driver for this board as of today, this patch
> series uses a fixed-clock named i2c_ic_clk.
> There is also no pinctrl driver yet so pinmux must be handled manually
> for now.
> It also fixes the order of the nodes in the device tree to comply with
> device-tree coding-style.
> 
> Thomas Bonnefille (4):
>   dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>   riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
>   riscv: dts: thead: Add TH1520 I2C nodes
>   riscv: dts: thead: Enable I2C on the BeagleV-Ahead
> 
>  .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
>  arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
>  3 files changed, 127 insertions(+), 27 deletions(-)
> 
> --
> 2.44.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y thead/th1520-beaglev-ahead.dtb' for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:

arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#






