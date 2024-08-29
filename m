Return-Path: <linux-i2c+bounces-5923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE97964265
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 986BC285FFC
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EFB18CBF8;
	Thu, 29 Aug 2024 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="b4mqiO05";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="o5cjZqEF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A62189B95;
	Thu, 29 Aug 2024 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724928934; cv=none; b=HeQCroaAV8gTZI9igUWCQ2FUqk+IJnw2DUWrMhM0lZeCrTn8iJQ0Z0NRgeTXGVqy/r8VF532w+BlMqTK7wLDjKd+7ov96+8r/LSsIa+jtQ2WhGB//1swgNiVnd8LC+WWy4djjvLsEdRA6KoElq8LzKmwcoHN9qJjjCO5lo4T1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724928934; c=relaxed/simple;
	bh=ejYdjNgSbAx5OYv2qyLkgoU1l5jP4SBPh/grlWEaEW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mp8SAb3Pnu2ZyNXdKg+Bw4U/KE2a0sVy/KMBca1JldGYvRJ/wEFV1Suj7HVMnUe5u3wK+PKX6oCswm0pqPo2jnXPynC/2GvK+AThPan2H0I+bMYQKFWRejPp1kS9wHNMAUpjDsVRBd2xmc+Ms+gN8LIDKG9oMvDCVxRa8fWsyjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=b4mqiO05; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=o5cjZqEF reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724928932; x=1756464932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oWzcDmjgkJcSg2wpZdI3SiGft3f6OnhQjayTMf0HJ38=;
  b=b4mqiO05RjG5zzvaLPatwU4zy/lOW2/03POvr5eT7RwbsIO6Tdg1UUG4
   S9q4fysDEbzp7biugiA2JSCH1x2SyEE5cE/YzTMhyMz0N1whu7r/F60kG
   9xZC3Umf0GfMmZIdvnGMWQI+0AjQv8o7DuntbpUoRQuGdru4ZJ1LVF4NS
   hL8/dHToU0cQuttVNA2xSx5zZM8tGTZgvmGOzEBS1UkSGXzdOWfqKcLgi
   BT0+1pVr4xm0bfgqvBjtCB+mz5KHQq94VgeHAbJPMQNgvd5pfijaNPqT7
   6QEd0spirzSGVZGJBZZQdzeMFubH+kff26zmunWXPqSlXwbumCTU4mIHa
   A==;
X-CSE-ConnectionGUID: IxpUcI0TR6CUshZtug8O9w==
X-CSE-MsgGUID: 1JdaoTtdS2Geeh9lZqbFog==
X-IronPort-AV: E=Sophos;i="6.10,185,1719871200"; 
   d="scan'208";a="38657106"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Aug 2024 12:55:23 +0200
X-CheckPoint: {66D0539A-E-22BB8E18-F5F6D0B4}
X-MAIL-CPID: 0FF3B4A887F5D6DA561B29681486B5BB_5
X-Control-Analysis: str=0001.0A782F1D.66D0539A.00DA,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02E45165A3E;
	Thu, 29 Aug 2024 12:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724928918;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oWzcDmjgkJcSg2wpZdI3SiGft3f6OnhQjayTMf0HJ38=;
	b=o5cjZqEFPmxCCUoClAnK46MIX62MOzhLPNdveJPyKyS6+3pAUL4sTVLt09QJKZZcTw5qjb
	Qc0Ol2HPwKTFgnwvAF6D2sSEgmba7IF9QS4QmHV7dDIuDJuUZ0BWHsva35bTD4tTnQoZuq
	MFWtDUNhEVWXBkZYqHAHSVMxTtw7yLlgm0m9Ew5+1rQ89nZ5pnWpxngesbtN5Ezm9oUNEM
	hCQmVTYiliiI+Z5z77dn1Jdkcv8K+Yh2aTvBOG1TKZQoBYaBC6PzplDaDnvr81XfbMiv62
	ZdpNRDGYTNwo9PTnA1WnHMv/H5PXpoeXys5jmWsUyzkJRvCawXrZICRruKIYrw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, carlos.song@nxp.com
Subject: Re: [PATCH 5/5] i2c: imx-lpi2c: increase PM timeout to avoid operate clk frequently
Date: Thu, 29 Aug 2024 12:55:16 +0200
Message-ID: <4375906.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240829093722.2714921-5-carlos.song@nxp.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com> <20240829093722.2714921-5-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 29. August 2024, 11:37:22 CEST schrieb carlos.song@nxp.com:
> From: Clark Wang <xiaoning.wang@nxp.com>
>=20
> Switching the clock frequently will affect the data transmission
> efficiency, and prolong the timeout to reduce autosuspend times for
> lpi2c.

Efficiency as in throughput or total time per transfer? Do you have any
numbers?

Best regards,
Alexander

> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index 210d505db76d..cc5e5d96aacd 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -129,7 +129,7 @@
>  #define I2C_CLK_RATIO	2
>  #define CHUNK_DATA	256
> =20
> -#define I2C_PM_TIMEOUT		10 /* ms */
> +#define I2C_PM_TIMEOUT		1000 /* ms */
>  #define I2C_DMA_THRESHOLD	8 /* bytes */
> =20
>  enum lpi2c_imx_mode {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



