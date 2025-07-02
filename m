Return-Path: <linux-i2c+bounces-11775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F22AF5FC9
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 19:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14A593A8231
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31552DCF7A;
	Wed,  2 Jul 2025 17:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLRU0rsy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA67292B2E;
	Wed,  2 Jul 2025 17:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476735; cv=none; b=vFdisL6609/nM2ubSgpzK5IS9IWUhUIUOi4ZgAZnkTzs/90VvUiM035k3ve9L3XVxdEge/iondsdIj4liMRQvJRgRl8Q8SA3nw+21ewBU4XIoF7W0Gx/gOuD3KyOvBQ4f0c2538eX/01jKN9u/3qWfrf0ddk9KlSjSFR3BY2Agg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476735; c=relaxed/simple;
	bh=8h5GbKdkae9i6ZkZEjnm4Lxi6OfPqqiK/ol2Xrklaag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jvlc0ZjYkZlH3UR0uB2TrsnfbKfubAVoQzYUbZPm7ZdEWDUqst3+n6q8Fcb1GiWAV2Zz0l0Bj7+T+nhPemuSgzP+Ls7b7ttg5mM66pTZ7b44tfdhgRHULRr0buUTK1Y1nqJxZElfa6QnMtKEoMNUqSikoKjji1BafW+L1zvLAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLRU0rsy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE86C4CEE7;
	Wed,  2 Jul 2025 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751476734;
	bh=8h5GbKdkae9i6ZkZEjnm4Lxi6OfPqqiK/ol2Xrklaag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLRU0rsywuoBmH8y6P1v4kfDw9ZRazFWEd2K6Q5H7u4pKgYfjhhQNDmcNsiTIFK9J
	 /Go0ys/I3yvuOGyJcuYHv1nwslY+mU+XPio/+aW4PZ9o4/E50wpdweRPjVfWz8zKvC
	 edm78aK1NERBhoFqeOyl/rO5frW81GPht01XKibzF49due1PXzyLF4Z8Mhu9GYlrnJ
	 lh9DXFwACxuTmbU7XFLC1cVQ/ZcAg/tfbWIunm6pZXiwRZwUJ6J9ek5uNyzXjRqif2
	 T+IvUFvRaoDQ1Nw59ucfA/jN8fFTy/f5Ehq8JSEv9CQ3Xloucc2cW97oT99o1w4iWG
	 ELYaAHlkJdbAg==
Date: Wed, 2 Jul 2025 19:18:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>, 
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] drm/xe: i2c support
Message-ID: <s7kfne6budueamqqbshbrrtql6awrp7mvfhqlkrvtyhqjqsech@qemfad4phmlj>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

> Heikki Krogerus (3):
>   i2c: designware: Use polling by default when there is no irq resource
>   i2c: designware: Add quirk for Intel Xe

I think you could have kept Jarkko's ack here. Up to you.

Anyone against me taking the two above already?

Andi

>   drm/xe: Support for I2C attached MCUs
> 
> Raag Jadav (1):
>   drm/xe/pm: Wire up suspend/resume for I2C controller
> 
> Riana Tauro (1):
>   drm/xe/xe_i2c: Add support for i2c in survivability mode

