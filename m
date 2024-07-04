Return-Path: <linux-i2c+bounces-4644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2B927EC5
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 23:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46D31284D4E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 21:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75787142640;
	Thu,  4 Jul 2024 21:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5mThql5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4C2BB06;
	Thu,  4 Jul 2024 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720130203; cv=none; b=QgdvUxGsa7oKzKbokfkRpppKO5Muso/kqF7b7EV1lKVdp2BNS34YUvDnc6QCoSaopDAMov/FkLFttYcYAVKRdevjvAv5eYOyUGp7sBdYJeFoG8y7fwIlr6KzhOzSWJKpFzmxVFsW7pEMktc+clz+8IOc6o6SphOUhdq6yCppgZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720130203; c=relaxed/simple;
	bh=vog7pWyqgwU+bQPYbr6yAaf6sjQig+brC0HASVtKHcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrI/+4i1v9CWiY8HAIMt9cMdxnUs1UXoNRLTFoFhTg+DMyq+oPbE1HSH3gucfAP83zoX2YEynCZM5FfAXusLyVZ/gO3E+9ilpe//cCUN3o3eb6pmDqAGxrlE5X2J5VLHt67VnK70tAbljxO1pVtwA4wWqoVdycXM/+LZ8U+Mo5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5mThql5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB44C3277B;
	Thu,  4 Jul 2024 21:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720130202;
	bh=vog7pWyqgwU+bQPYbr6yAaf6sjQig+brC0HASVtKHcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5mThql575Tr08oEJEVQDV8bZXux4jC0nL3dY0B7obLDjoDSSc5rdwC22bFX0CKCv
	 A+91tFa//fflTDjxr+DJILQ94JY+vQl/ntrvcQXiSVXXlDpjSZDc0n3zueGs4H+zc2
	 5Tj284s2q1h4dsezOf9KfTWoti52oan5dBMDcYyyWSU0W10nfLNpGs+ro3ZPEBfACs
	 jjvm1L9D26bob9SgeT4Vo+QEm3853cu2waLjGWx38ZJqkJhh3WnWCQ9iItJWfXAcSJ
	 UnMEpi/yohau/6j+OE8pHM5zcq/zqxdHB9yQZ3Cs09fxX2PhxsvHiV8Y40Pl6dStVE
	 c15OqQGynDPXA==
Date: Thu, 4 Jul 2024 23:56:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 0/4] i2c: smbus cleanups and SPD support for piix4
Message-ID: <g5bg74ewkto5kdky7q2ystfxmsu73bm4zdpnx6buanbcompady@vnyrwpaajbka>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>

Hi Thomas,

...

> Thomas Weißschuh (4):
>       i2c: smbus: only limit max banks to eight
>       i2c: smbus: probe SPDs on a best-effort basis
>       i2c: smbus: drop warning about muxed segments requirement

These three patches are shuffling around the code,
adding/removing/moving the same bits. Can we squash them to a
single patch?

Thanks,
Andi

