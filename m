Return-Path: <linux-i2c+bounces-2147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225DF87036C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 14:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A35C285962
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 13:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64113F8D3;
	Mon,  4 Mar 2024 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9S+MQp1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94E33CF;
	Mon,  4 Mar 2024 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709560547; cv=none; b=Y3qWEE9D9fI+MROu1f9KiIEw508oTGmDqL6qRppBkyz5HholvjJnNGDq74fdsccguR5f3I9qvaL1s38sDT20PcOpG2yfg59vtAGwTmdw4jpfkpl7pF5DOSm4gsClBMuNFrPt546KeRxSeAfoPD29lORUfYwu+pf/1jmMMo+Stxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709560547; c=relaxed/simple;
	bh=M65u/Bkh6ZmhHusXFXrbiVOO75W05EtI/6MYBPjQTH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNQwygqx6ZtRu9hmEMa6Ev1r3QmmRCTqrpXyR6DBTMvhEV2EFU+UFaHR62pRmGG8XBCftw5bDGHIUayYaJasO+q35Bg3poFKEoNnDT3H7odayo2ql7UH3+DeBzxIhkhk+9+NqH1sYVuxJHAL1SJLny4b7lZCEQb5reqy1qQfwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9S+MQp1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433EEC433B1;
	Mon,  4 Mar 2024 13:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709560547;
	bh=M65u/Bkh6ZmhHusXFXrbiVOO75W05EtI/6MYBPjQTH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9S+MQp153uTYwq1SOWKQxG9XeP4hdEE4JH/PEBX6M4kUzitYz3d44cF74PlLlYzg
	 OpHwMcCNmCyjVlTPeI6LlcQFkXvzss+GyaxJBqhpffL8YPkRWbj+uvmfpfnNovmFOQ
	 VPqaifkcZTI3Z5vs75y+7z9L9VM0fLdlaaic4ewi2P5dK6mVUErYyl6tXBLMLBd2sK
	 3MGZB29WsKmh14xpBHOmFCcllwAQR+4h9S+K4j+JFufUHs9SKkb63o/ArmJA5ftmnK
	 6baGsxYH5lDdxCpC2tiMeeis6TnRzVLVfxrm3O9W04AY9EOYyEKr+cEGabBRF3ld/i
	 BbXpPvOdHZnUQ==
Date: Mon, 4 Mar 2024 14:55:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 07/11] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
Message-ID: <tuqu3wvuhtevu4hjll63yy7oeax26o4p5ylkvvygcmw4mkc3il@j3gyxqjcjnyg>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-7-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229-mbly-i2c-v2-7-b32ed18c098c@bootlin.com>

Hi Theo,

On Thu, Feb 29, 2024 at 07:10:55PM +0100, Théo Lebrun wrote:
> The FIFO flush function uses a jiffies amount to detect timeouts as the
> flushing is async. Replace with ktime to get more accurate precision
> and support short timeouts.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

