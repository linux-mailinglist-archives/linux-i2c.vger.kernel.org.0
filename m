Return-Path: <linux-i2c+bounces-2100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF6786E489
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 16:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B81F71F265AC
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001E16F514;
	Fri,  1 Mar 2024 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQkhDY5z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D2F40BE5;
	Fri,  1 Mar 2024 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307527; cv=none; b=E/Lma3AB7QUhEcOVGF+x/G91b0Epo3+omTu4iZdViYYJWT+qssiLGdgp2SVdNkgpMKjoEp/AD780AA7GB8xPoqtC3wBwt/L5t/qHr3WUN6DYz2p+2b7qRjgDZVm9dhNkpBI5BBNI7bWEZ570X3j4Kw1mpAXr+MaC6Gdx0DjVjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307527; c=relaxed/simple;
	bh=zM3kRvwFs3VzutlCoShxogMjfI9nsDPaM/Zirbro2es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7s/PnfW67UYd2rjigxACV0f2pZMIVyCcq4hqUrz4Y0KasmTMJIdw5YDf+D+qHsNMu0k3v1AoG8m+8SIeXlc6kLU2axSCJoSodQTIs9T4ZsAstykj62+H/8/5ReN7YEf5bF/u5TyAUa/SyeWXg1QcGaz6VQ+ept7zEpeZrI2JmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQkhDY5z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57EDC433C7;
	Fri,  1 Mar 2024 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709307527;
	bh=zM3kRvwFs3VzutlCoShxogMjfI9nsDPaM/Zirbro2es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQkhDY5zyHZLeZuG0OpcuVpouAwXIVOVmHLAxitjoFlVkF760J/ZKUkQf69fh2aW/
	 c4pu9K6ZUVcakQ04BP8XnHiO0NvVnJ3nNhdorPGCnFOyAUXak2HMACFK1Bzn8NOxN5
	 /BylOsCW7v/qMAA7IZwLOCWjdLAHl5GSNSOBYL+4SSBXs1jx4Kh1dxMw7CDrSoKATs
	 q6Ar3l/6sVnTkRJcZeT10HpyJ5ZLSMWpxT5YxV86DmzwweiQZidWu/ZS0HfNgPIj3T
	 BAVjAKbckYSTQZSZ3x8VqblzMwI6Ivbdv6PzC50sPdVCg8KJavdyTXcAxvDmNzQCC0
	 CrZU/wa44c19Q==
Date: Fri, 1 Mar 2024 09:38:44 -0600
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
Message-ID: <20240301153844.GA2170969-robh@kernel.org>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
 <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
 <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>

On Thu, Feb 29, 2024 at 10:53:07PM -0800, Guenter Roeck wrote:
> On 2/29/24 22:37, Krzysztof Kozlowski wrote:
> > On 29/02/2024 19:10, Théo Lebrun wrote:
> > > Reference common hwmon schema which has the generic "label" property,
> > > parsed by Linux hwmon subsystem.
> > > 
> > 
> > Please do not mix independent patchsets. You create unneeded
> > dependencies blocking this patch. This patch depends on hwmon work, so
> > it cannot go through different tree.
> > 
> > If you insist to combine independent patches, then at least clearly
> > express merging strategy or dependency in patch changelog --- .
> > 
> 
> For my part I have to say that I don't know what to do with it.
> Rob's robot reported errors, so I won't apply it, and I don't
> feel comfortable giving it an ack either because of those errors.

You can apply it. Those are just related to not finding 
hwmon-common.yaml which you have, and Théo confirmed it works on 
hwmon-next.

Rob

