Return-Path: <linux-i2c+bounces-10311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C8A874D0
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E855B1702F5
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD714199E84;
	Sun, 13 Apr 2025 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4A0r+ud"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD05674E;
	Sun, 13 Apr 2025 22:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584958; cv=none; b=XE3yEdY8nQTygeKoIhYEJFpZ01KmuLokzZY9a6scHsKYQWmAZj52uft4fizzUrIMG7CbL/aZeZTFabyPkKZIOXAnQzwe1a9cxY7kPVY7wN17OgntjxOYXNO3fFbZwwFbGt6cSE4J51LQKjBTFs8yjwc4txxPqqoLTblQBFrNQbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584958; c=relaxed/simple;
	bh=1QKrSgD2Dmvk73S/lVnbOYbsyjUbYbhdFMpUj7ufyXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nG8QexSRHjhBvv7hvWFtugOgV5ptZXw/MIM0qJ029ijM4pJXAPRlXmR7dWuIFjQ8kx0EjZ52Wgp4aOnKMu7XjMD5BJnm8929xdT8eiWd0iQPnmkKntfsv4Uq8HwT1AAivxSclusEtrB1qhlv9u1xcm87mr4G2hab6Cp8n4Zzxfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4A0r+ud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E21C4CEEC;
	Sun, 13 Apr 2025 22:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744584957;
	bh=1QKrSgD2Dmvk73S/lVnbOYbsyjUbYbhdFMpUj7ufyXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4A0r+udN7p2QfSNip0X5r6kKEWG9tsPX4EdE1qCMw4qkiXKBqZ8bB2tHshfiZv1k
	 VDOTgxjd53rkfeLWyi+0WOzpqcVE5eqqTUbtkSVDSScAOB8R7DfZNWBEKPSIk2iTrH
	 tvQLn+Uh0jAfdiQdOurFbyM/iTCjLzugrEpTyiSRzjQjeqGQQ0Yjy3v3623mZRx3TM
	 h/5NgE8cCjrhdOUCJzTO/zGUF6MhxEcJsECczu5IWWbrse6n3w+YxrjJ8xH1lRmbII
	 2zxv2asIsqIjcB0jEPBH0vhm62IG8y/NYpAmDd5FyMUs7pB8acb313Invws7mEnP1F
	 AC9COLh/LtCQA==
Date: Mon, 14 Apr 2025 00:55:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rzv2m: Constify struct i2c_algorithm
Message-ID: <qykqy3nqly7bpsv3zmju4ts4xmcgnhduohdnaeka5zivljouoh@epyb5f36bbfk>
References: <537d93441ced53bffa6553b8ec93d007e64cb9a5.1743258995.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537d93441ced53bffa6553b8ec93d007e64cb9a5.1743258995.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Sat, Mar 29, 2025 at 03:37:07PM +0100, Christophe JAILLET wrote:
> 'struct i2c_algorithm' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   11027	    646	     16	  11689	   2da9	drivers/i2c/busses/i2c-rzv2m.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   11107	    566	     16	  11689	   2da9	drivers/i2c/busses/i2c-rzv2m.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

merged to i2c/i2c-host.

Thanks,
Andi

