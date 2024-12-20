Return-Path: <linux-i2c+bounces-8649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761A9F8C7B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 07:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B424516C2C7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 06:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BB519D897;
	Fri, 20 Dec 2024 06:13:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC919C578
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 06:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675183; cv=none; b=AzZ9rtgmjFjdxznXNRiNBrR0qTXBAffn7ND//iK/cy0gvX30KJyVgcQHCLrJd5/D+NHRS6lcKl4Ls8Cqd0hATDKm65GMJm1uIP3yKrFd5BVgWzet22gATKxoF0Df6PByKXLsThYsipe4iJbpaQAdWXfI9I+UqKwgGk6O1tleXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675183; c=relaxed/simple;
	bh=BUf8yu9L7g3vHlkDBpNNG40Xqnz5Op0dlB85KJjv/xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUWvF+wXKDY4hBQPaGQ5Qz1vMTmblA1sa8yNm//ZxGpkS0Bau4tjfgvgSyalPpg5DAujeRfnf4cpUKT+CVxWjKZejow0VWP+jEEital/TXISdbDRbX8tQK7Zm6+jDj3n8taaF9KFR6pqJe6wBGqvLcxHEMoihc/ejw8CZsuMdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOWFn-0000a5-09; Fri, 20 Dec 2024 07:12:51 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOWFl-004KXK-2y;
	Fri, 20 Dec 2024 07:12:50 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOWFm-00AMqK-1s;
	Fri, 20 Dec 2024 07:12:50 +0100
Date: Fri, 20 Dec 2024 07:12:50 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <Z2UK4rMxrtNsPw5V@pengutronix.de>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
> > > So we make this logic. Anyway we let the I2C controller registered whether
> > DMA is available or not(except defer probe).
> > > Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing happened if
> > DMA is defer probed or not enabled(This is an expected).
> > > However we still need i2c DMA status is known when meet an unexpected
> > error, so we use dev_err_probe() to print error.
> >
> > Why dev_err_probe() instead of dev_err()?
> >
> Hi,
> In patch V2 discussion, Marc suggested just return dev_err_probe(), but I don't accept it so I choose to use dev_err_probe() to print error in V3.[1]
> In this case, the two APIs have the same function, do you mean dev_err() is more suitable?

Yes, dev_err_probe() should be used in combination with return. For
example:
  return dev_err_probe(...);

It will pass the return value on exit of the function and optionally
print of the error message if it is not EPROBE_DEFER. Practically it
replace commonly used coding pattern:
  if (ret == -EPROBE_DEFER) {
    return ret;
  } else if (ret) {
    dev_err(..);
    return ret;
  }

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

