Return-Path: <linux-i2c+bounces-1804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BFB8573CD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 03:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 891991F23FCE
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 02:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2421EAFA;
	Fri, 16 Feb 2024 02:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSA+W6s9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54310940;
	Fri, 16 Feb 2024 02:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708050427; cv=none; b=aBfTWIxKQ3woAoLn5DuSIevFBsvxz/NkPc18q3slI+nXNE0EPO4CmbWsR6P2J9Ps/l+iQ+lBAPDILnL0TdC97f/idyI6oAdizlCgA96SbQQgSuK9fHRybZnSbYx5x8Ggya36g2ouDKtmxCAWWNiusB7t/OJGYnKXpjSxfNZyhBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708050427; c=relaxed/simple;
	bh=Y5qh+9JREvyq2zqb0XI0nCO50XgfGIo6od758Hfx7iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGTS3h+PgAd+93lBqwtJKnoywY6gXtPg6C+aVMrRTegv3jLkhwJt0qIySj7gu1V6Bg4LV7OIc0G2+lyU9QGrXwyy8++C22PggE/IzpdngdNeTgcW/tiGRDDKBdQD18r56CVNxC/q5oV4ytlE1rmMKhya9B+whbFzooMquegJwxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSA+W6s9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4968C433F1;
	Fri, 16 Feb 2024 02:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708050427;
	bh=Y5qh+9JREvyq2zqb0XI0nCO50XgfGIo6od758Hfx7iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSA+W6s9yF3wgLZ2gbFWzJiB8WA+TyUP5MayInC2+Dsjzp7ca5q/kpKx0rrwUOXSB
	 diiWcZCRrNYWf0g1DAZPN8bL+SQN37pBkNHyUGBwN0kbY42pKQOM4izOCLegZjl2aU
	 X/2i3xuFHv2rG1HZ7RQp7H2Fw77e/WQH83RL3oHLv2QDlCj0l3Zu3IajC+1fquciZb
	 Nc2AmqORXPIgyPCoo7+HHIOHgDkGwzkAN9wZ3FCiPmr0XCWNKGCO3Glcv0E3V5RQ8/
	 ln9PJARWUMympDYF42OToRjx5BPBZvHqychSHJCrq9r7gT9S4Vx5uCbJ34pOsX83cN
	 yFCm+mCaBhMqg==
Date: Thu, 15 Feb 2024 20:27:04 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
Message-ID: <20240216022704.GB850600-robh@kernel.org>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>

On Thu, Feb 15, 2024 at 05:52:08PM +0100, Théo Lebrun wrote:
> Expose I2C device timeout configuration from devicetree. Use µs as time
> unit and express it in the name.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> index 16024415a4a7..e6b95e3765ac 100644
> --- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> @@ -70,6 +70,10 @@ properties:
>      minimum: 1
>      maximum: 400000
>  
> +  timeout-usecs:

Use standard unit suffixes.

We already have at least 2 device specific timeout properties. This one 
should be common. That means you need to add it to i2c-controller.yaml 
in dtschema. GH PR or patch to devicetree-spec list is fine.

Rob

