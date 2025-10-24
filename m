Return-Path: <linux-i2c+bounces-13767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89726C048D0
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 08:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 365464F7334
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 06:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D9A25FA10;
	Fri, 24 Oct 2025 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivnGSX9D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF006238C03;
	Fri, 24 Oct 2025 06:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288324; cv=none; b=BrWH1cCbMTZfe/j0GK5Nu9soIUMNMRGJdZ1aUglWt7dEYfL7D1C9eARI4ExrMBY8GXfCGRwnVRILBIjE49MNcwyTaOZXY3+w6fbvovnmHyI7odvdMVrfb3Fi33M41eClUlkzzFFiOxUsYiuRYC7wyeGt4drXVqwgk1O441IBiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288324; c=relaxed/simple;
	bh=UUhpDadZzBT4RrPvzIdECya0GjjCWyOzHQkuKftuzQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcSuh4TrNBqWOR5ZcmdaroxpVPDyI2szMmaqmqNwZ+0XqQ0dVBd8PUeBpyI02nZ0urXvLo3N6xEObuV92FV89X2uc6q66R8XMW7Okg7Uu7BsN5FANxRzrKJW9liYfJKJHBwRMqYUaxHLVBFKxYlySR19krAsQqqoCJ+J8UpeYXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivnGSX9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4902C4CEFF;
	Fri, 24 Oct 2025 06:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761288324;
	bh=UUhpDadZzBT4RrPvzIdECya0GjjCWyOzHQkuKftuzQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivnGSX9DduM/MQ3ZCnpNc62OnWb6W1h9IiDDP6dsfVjSgb3jOLPa0VNNzruUqf5pS
	 qhmliyRhoRe269hJZp5+YDDOXrtig4fQViL/rfmkqETX14BeTLZ+nPnQ6T8lF4dveM
	 SEOIUhC8wTQ/V6yEtA30ijB80qUwyN0LhUES2BGTO5MWs2i20z7xJ5yE6b3+EwiYav
	 S2HiYVRBLW1LRSyeZdeRRo8LsL/+kBul/V/7kJ4UPQaP4W58RJ/r8sRG061ecw60sR
	 4uaJWGTcXUxD2sdbCdO8bSUlWf5gKjkeJstNRnwyN6e24SqUA0FeR2z8DpMtxKmLhM
	 Gyw7h+Znj9EbA==
Date: Fri, 24 Oct 2025 08:45:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	jk@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021013548.2375190-2-ryan_chen@aspeedtech.com>

On Tue, Oct 21, 2025 at 09:35:45AM +0800, Ryan Chen wrote:
> The AST2600 I2C controller is a new hardware design compared to the
> I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).
> 
> It introduces new features such as:
>  - A redesigned register layout
>  - Separation between controller and target mode registers
>  - Transfer mode selection (byte, buffer, DMA)
>  - Support for a shared global register block for configuration
> 
> Due to these fundamental differences, maintaining a separate
> devicetree binding file for AST2600 helps to clearly distinguish

No, that's not a valid reason. You just moved the compatible and are
still 100% identical, at least according to this commit msg, so there is
no point in this patch.

NAK

Best regards,
Krzysztof


