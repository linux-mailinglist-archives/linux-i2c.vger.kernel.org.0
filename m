Return-Path: <linux-i2c+bounces-2286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1704D876441
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4972A1C20E12
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADD156B8A;
	Fri,  8 Mar 2024 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdBjapmo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4CE4C84;
	Fri,  8 Mar 2024 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709900776; cv=none; b=ofg/6ZV/fDQHeXq8kb4Nv0Gd0lhRfgUFyq5Yay9z3TmO03Dww52uUvLRcofPwVKMtKceC+pZpkiI4u9LyKAc6f+limazWJChTJ5oPM7UBBOlOjFQQxX3iTPrN3oGWHHpJ/3eMndCZ6gmkj6Ztc9+n+rlQBxVhIT3nlrqitxfs5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709900776; c=relaxed/simple;
	bh=YPOnPiOJiJ7yMQczi/fmldA2s+dWEsGUXu0b3HCt6Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAfBeIpSsCDcWB/ShMesFoeNJ6saY1HATJWHLDDu85dAVJhFFAaynHl9Ay5tylMngPkVO+jbh7GnHrHzyChiWOORWN4yziqtY1zAuQTJ4zXRKVOjxWLFwOIpV/nAqvqBeeZpOeZsBY3GVO7FslJpJ2oL5PlB7zVsAv9LA4DM8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdBjapmo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14900C433F1;
	Fri,  8 Mar 2024 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709900775;
	bh=YPOnPiOJiJ7yMQczi/fmldA2s+dWEsGUXu0b3HCt6Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdBjapmoWUt/IlZo67XjMpJoGk7SLU5JXZP7CHOMm+k8D55H82zuIMAvHOht58hAK
	 oMlsRQytJFESZqopq8IGKbW5PNstrp2UtFjZbhLQm/YUhaf7xQWUI/GDNKT0e3E8iU
	 gFUcb6Y0ZE9OMBqQuzWhZoMBhG3pV6GsKbxbJ6MzIYT0o6gZrMelAEjsNZqh9zBh78
	 w7kofRQdBbbt3bu29uRps5iIBHhuthNQI3aFNgWngs92p8dHG/+mR7hKRz4TDCw5oQ
	 1/8X+aVia4BA4TScdD90Mja/xNh03Fmh26mqpRDbWWdy/2a3OHTHtBwxysu5TFGCwW
	 BzVR011MRYcMQ==
Date: Fri, 8 Mar 2024 13:26:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 11/11] MIPS: mobileye: eyeq5: add evaluation board I2C
 temp sensor
Message-ID: <b3w2ygotwhezt7kfvkneej4o2bgkbmkbglvpkr6cw6ekhssuus@ugac5y5ir7zp>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-11-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306-mbly-i2c-v3-11-605f866aa4ec@bootlin.com>

Hi Theo,

On Wed, Mar 06, 2024 at 06:59:31PM +0100, Théo Lebrun wrote:
> Declare the temperature sensor on I2C bus 2. Its label is the schematics
> identifier.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

