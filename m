Return-Path: <linux-i2c+bounces-4859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CB92DB48
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 23:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA3D1F238EA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 21:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C068513C80C;
	Wed, 10 Jul 2024 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lh/ZYt+C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B70D12CDAE;
	Wed, 10 Jul 2024 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648451; cv=none; b=Evom+vPd3l3s9Blv8kuv0yv13kZR6jM8KQYwoHLy74x/jRZXVVWo18jbO5gjKwI23MwJymKgevVZtwILVy01wB5yF7WjonMMCRQmSumFaf7Q5Y0k4tQ4Fgc5FFq1u2VWdjTtL1UNTID+ENQIpzERl/uBO1jgBeThVcxzJTURF/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648451; c=relaxed/simple;
	bh=60OwlEBX0ESWlqXkMiMdHEeliRGI0B4nU4qRbCL11NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjDNrsyMnPvYc74JT0azdjDkzGL9l+k3SJHRtnndfc2MEJ6Isq02IJqFy+M3FNKZHHj289gSsJjPt9faM5FshNH8FBRm2jcTWYm5l3WUCk5VzU/OQOqjnuPsy6m4sVgRM/YE+3MG23jvSblFgEqMTaRJHW6jQqrVclQPecAFmRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lh/ZYt+C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7A6C32781;
	Wed, 10 Jul 2024 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720648451;
	bh=60OwlEBX0ESWlqXkMiMdHEeliRGI0B4nU4qRbCL11NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lh/ZYt+Ch5gR3CPIKv7xfrc7XzKWD8T3iJJ/pMfW4LY2rqWT3lVTlDk4sBYIabUr0
	 RSbLybkfVGX6FCavf0j2zr7oYPyhThh5gTAhnSoInPP71ag+hUhzgYUayaWgZZ+I69
	 lUiY9dJodGn/2QyzcOplU/7RPoRSk1QOppG5El+w/OE5gWXI6R7CPMcXWNhfNxU9pR
	 1q3lTKmDTaWw8Cq17HWX5S01KR1e4IGUESITiPMTq90Nck9jG5D2tFeppw3Lik4Jlg
	 TpCaAoJXvWvtjr1CVYeEefMJEpkGiitypt/vzVWJYX/FTGrqo0ixBRHfk55ZJqQdn5
	 Rari2Malwbg+g==
Date: Wed, 10 Jul 2024 23:54:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 27/60] i2c: lpc2k: reword according to newest
 specification
Message-ID: <ksdqyb3pwxmoyspmolecxqbqhxmzp4y7ha3bh32zwvkjirdbwq@ea56gmyx3edx>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-28-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-28-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:27PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

