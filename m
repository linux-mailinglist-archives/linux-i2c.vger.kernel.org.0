Return-Path: <linux-i2c+bounces-15111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85559D19DFB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B99730336BA
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E084E392B67;
	Tue, 13 Jan 2026 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HQLI2XHG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE3363C64
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317944; cv=none; b=avonB+V8Gi0m9oVvZubSnTH7ClCBdSwZD9VyLpG9sG3rjytT3HFQpTv3HFHxv3OqT38uC/C1Ibber8GNqtnXREXIXv3cSiLl3Ez1FoEny2D0JHp5xs+5+NcCk0ozoqSJUoNHZsoPipTwnSOfOTBAB1FLvgbAhAwri6LhMDSIkAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317944; c=relaxed/simple;
	bh=VB8xKnXnSIWhXQwdEL9wgRdqiTnF5culbPOmvUZlvVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMwJL6O7SDLkeSXsMrAZY8ZA0atuQCSFqj5ULfMtKzud5Dd9agJDC4QtjUl76e5D69zdt9CkRjytg+sHYKxE4NaLQ0xO9wOacyJLZBERMwHDhGIvoGETYpy9eRDRMKAWGfUAIxWq7p+try5VhvaoW/laIkGXPXWvkApU03r8e/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HQLI2XHG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5JX8
	I944vOf0miWVEpuB8Fx/vVescgzjqKFm8m4hKuA=; b=HQLI2XHGlGdI3qVUbcVL
	GcW5zz9XUYHF5uREKFQXtzqE9GoVGLUBOiq55aDUSqtN+igGCQx2MD7bbwxif/MF
	je0czBWxOxexCGqFkSCREdnt2ucQtOhWlj3aEXLuxrle3uZLw5JMIFuWroEUwZ+Y
	d1V/9ZTIzJWeSMqbPqz4ItLhCrmG0cy0oDsmQuVpRuqyLiYYzpVxEGgKbs8niHet
	JvzFXgLzLRg6f8QSKMrZBEhye/09odcAZURWczfoKJuVqe6fvfinIOBVlcGBqvvA
	db9MWPeluBJ86qol16j40vZMufC9QI0i4Cb45B/w5yKFhYNtFh3ew5sCbmB3bkhL
	zQ==
Received: (qmail 1750804 invoked from network); 13 Jan 2026 16:25:37 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:25:37 +0100
X-UD-Smtp-Session: l3s3148p1@GtaBmkZIFJIujnvx
Date: Tue, 13 Jan 2026 16:25:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Message-ID: <aWZj7_i-hnfFOmJ3@ninjato>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
 <aWSy9U-JFocPAI9X@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWSy9U-JFocPAI9X@gmail.com>

Hi Marcus,

> This series has been in its final shape for a while now.
> With multiple resends and pings on this series for the last four
> months, I think everyone interested has had the chance to review it.

So, if there are interested parties, please add tags like Rev-by or
Tested-by. Makes my life a lot easier. Currently, the core parts here
are unreviewed.

> Wolfram Sang, could you please take a look on this series and consider
> pick it up for merging? 

I do respect the work you put into this. However, I am super busy and
maintaining I2C is largely free-time work, so I can't give you any
promise. Believe me, I wish it would be different.

All the best,

   Wolfram


