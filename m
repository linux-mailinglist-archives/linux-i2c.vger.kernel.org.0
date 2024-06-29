Return-Path: <linux-i2c+bounces-4493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10FB91CB7A
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 09:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 262DB1C219A6
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 07:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18CD2BCF7;
	Sat, 29 Jun 2024 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Va2WLuiN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA2AD49;
	Sat, 29 Jun 2024 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719645603; cv=none; b=Z8YSb8Y65Ek2ZBUrMDpXkgaY6tYgycBswGEppUrLWRvFSUu8Hf1SgUvxMqHEN+PHUtVPtO/gk++QtA+bGTrQtGVl9MuKuvg4bzku3oNc4Nb23dDtn9FcCkFtvhBQMZBOc72+NhHJPGMZP5Qtwxf7i2kw7SwuV9xQUDq/eJWc2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719645603; c=relaxed/simple;
	bh=43KSNdy635mC+m8pthn4X3ijJbOR+DQUlbunS7xxVS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpQOFfQMOlVymRXPyFW+vj4iMYsjI0M/JVVM7k/r5zBqhlQd5snKgAOPWx9oNU7IW47FUjgIZNgsXWNc77QWVTsrmAwO9YhNMLquMKH4Sn74pg2ympGf7jxUqfUtj0navIHkdJaNVeA3X4IUh3eRW7EZX79Ao2SJ1nDf8qVd5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Va2WLuiN; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1719645589;
	bh=43KSNdy635mC+m8pthn4X3ijJbOR+DQUlbunS7xxVS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Va2WLuiN/gG2+vp+0zVx7TteJs9XIGnfYL7HWuWz2kVVO0ZCRubN0ocPoGxICQc1z
	 6j/6IQQ9xYrwOpCQwm+0Z4qarg2AjCeA9nXUjGQwkR8d5crtenM9GDI6GcrhdxyASt
	 N4tUwLkCTxtiSWRdEd7AETdeNTy62CByDvCEfDJE=
Date: Sat, 29 Jun 2024 09:19:48 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 4/4] i2c: piix4: Register SPDs
Message-ID: <afd11870-eab1-4b90-9b81-2a7c84be46e5@t-8ch.de>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-4-617ce47b8ff4@weissschuh.net>
 <2bbdb1bd-ea4d-4c14-9ea7-9fce09ac76b7@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bbdb1bd-ea4d-4c14-9ea7-9fce09ac76b7@roeck-us.net>

On 2024-06-28 16:09:09+0000, Guenter Roeck wrote:
> On 6/27/24 10:48, Thomas Weißschuh wrote:
> > The piix4 I2C bus can carry SPDs, register them if present.
> > Only look on bus 0, as this is where the SPDs seem to be located.
> > 
> > Only the first 8 slots are supported. If the system has more,
> > then these will not be visible.
> > 
> > The AUX bus can not be probed as on some platforms it reports all
> > devices present and all reads return "0".
> > This would allow the ee1004 to be probed incorrectly.
> 
> Was this reported somewhere ? I don't see it happen on any of my systems
> (of course that doesn't really mean anything).

It happened on one of the big server systems I tested on.

> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks!

FYI, combined tags are discouraged by
Documentation/process/maintainer-tip.rst:

  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
  they just complicate automated extraction of tags.

I'll add the tags in split form to the patch.


Thomas

