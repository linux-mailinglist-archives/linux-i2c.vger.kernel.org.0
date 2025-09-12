Return-Path: <linux-i2c+bounces-12904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2EB54630
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 10:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C1F31C27934
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 08:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F7F2737E3;
	Fri, 12 Sep 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="gQUT9pxh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186311A3142;
	Fri, 12 Sep 2025 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667545; cv=none; b=pHgiwSsOW935ZhxVSZlMyItx4PUjja4bCQgW46avPn+AAscHwesQcMORXTH3yhHmAA5QwJqMT0wKCdKEbb75yZpvK3N7VTCCPtsHtKgm5DMJ9BGCeiWF0V+4qdrWP36Bg0C3eCP4R+JdTTBOse2xvRAaIESHTyop5L1HrvXEIjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667545; c=relaxed/simple;
	bh=efbW/Sfe0OW517ShQC9CjQHOEKr+0UjfF7wcZYdo6R8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bHwxYsOvP4QeLqxMrq/Iag8JFdnKSZsXk3vf8FWsf6wJkMlQbOedwhOTMy7z2cSGyrqQ1k9j04iIGh0lbgqTzUt7Ba0hyXclOrHjdf3/CL4VcfG9CbOY4+3pWn0/WiKiX94fHeyrdwBLL/EZzBfjQmkb6iPXhJ41HinGDUCMwQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=gQUT9pxh; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757667533;
	bh=efbW/Sfe0OW517ShQC9CjQHOEKr+0UjfF7wcZYdo6R8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=gQUT9pxhlZK5toz3qpJBhksN8GlW+u9S0jSBZhnkiD/iqI1/v93UiO6gp/fkoZnEu
	 BNG+EutVZjFVqSirhIOp9fSYQ62IQ4INHGAyJvkiK9+A1vB/LEavjFnLdNacsgCQ2Z
	 o6LCVucyWVOHDpGi+qSdfStgOMsE5J7GWUNCuRD/0BUcXLU5sUrMvNKoFp9QUiNLgc
	 vn3Qbpd4Q51l4mdF4ikc9hTCo0Ye6qznEroVNQNMwlE6uJhmbzZJRRBJ3WgTGzfF/c
	 zy0yPCrTWAvFjjWyhASWPxKXd3EEk8Y0+aU3hBPJ87ASCBluY6wm4OsxTvCmdxEA/3
	 5QIYAH+Ufn03g==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0A84664748;
	Fri, 12 Sep 2025 16:58:48 +0800 (AWST)
Message-ID: <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
 joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
  conor+dt@kernel.org, andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 12 Sep 2025 16:58:48 +0800
In-Reply-To: <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
	 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ryan,

> And AST2600 i2c controller have two register mode, one is legacy
> register layout which is mix controller/target register control
> together, another is new mode which is separate controller/target
> register control.

OK, but the ast2400 and ast2500 I2C peripherals - which this binding
also describes - do not have that facility. Given the 2600 is a distinct
peripheral (as discussed on the v16 series), this would seem to warrant
a distinct binding.

Should this be split out into an ast2600-specific binding, to reflect
that it is different hardware? The reference to the global registers and
transfer modes would then be added only to the ast2600-i2c-bus binding.

Cheers,


Jeremy

