Return-Path: <linux-i2c+bounces-11914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B098B020FE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 17:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86CDF4A7435
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 15:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8CE2EE28E;
	Fri, 11 Jul 2025 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBqfEIH8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E72E763B;
	Fri, 11 Jul 2025 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752249579; cv=none; b=uQb+pXj8joJhlus/cpZyCXbVyy4yZiJoahFPOWf7+uq6Q2yw/Ih8mtRN8MiFO7qBabAfVuGIEgel0DVVof832Tuq65vECaALCWldxfUcm2xfXE+3aPmP16M2+sqEcg+RXo78b/uK7CLc+PFX0Fgw/qXiCllTOWVv/T7u2E8hg0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752249579; c=relaxed/simple;
	bh=J/74gCWCb/fJuIw7/PGqtuWPe+wLtBGrToknQ/QYwTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7dXt4a4+Zt02eaDeY3f9oxhOWIgAHYhjZEWSiv0txDTTsTrb+idfhOuMLwwCCeg74f3RzkTMCOcvasm7RuWn5mM67lgZRSrjCUOI0NiNpn0ykxxFfejZUaxtpuyEWApHfbvaSj5IhjhKKQifjfIjdV95Wnrjd/A1WZBOl8XsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBqfEIH8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C68C4CEED;
	Fri, 11 Jul 2025 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752249579;
	bh=J/74gCWCb/fJuIw7/PGqtuWPe+wLtBGrToknQ/QYwTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBqfEIH8IwfxJFLK7PjScX0mNBkSFYMlhgBJRavsH1/3f2gnaO39+XVemJIJFrDu0
	 wj0I2zRspvmo8qrzKyhWEGjczhasCSQeunoikcsOyFrIae7zB6Mr/iVS9sZI+bZsv1
	 n87FZhymxfQdOFogPYZB3z2CvI468A7Vb8GYEsNlusqaYq2zCgmZFgU8veaw6nSfaP
	 5iD+F0C0YzVquq6/TAYEhMZTHJAqDpBzkTPYC/COnyXaDauBeGXbngDXKoqK0YjfNc
	 Mrpgn/KoJqhqDDTfAXBw8Usv6FDNSFnmXhWX1IxVCl6T36v5iZr8Ldl+gQfNoOKQss
	 4aclURnsSZUfA==
Date: Fri, 11 Jul 2025 17:59:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, digetx@gmail.com, 
	jonathanh@nvidia.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, p.zabel@pengutronix.de, 
	thierry.reding@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 1/3] i2c: tegra: Fix reset error handling with ACPI
Message-ID: <wuggyfzqeljlinbcanvlu7pxq5orjdg37az3trbrxdiufk5byi@jbkeihqkozkv>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
 <20250710131206.2316-2-akhilrajeev@nvidia.com>
 <aG_FJZQjNbV-OnGc@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG_FJZQjNbV-OnGc@smile.fi.intel.com>

Hi Akhil,

On Thu, Jul 10, 2025 at 04:50:29PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 10, 2025 at 06:42:04PM +0530, Akhil R wrote:
> > The acpi_evaluate_object() returns an ACPI error code and not
> > Linux one. For the some platforms the err will have positive code
> > which may be interpreted incorrectly. Use device_reset for reset
> 
> device_reset()

no need to resend, I can fix it.

Andi

> > control which handles it correctly.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

