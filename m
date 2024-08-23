Return-Path: <linux-i2c+bounces-5708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB195C298
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 02:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90FC01C21F91
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 00:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21E310953;
	Fri, 23 Aug 2024 00:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETvE99Rz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC57EC2FC;
	Fri, 23 Aug 2024 00:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724374030; cv=none; b=V/3xaLnphKZa/HTJvlDQ24EqsnF+g0NfY+yxaoXgutiRzLY35Si19ReYpWV57+A8VieyHv/myIe6/GPF7qX+tYmlCiO4/QmEj97vEhGytz15hHN00JQJXlcga2H/NzBADelyludAJ3gof7+OsatnnZx1I4Kmt2/17fF/1lUp4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724374030; c=relaxed/simple;
	bh=7c8U8P17RBpksj9StMpvTn4yepCfU1cHFPsy5wDvMkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7TduSQ+/l2N8tBeFqrBp9miPYUS8xt8XtW/jUjPHZAtyP/n7JoieE4b6Uqiw++kJaJ3ts3s/O2UpIkPf6TxgQ9aeAhORn584udbZzgSysy2uBjFjvBX51wSV3gluNhF8EbtfDpiluShhVd48GcmfaWU/edp7V17uvNmfcdYw7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETvE99Rz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8165C32782;
	Fri, 23 Aug 2024 00:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724374030;
	bh=7c8U8P17RBpksj9StMpvTn4yepCfU1cHFPsy5wDvMkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETvE99RzkV7wy7ScnEZFfNo7mfqo4cN0bPfrINf3qZPUZCcIotWNFG80KRjN5VYH+
	 c9aWFJXC5imdGYgrppYKkoF0qdWXp70obGY2bTvc0nWNib70IRktanIxXm4e+todtI
	 jAsIfTQmzQoDByqH5IOnFaTPNBV6WzKsYlk/f9KKxt3L0fohd30e0Cdo8mNA6wH+44
	 201z7ZHdNvUJm4tChJdXC0jnRHhPHFBY80ad1CL05geKp+p0kwo/OJaN6gQzpkIAuM
	 JOIqIWyi2peY9/z7BRAqLcoH8bc0Vw1mysgY5RVex+hcDxbd5GeoKmfYPtdfeD8UCU
	 kWxiT4nTA6Xxw==
Date: Fri, 23 Aug 2024 02:47:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Simplify unsupported bus speed handling
Message-ID: <qkqyys7dxu6tuihlznfxjjkk3addjjokd2tlar27mozvpgarmt@ibjpgmxh7pjg>
References: <dc6b10a56be9c90f580c50c55d829766fe2956a7.1724337807.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc6b10a56be9c90f580c50c55d829766fe2956a7.1724337807.git.geert+renesas@glider.be>

Hi Geert,

On Thu, Aug 22, 2024 at 04:45:54PM GMT, Geert Uytterhoeven wrote:
> Simplify checking for unsupported bus speeds and reporting errors by
> factoring out the calculation of the maximum bus speed, and by using the
> dev_err_probe() helper.
> 
> While at it, use "%u" for u32, and improve the error message.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the cleanup, I missed the cleaner way during code
review :-)

Merged to i2c/i2c-host.

Andi

