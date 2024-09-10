Return-Path: <linux-i2c+bounces-6482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A1997388F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A6BA1F226AF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722A2137772;
	Tue, 10 Sep 2024 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn8d45Za"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67518D640;
	Tue, 10 Sep 2024 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725974712; cv=none; b=pIrDgdGejUSeOx6t1kIWGo4+hSaCw/EmCDYjB2jIROEm0zjwrNC3hWXDUbLtdTus58LU9OZQjjfQHCTn9LJRXYiWjOvsQUKFV4rnumwQcVjOH2g6gMksgomtgw5taKnn3ly2MDFl3kphBL4mbtHYrQSfFcUf/g/8H/dKct9MOEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725974712; c=relaxed/simple;
	bh=nuwHY1NTNh5UoVLvip8m7oo1n8SX8ducSYgUrMUCtVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzUwVd+/hKa5FAKhWdChAIIguVAkydgrbfC2rzo/ZGD3g2r7/y4hyPM+H0tXMpTDUkdivLqfXQa6XAa9/FqQGZ+S8HLr/hPblDrLAzKybXw5Kkxz0wBlQlwtAA6qWSNfbFEu0QBW5xkogaLF+cNq/fC5AWUPG6PtbPraA5BVxZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn8d45Za; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71766C4CEC3;
	Tue, 10 Sep 2024 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725974712;
	bh=nuwHY1NTNh5UoVLvip8m7oo1n8SX8ducSYgUrMUCtVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cn8d45Za9wGfNaEv0RYnYP8gWW+HykJBqHw8Xee0v3m+wTNDCrH0GjAFneh2Va7eU
	 jLxHhXBR12wjogXI4Wu4Hwml7VYwTzQgZ7IR+zOfHNUOK94t5qFOKeXt6yAn7s1sWP
	 BOVijE+DJvxjn4K0vpiglHYGhV9zcpJi41b3iZdKtX/xzS8IIMjXIugar02ZnX7baG
	 400Bj/76qdN7mwr0PKnyPTswQ8nnnAk5lavaab2HLjhMOCVyyaZ9J6UinLwQ1IyPna
	 IRWyo6grDOoeQeLJylXfhqIkpNDA7aH2uMc4Qz4UaJTjfCSkkjKfMz5aYet5FB/HyJ
	 sLatCYexo2ILw==
Date: Tue, 10 Sep 2024 15:25:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@amd.com, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manion05gk@gmail.com
Subject: Re: [PATCH 2/3] i2c: cadence: Split cdns_i2c_master_xfer for Atomic
 Mode
Message-ID: <xych5znhsc3thtkjwdlytah6qz6rmgzsweacyyia5g7ekhroiq@xttgjuxiovja>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
 <20240801094408.2004460-3-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801094408.2004460-3-manikanta.guntupalli@amd.com>

Hi Manikanta,

On Thu, Aug 01, 2024 at 03:14:07PM GMT, Manikanta Guntupalli wrote:
> The cdns_i2c_master_xfer function has been refactored to separate
> the common code. This change facilitates better support for atomic
> mode operations by isolating the shared logic.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

