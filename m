Return-Path: <linux-i2c+bounces-4809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13092C632
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 00:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26611B22A7E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 22:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF57185600;
	Tue,  9 Jul 2024 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmqR+2cl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D31B86D6;
	Tue,  9 Jul 2024 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720563504; cv=none; b=YpP+lqATW5TTyGqk38Qjb9kZNbq9EiTx6GCmgKv7IUDDdG1B7mzoB67YGz9Jnw1UxeoIahmZlVduExSgDZt19HilUh7exwSpIzRCSDxGm66VXULF4DMQ/rTAL+c80U2J9L5pEHohuqmETKhXXx/H/VJ06GJVVjPsJAtyI0UyqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720563504; c=relaxed/simple;
	bh=LgupaadEB2Q4eL31hle8pOkB3nzu7xU1fOoNNDgzt9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1T/C/5i2HoczLLZA3ZUHrSX6VWUb3icCBAzCdGZRTwicnM7bjXIj78SiL862M9ONyCasSeNlN7UrUr/nH+l9F+PNpV7QiTuGEpgCR60LBEltiU1jGRAU6gQ5OtRUC7s95RBqe2OtFTix8D57sDsNEvlNlYHuVBLInAoffQkZmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmqR+2cl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF99C3277B;
	Tue,  9 Jul 2024 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720563503;
	bh=LgupaadEB2Q4eL31hle8pOkB3nzu7xU1fOoNNDgzt9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmqR+2clVEj02GiBK4gTLohAjkAHRPUsqg510rBZ4JlK67JQYIjxoYX2b0b9jyU2S
	 Zq78et7WVNa1einMuJnw3VK/P3UlCXp30AdHKH3TMElnYUdgIXCTadmtS8sy8KT2cG
	 MR2NLVcW9eSl2ZDEXEOVLs8xGR5OmQpuRgB2vww0TO/NTLtFMyIVeWiN3altJFvcpq
	 vACHS1ovvPCQo+5LmPEp8JB39GZDuoaSrOulvJY3KZxLagoucbj/N4/qiyveAHaEs8
	 MA8s7/qbsiD4mjQ3LUN0tJ9ocHLs0Dh4LnXpQUL8Ws19//8jf2+JExmYqRLU2WbglI
	 N7qA0yJ1UPj6Q==
Date: Wed, 10 Jul 2024 00:18:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/60] i2c: cros-ec-tunnel: reword according to newest
 specification
Message-ID: <h62nqx6oql4jdtu7tjqof626vd5tlilnp53bfk6smjst3wcirb@ki4muj74pve6>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-11-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:10PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

