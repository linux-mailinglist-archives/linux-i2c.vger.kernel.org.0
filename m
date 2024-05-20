Return-Path: <linux-i2c+bounces-3598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E000E8C9E4A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 15:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0F11F21E42
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 13:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81003136655;
	Mon, 20 May 2024 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dFQrREXY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCAA54789;
	Mon, 20 May 2024 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716212497; cv=none; b=h8vJ/eB6FqgOlaZ9Sd8szV7QRRuefh46fdlgt+U9l4S7QakPdLtiWrWr52JFXdQYy7VrP3GGirNEGjT6qkoFKtv55Uv24iwhrIQWR5KkF0XAEAPfOqQnr9T6WvKMB17mTxIusxSUNPwLl9k80G40slWLH1jbyM6hvv5NWXxKDGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716212497; c=relaxed/simple;
	bh=tDiANetDoW1pQLr/KuXUjU82Zacm1RZP8bbd93enBmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oom3q+9BUtjhj80I2ihIfbAKX8cyQV079d1LW6NkMbYmeIJHe1lwmgPKknU5UtA2611F8aP8Bhsvv42xDkjLDU6v7pPaSVrHY/lWoUq9Cae6amgK8U4VUmCkrWov3JCh9OvL4whdOFp9t/e+e1/qQZHsPOatP3kzL3TCyHXrPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dFQrREXY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=GgIHxPkfIqu3jiSSto02RWnKkf1y+ggjPEgehOTqsBM=; b=dF
	QrREXY6vZiR7rSNZCz+DDVvWrxiUt1oPG78n7yje788+FHEnXJ8BmFIV88pJ3EShJ75hMA3r3TLPR
	g/B/4O20JEgiWctoXWmIif9WSIQ19NJQCr+vsSkqZ7w/ZOn5oc6QB0iG6OrImNMEQMDgbMHJZYtVQ
	UdZWtpTuGv2TuzE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s93Gc-00FhSS-9z; Mon, 20 May 2024 15:41:30 +0200
Date: Mon, 20 May 2024 15:41:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: grygorii tertychnyi <grembeter@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>,
	bsp-development.geo@leica-geosystems.com, linux-i2c@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Peter Korsgaard <peter@korsgaard.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: ocores: set IACK bit after core is enabled
Message-ID: <a42d75ad-8065-49f0-906a-c8ae3761457c@lunn.ch>
References: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com>
 <6eee1069-81ae-495a-850f-7f526006db8b@web.de>
 <CAGFuAuyXhBT8Nkvz5qN8iejeoHMFmx1b86tTNmpVfQ2xqjMtLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGFuAuyXhBT8Nkvz5qN8iejeoHMFmx1b86tTNmpVfQ2xqjMtLw@mail.gmail.com>

On Mon, May 20, 2024 at 03:30:43PM +0200, grygorii tertychnyi wrote:
> On Sun, May 19, 2024 at 7:25 AM Markus Elfring <Markus.Elfring@web.de> wrote:
> >
> > …
> > > Sometimes it causes failure for the very first message transfer, …
> >
> > Does such an information indicate the need for the tag “Fixes”?
> 
> I'm not sure: the original initialization order was introduced by the
> very first commit
> 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C controller").

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

  It fixes a problem like an oops, a hang, data corruption, a real
  security issue, a hardware quirk, a build error (but not for things
  marked CONFIG_BROKEN), or some “oh, that’s not good” issue.

Your description of the very first message transfer failing sounds
like a data corruption? Using the commit which adds the driver is also
fine, some bugs have been there all the time.

Remember to add a

Cc: stable@vger.kernel.org

    Andrew

