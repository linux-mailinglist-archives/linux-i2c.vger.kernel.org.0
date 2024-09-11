Return-Path: <linux-i2c+bounces-6586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7648E9757C2
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F5D28CE7B
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393A31ABEDF;
	Wed, 11 Sep 2024 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tleheoHl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7128187336;
	Wed, 11 Sep 2024 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070344; cv=none; b=s5McFSnPw59igGHrb1kQixTEL7EwfkL4frJnFFMHdXeiFUad3VCPbfOhmP1KLpm56fKZVOFvHWv2tnW2RzAxZ5AxbShV9Nana1s8wV21UVb21hWa0DW9ZYgxzVy0I2ij4BCXZMtDC07+4YXLcltfCNK+iZ0UtFads+Vbf00ZnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070344; c=relaxed/simple;
	bh=Mu0KKoCsaT6sNUuTlrDEprXR1UN7pQSV8Yy+de930to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCpNmyxaGPnqjHZzmQ2U7SnolRiv00IB4hlRWS7zBLUCkIJ1NxUzWCb4aAye82p9fYhNSrggDUAuVgUeRoOSV2JlUCLxtHVZBCKg7f607fad1iK9asWDxLTxLbrqkRSOtqne50h1ukEy7SH3PjftuGtsJX19ZsLUKe638VyPDTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tleheoHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE482C4CEC0;
	Wed, 11 Sep 2024 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726070343;
	bh=Mu0KKoCsaT6sNUuTlrDEprXR1UN7pQSV8Yy+de930to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tleheoHlBWzLEDtaGqvPrvGTouLXocHZ/ahZ4s2A8HQSGtQgD7xYbZIiyHkxrsu23
	 pcpMm0jDO9ZlztkrxO45UbE7+YjucvB0BPEMuDQ/qiiAei6+qmfRBtB/1wnvW7M8VB
	 b2OTF58LmfJfO61XN0n6rEtHtDjpRQyqNhomj7EVFdF+O5nx5f+RKFLhFPIUl6pny2
	 uSm42+WaDJCzYRKZD3/yIv4R2mTrPWTjUmFU6dAOfysTwgzt/06UuXRApuXsXYtHqA
	 dySEQXc5U+AcnXYXtCSz7xhwN+NTqG3eGr6qKDW3csMnq2/VrYZ8PqHWY87ppSTN3G
	 X7tMMolBY/I9A==
Date: Wed, 11 Sep 2024 17:58:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	Frank Li <frank.li@nxp.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3] i2c: imx-lpi2c: add target mode support
Message-ID: <gfh4theygqzq4qz2ez2hdba6twtbommna7fgsk5w3bx2drgsqw@l4xj7qm67ihq>
References: <20240911150537.192570-1-carlos.song@nxp.com>
 <VI1PR04MB50055F0397031B6518E49751E89B2@VI1PR04MB5005.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB50055F0397031B6518E49751E89B2@VI1PR04MB5005.eurprd04.prod.outlook.com>

Hi Carlos,

On Wed, Sep 11, 2024 at 03:07:42PM GMT, Carlos Song wrote:
> > LPI2C support master controller and target controller enabled simultaneously.
> > Both controllers share same SDA/SCL lines and interrupt source but has
> > separate control and status registers.
> > Even if target mode is enabled, LPI2C can still work normally as master
> > controller at the same time.
> > 
> > This patch supports basic target data read/write operations in 7-bit target
> > address. LPI2C target mode can be enabled by using I2C slave backend. I2C
> > slave backend behave like a standard I2C client. For simple use and test, Linux
> > I2C slave EEPROM backend can be used.
> > 
> 
> Hi, Andi
> 
> Just now I found I still have work to do! Before I notice to need to enrich commit log only.
> Oh..It's a little embarrassing. Sorry for missing other comment. I will send V4 then finish the rest:).

no problem, no need to be embarrassed :-)

Take your time!

Andi

