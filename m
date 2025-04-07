Return-Path: <linux-i2c+bounces-10142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B1A7DFA9
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B38416938E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0442188596;
	Mon,  7 Apr 2025 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbQRmtq9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49099156861;
	Mon,  7 Apr 2025 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033115; cv=none; b=s6vkxr8+E0pjPVMvAtZng7c7jjCAAigkGEsFMXlR4OgBg3AHPjV3pdzJpcJ+Qd7Zc9MJW1rvjmq4tMmd1QeHoww7yoa0f9GVcoDI1bA0zzVOdlVdPcZwBr0c9R4quRaZs6Wcy4Yt4fkB23zjVdWnIysXy6d7IDeKuH0Yql8MI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033115; c=relaxed/simple;
	bh=R/+LUhaZu48S7bNuKq4PNvUVMZjjf3m1lZ4q6yzkqyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igSnKhUa1VreFgCtN/wmle6mmNlzMomW5UJT2oEOCX2+ItV/r0M3xBOkXVvoei5/5bm/cfKCr4elTRRunQzu1J24pf6BCXQOqOFsDJ8ldehAzQI6b4VkpfKp9YxxyzJ8QVfdLRmX9VpWUZhgwnI/uFS5wpio9eaqOEFb79dGKO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbQRmtq9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA24C4CEDD;
	Mon,  7 Apr 2025 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033113;
	bh=R/+LUhaZu48S7bNuKq4PNvUVMZjjf3m1lZ4q6yzkqyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KbQRmtq9/KVixr5Z5VrZP/HP1OUcSZToqDGLRIrfoTL2PXKFEpSuvphV6iYrN4YgI
	 MYkcGgAkpGJsPj2ukt1pA8Rc7Xs5I/YJXCC5SYNuIf8ckqR6rT+m5v2Rkzrqtj7OKh
	 LLmA5f0bF334my2qScGq099+fIMAUEZ3bJsPlKcG9HhHbbf2+9e5V6c2tvNKQvt2yp
	 p3dIHRyB/whsgHdL3Y05vIidlru4VMgpvtRSGAKaiuOlsh7vH9HT5XZ66fSmaCSc4W
	 Bn9cIQ4Ivnsxvbw8EBsKlFNCRfwazPn+L7oZCjm1Pgfz/eQ8PEgpkSerrOd7jE0H3f
	 SgDD2uhCrUa+Q==
Date: Mon, 7 Apr 2025 08:38:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: sophgo@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-i2c@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, ghost <2990955050@qq.com>,
	linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: interrupt-controller: Add Sophgo SG2044
 CLINT mswi
Message-ID: <174403311198.2084156.511081791031518276.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-3-inochiama@gmail.com>


On Mon, 07 Apr 2025 09:06:07 +0800, Inochi Amaoto wrote:
> As SG2044 also implements an enhanced ACLINT as SG204, add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


