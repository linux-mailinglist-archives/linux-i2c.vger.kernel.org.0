Return-Path: <linux-i2c+bounces-8662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495279F919D
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 12:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A81F3168B34
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 11:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F98D1C32FE;
	Fri, 20 Dec 2024 11:47:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEA41C1F07
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695228; cv=none; b=IpOK/DMc3b4AK9pzk2Po0NYqU72r4DFVZw5TMHlgBxhYjqz4T6w/Y7VM1VYnQtFJCxLiBiFeGbPWdMvdbsdlhpZh/qfaUbw7PRZGj6JwMPF7cXl0UHmyHJwiUzxaseF6TVJ+4KbbS9tbsNDBKODDKfF29zV6I2vJ5o982jXQVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695228; c=relaxed/simple;
	bh=qyfxmvqgHPbMu65uPtrn2Jh4bwUe3hULoZymw2CJzHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWCpdCAgYCYANLj8sJuoD02d5ob24Xc/Lp0slgHxQROWS7owq3VqV0gM5ekweYXDsruhC4QmOom+ENnfFUIXwrWqFQpdc4J6IOz4PXFQxSQaVVKgAFDOfEHn64XpmDkvoaLxti4tHdjeCDvzi75hxDzFWttAQSziHFO5ut8+QX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tObT5-0005Gt-Uu; Fri, 20 Dec 2024 12:46:55 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tObT4-004Msi-2X;
	Fri, 20 Dec 2024 12:46:55 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tObT5-00AQqo-1S;
	Fri, 20 Dec 2024 12:46:55 +0100
Date: Fri, 20 Dec 2024 12:46:55 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Carlos Song <carlos.song@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <frank.li@nxp.com>,
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
Message-ID: <Z2VZLw0RGiEA68Nd@pengutronix.de>
References: <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2Ugt8NVued0_4c4@pengutronix.de>
 <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
 <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <451e8c12-7b45-4b12-af10-63f60ba6e92e@pengutronix.de>
 <AM0PR0402MB3937E87BBDC5CEA1C51E4E3AE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <f2690b83-b907-4ade-bb9d-daa0636c6786@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2690b83-b907-4ade-bb9d-daa0636c6786@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fri, Dec 20, 2024 at 11:51:27AM +0100, Ahmad Fatoum wrote:
> Hi Carlos,
> 
> On 20.12.24 11:46, Carlos Song wrote:
> > 
> > 
> >> -----Original Message-----
> >> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> Sent: Friday, December 20, 2024 5:32 PM
> >> To: Carlos Song <carlos.song@nxp.com>; Oleksij Rempel
> 
> >> I know -110, but -12 I need to look up :) Both are cryptic to end users, which is
> >> why %pe was added on top of the existing %p:
> >>
> >> If CONFIG_SYMBOLIC_ERRNAME is enabled %pe expands to an error string, e.g.
> >> "ENOMEM" or "ETIMEDOUT". If it's disabled, you get the same error number
> >> that was printed raw before.
> >>
> >> Cheers,
> >> Ahmad
> >>
> > 
> > Wow! Looks so cool.
> > Thank you very much for your patient explanation! I agree it.
> > 
> > Also I will change the comment from your suggestion[1]:
> > 
> > "
> >   /*
> >    * As we can always fall back to PIO, let's ignore the error setting up
> >    * DMA and see if we run into errors while setting up PIO mode.
> >    */
> > "
> > In fact, other errors are also from DMA setting not from setting PIO mode.
> > So can I comment simply like this?
> > 
> >         /* As we can always fall back to PIO, let's ignore the error setting up DMA. */
> >         ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> >         if (ret) {
> >                 if (ret == -EPROBE_DEFER)
> >                         goto clk_notifier_unregister;
> >                 else if (ret == -ENODEV)
> >                         dev_dbg(&pdev->dev, "Only use PIO mode\n");
> >                 else
> >                         dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n", ERR_PTR(ret));
> >         }
> > 
> > [1]https://lore.kernel.org/imx/89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de/
> 
> Sure, looks good to me. @Oleksij?

Ack, looks good. Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

