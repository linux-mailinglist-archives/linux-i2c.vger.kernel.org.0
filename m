Return-Path: <linux-i2c+bounces-15231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BBD315E0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 13:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EE6C30587A7
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 12:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C0E22A7F1;
	Fri, 16 Jan 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNPVQ1qV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B428239E7D;
	Fri, 16 Jan 2026 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568068; cv=none; b=U5FEyRKkMl6Z+A0lD/EEaXXEfuC51QiL7O4YlV5PEEHektAE836CeA8+MckX+hfyvVUQhXglmSgA/BbzyC0fuY38I9UqysUba/QGCcxXPvzVoeWT+BbMqpj06JOwRpZhqE6HXfDy1HCXTgFE5WbGzYY73ckcaDUaDOiygDPCdmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568068; c=relaxed/simple;
	bh=RZAgpHyP7n04yqxOa2/ttwQj+MT9gPPGp7AC3BfOuOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED7ghtulVHvc8qUxe+7WeF9SLHX2H0Pz8t03Bowc44CuKq44PQ6LxQR9LQeNPwioQ2MLLb0MSZ6MCt1MSkGqGo2klMfYIRFUgwhhUDEemDxRCeq5b1C43pEIf30Wws5z1xARNr+r1Wr1w0+hgNzbkwLYNAHEqidpT8+/1DVfd00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNPVQ1qV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB9AC116C6;
	Fri, 16 Jan 2026 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568068;
	bh=RZAgpHyP7n04yqxOa2/ttwQj+MT9gPPGp7AC3BfOuOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNPVQ1qVz93EaBRsYVAvNz6uY6Ak+tN8bN/oheSd+jXvUr2jX1ZF4+lNLGJaadM+L
	 Jg+WJu/53xPJIhNmTCAE5nxFDww/ERpshwgb2ClDqmf1CV3hScUsSqpzXVHC3wOCB+
	 E+VXJoCQj0DfuX+xbUWVIuwHMBrtcGpKtVH0hNQHxcjl2nQ/95wi4yTh9bt/rbttAg
	 hT3m9DifKqhVhiRjyjc8svNyXwCNWDs6nyjUXX42zAchhMLFcwV6KJYS5ZoXXe208S
	 Aw0IaDYQ6tD1mD6yBC1lMPPIaIrsl9T1/tyvGBa7U7mY3oyPTM2S0Lg6haMcNvYt2z
	 hplkTy11OLNJA==
Date: Fri, 16 Jan 2026 13:54:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Elie Morisse <syniurge@gmail.com>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: amd-mp2: clean up amd_mp2_find_device()
Message-ID: <aWo07ayhQ6E-WoRY@zenone.zhora.eu>
References: <20251210040258.60106-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210040258.60106-1-johan@kernel.org>

Hi Johan,

On Wed, Dec 10, 2025 at 01:02:58PM +0900, Johan Hovold wrote:
> Rename the driver data pointer for consistency with the rest of the
> driver and drop a redundant cast.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

merged to i2c/i2c-host.

Thanks,
Andi

