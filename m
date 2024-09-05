Return-Path: <linux-i2c+bounces-6285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1596E52F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 23:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FEA81F24EEB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB44B1A0AF3;
	Thu,  5 Sep 2024 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZqIe3WU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6697319414A;
	Thu,  5 Sep 2024 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725572359; cv=none; b=TX5XpFtcs0DBtEgOveJ7003AbVXZtLAuboNxku/0j2uJ2iGEcZO6krLkDeY87ek6cnmb7wdzMQOu+pi2ESJUNC9yWbqbJiICDprta1ZwOBfjLzAk83qIJexVgyc9vpTTv/r7wFHYILVXIS3bTvpg/kU7G8s+KmUp+StyDwceZjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725572359; c=relaxed/simple;
	bh=wwNHDVwarDDWbgFkCqrVArLL1shfHCnjmYLoJJkJYoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRzHs3oAj9BX7L3F3pBTK+9dG6nS4iqJzwdYHWLCB3kMhJCJpkQQg0mzaxdIQKvHLvO/63M2XaLjkgpftcQrWF5sWlzrKXrvNcLnSIKZfvgS/Y8inUBQ0r3gab2hpQ6Y0AwuMpgaJWt/Zu9tI44F5MB2K2Vmo3CNYYZ+zoZIfJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZqIe3WU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF2CC4CEC3;
	Thu,  5 Sep 2024 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572359;
	bh=wwNHDVwarDDWbgFkCqrVArLL1shfHCnjmYLoJJkJYoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZqIe3WUYfe8lQJ6KgzUugf9dSZfNMLC6ds7+GSZGoL6KmHh+J7F/0OxDiHLFAnI4
	 Bv0XTtZZe917wlXoAniw70emeoDghiJ8d9opNjQ2HSbwaLBD+CeFhvzcptWBO0HF0s
	 eeSpmfW+CPvPNcqdKPIRKXKj5UzYB9h/x3Y4ppHlMoIrHwT30pJsHc9zxaDki92P/x
	 isrPNfH3fU0N2SzLlySn4hc7ea9ggjvkdvra89OCA/wSP3DYZq5JYibeqMpDJ2d0Hl
	 WAjpULF9TRHFK9x7ntAEQS30Phusmmc6d1RSpyPdS1o1UIlpEAPZQ/C8XI85d1stD4
	 CMmpmIVgQy1wA==
Date: Thu, 5 Sep 2024 23:39:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
Message-ID: <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-5-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-5-kfting@nuvoton.com>

Hi Tyrone,

On Fri, Aug 30, 2024 at 11:46:37AM GMT, Tyrone Ting wrote:
> Increase the timeout and treat it as the total timeout, including retries.
> The total timeout is 2 seconds now.

Why?

> The i2c core layer will have chances to retry to call the i2c driver
> transfer function if the i2c driver reports that the bus is busy and
> returns EAGAIN.
> 
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")

What is the bug you are fixing?

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Still... can someone from the nuvoton supporters/reviewers check
this patch?

Thanks,
Andi

