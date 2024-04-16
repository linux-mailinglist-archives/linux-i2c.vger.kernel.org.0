Return-Path: <linux-i2c+bounces-2983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FB8A766A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 23:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB6492819F2
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 21:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287826E615;
	Tue, 16 Apr 2024 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EydqBD4/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE014A0A6;
	Tue, 16 Apr 2024 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302428; cv=none; b=K5NOZMh5mCAKTP/t4SCsJ1yzUjMg7xASmahRRx/QzJsqTIdAAVdhp7waBBsZoHuDQte2GuErFbHl0P6Mq9mxt8pSdFKomUWmmWCd3MEwY/4mHIp6PyJYc5/1l03rIzMmX8QlFLP5nleypwWSKF2OPsKU9k4g6PGgnucpzChDysM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302428; c=relaxed/simple;
	bh=IFokjAjHlzy494mccRdVcr0RgTAmRJ8DMxWp7AMbDtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrgICFf8dpqH8AtBoatrnNfX97id+f9psyniYgZAqW0ZC68YHm7AIF7fEY6RrKWp2loMGbQtRYkbqY88dFSsKguMZQzu5Zn9ZWwm9UKArHVFRH0FjEY/gJOlwT9KTpPJHdMrfvgmrx/nNFmq6FEWrFt7uiwDIcYfnOIBLxG4/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EydqBD4/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e3f17c6491so42059295ad.2;
        Tue, 16 Apr 2024 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713302427; x=1713907227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2tnBfmY7bNLR1j1Au/1ahJSbQCEe3E2+XWTpaE2RZg=;
        b=EydqBD4/fBrPk19WKiJpcQ+U92Ab3TCx6DZfvo+cRyL7LZgQ18itqK+t3Mj34q1PWv
         cqTjfA0XGS7V3UfINK7GxHRzr2i5IhX6tY+o9cqDOgXLDriwQI9Rvs4iJufjBK7jQ+CC
         dTeMcGkvq/pwxCErq3+sstoQbMmQALpVaGoSiupZkuZCwI5Wp5QYKK551m7DYtCcJH8g
         Pq3VdV3/uQFcF/FVLzsbk+v9Zu9dFtZDnVZY0emR3qWAGk1V/7gdy674GiAL03lcILPY
         Dt3gQaEkpSXoiBNrApPpCqTbQNfuky+aoIZ9VpZTcC86Lwa3yjhs8PE9kPeeo8Fveou6
         fevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302427; x=1713907227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2tnBfmY7bNLR1j1Au/1ahJSbQCEe3E2+XWTpaE2RZg=;
        b=kg0iuNHupM8ch+mWpLc5Cc/tOWFJRArNgwiyQWoa/JSymhMPzW+7NzD+yDuFuLLE4n
         wluxfgn8fIPCZc2QspYxZVGFyrgBnD2+Hql36nePTKF+u0QZEMJyfrugASler6zsOH1J
         /P646c9oLLSrmes9su0Pfp3dQprnmY25aENb3aWwtjA2jnz+mL809pn2AIQ0Fz2Lke1Y
         2Xr5FSrpqwPo4B41ymHQvc0XgBaFNuMKILzDG6Isv2TobVle0eJD7bDbTclCvDZ4Mhb4
         sl8pqQMRl2LaFh3RxyKTPJTbVgXPMemzeX64rXqYfVC2IVKCVLnpsHc0GL9qt3tc+7KH
         e2qg==
X-Forwarded-Encrypted: i=1; AJvYcCXuYQQT8KRtlbfhkrOCtgPHO7/J2r8W5EhFLrd8vbeyxS9in+sxwBMEsvp1HN/T89YWCnIYAgSQJJcG6QHU/hKIGFnWEp3IKfSJElkEhQGe7aGiWXLYOdcU0s5LWk3MRZvgFmY149UMUtCzNI/C4G9uSAd4Z9Er8BC6SNDXKJJU3hh+Bw==
X-Gm-Message-State: AOJu0YwUbHeWYB8wVztxFpE1JB7X5a7CO0eFCsIl7hBXaD9yYojTnsMa
	3sGA8rfPNilikCgInN0rBtpKQo/hIb5G/xClYoxpq3hVn/lqrgByNLM+zA==
X-Google-Smtp-Source: AGHT+IFCHt3kPoo08Hbf6FJbz6fwSDfalTaDVDtNncFkQX9iPxjNh1orR04y0KCWHgq/Xp7rz4w3YQ==
X-Received: by 2002:a17:902:e5d2:b0:1e2:61ca:9449 with SMTP id u18-20020a170902e5d200b001e261ca9449mr15181757plf.40.1713302426742;
        Tue, 16 Apr 2024 14:20:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001e3e0a8b32asm10185701plg.45.2024.04.16.14.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:20:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Apr 2024 14:20:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
	conor+dt@kernel.org, alistair@popple.id.au,
	linux-kernel@vger.kernel.org, lakshmiy@us.ibmcom,
	linux-i2c@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-fsi@lists.ozlabs.org, robh@kernel.org
Subject: Re: [PATCH v2 25/31] i2c: fsi: Calculate clock divider from local
 bus frequency
Message-ID: <6e34260b-7d8e-4c86-9a11-6727f0c83a70@roeck-us.net>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
 <20240226165321.91976-26-eajames@linux.ibm.com>
 <q6bl7sbskt4ukd3mylfgwpo6dmv444umdpycs6xp7ozd2kv335@syeymu62fczb>
 <2474f02c-c835-4691-b531-62c8c747aede@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2474f02c-c835-4691-b531-62c8c747aede@linux.ibm.com>

On Tue, Apr 16, 2024 at 01:09:04PM -0500, Eddie James wrote:
> 
> On 4/15/24 17:11, Andi Shyti wrote:
> > Hi Eddie,
> > 
> > > @@ -689,6 +692,20 @@ static int fsi_i2c_probe(struct device *dev)
> > >   	mutex_init(&i2c->lock);
> > >   	i2c->fsi = to_fsi_dev(dev);
> > >   	INIT_LIST_HEAD(&i2c->ports);
> > > +	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
> > > +
> > > +	lbus = fsi_device_local_bus_frequency(i2c->fsi);
> > > +	if (lbus) {
> > > +		u32 clock = I2C_DEFAULT_CLK_RATE;
> > I don't see the need for initialization.
> 
> 
> Does device_property_read_u32 set clock if the property isn't found? If not,
> it needs to be initialized here. Or I can set it in an else statement from
> device_property_read_u32.
> 
> 
> > 
> > > +
> > > +		if (!device_property_read_u32(dev, "clock-frequency", &clock)) {
> > > +			if (!clock)
> > > +				clock = I2C_DEFAULT_CLK_RATE;
> > > +		}

		if (device_property_read_u32(dev, "clock-frequency", &clock) || !clock)
			clock = I2C_DEFAULT_CLK_RATE;

> > > +
> > > +		// i2c clock rate = local bus clock / (4 * (i2c clock div + 1))
> > You forgot to remove this.
> 
> 
> I actually meant to leave that comment to explain how the clock rate is
> calculated, as the reverse calculation in the code is a little more
> confusing.
> 

Partially that is because you implemented DIV_ROUND_UP() manually.

> 
> > 
> > Andi
> > 
> > > +		i2c->clock_div = (((lbus + (clock - 1)) / clock) / 4) - 1;

				= DIV_ROUND_UP(lbus, clock) / 4 - 1

Guenter

