Return-Path: <linux-i2c+bounces-10143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29655A7DFC5
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F1E3BA38A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0E21917D9;
	Mon,  7 Apr 2025 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GptQj2sp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD535959;
	Mon,  7 Apr 2025 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033133; cv=none; b=rNa9Nri4lE9X7Wvipx+8mhrcOmXImj8pgR/4cdLlIaGHfS3jUxsLqem1Ovid4uPnjQxVHWveAdbdFB4ZMv0XiAoE28jg16VNiv3Z8Kne0mFZL7WV2zz0YiWhPGYXLisNEiSCRsw3y20VKiPfj7PrjmZQ68Fq9F3jdsloe/Sr6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033133; c=relaxed/simple;
	bh=1F9LhW1V7Jl/4nlfW9DvA2Y0ImG8BNm2UMrmjZazqxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMV0Pdovm09oUEFGjRSS6JXFH8ogUJA+NS+Ys3VzvdEHWSFSaGOU3ooAlBLUF+ijkJ1MCAxy8Iwqo+kZteW3FmtzPFiSy8lHO2FUmmPGNsHK18EFLOXLJ8pKNNVoK8CaqApTeSuvQ36ICtmARozsruWkLZnrL9f6kSIowMaxl4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GptQj2sp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B97C4CEDD;
	Mon,  7 Apr 2025 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033131;
	bh=1F9LhW1V7Jl/4nlfW9DvA2Y0ImG8BNm2UMrmjZazqxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GptQj2sp4ROzyVqijGrfeOg8cOCWBaPBVUGe9+mxx2erXzuel+E91GW/HRRUbZjCV
	 Kt6XqC97RL4qZC+c92EhVmznm3NSy52VP6j+tPWqd50hicTNd1SdiLuOHDFYxiLGkv
	 qMnHCKVPpQlLOQqoGNk4y5/GTy+eikre5XgqhbSgg+ws2XvvgUYyB53MoGOIAZsFd+
	 wokRUCgYcW/I0Fh8e9o6QWqyxNsAYrgNGx1fj+qEb8fddmvvMPc21s+Ji0KncGzUuL
	 jUpswAuMcUhpTuHXfg+kGYU9lYPDGnCTKn1CtqbOGL25YghmTwJzZUdcyB0dHdIEzG
	 7UwKNusNriBsw==
Date: Mon, 7 Apr 2025 08:38:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-mmc@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, ghost <2990955050@qq.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: interrupt-controller: Add Sophgo SG2044
 PLIC
Message-ID: <174403312992.2087419.10477124729045212954.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-4-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-4-inochiama@gmail.com>


On Mon, 07 Apr 2025 09:06:08 +0800, Inochi Amaoto wrote:
> The SG2044 implement a standard T-HEAD C900 PLIC, which is
> already supported by the kernel.
> 
> Add compatible string for Sophgo SG2044 plic.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


