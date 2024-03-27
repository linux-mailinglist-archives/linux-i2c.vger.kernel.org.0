Return-Path: <linux-i2c+bounces-2632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AB88F035
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 21:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811011C2DD99
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 20:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886571534EE;
	Wed, 27 Mar 2024 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7L/nt16"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38997152E1E;
	Wed, 27 Mar 2024 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711571690; cv=none; b=Ghid+NNw+Z1oMGYDf5GHsUoCAmqWlgwCLh4eBOyV2ygByZz60pmmhYLR27UxoUOGCwxqLx0apvhvZzFjlEeeaxv13wtqo3WPrwVN+EUDY0Ewhk14xpGQRE4f747GcScbC1PcOhNCk6JdXCIhWRrGRZVUYOQPNqLOdSjS3+Ok8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711571690; c=relaxed/simple;
	bh=pKWcFje0siVhJjbTaTMsms5pCrvdPMtxOJIML+RXQSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKkVDyOUcIkjoQYYz0BJ9kaBn1oe7yIc8PY4Yafk6s9gcqloaH141CwNZPhwz/32tcLCjR3o5Rubku6af0/DdUYPkxfAtBW6oanlthIEWSMjxrophYap1iP258l2m3I11uJDYdkdp4jzf3jMvHOgErZsTipf8svJ6ItpIy40TrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7L/nt16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715A3C433F1;
	Wed, 27 Mar 2024 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711571690;
	bh=pKWcFje0siVhJjbTaTMsms5pCrvdPMtxOJIML+RXQSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7L/nt160fnk7miw88fq0azo3Io+V1Ovj3mvJYo/gwVBkJm0VzmXg5xfEKOAqfhKw
	 5VGhhm4uz17CxTrwNn+1nYRgpwKaXKVkep9UjTvmGHVWxxKz/qlR7hxvq0QXS6HJ28
	 9DJwf4UwqIiZqAAKfb8dpfXcesViXw4DMYZTtUCj2miIw/BweVV8XbRjy0wN8NdbQV
	 ENuwIGodp4qX2AqJ6fNnpRksE0+ekCl73XxG6u+vbIxLj3LMlkDbR3kPXNmX7AQu1E
	 euYDdJ00mQWcTB3uXc31ZOL+RvafZ138wzQ3KeXSF1f7kZtJw/r/FHpMP4mPZHqYC5
	 wYv75FWLLUPJA==
Date: Wed, 27 Mar 2024 21:34:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 14/19] i2c: nomadik: drop owner assignment
Message-ID: <ygjktie5isba7fzarq4agm6gh363ysm36czhfmvwlwozcs2fkn@c7z32o2lrldz>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>

Hi Krzysztof,

On Tue, Mar 26, 2024 at 09:23:44PM +0100, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Andi

