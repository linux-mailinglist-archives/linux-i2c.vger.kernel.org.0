Return-Path: <linux-i2c+bounces-8720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D613E9FC9EE
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 10:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DC9A1882CDE
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7511D279C;
	Thu, 26 Dec 2024 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLluwXju"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA64154BEA;
	Thu, 26 Dec 2024 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735205151; cv=none; b=dIrdSFxYAYbXiJ9a1Vx0JQVONZmOkw1KsmO+z6dwX5LMlEk4y5u7JS3GoSocthUbwh8uVL8a5viF23SIo+heh6jxEzjP0t+G7ALc5EBTS3ZaYjuFYAN4LDuwm99ZC5aa/sFgEjFWyZgrIBhGXHdSHevcsbXNsxVHFvEn9oxBKhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735205151; c=relaxed/simple;
	bh=Ul6bUTCa3anx9Wsnv9cjUsR1k1LIwb47nD82Zrb+90A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkU/Qon7dux63ki1EEOQAJTX5PgkG7d1MInxJSxfeYA6CwHU3frUDIl0xQgbJzAIoQLBZiP6QtH2IqdQMjzKixgBQDRXY7cXuDIEOy5lQs08x6nuXtDNoqnBhrY2Vpsyeho8lniXzrvJlXjLFs6kqD3Msu4+UtaTnvwMCBp6CP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLluwXju; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364A2C4CED1;
	Thu, 26 Dec 2024 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735205151;
	bh=Ul6bUTCa3anx9Wsnv9cjUsR1k1LIwb47nD82Zrb+90A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLluwXjuwtXtZVjo2UTLBoDjVUHYRXrees11Ics8rqLZHHhN/sssRbt4AwUEws5PA
	 wl9bl1PBbJdZeRnzY1F5asz8PsC4yYaDFeemoS4FG8UAEj6FezyV6/PLjcwLcOEc5b
	 a3X/KTR8xQsnNyo4CZo8Cr1qMhDI6EWB6ZddPoqY6fEJSyr8l6n92TELfeK/YQJdOO
	 NVox0I603bOxzn3N+yu3st/PKq4cIyLCPDofyl5/vIf6cn11jrMZ7E2e0do0vvqkY7
	 fWREmyJysf1TT+d+op7KWAhv52eszQQNCfMAxObrx4WP3ZD+ooGZ+5CKDLdtx8zq/q
	 o+Iqo6NE5ePrg==
Date: Thu, 26 Dec 2024 10:25:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 3/7] i2c: Add Nuvoton NCT6694 I2C support
Message-ID: <bjgcaxdlkqiujbyjazjprvoup3r2ctgjr5fcvzyyr46vea5icc@ao5axgffufbw>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-4-tmyu0@nuvoton.com>
 <qe7rucm65tixgnlendfdlr6iemrvs2ecun7odlbl3csofj7qjj@sl6vypb66awz>
 <CAOoeyxX475tHNqoejX=DcY2ow2+rPc=_qXuX0O5AGumLPFoQGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOoeyxX475tHNqoejX=DcY2ow2+rPc=_qXuX0O5AGumLPFoQGA@mail.gmail.com>

Hi Ming,

> > > +static struct platform_driver nct6694_i2c_driver = {
> > > +     .driver = {
> > > +             .name   = "nct6694-i2c",
> > > +     },
> > > +     .probe          = nct6694_i2c_probe,
> > > +     .remove         = nct6694_i2c_remove,
> > > +};
> > > +
> > > +module_platform_driver(nct6694_i2c_driver);
> >
> > what I meant in v1 is to try using module_auxiliary_driver().
> > Check, e.g., i2c-ljca.c or i2c-keba.c.
> 
> I think the NCT6694  is an MCU-based device, and the current
> implementation is as an MFD driver. Are you suggesting it should
> instead be implemented as an auxiliary device driver? If so, would
> that mean all related drivers need to be revised accordingly?

No worries, module_platform_driver() is also fine.

Andi

