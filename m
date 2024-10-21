Return-Path: <linux-i2c+bounces-7492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B289A5D04
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 09:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63164284016
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 07:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F3B1D31B0;
	Mon, 21 Oct 2024 07:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ewq+nabE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D641D1E6D;
	Mon, 21 Oct 2024 07:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495679; cv=none; b=gXEz5ID6ymshe23x8QV4dNmxHD4nt8fDYTcRKzhTkmKcFB0aLUieKJ0XLIb32PZ94k2hb62C4b4ftTy9kHl84M9BiGEWmGono92BBhUwz/4HQvivs45kkBGYBv3zoSkBSSBBOLQNhuNH1YR86y7J+uUdVSFpzC9OpOFdFhgplQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495679; c=relaxed/simple;
	bh=QxL830a9Ax2smwJ/u4AW2tTEirYlo+bfedpBWZc+7V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAGL4mW2GGSQgzgBLBXQFZG140YNp6frfVv3L9RO0gyC76gw1IFAhuEdtUSxcnJgDbY3tHLhTgEuKKmljilKg7EO7wWfUEwhowuLMZBZiee3o0/gvmkPqQxzR8bEfgFizJhui3WREJZC0Trtws+L36p0kyzEb2+yHqqEWS04DfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ewq+nabE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AAAC4CEC3;
	Mon, 21 Oct 2024 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729495679;
	bh=QxL830a9Ax2smwJ/u4AW2tTEirYlo+bfedpBWZc+7V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ewq+nabEmyPpNwRvJxshR2Fulo749uN12b4AjLYzP7jvQv+iMMKNx0avF5iP3ocXU
	 UsEUopJSpgcacv+TQ6slMptGpXATO1/76YFRFd/rmFNJE4YhPoWA4MnQn4B9JL5QFn
	 SurQdxNl65S/d35vVWnOWpTQFc9dQ1ANcui1Xa7yqcb1ZFiu9z6izD7WfG3YnmWe5+
	 zHjKpMUYK8lGTKzXqzMRfVDl02Yfw6EeYOkwYm6G2Oo1Fh1oFtshC4Th4+vmZg+SdT
	 t0z6mX8PPmuLqx5x9ZewBuIBVcohfODU9vhwXcrq/191/TyeA8PGmwVvVW/tLfvlLC
	 dlizrxHJPM0wA==
Date: Mon, 21 Oct 2024 09:27:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
Cc: Rob Herring <robh@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, 
	"peda@axentia.se" <peda@axentia.se>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Message-ID: <pkse4jc6muqwo4zrvb6auhcdv4zrt6zd5zmp4yea5usagw62o3@lgzwggtz4uv3>
References: <20241018100338.19420-1-wojciech.siudy@nokia.com>
 <20241018100338.19420-2-wojciech.siudy@nokia.com>
 <20241018135314.GA91900-robh@kernel.org>
 <DB6PR07MB35091425FE5CBCD782B465A69D412@DB6PR07MB3509.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB6PR07MB35091425FE5CBCD782B465A69D412@DB6PR07MB3509.eurprd07.prod.outlook.com>

On Sat, Oct 19, 2024 at 11:09:43AM +0000, Wojciech Siudy (Nokia) wrote:
> Hi!
> 
> > If you have a reset GPIO for the mux, then why wouldn't just use it
> > on timeout?
> 
> Because we cannot do that on every board. The reset GPIO is provided to
> ensure, that we have reset signal de-asserted during initialisation.
> You might have connected other devices to the same reset line so this
> must be a configurable option.
> 
> > What happens if you timeout and don't have this property? Just 
> give up?
> 
> This would be the case just like before introducting this change. Some
> aplications might do other attempt, the bus driver can try recovery.
> Unfortunately common reset line for multiple chips is not a rare
> situation.

And Linux handles it well now. This is reset of the I2C devices
(children), not the controller, right? If so, then:
1. It's not a property of the controller,
2. Linux already handles it - switch to reset controller framework.

Best regards,
Krzysztof


