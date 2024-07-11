Return-Path: <linux-i2c+bounces-4884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D936892E17B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A64A1F219E0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4406014F9EA;
	Thu, 11 Jul 2024 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9vb5BbR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A6614D283;
	Thu, 11 Jul 2024 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685179; cv=none; b=tnYUO9haoZUqUchvsIp0SFoxEWWj+y1ENVCGXG3yzsfRqU/MRGjVarFLObvIMpdgxyf2DOYv5B3jhBmVQvYppTujHRTWkDdRJSAAIWtBNrw6UF06XM2q5g9rglOg3auBPQl8gMOOusUTfABp4y4J3d5Hxt4Zeqns4bv682MR6wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685179; c=relaxed/simple;
	bh=wj4J13ImGJ99o42zdWJ7/yPMS++KVQq5UDwBY0VGnAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddUQaNW2Fuk56o77qjuR/U9QS27Z5CFpboeVG6+1I1BdZtsihUDT97p3dNP1Vg/6xZXlT5YDcn174Wb9DH1vjL0c5dI1T+n0KNrkIIPC2om4CZgvWSM2ONzSJ74RmErSNB7TflW/JPaO7yDs9lkyt9CkhSqAvbEIV2UT6jh+8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9vb5BbR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048E8C116B1;
	Thu, 11 Jul 2024 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685178;
	bh=wj4J13ImGJ99o42zdWJ7/yPMS++KVQq5UDwBY0VGnAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9vb5BbRi+CNTpkpSy5JWi43mwn7x3Wj9UL63A0mvZ4kORwRTdP5F6fIQrmdYCPnt
	 Zewi3SICi5VbqRCe87FMYhxcAB+iAqLGoD1s/+u5N5OwokAC3EO3tD32Jot5B4/BmP
	 khXdASxl2X+qbw19eWmYE63MUfeaTlWG2K6oY9WHiYpc6oh+I2j0RZKQQ9fDPsdhdE
	 Sq85bCZ0dDU28pzUkQBkrKcTkAHuDvoIyWyrluIMQQ28s4nJ4AXrTmRp/Ivz3kjhSL
	 3sGde0s4Pzc3BEjFsCkqQREwEuazoYTr28eWspPjIIc0/NBD6X8rXXGlxGZriU8QoF
	 kzPEHHMWhVk6A==
Date: Thu, 11 Jul 2024 10:06:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 35/60] i2c: opal: reword according to newest
 specification
Message-ID: <kw6722v3rwxkuw4xqghvac6acxblcljsv5e4g6jhexjjb47pzh@y2jprwr3t653>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-36-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-36-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:35PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

