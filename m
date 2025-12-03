Return-Path: <linux-i2c+bounces-14382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C86CA117C
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 19:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA73F30065B8
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FCB318144;
	Wed,  3 Dec 2025 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SukCD8qk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026E3164C5;
	Wed,  3 Dec 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786968; cv=none; b=DSBVY1+/bTxGuj9YjPy2W1xEw97XgQUwAqPSkbhTD6xMcSibRDxMP/ltPI2r4BQDTr8iNpzHJeGVrK+ENNH4fTR8tOuMiS+knxQ/TXDhM5fRXujC4wfHj4qoQV8hPzIrnOSd89qwYmZtsT+E3PQWYTMZnvfp73JIHrrXsfJf7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786968; c=relaxed/simple;
	bh=uzEiQvOsPun3ukZciPE2wzH2mwUBVgVmO8Yc1elU7RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8qhBLdCEQOUtFp9CaMNwgi9kdeEddPT/rCXDueZuiyZkgLadZgPGjbnKmh8X1uMm2KMwKbzQZ0aPnbzE03hCj28Ggchfo9/+R7n3W3CrgeUAMzXbrTz7mtFRzp2yNcmhQcqJjaDbWkzmWlxJ4IxPTSAk3FeI5o1rELAZGAAsaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SukCD8qk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A01BC4CEF5;
	Wed,  3 Dec 2025 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764786967;
	bh=uzEiQvOsPun3ukZciPE2wzH2mwUBVgVmO8Yc1elU7RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SukCD8qkpXI1R+Bx8Ol38ztsmsPbAFBwQPOzUQWDBIBVFul0j3LOn4Ni89870ChCW
	 jbY8aKX1nQGkFibTCdXijo6pywd/v1nDTK7YdcdORer2c2pOqhpU7qGzC3InoNXREY
	 5Fj3/OqN7TW1F3S0ZVZWOIfSFXrnofILtt1WDodR0xN2TPvBXXaQVt2935JRw9vFaA
	 suWQdfUzkQbzG9+CN84mMF0+9EhG352atekGn7bkI1WqhoEU9GotqUTampgrMYEbwO
	 GaQPjyiLhbxZjLxCE+2RK3p4eCR9RBJfZE8j5UFv3bhiysjsgC3R+OF+X3IpsGwDYa
	 jFGbSkBXJqRow==
Date: Wed, 3 Dec 2025 19:36:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 0/7] i2c: designware: Improve support of
 multi-messages transfer
Message-ID: <gbuthxg24mqk3ofvnyqabwfxhwjwemrdtdowluvwub7odsm36u@jutqnsrthvv2>
References: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>

Hi Benoît,

>       dt-bindings: i2c: dw: Add Mobileye I2C controllers
>       i2c: designware: Optimize flag reading in i2c_dw_read()
>       i2c: designware: Sort compatible strings in alphabetical order
>       i2c: designware: Add dedicated algorithm for AMD NAVI

I merged to i2c/i2c-host until here.

>       i2c: designware: Implement I2C_M_STOP support

I'd like to check this a little better.

>       i2c: designware: Use runtime PM macro for auto-cleanup
>       i2c: designware: Support of controller with IC_EMPTYFIFO_HOLD_MASTER disabled

I will shift the last three patches for the next release. Is it
OK with you?

Andi

