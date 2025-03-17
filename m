Return-Path: <linux-i2c+bounces-9851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E677A645CA
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 09:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C885916CB41
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 08:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D82221D85;
	Mon, 17 Mar 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="H+TbMdwG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285721DED6D;
	Mon, 17 Mar 2025 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200769; cv=none; b=Tphm9Rp7fJhaMx8YkLFSh/XYGgGYfULQF4AliND5kbEaE70RtD19VvYF+9UULPiOgEOGo4lqMny4/pVKgiORG2T3M59s93xgU70J/yKDdFNk0sszAnPzrbnGxVIyCseiN2oW/0S74hixd2/yQmR/IWjvXn5WOhelSbWIGA0OE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200769; c=relaxed/simple;
	bh=0LWPwkYHb5CwsDkji/iwkvFIS+/rI+FlG0f6Syt76Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDOyq7lfpCni6VhZk+6wfNdr9SQukN0Jrz8p6FUreFgbW98STaVO2/ehkiLXRR0Oma6Wu7XESMhQc06bNL1eNxtkY4TEhx9eUPp7A2JIh2g8QUvJWGM5bVglh/meaeQtregyunR/IZZcdei8Zz01jAWzRvaWSgXjEG2acDqdFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=H+TbMdwG; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7CF0B1F842;
	Mon, 17 Mar 2025 09:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1742200757;
	bh=m+AhiKfws1xc+HMC/G6boZQHJPWKEYM0DxVNwOLDPnI=; h=From:To:Subject;
	b=H+TbMdwGbPL5QAHuKGVI9Fcqp86xbDrmmM5qZ10uPDDHgKuVtimP7VKoCQMf+ZwHZ
	 YbublZmlatb7jgl3LjrJtkk5F6XXNcBnXH2BdEln57eA42cPCWh6iAv514SR186rxj
	 znXYPA8tR3GWgRlmi+WHfuz4bUZnAdfJ+QpZQRppJBoKcljCApwFt7+5ZtQxc/xdKl
	 ZK0DWmtWneTh0/9kPt2QmxCH4Kiux7DoYF3qzYGNuI3Tw8cj2rc4KeJy22IbyuZDPH
	 5WUZtUt6rgCanoyXpBCpuvhp/7vNkLuQvOjIyRxnkYZG2knWqwoVyD7XQQHO8C/1Ac
	 71Sr9VUjUjmOA==
Date: Mon, 17 Mar 2025 09:39:11 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Andy Shevchenko <andy@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 2/2] platform: toradex: add preliminary support
 for Embedded Controller
Message-ID: <20250317083911.GA17428@francesco-nb>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <20250313144331.70591-3-francesco@dolcini.it>
 <Z9LxbzJ3zf0RT-JS@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9LxbzJ3zf0RT-JS@smile.fi.intel.com>

Hello Andy,
thanks for the review.

On Thu, Mar 13, 2025 at 04:53:35PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 13, 2025 at 03:43:31PM +0100, Francesco Dolcini wrote:
> 
> > Add new platform driver for the Embedded Controller currently used
> > in Toradex SMARC iMX8MP and SMARC iMX95.
> > It currently provides power-off and restart (reset) handlers.

...

> > +	err = regmap_bulk_read(ec->regmap, EC_CHIP_ID_REG, &reg_val, EC_ID_VERSION_LEN);
> > +	if (err)
> > +		return dev_err_probe(dev, err,
> > +				     "Cannot read id and version registers\n");
> > +
> > +	dev_info(dev, "Toradex Embedded Controller id %x - Firmware %d.%d\n",
> 
> Specifiers are semirandom. Why signed? Why x and not %u?

The firmware version ("Firmware %d.%d") is two unsigned decimal number,
so yes, I will change to "Firmware %u.%u".

The ID is just an identifier that is documented as hex, therefore I
think that the most convenient way to display it is as a hex number.

Francesco


