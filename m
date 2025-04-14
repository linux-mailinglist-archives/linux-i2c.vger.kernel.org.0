Return-Path: <linux-i2c+bounces-10318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65DA878CB
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 09:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77E071702F1
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 07:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9C02580EA;
	Mon, 14 Apr 2025 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVPlimpU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FB3B7A8;
	Mon, 14 Apr 2025 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616000; cv=none; b=UVDhrIFBIlXX6/OTea21ImPc66s+dnlSypWR+q2CC0hiOMO8+zmiA/uiea4ckBP+aM40bnQSUlAsMYK3LtFNLUmPncMaAJthpMGH8j9ZC9kuCiFwspYS6fWdJx2VUJCD7g8syUyHrbvbLkUaD0OuiQ40kUGd4WOHdEivjizwsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616000; c=relaxed/simple;
	bh=kTal2JJIjvbhqqeb2aXNLhvO1P71bn/m7n+c3fSUmFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIOpqXnSl/frlc7XQiBp9CgHcud1xTbQ8SscFfKh0aiux73F3z+3J25O1o8LUSzpBK1mCLuLNXbq8BpVqPRBTD/WDXudh/1Y5fEEQ14YoIt4Do1vaB84iIjkTxK+0jcvcFuzmAUJNnj06GV4LCmVnYkeHZMfozeZvYPZGWbRJPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVPlimpU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADA5C4CEE2;
	Mon, 14 Apr 2025 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616000;
	bh=kTal2JJIjvbhqqeb2aXNLhvO1P71bn/m7n+c3fSUmFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVPlimpUDYBt4gJJhPFhhpA2n3VetxCb4i63xcd2AuKq+ciPthWfhwmv2mQodGvTe
	 pQf+LBQ/Ib/LsVsJ8oTXtIL6PZIbbn0FURfbYgNmXaI6RTpTzjGuW/kq9ZtnEg/acg
	 r/rHOLuiOewVFKRPdMzRbCcc1l19mqZCdm3YcSuf83U/zxI2cQDKirzWHh9cZkeXT6
	 kDOlN83CmMrdzm5WGiUlKlxXCaR6BzlOEtgmvgAmAq96NzXl6itExfdSV9tDaR/sIA
	 Z0f6BzFjPKqZR5jmas63v2PubPQvbbrR0N7GiCg4yisSwZQnucP71USp2YLhCEuakN
	 G9LZrP27Ev/ow==
Date: Mon, 14 Apr 2025 09:33:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 08/10] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C
 controller
Message-ID: <20250414-muscular-steady-perch-cb44e3@shite>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-9-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-9-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:35:02AM GMT, Inochi Amaoto wrote:
> Add compatible string for Sophgo SG2044 SoC I2C controller which can be
> used specifically for the SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


