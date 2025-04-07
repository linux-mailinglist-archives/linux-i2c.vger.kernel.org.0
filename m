Return-Path: <linux-i2c+bounces-10148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014DA7E064
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 16:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A50188B89C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F611B0405;
	Mon,  7 Apr 2025 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXG8+zHj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C7846D;
	Mon,  7 Apr 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034366; cv=none; b=AD7+6xIM+Vlz+C6ur7MAbqUXYOvLPxoaGaOeX4x9PjwkRrVGCKhpiWT7rl6pWP3wHLCtg1ekF5mVr5YXpZxoX3l35MQot7uVEfWMwY87r8y32w9hkpjgJJfcWiZ29coV+J5K2LLNl9yBYjpvuMTb5FzSwt7gMwYQERC4UZJ41yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034366; c=relaxed/simple;
	bh=8s2WBNabZQFxBl7Vpsud+lJ/8w8F8nDe+peMa/6CfYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYzJXc+tTJiyN9YYSV/sUkLVC5EEFTqeGC00XtkizI/w8DNjJg/i19ETMtk8aYR4s9s2nOsSmlzCMH7ArsTqBDPhYHH0wfkHh/5tYM5KQ6tRVbe2SyT0U07cbMQwYs12cx6jCykp/O8Ld+MK+swnrR0jyzcYuHcKFKG8MjZGhRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXG8+zHj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55286C4CEDD;
	Mon,  7 Apr 2025 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034365;
	bh=8s2WBNabZQFxBl7Vpsud+lJ/8w8F8nDe+peMa/6CfYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXG8+zHjOCj+V48R59reR4E1O9Q2qp21nTZlonWp9Xyp0ycMi0V/9lST8jdTr0JrB
	 dwa44fh0Om/zzKA0zGhuyNwgJ0BTsdSwrk6QZp8p3UGwoHZA0O0dLZiodAr4W829ZG
	 TUxObNX6z/efLUgEv34gVPOMdySNc0fUQDCPZe7b4T3sGHYDcLThD8icihBOG8/kN+
	 uTKEbi0PwlM+9+WH5COIS7hYG+6oEuN2nvg/YVU5dAjKKt/kHkgWwePWd4N/KkT1kq
	 zDWY70pHKi3qVH9AjH7qXgKhX0cG6jwP/4slFVjbxAE6EyzKWkS5OHwpfyF+1fNF7s
	 t2QGiCC2GYohQ==
Date: Mon, 7 Apr 2025 08:59:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-riscv@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Yixun Lan <dlan@gentoo.org>, sophgo@lists.linux.dev,
	Chao Wei <chao.wei@sophgo.com>, Longbin Li <looong.bin@gmail.com>,
	linux-i2c@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	ghost <2990955050@qq.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-mmc@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <174403436377.2164588.13246068752333809704.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-6-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-6-inochiama@gmail.com>


On Mon, 07 Apr 2025 09:06:10 +0800, Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
> 
> Add compatible string for monitor device of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


