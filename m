Return-Path: <linux-i2c+bounces-10665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4D5A9F949
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 21:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB09616ABA1
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 19:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711971FECB4;
	Mon, 28 Apr 2025 19:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSRI3GkU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EC686359;
	Mon, 28 Apr 2025 19:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867834; cv=none; b=QzOuuV1arEDoblHHkrecLP+8hdTgPQuvPu+20zQysOJL4DKakduv+Alk0kAE9167uHTxJfMjdeT0USRW8cuwUUJfhDCj5qgVjJSKXst1otXCeCirAgRJmlGjMOnFbPolEL3UIi5HVmhT2gvBraBNoYRV36kgoaiL5lDRdovYeqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867834; c=relaxed/simple;
	bh=+Pt11UMRuRnTvhbLia21GdJOsV7PGpiNDBc9vcqLQvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5336WjmhDuwCSUY1f4gLoN83TaYDAqWHKX4Kt313sVubCCWvoRb2tJfbrZQddAxRojiSUJsSOeKxuTjbecRhjpXOT45zGJ9pskCCd/P9jbLX0tL1aOHXSL2MA2WGGGmKSZGUzDyMIatXPSVu7L5zhmAoSR3Vb8ih437zBmlVL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSRI3GkU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1554BC4CEE4;
	Mon, 28 Apr 2025 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745867833;
	bh=+Pt11UMRuRnTvhbLia21GdJOsV7PGpiNDBc9vcqLQvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSRI3GkUAhCCiZj0WUU80xHJQT+SghGms4KZcVH/xrqsDa1/Gu/BIzMPU1MfKWyTd
	 IjheCLi4QmgirILEewftqYgZDqgwKZnSvLDLfog3cgvYiXvKQXWVE36+MQ8AgLpvlA
	 HI4AQ0AYcXl3ZCWySwGV6Nxi2T/+6nSlzjimx29GiWwtyEW2xaE5zEphUfBzaz0/jD
	 vhTPFJemxn5ql1wx52r3vsuMEG1klAv2Trw5xbcw7+GCBw0SGebkN+tytD5MzibpTx
	 DnqstA4gBIlT+tu7lMOvgb9z7nWMMWEq6eM3P1yW4UHf8NbF1FYAud3qF0d8hA3tf/
	 NdwEuMBJS4kTw==
Date: Mon, 28 Apr 2025 21:17:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <l7meopd4ny4lbux64w5jgyugza3idt4sabwzojmvrafw67fhsw@uf4xbbajzfrj>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
 <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>

Hi Carlos,

> rpm_disable:
> 	pm_runtime_put(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
> 	pm_runtime_dont_use_autosuspend(&pdev->dev);
> 
> pm_runtime_put() may not work really sometimes.
> 
> [    3.203715] imx-lpi2c 42530000.i2c: defer probe
> [    3.208324] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
> [    3.214801] imx-lpi2c 42540000.i2c: defer probe
> ---> (No lpi2c_runtime_suspend callback(pm_runtime_put() is not really wrok))
> [    3.220672] imx-lpi2c 426c0000.i2c: defer probe
> [    3.225248] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend
> 
> After apply this change:
> rpm_disable:
> 	pm_runtime_dont_use_autosuspend(&pdev->dev);
> 	pm_runtime_put_sync(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
> 
> all issues gone.
> [    3.093025] imx-lpi2c 42530000.i2c: defer probe
> [    3.097592] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
> [    3.104281] imx-lpi2c 42540000.i2c: defer probe
> [    3.108858] imx-lpi2c 42540000.i2c: lpi2c_runtime_suspend
> [    3.115278] imx-lpi2c 426c0000.i2c: defer probe
> [    3.119818] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend

Thanks for the explanation. If we lose the count here, I think we
also need for the Fixes tag, do you agree? Should we add:

Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
Cc: <stable@vger.kernel.org> # v4.16+

as well?

...

> > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > > Signed-off-by: Jun Li <jun.li@nxp.com>
> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > 
> > Carlo's SoB should be at the end of the chain. Should be nice to know what these
> > are, though, are they co-developed-by? tested-by?
> > Why so many SoB's?
> > 
> 
> This patch author is not me and they meet similar issue at some boards(Vague history), now
> I meet this issue at new SOC again. I think this local patch is helpful and looks reasonable.
> So I send the patch to community adding my SoB.

So Clark has authored the patch and you have sent it. And your
SoB makes sense (even though, your SoB shoud be placed at the
end, because you sent the patch).

Juan and Haibo have tested it? Reported it?

A practical rule of thumb for tags is that they are placed in
chronological order, e.g.:

 Reported-by: <reporter of the bug>
 Fixes: <commit that introduced the bug>
 Closes: <link where the bug has been reported>
 Co-developed-by: <co-developer>
 Signed-off-by: <co-developer>
 Signed-off-by: <developer>
 Cc: <people who should be aware of the patch>
 Tested-by: <tester>
 Reviewed-by: <reviewer>
 Acked-by: <someone who agrees>
 Signed-off-by: <patch sender>
 Link: <lore link>
 Signed-off-by: <maintainer who applies the patch>

If you notice, more or less things are in chronological order. I
hope this makes it a bit clearer.

Andi

