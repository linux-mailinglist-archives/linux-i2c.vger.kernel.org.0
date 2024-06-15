Return-Path: <linux-i2c+bounces-4044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A4F9099EB
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 22:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E61F11F224E9
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 20:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ECC56470;
	Sat, 15 Jun 2024 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJlkwg3L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE643F9CC;
	Sat, 15 Jun 2024 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718484567; cv=none; b=V0KpzgUV7CMsY43SDZ633TCcWexvsxO2C0LNGFh54bhFHcnjuvZf1QdKEtVZ6c397FQN0wISqgTKisiJcWDx3s6Pbu+EfVj6SLgdfw2KY9mG3H2xokgcebkVAg98PycNhKh063j6K0EpiP+2BMnva3mEU5cUnYo1H/xpAWSSwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718484567; c=relaxed/simple;
	bh=+lLsRhJQa0csmNsBtDsKvLrgB/ujeFvdmKUbmQmBOcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XY6EKaZLRmqD1Qe1wl90xlz1gjTGGgupDUcbJBzzsbUfIi2CuNzGk4+SKOoEeX+gkGJcArfg7e1px2C8MZoBdJ/hFz2pNYLwFsebKnAp3mq+TOIFz1AIW+XlWm9oIxxmYXuFWjm+RF00jfyEOvhn9+0uR6eqiWh/vEAAQq7BqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJlkwg3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC47C116B1;
	Sat, 15 Jun 2024 20:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718484567;
	bh=+lLsRhJQa0csmNsBtDsKvLrgB/ujeFvdmKUbmQmBOcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJlkwg3LVxgIncwHXXYm4NAMXtUw+aA1yrPGbQPFnFdSI6VIew6zLP1D2N2L5PJ91
	 V3IL0H/+J/NYomtn88oGx4lGQZ/QuCMciZKd9YSrgVDm4wdLjgieoi6XTsS8P5tOxI
	 31NsnmZx8yhsia7/Q+saRZU2Csdj0O8In2BMyBVtGgcOmTU4uHDUl1zrP9gQOtlFol
	 ffLHTbAtjPW3D9QJ8yOV1uLCFNQ11W5XnwrsI+5+SiGrfWiqeg5v53Vsr3zoYgO7+0
	 UuyFpEC6i3KpIooIQjei2fT4VHS8zJMF2OMHhdB48J6eoTvRZafzbrtSw65N/UeNvq
	 xnggH8acimv0w==
Date: Sat, 15 Jun 2024 22:49:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614081239.7128-13-wsa+renesas@sang-engineering.com>

Hi Wolfram,

...

> -A **target** chip is a node that responds to communications when addressed
> -by the controller. In Linux it is called a **client**. Client drivers are kept
> -in a directory specific to the feature they provide, for example
> -``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
> +A **target** chip is a node that responds to communications when addressed by a
> +controller. In the Linux kernel implementation it is called a **client**. While

I am not a big fan of the use of the word client. It's not used
anywhere in the documentation and it's too generic as a name for
giving it a specific meaning.

I've seen already some confusion amongst reviewers and
maintainers when Easwar sent the patch in drm.

If it depends on me, I would stick to the only controller/target
and render obsolet the use of the word "client" in the i2c
context.

Andi

> +targets are usually separate external chips, Linux can also act as a target
> +(needs hardware support) and respond to another controller on the bus. This is
> +then called a **local target**. In contrast, an external chip is called a
> +**remote target**.
> +
> +Target drivers are kept in a directory specific to the feature they provide,
> +for example ``drivers/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
>  video-related chips.
>  
>  For the example configuration in figure, you will need a driver for your
> -- 
> 2.43.0
> 

