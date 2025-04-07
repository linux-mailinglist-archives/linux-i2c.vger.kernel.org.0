Return-Path: <linux-i2c+bounces-10141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7983AA7DFBA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26973B6972
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BCB1A3A95;
	Mon,  7 Apr 2025 13:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shGgD5Gc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C719F103;
	Mon,  7 Apr 2025 13:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033100; cv=none; b=aibCLk12fAaV6YAjLR1UGGUgAPhBQLbyb/SvH6a2QF+GN+U4E57Wgyr9PTY3p7U76DU2l9MyrpOI5nQTWOIVYn0p5dikNNnVeai/ip2lT082SUFHAyxxVbEvxCserCloQLjv5+JcvrRIP+qqS7FxNW0iB2H6I7Bo68+MYjTeXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033100; c=relaxed/simple;
	bh=iJcvqyuDnRs1UUEVLb9o2DZdzokURwcVSh0sWsAF0WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIDmACw7QkWq7FaPMvEeo7yaDGRFP9Wd3dy/FW+K6OYG+lFuJEdaHQXDc76Ehc9AIYtJi4azTngU+RuD8MThUxcZ2z/nUe0ti2P5J0dLoIou+Poh7lznFoz+oY6NZynoegqHjGHgUTtZ7A4WdyDhc7GJTR5cjeECOxzp94Oshkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shGgD5Gc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81925C4CEE9;
	Mon,  7 Apr 2025 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033098;
	bh=iJcvqyuDnRs1UUEVLb9o2DZdzokURwcVSh0sWsAF0WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shGgD5GcvoukPBR7IKo4QrWf9lMxSBN0wZOrqRrrC5X2KDzeGjC8MA3dF3eWVQ/L/
	 VaMAiey9R8D3X7e75z/KSxv/EZH4m6hFVnbm4MuSEdLPI0pfjWa1i+iSYqpxSnGyNR
	 syEa9hDIWIYB4Cfg/DfyGaIRLKhH6G9AqJG9FfMS9uz2VFi1iuMfZyJgL/79KZ4l0/
	 Ur3cwy2t80bBXz6K/BopNTHi+rfENnFEuMK41pFxWB6eQDFbE6Qx13ILCe9X8dG0zX
	 NK6u//exi8jzgWX6rsgwTxCloOg9TTTgQioF4Wtj5MZKw+ZccCvFFoU3/jjc4iOg8E
	 hJPaHJIY1P87A==
Date: Mon, 7 Apr 2025 08:38:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, ghost <2990955050@qq.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Chen Wang <unicorn_wang@outlook.com>, linux-mmc@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	sophgo@lists.linux.dev, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Message-ID: <174403309704.2081482.4050249481827035310.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-2-inochiama@gmail.com>


On Mon, 07 Apr 2025 09:06:06 +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


