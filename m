Return-Path: <linux-i2c+bounces-5630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B495A141
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 17:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6253B20DCF
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 15:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ABA1494CC;
	Wed, 21 Aug 2024 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euH6vnec"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18E31C687;
	Wed, 21 Aug 2024 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724253810; cv=none; b=en6k7DvmUw1EPKc2ZqpYxGnAXj3o/iOKEaicXx9U20QFAFtOuKnZoS4VW62/1iToPTyYQdDYdM+4Bds56DvHiT8vha+26DRmDCJW3mbgrkKqP0BJYORZV9TeNoJQGyX8zuNgXZZLYOIFFl+HeYvsdloJK4UJOIoz5fY3kKRIfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724253810; c=relaxed/simple;
	bh=/ls9kAQ3NNeEjTNKhldR/IHMKF6SMXPYY3qSznxb/f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB1OqGyLgIEySPAcJwxxcrr/1vpNY09rlnVu35LJl+BT6lVsDV60jaEyrwmRunvrD9UvIhuMY2f8hGoe8W0OG6xLILYWB9lVnrlL2sk+2Edk7KhZEC7ecORcjWMUa4p73rCOTLt22UQSfby7ey0P2sQRP6kHzTZQX+09rxXjLzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euH6vnec; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso74766025e9.2;
        Wed, 21 Aug 2024 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724253807; x=1724858607; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=on58eBktu8//MnphFE6QbfO4BlqhK86yb9Y44C2uYzo=;
        b=euH6vnecSE2/p67dplkJHU/YlyPVN8ENK+idYLG51hgUSjDyB50FgPN8K09/iO19vL
         0FgkbF+zhm8Vi/pzRdlIE7iYRKPdRp4A1NeXgrNhASWr3tPaKFq5YAJlO9U8SgtZ66LZ
         6CGMHPkev92dfW9MBOZOmzDBlqwv5b3jERrJZrLZxxvoRzD9bpKEMzmVuSXN5Vi0sR40
         fktxn+uBlowztrqCWCXRD8aO1Z12VM0G/bguOrp9CVY07VbXcjkAD/gUemxzSmaP7xEF
         zvejeRihNJOmGMVGiP752Zq7oIW51XxxsIggAGNa3FGj5Z5EhX31rmsvyHMS6zz5NjTA
         7h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724253807; x=1724858607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=on58eBktu8//MnphFE6QbfO4BlqhK86yb9Y44C2uYzo=;
        b=BJpgepP6DBPFm+IlGO31meg+SrsmdRjodlIpVlPX4FaUcyF9R/tlLKzy3W3bAzFKiY
         Hr3cuYU/RqiUMCwdSD2ltkkAQhp8Rddxx7WseBfAQ3uFzcpznkl86f4zjTKWIzb3cjFe
         0v7vZ70u2m0SxodIXHVZETOVz0y/9xtaqwZ/V0+Le/0IxdSbWrIwHekHFh3ICVoyVcjC
         Jtt25RKPm6y3aBwwy5OayYnzE6mSI78BbEIfWnsev1+MZQDNEufjj2h53ol7zd1oBOfd
         RHQUEWZ3+fYjGhlT3ISQ/VX5vjODpp8AMm4vlwhpJHSmq58ULbgbWbIl994GrSP6HlXk
         dw4w==
X-Forwarded-Encrypted: i=1; AJvYcCV2anqWPr3ebca3iIOLqMwTWGfy6LQQmHmPgL6dHWVtgfZk88gBt8LWVs2AL5ywd7Qo5ZhqJejWC8g=@vger.kernel.org, AJvYcCX96tYvP2KI8D4m4PYMs+zYRxzWfjQNieBFsdmDLcwWCh9O6Q3HLXmx3ucsdCOsFJSRu32yPs9bcqilDnJw@vger.kernel.org
X-Gm-Message-State: AOJu0YwUp5977dR0CtbCAHubCljE62Cwi7dkpUD6vvikmjm+HMaH+jGB
	ggk6g1T/eKyinoc54HVW0pO1duYHIL+oi3Bpz4UXhD94IXuN+o5I
X-Google-Smtp-Source: AGHT+IG1ZzxG35cV4xa41v9iY/LRo3Z2DG4I6ZnhNmHSYUOwELUQafq8+lrzs83TZ5LK5Kr+B1jzwg==
X-Received: by 2002:a05:600c:4444:b0:428:f0a:3f92 with SMTP id 5b1f17b1804b1-42abd2265f5mr24916965e9.21.1724253806602;
        Wed, 21 Aug 2024 08:23:26 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:ce3a:abb4:426f:fe4a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef9f5b9sm29583395e9.29.2024.08.21.08.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 08:23:26 -0700 (PDT)
Date: Wed, 21 Aug 2024 17:23:24 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
	andi.shyti@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZsYGbN36jwxyMAvE@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
 <ZsX8KzkQw0wJUCbc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsX8KzkQw0wJUCbc@pengutronix.de>

Hi Fabio, Oleksij,

On Wed, Aug 21, 2024 at 04:39:39PM +0200, Oleksij Rempel wrote:
> Hi Fabio, Stefan,
> 
> On Wed, Aug 21, 2024 at 08:01:20AM -0300, Fabio Estevam wrote:
> > Hi Stefan,
> > 
> > On Mon, Aug 19, 2024 at 4:20 AM Stefan Eichenberger <eichest@gmail.com> wrote:
> > >
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >
> > > According to the i.MX8M Mini reference manual chapter "16.1.4.2
> > > Generation of Start" it is only necessary to poll for bus busy and
> > > arbitration lost in multi master mode. This helps to avoid rescheduling
> > > while the i2c bus is busy and avoids SMBus devices to timeout.
> > >
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > 
> > This fixes a pca953x probe error on an imx8mp board running linux-stable 6.6:
> > 
> > [    1.893260] pca953x 2-0020: failed writing register
> > [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
> > 
> > Could you please add a Fixes tag and Cc stable so that this can reach
> > the stable kernels?
> > 
> > Tested-by: Fabio Estevam <festevam@denx.de>

Thanks a lot for testing. Are the other patches required as well or did
only introducing the master mode flag solve the issue?

> > 
> > Thanks a lot,
> 
> It looks like with this patch, the I2SR_IAL interrupt is not cleared.
> I would expect some kind of interrupt storm. Can you confirm it?

This is a good question. i2c_imx_trx_complete was never called in the
interrupt handler. So that would mean the storm would already be there
before just for a shorter time. We only clear the IFF flag in the isr.

> This causes a processor interrupt request (if the interrupt enable is
> asserted [IIEN = 1]). The interrupt is set when one of the following
> occurs:
> - One byte transfer is completed (the interrupt is set at the falling
>   edge of the ninth clock).
> - An address is received that matches its own specific address in
>   Slave Receive mode.
> - Arbitration is lost.

Unfortunately, I don't have a device that uses multi master mode and we
would only see it on such a device. However, also from the reference
manual:

> IAL must be cleared by software by writing a "0" to it at the start of
> the interrupt service routine

So most likely it was wrong the whole the time we just didn't see it
before, could that be? I think a fix would be relatively easy we have to
clear it at the beginning of the isr but after we read the status. I
could add this to the series if you agree.

Regards,
Stefan

