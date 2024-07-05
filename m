Return-Path: <linux-i2c+bounces-4652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80196928187
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 07:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1E41F230BB
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 05:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9830313B2B1;
	Fri,  5 Jul 2024 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="pQLGmpve"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC72D4CB28;
	Fri,  5 Jul 2024 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158726; cv=none; b=INWU+S4I1VieLa6uJ/TOzYoxzbqkw/SW05CwNk6rsNxH6jd9Tof2BqQg4kyD+c9IoJjmyBvois8nUeVW3CWjs9mvH5VvpPoXt19UJGv5v2VXptBEHWsNnMgQjhhW/d7NZ/K0SDG6rOuFieEBb6ndreClK1lriVRiYV5XxjS2f1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158726; c=relaxed/simple;
	bh=b4Y/AqHq1YzIqPDwhQ681I6YPdm5OfPgQY/LQ8WA+6M=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Z8UyC6VNIHmnzD0A4VF6SwwQKRFu8MPp9RfgxRkA7ZEGAHCruHPWNzIn27M4aogrG5a0eJbKDxdc8zFMZ6DjQXs6MPyP7Zk1o5I/iaHyMCjuKjn99JhAIyTTjoNhk1adD1RHxASbpYdhcoN5mEjzH1p8LSV5iE/RG4l2M9gfNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=pQLGmpve; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1720158720; bh=b4Y/AqHq1YzIqPDwhQ681I6YPdm5OfPgQY/LQ8WA+6M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pQLGmpvei5KqZUF9ZCKSm9BPn5xE9FYZTxgsa6OsKoMHjeYPU3RAaQjBmUkGw406/
	 BkvWqYo5SRy9NEpgQKk8qsCrr2avQxdgBlbmrdrCKO2D7i36fFYnIFi8R0XpwkK0qo
	 Jsa40xoe0Jb3tfeHdSJT8071f+KFKOuNIZFkwyII=
Date: Fri, 5 Jul 2024 07:51:59 +0200 (GMT+02:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_?= <thomas@t-8ch.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <a86cac1d-6159-46c8-96d9-4c372a7956c2@t-8ch.de>
In-Reply-To: <g5bg74ewkto5kdky7q2ystfxmsu73bm4zdpnx6buanbcompady@vnyrwpaajbka>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net> <g5bg74ewkto5kdky7q2ystfxmsu73bm4zdpnx6buanbcompady@vnyrwpaajbka>
Subject: Re: [PATCH v2 0/4] i2c: smbus cleanups and SPD support for piix4
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <a86cac1d-6159-46c8-96d9-4c372a7956c2@t-8ch.de>

Jul 4, 2024 23:56:45 Andi Shyti <andi.shyti@kernel.org>:

> Hi Thomas,
>
> ...
>
>> Thomas Wei=C3=9Fschuh (4):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c: smbus: only limit max banks to eight
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c: smbus: probe SPDs on a best-effort b=
asis
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c: smbus: drop warning about muxed segm=
ents requirement
>
> These three patches are shuffling around the code,
> adding/removing/moving the same bits. Can we squash them to a
> single patch?

IMO they are doing different things, but I'll squash them for the next subm=
ission.

