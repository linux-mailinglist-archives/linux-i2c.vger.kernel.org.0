Return-Path: <linux-i2c+bounces-4802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3463E92C59D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 23:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6607D1C22C84
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 21:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D688D18784E;
	Tue,  9 Jul 2024 21:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKOwmoQI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851EE187843;
	Tue,  9 Jul 2024 21:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561374; cv=none; b=hymAAu/1GWv73TEGHLF9xsGQwymY/sFPx8wppr0vBg3+g+vXh77PEAU4VXDtTdhriZlbiNx2K71S5SuglNSO/ofGpfDJIctjedRe1clk7hkATRDuY4RfyztoNGxja3OK1Tjl9SR+QqKCpsgaJDgN1t3wcqiHwN7eAFjiLgDLtAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561374; c=relaxed/simple;
	bh=DB4aizep3JoJB6Lb+bHiTjG4XaBZOilWq6JLMlz/qG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9lfuUwOV4Aq1c6G/HmY97TgRVH6CjwNZsjfV7VY/9sAQnS0aT+3Dn/ymesKnhFQGQJuVWvS/Qgwme1k3XpYJznI3bezz3Xo58KAEis3jaWUv5u5vksqVZg20eqPCIw/+v8PPlMB92ACm5I9qF7v4nydF4Amagz7ie0NzaYuueU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKOwmoQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5C8C3277B;
	Tue,  9 Jul 2024 21:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561374;
	bh=DB4aizep3JoJB6Lb+bHiTjG4XaBZOilWq6JLMlz/qG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKOwmoQIAWUkecWcrwhLF6uNK+woegn9M6/y/lJ3hy/KkIyOHioMv6gp43DfoCqgL
	 i06sYFSQYNfY24FNrbzMj6V8OwSBwC3nK7xqbDIodsUZEitfhl2eYLj9vtVolRp/6G
	 Gts04t/n0fvibg56kXheviVUbKpPgPBTB23n1c0cSkg4KPYy+/9mMakVk538IK9cyJ
	 bfvL53xaH0s57fOJLHQaLgEPZKAUHbPcH202V8HWM78rnPqIMNR2leMt8mF6EDTDPx
	 OMzUjHY3sgOSapDlNy+fFBEddDNOGJlIFd+dkYqahMK9tG5gPrNnKUXNfLdbe/I+/d
	 q9y/DUmtis7kQ==
Date: Tue, 9 Jul 2024 23:42:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 2/3] i2c: mux: gpio: Re-order #include to match
 alphabetic order
Message-ID: <4u7ucwosa5snvobzcmyvoukmljudlqotgwh76a4llussb5227k@dxjbagicsh2o>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-3-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617120818.81237-3-bastien.curutchet@bootlin.com>

Hi,

On Mon, Jun 17, 2024 at 02:08:17PM GMT, Bastien Curutchet wrote:
> The #includes don't match alphabetic order.
> 
> Re-order #includes to match the alphabetic order before adding a new
> one.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

