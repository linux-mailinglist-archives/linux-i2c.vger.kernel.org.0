Return-Path: <linux-i2c+bounces-6405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43942971A3D
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E253A1F23834
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AF71B790E;
	Mon,  9 Sep 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liqnPCl/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3B1531E0;
	Mon,  9 Sep 2024 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886968; cv=none; b=Cs6et+Zx+rnl7ssxxZwu5Y3B4pP2qDpDsPrO86zProzuORkxvKlZCfjHdiQN8UdguHrckefq2xYjkvt/EeCAs0sYWOczLRJtY3E5wu/vB0gDF10jQdJRwxZ0QJQZR/oKNHWOF/6rDqNERE3J7do4+hwgXZiA7fjPaMOoqUgSizk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886968; c=relaxed/simple;
	bh=U1fBvcEDyYes0x/y/3PvNgCb6D7pIlY+q6adWlCP03M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGYosD1ZuVfZ+Z76FRuiS53FAqG9dwy5aV3WYltnPzks7hCdTbIVyNFrc+apIYhRbpuhBbjhjFAZH+BfOMl7U76Xm4COwGLP+Xf2TCVIcGYAqOgIuhmwavnzGfz1J8hCMocZQDrF94QbZK/L4VJDRCsM8xKfJftH9CF13Z2fCH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liqnPCl/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32476C4CEC5;
	Mon,  9 Sep 2024 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886967;
	bh=U1fBvcEDyYes0x/y/3PvNgCb6D7pIlY+q6adWlCP03M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liqnPCl/Mehmu6EMYCO8T26EoGWzex4mpcd5mYoCnR28EeOxbiZuKKFxUnl3Yzvsi
	 k87ioVjvz6dwtXrN9W5JBUJDuyR+Mb3dzL9B+2BFBjKLp01ilA59ttTxRIZ4GNnkyY
	 tJHca4VjW0VFnDvnxpXXmfhn8kSHPqm++y3BldlSdVNO3ENCJkctdb/x18WGv0wpRn
	 dWQsgDELuWoLSDeJU1lyzK8wxeYcDps17lXAGiMAHdTbIw48ORqteaV1bNS2GzQtrQ
	 p06xlNLU3qsrp61z9+IwS/ALmHyv+d5/jvjUd/HToVrRa0eW2MjB330SuZCUcSGOYx
	 2p16Cla8frMwg==
Date: Mon, 9 Sep 2024 15:02:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] i2c: imx-lpi2c: add target mode support
Message-ID: <mparghzphduh5ajf5czdf7nxqtvki2uqqcnuetbxwu6x7zt5eu@e5fi5ziifmxd>
References: <20240829105444.2885653-1-carlos.song@nxp.com>
 <qcoguhxtkwn2aowtccfybutn6xgzrqvhdob4tzericerpfntfh@q6f5upgegba7>
 <AM6PR04MB499944C16813C1A88A3840F3E8992@AM6PR04MB4999.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB499944C16813C1A88A3840F3E8992@AM6PR04MB4999.eurprd04.prod.outlook.com>

Hi Carlos,

> > (please, next time when you send a series with more than one patch, include a
> > cover letter).
> > 
> 
> Yes. I will do this in the future. Thank you.
> 
> One thing bother me, for other patches in this series, I plan to separate this series patches
> and send them out in different series(maybe it looks like I dropped this patches series, later I will use other series).
> So for this patch, can you accept that I only send this V3 patch fix without other patches?(Later other patches will send out
> in other series separately, one patches series for fixing one issue).

fine with me.

Thanks,
Andi

PS I have other patches from you to review, I will provide an
answer tonight... sorry for being late.

