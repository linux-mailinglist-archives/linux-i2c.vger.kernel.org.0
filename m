Return-Path: <linux-i2c+bounces-2235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE0C874144
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 21:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCCB287458
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 20:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37481140E5B;
	Wed,  6 Mar 2024 20:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EptFzMaC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF514036B;
	Wed,  6 Mar 2024 20:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709756228; cv=none; b=Oy/j/k7gkXMiwb/rsWvn2RhQEgoSa82CUUg3J/CsTyQAQpK2sSHHwwdwVFCArY9A9tN9vxaoUMXDOQXkhpnHAHa7vBB78VCNgn16fFvZ48YSgqqkfRHm6DE7ITteQo4FfMbTu87gEQdOASVP6Hz4iPAjEYlNzjb9vCaaSCqpnN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709756228; c=relaxed/simple;
	bh=hFozG4fN9WYd6UAq6nV/mir0bNuPwOW+MEPZsdbO1w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npSaNC+sO1ysa3svLlivE+NlFuAibpVUbfjEuBKB+Ou9o/f+olS7ILr7vZgzeUNYuQMbQiS+Vz8g6UTkJFLgj8b9lRdSifeytdWbDofYpgIK+D9orTIYEjIvAWiHAlqXSS1f7k5Gu+rB+uH1jsxKwTSVNMJfE+toEj9crgSfWv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EptFzMaC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34917C433F1;
	Wed,  6 Mar 2024 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709756227;
	bh=hFozG4fN9WYd6UAq6nV/mir0bNuPwOW+MEPZsdbO1w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EptFzMaCRsRKcLJ0IxclDn7BxasTbKGc3cfy3tYEdyg7nCujmodoZxisIyznyZZj8
	 R3RnsPO0675JLqf8jnaWo0mFTXcD7OdRKnePU5nRylDy9Ho2XkArI//n074mcDLFvK
	 l4TqP2zATyYHWEBkekRxptnCKYZfnrWDReqsHnmVgGvLq8P6Qlr2qmdyjVq/OELLzv
	 YZS8ZTtWH+DuFvzwNNzmICEaJ80/p8WJfmzStbodNSr1pTo1FiFbRWvp4y07qEetSn
	 GwSNfwjnO8lvtJQXtvnPiFwRvtM7rPuvcfLpDbIDaPkdwp9pkzepkjGmt34K7nygfv
	 W1U2iuBR5lx5g==
Date: Wed, 6 Mar 2024 14:17:05 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: i2c: nomadik: add
 mobileye,eyeq5-i2c bindings and example
Message-ID: <170975622448.581932.10085481250061070322.robh@kernel.org>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-1-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306-mbly-i2c-v3-1-605f866aa4ec@bootlin.com>


On Wed, 06 Mar 2024 18:59:21 +0100, Théo Lebrun wrote:
> Add EyeQ5 bindings to the existing Nomadik I2C dt-bindings. Add the
> EyeQ5-specific property behind a conditional. Add an example for this
> compatible.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 49 +++++++++++++++++++---
>  1 file changed, 43 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


