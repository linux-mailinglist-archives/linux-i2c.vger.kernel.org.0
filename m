Return-Path: <linux-i2c+bounces-11711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8229AEE6BC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 20:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3E83BF77E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 18:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B481DED52;
	Mon, 30 Jun 2025 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrOZbBta"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBDC72613;
	Mon, 30 Jun 2025 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751308100; cv=none; b=q9kkHke4rcC4aN/5aIr3yRcI+af6cDkAxmDk/w0bCCq0fN5nQfhWxPkogLJg+jZOW4k2ZA+Iqu+ncJFqwYU0KbqeHxzHRd7kLY4b5S0uIvEL/sxva3Al3rKBB1Zp+aRw3PScd/7qVQTk/IH23ucrSGAzHIUkWeJBxmrF6/hbxtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751308100; c=relaxed/simple;
	bh=GxFRzmBGBJNDKvWM2J16xINJw3wVBq57APedjAYERKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPd5x+WW9Ch9zh+mFPYSQsX6lfYfztaunM+R1mKPARdbdP80I/XnihTlIcWPj4OCzmBzQe/mfZI+D4eL+L0y//H+hkH/ypkGBaOUhJdNQw4ZX8tO6C5eCDZX/UFaAB2cgjxuwIa3IjTaOhuPeYOQEBOpk5/2MpHtZoymIQpZNBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrOZbBta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EC0C4CEE3;
	Mon, 30 Jun 2025 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751308096;
	bh=GxFRzmBGBJNDKvWM2J16xINJw3wVBq57APedjAYERKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrOZbBtaR5et9OF5MMll1PiXsSoC/iWUBWENE8TDF+RRDj8fWvByQsGR8BY43IBit
	 t65TYX/GHdnAJJsWu5vSVlnPcUBy+wMiCDac3gnJGGbX9UKSHbETSh+F5kLyFF3tuR
	 bb2ws+vm26QYpYAZ4P0meeaezswCL5NxOo3+/qy1kBIfuco4WVzDN7FsxgM7fXffEe
	 kCZt3AqfovytODIL4ATDg1FxTOErXTgH/40D8/cpreMO+rpPtLRHeIIQfqvctPoaUt
	 CePQxpSG7FkiTO1KEP44gJASGi5nJMO42sDhYgr/Q7amLEoDfuOe7vyHhoMj1TL1eI
	 odbLtJzLnBsSw==
Date: Mon, 30 Jun 2025 20:28:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>, 
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <gljpd4foldjwairaca7ip2qqpdl7ipto77wsqwhbfamv6kdd3v@2doqwso7ccx3>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-2-heikki.krogerus@linux.intel.com>

Hi Heikki,

On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.

What I don't like, though, is that there is no mention of the
change in the probe in the commit log.

Besides, are these changes related? Can we have them split in two
different patches? I guess this would also make Andy's point
about the extra churn.

Andi

> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

