Return-Path: <linux-i2c+bounces-12700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF1B46A12
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 10:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56ACE1CC4BC5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 08:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D851D2C0286;
	Sat,  6 Sep 2025 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PplUynJa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5124224678F
	for <linux-i2c@vger.kernel.org>; Sat,  6 Sep 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757146094; cv=none; b=UCvK+C5R9YLyUC7J8+BzRq4AvnClA3S4kGzZYiSnll7sALLUUteDogGwfjGYeUYRSaCGMNWQY7oUjnmn2ninT/oPfuHzvDSIDzTWwKt19Aea5CATEmzieTX3gaP0aopwP+3oAVce5y91R34oWBiEofKxeM2yrRKDo2jLbsgi5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757146094; c=relaxed/simple;
	bh=dop8XJUMlK+h+/BtYYrIy3cPtrh5X3wO9iRsyLj7Qkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXbxnvrtApyaHmfwxmtxZ8CV1PEHr3OunDsDJNHByC3FsCABizVCyaJ5eDITC0bYAonSvE5hDzy4r4FAAC/Ve2qPVUzP8cnQeEezFkXWUsYkTPEg2P0YfNjTRKkt49htaxLj7CYeFcjMyE3OvYjEomJm2GTgNOCcbom+k6hGMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PplUynJa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BgRV
	ww/LcyVXVqeeYuWbtWuvwtzxev9Xyc/QbRSfmcI=; b=PplUynJa5rOgmQ9Jyf5k
	CIe7MTet/XJPc9CfUzKV/WhWs8CJBZoJUSwKv4OGw2FQzSEUGCePbbvvNsr6MH+p
	VYcPqVzy6UuVBB5i6SYGbWbr3ahURh44kZ6ayBgbiblSMlEaY1KRChGjvu+VDXwP
	8osBnwdGXKc14zreeZLxXgKbouR/S022ktpKQ+7OsxiqbmsJtvwhykAOr834/p5i
	Ire++xbY0BrIqVO/ydeYF/1+AjIGH5Aj5nlzOc/jY0/uohBjZL/H5v1/M1LZE2b/
	rfizcWNy5W9xE5j0TtT+vcJQimQ3dxhC36Mm+bJXCA23vroDP8ptyqptS15IlxC8
	hg==
Received: (qmail 119234 invoked from network); 6 Sep 2025 10:08:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2025 10:08:06 +0200
X-UD-Smtp-Session: l3s3148p1@QH9JdB0+eLAgAwDPXxPDAOCjMSL5jkIv
Date: Sat, 6 Sep 2025 10:08:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mohammad Gomaa <midomaxgomaa@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kenalba@google.com,
	hbarnor@chromium.org, rayxu@google.com
Subject: Re: [PATCH WIP v2] i2c: add tracepoints to aid debugging in
 i2c-core-base
Message-ID: <aLvr5panVXBEH-Kc@shikoro>
References: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
 <aLnw0L3ncTsQm2eD@shikoro>
 <CAKRcmag2naB67VTJj+xdyJGN3i6Q9a9EmF1qamfZSFs-w1RkMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IRcXv83qomSr3GUO"
Content-Disposition: inline
In-Reply-To: <CAKRcmag2naB67VTJj+xdyJGN3i6Q9a9EmF1qamfZSFs-w1RkMQ@mail.gmail.com>


--IRcXv83qomSr3GUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mohammad,

> We started by adding a bunch of `dev_err` and `dev_debug` then we moved
> to traces when we saw this Kernel Patch (note: it didn't get merged):
> https://patchwork.kernel.org/project/linux-input/patch/C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com/

Tracepoints can make sense and we already have a few of them in the I2C
subsystem. Using them to propagate a new set of subsystem specific error
codes is not where tracepoints really shine IMHO.

> My point is: we can always circle back to using `dev_err` and `dev_debug`,
> while focusing on making the least amount of changes.

Good.

> Few examples of where we think adding an extra log line would be beneficial:
> - https://elixir.bootlin.com/linux/v6.6.94/source/drivers/i2c/i2c-core-base.c#L539-L544
> (log that no driver were matched)

If you enable debug printouts, it will be printed by the driver core.
Check the -ENODEV case of this function:
https://elixir.bootlin.com/linux/v6.6.94/source/drivers/base/dd.c#L572

At runtime, you can also check '/sys/bus/i2c/drivers/' if there are
symlinks to devices.

> - https://elixir.bootlin.com/linux/v6.6.94/source/drivers/i2c/i2c-core-base.c#L614
> (log that probing failed)

That really should be in the logs, because the same function as above
prints that with pr_warn (dev_err in recent kernels). No?

Happy hacking,

   Wolfram


--IRcXv83qomSr3GUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmi76+IACgkQFA3kzBSg
KbbYng//e3d3oumNpz/rhYDr+K1Maiqq9Hqg9i9fuT3E3YixJwSYgw73DoFcsafw
0+ptaSQxHuQLO3cfN6xNyCBfuEW4E44+CbSO5dBvaPVoSpSJ8rkco7eTnMd8nvjM
yJJRc90pLVEZsWQC7BGwTHcGt1ZfLxQusXn8ywMVnaP3Epv3XiazZR0K9wHMNVL8
EAI7A7ZJG5wzzUGG7hiA43oGa421XCTaKVpq8BSmcmgTs/tjkq1f2h9OzAt86iEy
0Aeb74iZ7N6snVD2admxipOMaeXjg43FoiONsj1TMUDHEKZfYsuG4qIr0s8ks5sE
dFf/MMLhPK+bCBuuabUPVuZJlmRN9IhUstRQAwGAyKi+43KqY1p/yab5pMwyiVD3
xFiR0hDrJDkl+XMRAn3Cmozl4Fazss7q3+coTLBHkLR6d5HGxsdYis5+1bw3oYr+
u7cb1yaTIJpeR5uAyWjwLa3uKTmyJb5sxCyKBW1/0gGW7ZiWlBX2elyOM2GgOIXx
yRG9t70mHC1tW+Nx6Cy4hqG48hoHvU4LuWvmWLBq7O0f7GczHrXjQcTiWGXdnBIc
UQN2wIKnXoG0/Mvc1QUlx2Y+kqnxOYYmSqAiTWEiqkMEXvouav4x491pB4Z4klqD
Y9QjfWDLFHf/iEikNjndIf8RrTLC18SOAlz9W30WtO9udBDwo/g=
=+10b
-----END PGP SIGNATURE-----

--IRcXv83qomSr3GUO--

