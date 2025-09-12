Return-Path: <linux-i2c+bounces-12928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F345B558CD
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 00:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451DE17B0DC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 22:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD22E27E1C6;
	Fri, 12 Sep 2025 22:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LOsddw8U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ABE27280C
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 22:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757714563; cv=none; b=Uq0Q5z5giBwO2PhVpx44OTpqE3Par7jum3l5gf2fc01J9T6uTaxCOFH0cLfOI7eqJjgfQ92MNYmRPyHgiU2aHka4OBLeQnoFoOt40gZoyuLWgBv+6FgUyxa8eSjXKKDTR/mYHxEyAdkarRx7tpmMrh+H+iuBLRqTA1MqGMCkz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757714563; c=relaxed/simple;
	bh=migYwaWcEFkXceb2jECsqJx9G0HoIYJqzR5emfUWiaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtQVcu8AzribNmScT7bR+PN2vks10dbnOapaAucW6f7q8BN2r0gJ4U3CzXQeWCZ/glk3hAa+ibGH4/ayAD7Z1YBq0GDCNYzhKYVEWewrNTcThAvsOTCvZro1TlaAv/fA/LLocQCE2TcD96u1BrFHr74CvSSJ2Y3Ozc7b60TZCfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LOsddw8U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VVaK
	ksK86+6l/now4jDnqJzPYXz3j497f5eBLemjxh4=; b=LOsddw8UblcV+2BcFY7K
	C6pwglAK4IU5mARj0LqB/qM0rYFAzymBL3+nBDSNXMINkzuZ8LyXyshghs4lbPFa
	3BQxPFsePOXS1J8ZOwqLlgY3O16rZTUnivjCCeKCLrQPg89N7za/6ULgBiWZbK60
	VzxBFy9nvB0M7Cfaxu3HehYPNaXzpyAJpzlkW2WS6J3j0DzfaM4wkz/T9ehAGo5n
	b+dGKK1PWojvovLGDQ6EVMscBCLJ+XssKYLEwfPzDH3Vt70Hn8J0ycX4YGiMVohc
	pPt9KrYw1jeeyomkBB/wh2z05g+h/sLmC9Q3+qnik8yzxhbpeJ3gW8OBnm23V3wc
	MQ==
Received: (qmail 1498791 invoked from network); 13 Sep 2025 00:02:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:02:38 +0200
X-UD-Smtp-Session: l3s3148p1@eVTez6E+apsgAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:02:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
Message-ID: <aMSYft5jCQe5iYdo@shikoro>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
 <20250907-perics-add-usinodes-v2-7-58f41796d2d3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-perics-add-usinodes-v2-7-58f41796d2d3@gmail.com>

On Sun, Sep 07, 2025 at 10:13:38PM +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-hsi2c dedicated compatible for
> representing I2C of Exynos990 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>

Applied to for-next, thanks!


