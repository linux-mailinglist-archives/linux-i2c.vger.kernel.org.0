Return-Path: <linux-i2c+bounces-15009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4642D0B5AA
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 17:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD4D3060A56
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 16:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4684E35E551;
	Fri,  9 Jan 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+HCE/kD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03514322B7F;
	Fri,  9 Jan 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976894; cv=none; b=U5QKoq/MStGG2LT7LvghfF5zHMCCk+RXJlDQ1ec1NVlmW+e8Y5cH+pnzcqtRV/a5vmeF3VxlGrTqzJDv0KWzDuUbJEUA/czC7gcZDQmFQqXFBH4aQbQlYSBOS3sP/COGjwk067ubw6ZwmDYA+bQDIIpDGUbTlT6I4cHq+PM695k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976894; c=relaxed/simple;
	bh=HlhshcbACU4cx8fSzZn3AaPVzCECAd+ZwpQPQ+F2DSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ObH+VDeNuTmIaQpT/9pHPJjLDhBL2P2KUTPS409ZoPRlLF540xpSS3MuPgQD38k419p528snCBKdA2E1YlwviZ8pclDOi1u+xeJdyU3Ir5ie8p52Tzu/cuu+aJWJZvu3oBrLQjONzq0YYfq2Oo2wcLjdciRy0AIK7FVVYYpfhI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+HCE/kD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE19C4CEF1;
	Fri,  9 Jan 2026 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767976893;
	bh=HlhshcbACU4cx8fSzZn3AaPVzCECAd+ZwpQPQ+F2DSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T+HCE/kD6HWY5CMtJFaT4wz+DFAXfChTB70NHDkKf+n30FMQN1RFfYCjY64eq2O9w
	 MUrKKjjMPTNN3AeVWodaHutbYQDGKede/37Dpm4BrpwdUnMI0chvWmOiWWz/UUpBKp
	 yNqYqq60tAMvUa0CdJWwvIMBX90ege+RRtuHxF16dCL+jWBgZQ+1yFyy038XQ+ddOl
	 hEuUBmCQakMOXuN0btbOtdRNbZS4WxORe0KJ8+4ssZezRo8T5udT/lULmHEVKTj7ZP
	 A8osj7Hom5hwE+kYp2nWNXoPS2EhBFhTL0bYX5Yi1OLgZP3KlbdpZ3w/UwFbMHpTaD
	 g5IjwO+msAtXg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com>
References: <20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com>
Subject: Re: (subset) [PATCH v4 2/3] mfd: simple-mfd-i2c: add default value
Message-Id: <176797689092.1850390.415240283270353240.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 16:41:30 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 25 Dec 2025 15:46:32 +0800, Troy Mitchell wrote:
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
> 
> 

Applied, thanks!

[2/3] mfd: simple-mfd-i2c: add default value
      commit: 77df11d1f1f962636e897f3fcf0977109aa74791

--
Lee Jones [李琼斯]


