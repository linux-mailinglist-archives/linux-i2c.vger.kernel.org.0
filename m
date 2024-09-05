Return-Path: <linux-i2c+bounces-6279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA396E451
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 22:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D2B284685
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 20:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4651917C9;
	Thu,  5 Sep 2024 20:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ0EYw3f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B517BBF;
	Thu,  5 Sep 2024 20:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569167; cv=none; b=sg7LhW0ZOmGH8s4/RW5E0KTgtz4PH4B7QR9ixYP4IezPJMEygWMviq+8JzMmfKgMiW8SqbikUv/MwxwPaV/exlA5cz7bPH5voLC8D+pCnI/EcWQNq11IhCuIarXdk7OENDRX5m7dEfvig1vGP44EGR93vRe5UYqdSTPjER2GFD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569167; c=relaxed/simple;
	bh=+OrvL2/VZLTsbhqN6X5J+Iu0Sre6DARVEoSBf17VHfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQ6gYp76dRZ6XjoKIHSVO9rPBdR738yA8J5C+ObnTkTFnAzHK6wYwWQbetGooKGPX/nglTxDHOVptwFU987s/9PJqjl1ugfkL9blWzmzC5A5HlyUM4XF8bPqnPHq3YY3zYKxYjIh1T4gKpqKkahUMvQIks3PNwEs4wnfcP4MP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ0EYw3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DD9C4CEC3;
	Thu,  5 Sep 2024 20:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725569166;
	bh=+OrvL2/VZLTsbhqN6X5J+Iu0Sre6DARVEoSBf17VHfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ0EYw3f2kf9edNbJjUGU9z7f8pDgyto+mkdKfT0Kr7l6j89gv74JONtNReuPdttB
	 Yc0eI8AFagLBWu49UlDimIZbs1mVINqdBcB+Elo7UMYm9WV3UV+bQ0sWR2TGng/o22
	 EBEujASO7ZVsv+r0zvpW7uAy15mc0/Jb9lzggZgJZrIVjmZbsAVGsLiqWyrIv4dwmc
	 AqM2irQlWsgqOOzbo2eq+rtmZZECxdbsOG3SDQtHg7OqXCe1ykvTISSsZ4guLBQikR
	 OxpPt0shI3oP2NiyK1wMWTTNe9GnA3HZ2b7FMc22rvHDeA0r6Uy4sr4u+BYoBAxILM
	 0P47qPNX1K7xw==
Date: Thu, 5 Sep 2024 22:46:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <o4bks5pxn5olnvobln3z2axi6jx57vz5pq2kazyzxemptbp6fb@p7qsppr7ks55>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <20240903142506.3444628-8-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903142506.3444628-8-heikki.krogerus@linux.intel.com>

Hi Heikki,

On Tue, Sep 03, 2024 at 05:25:06PM GMT, Heikki Krogerus wrote:
> There are quite a few drivers and options for the DesignWare
> I2C adapter in the Kconfig. Grouping all of them under the
> I2C_DESIGNWARE_CORE. That makes the menuconfig a bit more
> easier to understand.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks for your patch, I can take this only after the other
patches have been taken in.

Andi

