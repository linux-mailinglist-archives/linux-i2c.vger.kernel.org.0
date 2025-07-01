Return-Path: <linux-i2c+bounces-11744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3709AEFFDF
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 18:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2A41173DD8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 16:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A50279791;
	Tue,  1 Jul 2025 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9XIuGEp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E72BAF4;
	Tue,  1 Jul 2025 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387510; cv=none; b=GgoKz+ZqaQly5EJQAvWYCTS+J01I3nXo8/cipgbIoEAkOvlt29uGZdKpKVtT49xKibZSPljqvLJ273wyt6Z1vhVcFvfxubykt/mWtuOFClPvdhcTgumwMB4V/gud+DwXwoBf+zmnYX5zn9nDwKlbj5akC+CI+/lhXKTua6hWICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387510; c=relaxed/simple;
	bh=xyBmcnhbzF75bFtyZHhh19c+VqGZGqbSTS7OxTVcXrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfItU7GHJuz397sS1lK6Zqj81X1zp4xgR2j5pnb5xZ6D2fGEtKti5J6HOtopSG06YL2X1bFA7zOKAknviN6ADOx3zW4IdoK4v0G9knoYnYUJqvOFUezRO/mtBUn7GPZ7claOAkW4NRdSy2+w1ovefhLaG2PECvqg5RjY7pdjRIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9XIuGEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB134C4CEEB;
	Tue,  1 Jul 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751387509;
	bh=xyBmcnhbzF75bFtyZHhh19c+VqGZGqbSTS7OxTVcXrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9XIuGEpA8WarzU2BPZ0jcruYfynWh8aYTN+UYKBg5ZCzAxFvq/ee4ec3V4XKVTCt
	 +MqShV4DqE/7Tuwsy2pjATFse4dARBGUjjOVipE7pe47K9HwY4JdH6cRT6BjD6rrzQ
	 +2vTK4jhDJbJaX1rjoxwY8OqnkBMUCpZFDNmb2FeNQSkEKFAcMXKtzTB4PTSZq19C6
	 cvlUUq1W/Ik4rIxQzRkFRDXvWbVYN0SYFGyeIP1m2QWoHfnujs92UnzXePYdzLvhnT
	 2DKIbZLYHQUH48cf0Uil2IYIHP+j8fLHObZNzcRFnURIojwelBiyo20hFoaiVfJrYv
	 xk3Upnaz+MyDA==
Date: Tue, 1 Jul 2025 18:31:43 +0200
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
Subject: Re: [PATCH v6 1/5] i2c: designware: Use polling by default when
 there is no irq resource
Message-ID: <c77xrjlv5cc6mfjqeu5jhusqwzd6ga5w5ipijohmncaxuvd4bf@bgty5kororry>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>

Hi Heikki,

On Tue, Jul 01, 2025 at 03:22:48PM +0300, Heikki Krogerus wrote:
> The irq resource itself can be used as a generic way to
> determine when polling is needed.
> 
> This not only removes the need for special additional device
> properties that would soon be needed when the platform may
> or may not have the irq, but it also removes the need to
> check the platform in the first place in order to determine
> is polling needed or not.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

