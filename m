Return-Path: <linux-i2c+bounces-5709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 520C695C29A
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 02:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9E411F23F06
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 00:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F7411717;
	Fri, 23 Aug 2024 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCmBcH1v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66479D2;
	Fri, 23 Aug 2024 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724374076; cv=none; b=c5BLGrrVWvdWv2pmuDBiol43xEPcLjRqOMJvPg/3SSfkFYKHRxVu8tXeIo/hOIUZFJ+1QyRSLX60vsKpiXVhadxCa7yEamXH9dE8K+roO8g1OAmsFgmoOrYWmu61/6Hz5n7qA2tAl9MXIo/poeJHqEGfa2fk685gWKdgndbHMbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724374076; c=relaxed/simple;
	bh=VZ0yrCMU8UoapiytS23+yPHDyWkbRQqGwZT5OWmEkBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZepPGeClIBo32je17IVpZQHO6GmV2VzDtlyDS90E9s5NjoBTnWgGlhJxsoMxMWqMWw70f72rCbGFfqByZVWOOlZJ6LvMdelTYfQaCN9hHR49oWfogRiAMIxOFzn8f5m7lxoOmYRQYxNMy82iX3IomWClAohGqadbSSIwhRWjB2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCmBcH1v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB73C32782;
	Fri, 23 Aug 2024 00:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724374075;
	bh=VZ0yrCMU8UoapiytS23+yPHDyWkbRQqGwZT5OWmEkBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCmBcH1v9SaBPuwfRmqYfhcJwCTkIiU2rpi4k1FdUUshqMzdri0EiNWcA28//YTsa
	 YGnsv4ZuqUF8FPxyF83urVHX+wygjFQlMy9TZlxOqUWSx3YFDdw5X5/mP8QKSwL/OS
	 l5sadtMQXnziLyxaH3WSY1sq8GAQsr3oMn8KVFIVznjzlzLshWysY47C1t+eGeGnhk
	 C6VjJGHjMdOl3lBSa2P+rSjKbh28WH5+3HhjKyWtvpW9TVrOSR1geXfdUlq03/v6tO
	 PEHSaVjgkYnUMwShVT5k9lW3Wz+R/ktf/+YLa0HgCzVTB/d1QbVjmH+zFuc/w4qBHx
	 7gXiNqdFBN6GA==
Date: Fri, 23 Aug 2024 02:47:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Rayn Chen <rayn_chen@aspeedtech.com>, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: drop redundant multi-master
Message-ID: <htpetam5ykc622qcc5xrnl45d2qqniuucqf62ogoqq4esqnkvx@36lblj4ptzib>
References: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On Thu, Aug 22, 2024 at 03:27:08PM GMT, Krzysztof Kozlowski wrote:
> 'multi-master' property is defined by core i2c-controller schema in
> dtschema package, so binding which references it and has
> unevaluatedProperties:false, does not need to mention it.  It is
> completely redundant here.
> 
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for taking care of this! Merged to i2c/i2c-host.

Andi

