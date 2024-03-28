Return-Path: <linux-i2c+bounces-2638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39B88F6A0
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 05:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2B39B253F4
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 04:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4104B3FBB0;
	Thu, 28 Mar 2024 04:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkeMPOjI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0F376E0;
	Thu, 28 Mar 2024 04:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711601316; cv=none; b=BEuc0BuGivBhJ+2BrtMF0ocKp2R4XGgNWli0UNQ7u+EwhHHNX0EuzdGtv+F0VqIIz0RHUnvSKydt3idQmVvX1khah2cErmjQIy/1jA7wrRHMkgK230Q7hzNRJpQObaujnQPn+59RBG0Clje7Pm27/jeLDxs0wSQxBWZjq7SnTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711601316; c=relaxed/simple;
	bh=T1+Gn5e4VYEjFqV/RLqe57MQwZkWZMCO+i28LSmTCW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQjpcq3panKorLRRKgGWQsriD8dSIWhvSI7kmcCMFVnSpHaYWhl7Jr2H4ntnAbvDz3EJ/ID4hEaXC89cjIGlbnHJApjqFeBdzWqd5JUaIcgWTOrogA6pxsYBQwMg1MWf2E3M7w5ywuwxgTd8QNYUHYmHX9/8tuQebsjUcXKpCoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkeMPOjI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C99BC433F1;
	Thu, 28 Mar 2024 04:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711601315;
	bh=T1+Gn5e4VYEjFqV/RLqe57MQwZkWZMCO+i28LSmTCW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkeMPOjIXWWx66EEl/dw0rNG/pxCy0i2H6SKrLNgoHOTLnvRuHArUpUExtQQcxBy7
	 GoYS2XE0k7HVR67XM+JALCmFCPWDM7kmahzkHEIEzwRWOhV2/MI5a37sv4y3VFjkTi
	 TINQn5piO9369A/w84ydBXXtculBdHx708tFlIHfPEdpWfUmaJtvuetN1xQ+oS0V8f
	 PdjK3vLjs6nX8iVtVJQgEZEhxhgFDkUnBf0z6aggyXKH5v4RQHthb2EQwGlfvZ6jyI
	 1iNpnDpFFrB57jtVL5ByZwDhDNMLC31zg//72Qnyi+jvVIKWolcJ5xUB6b3q9xhztg
	 fsDMAbPM2UPJA==
Date: Thu, 28 Mar 2024 10:18:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 16/19] dmaengine: pl330: drop owner assignment
Message-ID: <ZgT2nj1FmvZPTLdi@matsya>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-16-4517b091385b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-16-4517b091385b@linaro.org>

On 26-03-24, 21:23, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

