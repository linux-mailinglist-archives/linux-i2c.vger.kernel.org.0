Return-Path: <linux-i2c+bounces-12580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AAB41BFA
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 12:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD093A5065
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 10:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B2A2ECD11;
	Wed,  3 Sep 2025 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JagdKvI8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F9C2DECC5;
	Wed,  3 Sep 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895837; cv=none; b=KF7ncUu78+fH1lVtV7yDb4rgnWu7mHeDeWtSNRJc/bfYCO6fKyB79gbwV3TneIUwyU2A7QMIBG1ATuM1/qBUfpUIkYmN3CxUgihjBw0pKipjFEKuRRyu5x3YxUi8JleCufpJPsRjnILRvBUeo35V65fhl0siEeVMPttCYTdml6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895837; c=relaxed/simple;
	bh=d84xsn1/XRPPl7BGLeHHOGgmU77ohZxDzmlv/AfyDw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnw72FoffLs5/SoKpgGdKH7r2E8oe+jJUX2Fh8dD2+TOTlRAD2quYNW4X/nJ4gUyUA3q1fDK75rvlTlSKkziURT+TRANEWiWGHsTCSAJ+STPI0YI89BldrAFjrxCK1Dit87WeDiYh4PEp1++UyPHwScXLrdpeOXBvampduivupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JagdKvI8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3DBC4CEF0;
	Wed,  3 Sep 2025 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756895834;
	bh=d84xsn1/XRPPl7BGLeHHOGgmU77ohZxDzmlv/AfyDw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JagdKvI8miQa5QU7EjHTmmx38UccgHBf+y4JG2z00Rs4G9HpUWFt2V2O98t6rwop+
	 KfdV8PWQvBmLTOzCUO+fc2xYR1nOif+qzvXXvuyf2UvCJtdLLAUA5EjPouLyjiDdCs
	 9t8gdC8k7wO0kWhiRJi7QGpL7MzsXVkyhkCnvpknNxkf1+I5ktiDvq50RoLlGXG+0J
	 /AffNlIajhVrersLo/ImtmYqD+Z2Z8qRTCYPIPOW8KxzjycNgj8qshE3/ZgdohF+LQ
	 9NZwPbFa1xCn5g6EePXMkk2N4yi18Dk5npv0aKktqPdNKdbHDJg1D/AZXn+/M7M9yZ
	 HTu8OS/OR3Kdg==
Date: Wed, 3 Sep 2025 12:37:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: s3c2410: Drop S3C2410 OF support
Message-ID: <jllb7g27r72hvfusjzetcj2tyio3w73hz7jey4hnwq2iohxqtz@wbshht7hqp2s>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On Sat, Aug 30, 2025 at 12:36:02PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.
> 
> However, there is still a user of "s3c2410-i2c" platform device ID,
> S3C64xx platform, so that part needs to stay.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

both patches reviewed and merged to i2c/i2c-host.

Thanks,
Andi

