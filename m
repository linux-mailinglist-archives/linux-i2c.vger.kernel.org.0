Return-Path: <linux-i2c+bounces-2148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09514870376
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 14:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B27B1C20983
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 13:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB323FB0F;
	Mon,  4 Mar 2024 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZAXPqkO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225AB3FB01;
	Mon,  4 Mar 2024 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709560651; cv=none; b=sk8kF0Le9/bHNHqWxIZjHhSOqSejCEP9eIZbWmHZFgUYj5eB8wyFVSaEhz2Ch5iz837aC3kzbq5Kv6Jn58wvGS2cF1JQ1v0hDKQa8FvyweQphAfugPTabShxffstwoJ3mM4QOHqCnejLsp2ErPASz9qcrW6mEL932qOcVc54/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709560651; c=relaxed/simple;
	bh=nPq643HkA5q8IS3cp0c7XoxseUBXXwbf88gB9gSO2TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB1oaERL0KbReKkDwVl2LCCAjLWs3C5+a+KMWlw7NPhOLnnU2OePoUf3XJDMxcCdTq9csOn8jQf61jE7luVOzXiIEN5Syy+XKHvRyQJlBrVtca1GC+PQfx7vTvaJd1eVQU2mWtR+rtnKZlIFhK3ws9sc8bj7F9tbxGFxmvjhKBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZAXPqkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3B6C433F1;
	Mon,  4 Mar 2024 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709560650;
	bh=nPq643HkA5q8IS3cp0c7XoxseUBXXwbf88gB9gSO2TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZAXPqkOnvxXMyIw+Qlh/odp6y9XRorZ51xkb8K1XRbB6xsNXXU+McUll6KFmjjhM
	 DDvxZA6rJ/EAKuFCceAYr4j6stSJ3C957x181HFSU1YLoH+wpk1Z1IWDJzsaCPAR8M
	 ihUY4Rmz051bwneZm/fT58pkor+8f/aBt8kqwWJqKzM1wVxYp8cT66kaGVxPY3YS9+
	 Wi5XSub7PP/Miyf+27DVP/J2twvETEaOkBS0LDFr+r19VvXEkgBwV0MWzJbngbitUL
	 cJRVzoAx6rCmsYLq2UZ9WYjsiYfyd4bAQo6nnyBYbgbZwntGAraAyWtYK4/BIIg/35
	 hYJw5j4gp7bZg==
Date: Mon, 4 Mar 2024 14:57:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 08/11] i2c: nomadik: fetch i2c-transfer-timeout-us
 property from devicetree
Message-ID: <euvozvodxwacw4tf2iifxs4zky7magyuc6nkraujwyb3766u33@iiifyt3nhb73>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>

Hi Theo,

On Thu, Feb 29, 2024 at 07:10:56PM +0100, Théo Lebrun wrote:
> Allow overriding the default timeout value (200ms) from devicetree,
> using the generic i2c-transfer-timeout-us property.
> 
> The i2c_adapter->timeout field is an unaccurate jiffies amount;
> i2c-nomadik uses hrtimers for timeouts below one jiffy.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

