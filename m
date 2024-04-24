Return-Path: <linux-i2c+bounces-3087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D48CE8AFD1F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 02:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28C69B243B6
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 00:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3086FB8;
	Wed, 24 Apr 2024 00:08:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8D6112
	for <linux-i2c@vger.kernel.org>; Wed, 24 Apr 2024 00:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917299; cv=none; b=U2rchViN+mIPMrQD7AFr1d5md/QFyQqVkg5pwBM21EFlAjWEI3WYuq1cuiyayCBb0nbH/fJxaEOqkNoKOI+w03SlV/JM1FD4W+LkbV/f8r2biT7OOZseh0SpmB8AV8JyPvUPXUzVpeAbPHFKpURX3r1Hge1vlKqPt1Qx3VvBaCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917299; c=relaxed/simple;
	bh=2lT28vERDCRi5gr20Y4YZMGGpwzIyZ7BWvJ2WY+Nd7k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URwCbvVedXSq9M0umHP9gZfXhjjl99SAr/Z2YVsKkRMPHbKUAt1z53zIKKQCKx/a2nVoLcaCEA3s9cpNiCW1bYLZZna8QXjcZ42ZC8qh0aJQiopaRwcTjVjbe1tzm5Qlfts3xH8KBeVd9S9BUisVrcc9Xw1yS4ArtBhtpFVvjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id bedb557c-01ce-11ef-abf4-005056bdd08f;
	Wed, 24 Apr 2024 03:08:15 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 03:08:14 +0300
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/18] i2c: remove printout on handled timeouts
Message-ID: <ZihNbtiVDkxgUDGk@surfacebook.localdomain>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>

Wed, Apr 10, 2024 at 01:24:14PM +0200, Wolfram Sang kirjoitti:
> While working on another cleanup series, I stumbled over the fact that
> some drivers print an error on I2C or SMBus related timeouts. This is
> wrong because it may be an expected state. The client driver on top
> knows this, so let's keep error handling on this level and remove the
> prinouts from controller drivers.
> 
> Looking forward to comments,

I do not see an equivalent change in I²C core.

IIRC in our case (DW or i801 or iSMT) we often have this message as the only
one that points to the issues (on non-debug level), it will be much harder to
debug for our customers with this going away.

-- 
With Best Regards,
Andy Shevchenko



