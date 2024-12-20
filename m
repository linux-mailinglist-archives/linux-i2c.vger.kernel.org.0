Return-Path: <linux-i2c+bounces-8654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C769F8D68
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 08:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E18E97A115C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 07:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6994616F0CF;
	Fri, 20 Dec 2024 07:46:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C24741C6A
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734680773; cv=none; b=LCVgbc0PjHzNmGqM3jUqRVuu4Rz68W7j5KQiDC8EKUjgmZTZTfagntDsybnHuI3ZHWOXJ5VyXFkh6+o6nZx+Cq5dHdE/nSKW2DbeWe+hfArP6cD5118DzbfHX8FtVFCQglYGUrBlO4KJ3maXvIVmlG3QBgLmy+1bZQabZ5m6waw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734680773; c=relaxed/simple;
	bh=cc9Z4vtC4BNMXHFh4FmjsIq/FKot5DMM/IP2qX3btUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNyCMPy9og8Al0ljnalbo9zR/FmL31zH1Rle6MrxleJnVwUYMH5BWrB0kvVOt8C4ML+uKucLrNg/yVj31lVTF59ZI1p1hzr57TvS3u0MNoLTy8mg1eQp08kV+akNO54xezkLAvXoLidC1zWU2pq15JD8UTeRO/d/C3mZffYvH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOXhw-0004Qw-1Z; Fri, 20 Dec 2024 08:46:00 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOXhu-004L5Y-2b;
	Fri, 20 Dec 2024 08:45:59 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOXhv-00ANip-1X;
	Fri, 20 Dec 2024 08:45:59 +0100
Date: Fri, 20 Dec 2024 08:45:59 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <Z2Ugt8NVued0_4c4@pengutronix.de>
References: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fri, Dec 20, 2024 at 07:38:47AM +0000, Carlos Song wrote:
> 
> 
> > -----Original Message-----
> > From: Oleksij Rempel <o.rempel@pengutronix.de>
> > Sent: Friday, December 20, 2024 3:35 PM
> > To: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Cc: Carlos Song <carlos.song@nxp.com>; Andi Shyti <andi.shyti@kernel.org>;
> > Frank Li <frank.li@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>
> > Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Fri, Dec 20, 2024 at 08:06:25AM +0100, Ahmad Fatoum wrote:
> > > Hello Carlos,
> > >
> > > On 20.12.24 07:58, Carlos Song wrote:
> > > >
> > > >
> > > >> -----Original Message-----
> > > >> From: Oleksij Rempel <o.rempel@pengutronix.de>
> > > >> Sent: Friday, December 20, 2024 2:13 PM
> > > >> To: Carlos Song <carlos.song@nxp.com>
> > > >> Cc: Andi Shyti <andi.shyti@kernel.org>; Frank Li
> > > >> <frank.li@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> > > >> s.hauer@pengutronix.de; festevam@gmail.com;
> > > >> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > > >> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > > >> Clark Wang <xiaoning.wang@nxp.com>; Ahmad Fatoum
> > > >> <a.fatoum@pengutronix.de>
> > > >> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> > > >>
> > > >> Caution: This is an external email. Please take care when clicking
> > > >> links or opening attachments. When in doubt, report the message
> > > >> using the 'Report this email' button
> > > >>
> > > >>
> > > >> On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
> > > >>>>> So we make this logic. Anyway we let the I2C controller
> > > >>>>> registered whether
> > > >>>> DMA is available or not(except defer probe).
> > > >>>>> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing
> > > >>>>> happened if
> > > >>>> DMA is defer probed or not enabled(This is an expected).
> > > >>>>> However we still need i2c DMA status is known when meet an
> > > >>>>> unexpected
> > > >>>> error, so we use dev_err_probe() to print error.
> > > >>>>
> > > >>>> Why dev_err_probe() instead of dev_err()?
> > > >>>>
> > > >>> Hi,
> > > >>> In patch V2 discussion, Marc suggested just return
> > > >>> dev_err_probe(), but I don't accept it so I choose to use
> > > >>> dev_err_probe() to print error in V3.[1]
> > > >> In this case, the two APIs have the same function, do you mean
> > > >> dev_err() is more suitable?
> > > >>
> > > >> Yes, dev_err_probe() should be used in combination with return. For
> > > >> example:
> > > >>   return dev_err_probe(...);
> > > >>
> > > >> It will pass the return value on exit of the function and
> > > >> optionally print of the error message if it is not EPROBE_DEFER.
> > > >> Practically it replace commonly used coding pattern:
> > > >>   if (ret == -EPROBE_DEFER) {
> > > >>     return ret;
> > > >>   } else if (ret) {
> > > >>     dev_err(..);
> > > >>     return ret;
> > > >>   }
> > > >>
> > > > Hi,
> > > >
> > > > Get your good point. I will change my code in V6:
> > > > +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > +       if (ret) {
> > > > +               if (ret == -EPROBE_DEFER)
> > > > +                       goto clk_notifier_unregister;
> > > > +               else if (ret == -ENODEV)
> > > > +                       dev_dbg(&pdev->dev, "Only use PIO
> > mode\n");
> > > > +               else
> > > > +                       dev_err(&pdev->dev, "Failed to setup DMA,
> > only use PIO mode\n");
> > > > +       }
> > > >
> > > > I think this is what you want to see, right?
> > >
> > > This loses the information why the error happens (ret). Using
> > > dev_err_probe even if no probe deferral is expected in that branch is
> > > perfectly fine and the kernel-doc even points it out:
> > >
> > >   Using this helper in your probe function is totally fine even if @err
> > >   is known to never be -EPROBE_DEFER.
> >
> > Thank you for the feedback. While I recognize the benefits of
> > dev_err_probe() for compact and standardized error handling, using it without
> > returning its result raises a red flag.
> >
> > The function's primary purpose is to combine error logging with returning the
> > error code. If the return value is not used, it can create confusion and suggests
> > potential oversight or unintended behavior. This misuse might mislead readers
> > into thinking that the function always returns at that point, which is not the case
> > here.
> >
> > In this scenario, using dev_err() directly is more explicit and avoids any ambiguity
> > about the control flow or error handling intent. It keeps the code clear and
> > aligned with its actual behavior.
> >
> 
> how about this?
> 
> +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +       if (ret) {
> +               if (ret == -EPROBE_DEFER)
> +                       goto clk_notifier_unregister;
> +               else if (ret == -ENODEV)
> +                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +               else
> +                       dev_err(&pdev->dev, "Failed to setup DMA (%d), only use PIO mode\n", ret);
> +       }

Please use human readable version of error value. In this case it will
be:
  dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n", ERR_PTR(ret));


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

