Return-Path: <linux-i2c+bounces-13095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D9B925EB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 19:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63BF13B172F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 17:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECD2214807;
	Mon, 22 Sep 2025 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVYEwB6I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F186729A2;
	Mon, 22 Sep 2025 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758561334; cv=none; b=LT7BF7THFwwcJG0oAEdovleKvrqlj4MGQUC/uhJNWu7P4XahV1YNayUlXzwXSwjTgMf1DkkHFyq3byM4/BbL9hbFmxTJ654rax1ugvMCQFRYzTPnNbu14jsOCQvwGDOIyR7ZSGpxJmYud5SOMzDzmsjNkFDm7v3BYuBRt6Snu1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758561334; c=relaxed/simple;
	bh=wEqeJMpLqHGZi/PwQq3I0CMJUgwHE876L0rlZKPKAWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apS46e1oVTzxPvnCKPyq09+y33tamtt23I7lZGeebvjVRhPAPfBL3kGMgqiYyY7hKZYjOrZsU1/kqkfVa+Mq4pqKPQOmOVB+FKYf1t9bDP0RRCrZM1FPuMhrPVespJJ3Q+AbvdGvaCSA+Lzb3wbB2gtZAUIHb1scX1WlKmg8NAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVYEwB6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F57C4CEF0;
	Mon, 22 Sep 2025 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758561333;
	bh=wEqeJMpLqHGZi/PwQq3I0CMJUgwHE876L0rlZKPKAWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVYEwB6InMpqho4Kzzgk+MrzSQHBlHhdqSrn1u+oZBetxHLvnwS3OgmP69Xmkzsew
	 regeqbxCKfKK3Mrp3XtsNbBC8GB1g6LwxjWeyjnnxEw81y+GbTeXK4BigVT5viEe56
	 4EfwO4xJLlKFTfvM9VpdKGiUlb5UVcygRh+t86GNwQFzft7DmbHNrhgnhgOdo6uEYa
	 8bFY3YSL93oTtkGUsLtSdomTycL+eGVSRM39Pf1CQMgb5b2qztPSPVwVrPCN2IASzU
	 k2qQA3hctAmmbxqrmCIhUjL8MN9yuAq/MDolVv7pR6RnpXIdwSIaMxxGye9I0m+ckJ
	 gC7b1EyjtExbA==
Date: Mon, 22 Sep 2025 12:15:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
Message-ID: <175856133245.488468.16132364519443523320.robh@kernel.org>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>


On Wed, 17 Sep 2025 21:04:21 +0000, Denzeel Oliva wrote:
> Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
> controllers.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


