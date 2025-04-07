Return-Path: <linux-i2c+bounces-10144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C380A7DFD1
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E70E93B7E15
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6288816F841;
	Mon,  7 Apr 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpOE4Xsi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4E7146593;
	Mon,  7 Apr 2025 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033204; cv=none; b=ntET27M5Xt2mTFs9UmmrTfZ7ERXDSeM9MibyK8GYqLvqIXRWjO0AhdazgJYWkcpsw8Fu7c71zpZnVXOdrJErBou9Y4jAW/pm0MLXF2fFQtv/d0Pdt3aQs+abnRpHC8DYMOg9inQyDbEy9s4Was0JZtcqN78e19tnW/qYhhdPeO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033204; c=relaxed/simple;
	bh=3Jsy3U8ncbmDNsptsfF9HvnjrFQt4I1GMdj0SZq/fzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUdGhBRDY6R9rlmmKEMkGjTiZWxOPYEnWcn8RxF12j3iMOKZjg6CbfCUpmmdhO/JDdR1zDBLSIU+3Ksy7YUHGj4y5AuAyrVRyxjdwuxRwAyGmRBTqmei5UAorUAaOtJBGYynWGv1HaeQ4kGY+myRximsvExnQ+HKiAI4TJVfKB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpOE4Xsi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020E2C4CEDD;
	Mon,  7 Apr 2025 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033203;
	bh=3Jsy3U8ncbmDNsptsfF9HvnjrFQt4I1GMdj0SZq/fzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpOE4XsiNPaNz5DJf0PaXDEDnphzgxL8k9uTxP0AKGzcklQGu3k6nKw5At/sHjQPU
	 Nc/RE53PVfGHBx/bo2Vf4BGXZvw+ak/a/23PdGHvw8KarWw1loqMVgGPuJ/3I+NA2y
	 U0+c9prQ+RnOJHvMy+aQ3KbglvYEdmWoUKnUhv4Km64VuFE6Yqic5sKz/VsUuVd4mA
	 wG3nu0TNHb0lsdT2nIE6A3/IjeRBQ+glkfCN0M5VVzsB5NxiHl4G4+58kO0Edtwc7v
	 1ujEUlavDc5/6ueEdJVqnhmgOUGenEcZhNtYTzlLuIhEPs7AVuC5Bd0DaSUF9Kxoyi
	 YFPKeLz3gxmTA==
Date: Mon, 7 Apr 2025 08:40:01 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: reset: sophgo: Add SG2044 bindings.
Message-ID: <20250407134001.GA2088093-robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-5-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-5-inochiama@gmail.com>

On Mon, Apr 07, 2025 at 09:06:09AM +0800, Inochi Amaoto wrote:
> The SG2044 shares the same reset controller as SG2042, so it
> is just enough to use the compatible string of SG2042 as a
> basis.

You can drop 'binding.' from the subject.

> 
> Add compatible string for the reset controller of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

