Return-Path: <linux-i2c+bounces-5000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5425932F4D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 19:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65627B20E5A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 17:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9730519B3C4;
	Tue, 16 Jul 2024 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQJcWy0i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51691FC19;
	Tue, 16 Jul 2024 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721152007; cv=none; b=ozSFvylR9MtgOko4jHqSgYbPVSqTfBt5UJaRoqFSj1p/WAw08+S7/rYkAT+70wmCqMc2pnZINs3SyglkpRKd9emUWiLeEoa+h6LJYJsj2/tXr2CjUtsu4AxSXGyuq/IGIpptMS25Oai/uBAUFItLtsiq20IG6Bhp93RucdhMfes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721152007; c=relaxed/simple;
	bh=Hw8FkfIKqsQ0CwefUs5XRJ2i9+YYcFdCnn2awFcRrPM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1bLIzVZXZlYAR6zFgqQT3mRKy97p5Pf2+kr1VlUxF+b18N4c2/ilpdbh5iqeROsU4EIHWSdyMz1FNFX4VA6LpewNP5ajrE9up7kod49FI4ZuR8MojPXBqz0/YvLXvQKh6QWW/SZ1u5Key1DqMjljNQOLBo3C2a+YPiresmAxoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQJcWy0i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6FEC116B1;
	Tue, 16 Jul 2024 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721152006;
	bh=Hw8FkfIKqsQ0CwefUs5XRJ2i9+YYcFdCnn2awFcRrPM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=FQJcWy0iZNK+SnczpSBDNWlOevdLGcbDQEVvfcid13Egol0KlnecmGmXuASuIuFua
	 HdDbyQzZbz6vy/JHAy+VvFBebXS2D/85tgeMdYnCecutlsFv4Zku38E/xg29LVUArm
	 UJCMgHKmoZghS7XeLpYmrLVlM7sPYUR2bw9EwDanH9F+OWzJchKURZs/Qtdna7F0uC
	 Pn3KWMhc4ofaAhLRAZ4J3eBE8Y8sprNjVOvyqzcbB8KwrqqViBt79EChcD1pGgSv4T
	 s5zbHrpVzm9kbmWnd4EoDBkPeJO0bCW8h01k0GCSAvBgo2vhC5FoQYaYYzy1N+FGpb
	 uVq1drfRIBgfA==
Date: Tue, 16 Jul 2024 19:46:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: piix4: Register SPDs
Message-ID: <i633av3v2a4chdh5a7yk6nv6y77ohvpajeozypjdroufikes6k@cmvpywjwj4df>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
 <20240709-piix4-spd-v3-2-9d1daa204983@weissschuh.net>
 <ZpEnXaRYnPIr1vG3@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpEnXaRYnPIr1vG3@shikoro>

Hi Thomas,

On Fri, Jul 12, 2024 at 02:53:49PM GMT, Wolfram Sang wrote:
> > Only the first 8 slots are supported. If the system has more,
> > then these will not be visible.
> > 
> > The AUX bus can not be probed as on some platforms it reports all
> > devices present and all reads return "0".
> > This would allow the ee1004 to be probed incorrectly.
> 
> I think this information would also be helpful as a comment above the
> code. But to allow this series to be applied now, I think an incremental
> patch will do. With Heiner's ack, I think this can go in now.

I agree with Wolfram here. Are you up for a v4 or do you want me
to add the comment while pushing?

Andi

