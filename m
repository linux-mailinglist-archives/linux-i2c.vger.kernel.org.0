Return-Path: <linux-i2c+bounces-8632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCEA9F7990
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 11:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF21818961BB
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B8E222D5B;
	Thu, 19 Dec 2024 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5PWR4JB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95949221DA0;
	Thu, 19 Dec 2024 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603942; cv=none; b=EpskPgP++/M8u2NR00lBiQQ5cRh1JHCm+vTSMfzsRIJPdeBX/mSlgGJX3rTV6qgapWgK6WAZW6CPdh5VAIOqZWTotvbgaeyhwSU4ifB/eLRO/yqUVocX+9nPFv6paHqB6C05NxGWiw5K2T79l636QptdQuokRS0rqo/xsapZT4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603942; c=relaxed/simple;
	bh=sOajlXr03gCO837sr0DFIcJPkyWadXfKtuB8F1ddqSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+DM8mAw8yu2lzL+eNkWFBysFHw/+vFSwHof4+0ExdCq54qHfElSuShe1Tjch6gVan9olz0lLIzLNe/r43zfNGxscUAjbm4U2rZ6L6US+MluwbQVVYAHz6SCqqU2vB99ABw2899zUOmXlzp7ngMvcquSCGFoHJ1uIqkI1fLOvTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5PWR4JB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CE2C4CECE;
	Thu, 19 Dec 2024 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734603940;
	bh=sOajlXr03gCO837sr0DFIcJPkyWadXfKtuB8F1ddqSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5PWR4JBUIJuWd/fafdoEaGj6mheDRaqR7fH3Npq1gTBx9ZClTfCs8fPRyBk0MXgt
	 z14xPffVBtqgPG5RsnV1SVCp1iS13JdptWa0U0Usn6qhw+O0FHwQPF0gNDGPkwnxA4
	 87YSU5pvDCSaj0uANSmRCs3rD3X8UnCsRqTOyxoS4uo8tkCB3bPtIiiG4sa5RNQmcv
	 ZW55izRDY+883+WnPBqgVksFdALvRxWI6BXGmopJ8eG/XHYYkRqBpPVtuUIBGMI53A
	 Bt7IM2gE8MDWT8O6MNkFijxnQUq9msee/FsbHrEtjbDPl4EERatTvUFtRqw+ddQJks
	 /TSY2dSmL9Wug==
Date: Thu, 19 Dec 2024 11:25:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Frank Li <frank.li@nxp.com>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Bough Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Message-ID: <brzvlpspjm66awnkshxvw7xefxxjbjx5v5mhqd3jl7befx33fy@mfi3pbagfy7a>
References: <20241218044238.143414-1-carlos.song@nxp.com>
 <Z2O1PFr4ZQHXTsrX@pengutronix.de>
 <AM0PR0402MB39379D10473292DA6533A757E8062@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39379D10473292DA6533A757E8062@AM0PR0402MB3937.eurprd04.prod.outlook.com>

Hi Carlos,

> It will be this in V4:

no need to send a v4.

Andi

