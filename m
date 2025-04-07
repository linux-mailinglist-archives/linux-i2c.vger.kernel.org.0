Return-Path: <linux-i2c+bounces-10152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD3A7E0AF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 16:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4987A3B1520
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7584B1C8602;
	Mon,  7 Apr 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm9MTLWM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BA156886;
	Mon,  7 Apr 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034662; cv=none; b=AQ5OhTDSZ1stOdpJ65RVl/BOdOJy88ggnU/UJtAIcgzA24XlhfKTOilUKRX4V8fdEas27FVaZpYWil46KSrOHU4OYR77nshuUZPssJWhKIZttTAvWnLIhYpltPpBElY4Xt1u6z2qrn4FYUn+eXALFyjiUse5p7DRwT/BWlY9y9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034662; c=relaxed/simple;
	bh=9XG8FxASO50Sf5GWUZAuiznC1VGVDHHjVjUYicIPg0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5LAt4bCjgGPn8J0UeN2+l1wdkGtGwA7ODlQOX7fWE5Y2GfFRrUML2eD4zw1xVAXAe5SIOpr7eZK0XYdi7An8pBjzFn1wfPn7LVwLKnZ7/Paa2KMG16j+pAKrLg43a+OOSqQT/6TQJgfWzn22jyV3dN6mdceh3EGPe3FLiQ5NOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm9MTLWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A14C4CEE7;
	Mon,  7 Apr 2025 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034662;
	bh=9XG8FxASO50Sf5GWUZAuiznC1VGVDHHjVjUYicIPg0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lm9MTLWM98znlU9G5vV2Xo5NhFHRhWUWVzbOpr/5eS8fxUIvzqxS9in87kTfpRtKv
	 WlIzspzrZPd36MSFuzEInhkiI04F0htNcjJQHWJWzQEjKFWDvvk+Xv4hvJoZzH1FxT
	 pk0kFhUOeK0bGUPJJciBAE5vDKXxf8DZSfBQpy9moR/hcwfd0IlDU2CVOFharyugdv
	 ymAtSu9pJQsqkfMSNx4eRKhLOPETJcNq9BwLY9PCJe1nCJH0uKpUd4GcRr+JhP2YXo
	 xTDuKmcmfdT6KQSK3Q9NnkY0MfcwxMkQ1wzEnWBJTAzsCR6tBmciOVpO9Flp136l0D
	 xnDDfDRzdzBVw==
Date: Mon, 7 Apr 2025 09:04:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, sophgo@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>, ghost <2990955050@qq.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Chao Wei <chao.wei@sophgo.com>, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Longbin Li <looong.bin@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 8/9] dt-bindings: riscv: sophgo: Add SG2044 compatible
 string
Message-ID: <174403464532.2172777.7350680687448047256.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-9-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-9-inochiama@gmail.com>


On Mon, 07 Apr 2025 09:06:13 +0800, Inochi Amaoto wrote:
> Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
> board.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


