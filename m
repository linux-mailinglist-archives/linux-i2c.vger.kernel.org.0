Return-Path: <linux-i2c+bounces-10673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A4AA0524
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 10:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6813B3FF2
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 08:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EE82777ED;
	Tue, 29 Apr 2025 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvUVuPtx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF311D61BB;
	Tue, 29 Apr 2025 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913692; cv=none; b=d4YyvnPvcPQaPenVhzZFpi1lhOKqEIRsp5XM8o0XwkhUP4PCUCYNm8fdS0BPio0FLsZ5gkWhaPVKBaHABKuIBIOc3wM2dnejpAlO1FUWicIrKVMWVtMVHskhhKFdjCCgdq5bPuEd0ZgI72XJILooXa4c/mnRpjOeOd0jL66L+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913692; c=relaxed/simple;
	bh=49svtWM+2GeOt+mimbaMb6SDg+mNR+ZgQRqnV3/67CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpHUIFKRl7PqSM/WEKGog5Ngpdbjuqn80ckK0E8DLeJbMqDeUBeR91qHyc0KO4rB6vFozyemALjhbYp9btD3FeF2zajX/b9WVQ69B6i8DtWRDhXcbA89GZxP84gKXFJnmn88+qWTzm4IMPXtkYHemjRVOWlDH64Ic39jpD/f4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvUVuPtx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A2C4CEE3;
	Tue, 29 Apr 2025 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913691;
	bh=49svtWM+2GeOt+mimbaMb6SDg+mNR+ZgQRqnV3/67CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvUVuPtxmt/mfErMJF541vpOKveOI7HD+7wWkMP+fH1HS9XJX/eugU1TXt9zxbE5g
	 D90PH3yLExF91XqvbvpKqLWqQVY4QcMzGi5C9pKvdzkjcE/8CaUkaI4Xlvq2jGTp7O
	 zyi7og9KJ30uEeL2Zyua1egy75nVGl7ZqlCC7x6+09gK8Tjo1y/6cBDTHbFdpYkUA4
	 QdH8rotxb6aXpotf0PKObw6CXIaqcyIVmhBev5Oj1AfYxz5RZk0zj2C9ZihOlXbYjF
	 4gii7N0uda7o0M5lPeOnP/Wtr6AeuApalcy6jBiTdci5WDDEGGam6w5UJiD4U4C0MF
	 A1dy3m0ZmB0Aw==
Date: Tue, 29 Apr 2025 10:01:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <yk4jxzsraqacrzinn34bvpalmnqxfyxrxch7buz62olt6allcx@rqda6tysnbhh>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
 <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <l7meopd4ny4lbux64w5jgyugza3idt4sabwzojmvrafw67fhsw@uf4xbbajzfrj>
 <VI2PR04MB11147FAC0E3941F672ACCA47CE8802@VI2PR04MB11147.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB11147FAC0E3941F672ACCA47CE8802@VI2PR04MB11147.eurprd04.prod.outlook.com>

Hi Carlos,

...

> > > > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > > > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > > > > Signed-off-by: Jun Li <jun.li@nxp.com>
> > > > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > > >
> > > > Carlo's SoB should be at the end of the chain. Should be nice to
> > > > know what these are, though, are they co-developed-by? tested-by?
> > > > Why so many SoB's?
> > > >
> > >
> > > This patch author is not me and they meet similar issue at some
> > > boards(Vague history), now I meet this issue at new SOC again. I think this local
> > patch is helpful and looks reasonable.
> > > So I send the patch to community adding my SoB.
> > 
> > So Clark has authored the patch and you have sent it. And your SoB makes sense
> > (even though, your SoB shoud be placed at the end, because you sent the
> > patch).
> > 
> > Juan and Haibo have tested it? Reported it?
> > 
> 
> They are local reviewer. So I change their Reviewed-by: to Signed-off-by:.
> Simply you can remove Jun and Haibo tags only keep two tags:

I see. Jun and Haibo are welcome to review in this list, if they
want.

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Following the chronological order concept, it would be:

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>

:-)

I'll take care of it.

Thanks,
Andi

