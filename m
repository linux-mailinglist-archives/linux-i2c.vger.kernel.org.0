Return-Path: <linux-i2c+bounces-4459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279691BB7A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25FBD2839C0
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8D31514D6;
	Fri, 28 Jun 2024 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXKyTlJv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE171CD32;
	Fri, 28 Jun 2024 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567033; cv=none; b=q8ZlJpFq1pisvqbnA5Dpc2XXbT7qiB7ZwphazetUHxAtqgd9cDxbcOnrQgm9SY30qBzSvvA91d0olP0KTdNsxg09EAxfqBPz90YfC4A03pJo0OyL9LwJ7VENrDMiV/wlekqlvse4Vr0yAVu+QS96WGZz6WnvJmnQXWSqWifY5OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567033; c=relaxed/simple;
	bh=VmYjwKp6mlAJ1kzDY8yon8mWRyRJ52jWM6niGqaHDo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8HnPj+V0cl37OK0JnpRyyDI/YM3ERjlwmUUnck+G+6HrQmmCsDlIbZZ+9yYDox/jM936F8j4wzGXzIRAuuvKk4KsTA45fCGt9RcSPWjDSHyTnTRIlnDrpvqwzcpQ2CL8xx/i1A9fmXHm8Z6fgtkJHjcvVPSNx1gTBmNDAwxeoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXKyTlJv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A45BC2BD10;
	Fri, 28 Jun 2024 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719567032;
	bh=VmYjwKp6mlAJ1kzDY8yon8mWRyRJ52jWM6niGqaHDo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXKyTlJvGFF4l0YoEAgw1mg6eLOctUu4JfxelD5BGvoLP4KW1ofc+zd9L+DopGwYT
	 2vYCSXxt1UOqrggvJ5hVYtje9EoUIcHFCrOnXQ4I3St7MyeeWSyGpmDTyvsmS2Q8kf
	 zIzEMELR+jo0Ab2N5U4McKq+O0jkamZ9i/FbS/jQ/9S4uT/w5+tAA9Sr0UFx8Jq81Z
	 c7T7JOdphvQiPlparHZOn7FEBI4l+Gb7e9pGnSf9lHI926SwTLJZGVltvjEMyzcf61
	 2lQalOEORVTJi8qVuebUSf2KNJhlS1qsKqSIsJvmRu4qq0U4QBQWBoZNT31QrpQlIn
	 oWwgCQ1sFA1VQ==
Date: Fri, 28 Jun 2024 11:30:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Conor Dooley <conor@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] Add I2C support on TH1520
Message-ID: <xkdmrmtiizoqo6mpc7i6iyhilxlw57nawn6ogv6dryaveyqddc@ach3rwy4abpe>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>

Hi,

On Tue, Jun 18, 2024 at 09:42:37AM GMT, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> 
> This patch depends on the clock patch from Drew Fustini
> Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
> and the pinctrl patch from Emil Renner Berthing
> Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

I think after these two go in...

> Changed from v1:
> 1. Remove redundant example for Synopsis DesignWare-I2C bindings
> 2. Remove Node Ordering commit as it has already been taken
> 3. Remove EEPROM label
> 4. Rebase on pinctrl and clock driver patches
> 5. Add pinctrl configuration
> 6. Replaced the fixed-clock with a correct configuration
> 
> Changed from v2:
> 1. Reorder nodes to conserve ascending register node ordering
> 2. Add support for I2C2 as it probably use the same controller
> 3. Format comments to match kernel coding style
> 4. Reorder nodes to conserve alphabetical node ordering
> 6. Declare I2C2
> 6. Set pinctrl pull-up resistor to the highest value
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> Thomas Bonnefille (3):
>       dt-bindings: i2c: dw: Document compatible thead,th1520-i2c

... this goes throught i2c...

>       riscv: dts: thead: Add TH1520 I2C nodes
>       riscv: dts: thead: Enable I2C on the BeagleV-Ahead

... and these two go thrhough Conor's branches.

Do you mind sending a ping when Drew's patches are included in
the merge window? I can put the first patch on a special branch
to keep it under my watch.

Andi

