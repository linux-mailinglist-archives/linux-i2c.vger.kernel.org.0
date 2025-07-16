Return-Path: <linux-i2c+bounces-11952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0BB0807E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jul 2025 00:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03442582400
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jul 2025 22:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A40290BA5;
	Wed, 16 Jul 2025 22:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdlymgH6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C026A0DF;
	Wed, 16 Jul 2025 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752704793; cv=none; b=HoBInxrL3EaQf7rOGZGj0ZdkO6MqY7XuzwOFcr4EHQt2p7cB3KZpam6QxVQfqkxzZ8vL4bmk2JXwMkR226hl01fUPnNRLfsQUy7pjdpfbEiYe7JyBis/Sw/V8ucPnVsAe7Z97dL3Mcvz4rumrXANrKvO+N4jcsos9OlqG/oKMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752704793; c=relaxed/simple;
	bh=JOJeLyCECI7amC2TB9K36NzTKnzUeHZ0ARDaQeBa6so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJQgE6Ly3ptbRLqehJpv9nr5YXrGJdj9+YQ3eeZbDG3SrnPIo5r/vKOqkdlwbmUB1uxk2148wSmp3v4q7kGfob19uZEqOQpYoBn7+At7tY2aqYCeAwP+e6faoadjgZhMnMHLnSVhDHcKkqt8KJMy/sgBe8KV9FwoxZXXmd0Ht3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdlymgH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46704C4CEE7;
	Wed, 16 Jul 2025 22:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752704791;
	bh=JOJeLyCECI7amC2TB9K36NzTKnzUeHZ0ARDaQeBa6so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdlymgH6c/n11Ay4TjcMGaQ/JWnaQnUPc6NHyikP7ZNFd+Z1y9zW4Tt51Phu9lQX8
	 esLs4b9Fr9P+UZ+IWelguH0ZKvp4A053jlvcFwHfhNZeJgBQvkneoWOlPMUYJLeJgi
	 iETUpGG/qcNNtpmUkZlx3HSwr3wKWnVw5oIvSs9Ph1lgRhtGMX4zO4WHgsVqjNpWwt
	 Q3kqy0a1ds+wuEOBc/YITMkNetEOuR60rOuCqTshnwq1iRdq2khiBDNKo84Hozi7DK
	 OrJ1D6LJ2SGWde6eQD2D+PQ2O0eXA3NoJIeiL80yYZYqnGlTdL73B9AxMifFzQS3SG
	 nk9OToyrbKVVQ==
Date: Thu, 17 Jul 2025 00:26:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Yuesong Li <liyuesong@vivo.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] i2c: lpi2c: convert to use secs_to_jiffies()
Message-ID: <qe5s4q5pabhbdbvtvxogmcbcchmnqwj556defrlxxhebhgan35@toxghkobdevv>
References: <20250613110649.3283336-1-liyuesong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613110649.3283336-1-liyuesong@vivo.com>

Hi Yuesong,

On Fri, Jun 13, 2025 at 07:06:38PM +0800, Yuesong Li wrote:
> Since secs_to_jiffies()(commit:b35108a51cf7) has been introduced, we can
> use it to avoid scaling the time to msec.
> 
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>

merged to i2c/i2c-host.

Thanks,
Andi

