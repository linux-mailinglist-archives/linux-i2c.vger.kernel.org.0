Return-Path: <linux-i2c+bounces-5739-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2363B95CE59
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEEC91F2181E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BB218858D;
	Fri, 23 Aug 2024 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN5sNAri"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C5A42AAE;
	Fri, 23 Aug 2024 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420917; cv=none; b=DyqWwvrNH58HSoOAHeQh89bVJar38GEsMtKIa8nqC+TTaZQe5TObje89bcgk4zeo14LaHa/XCv6GcSUpMgLQDVPF+ATKoHGvHgpPMMPhLwEGEVZRZ8wtbrJVVaiMESpzbBzkziw2Q/aNmJJCtOpOFkBTVbYl8pJfeSEnc/6bfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420917; c=relaxed/simple;
	bh=marIxUI4id/urQjGYVyABoFpJCtk9eZAhTRVhqbZCGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzodAvRHEfkJAz2nOF4FuUyLSqlAEYEXAn/HirqB0wxDBVRtD2U2ZGtLEarRKymTULs2F6H/e4HIKI9JQasgZwTOd1yFQSAeFP85Y3U5xIV8IwDciKjMCoG0CGAocSmUUG0QOaINhCcEoHOKqz4a8KUbkhNFZ/BTplziOot1IYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN5sNAri; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5bf006f37daso3364287a12.1;
        Fri, 23 Aug 2024 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724420914; x=1725025714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwrD/lbeRNRzoVUmgjpRWde1MN0URKCkPBQFtW3a+vw=;
        b=gN5sNAriRfr7FYvXaM0M3Q8RzvD8rugkNnEtgyrfMItPCb5Nwa+3Imr/RhTu6iDCXF
         6Eo9KTqrcpMwTI9mq5L6lGwvUTI89DJoFVEyT+T4hqlYgsYms64S4Wc0UMZKCQni1uum
         h8jJ4jKNrI+kRSkw/1gpxERNTNvB30xozMihIPSkwZEuf9YwqUEVLWYF+kPtc/6iWFID
         7VXB5v0uH4Voma5BsinSC1HRc10i9SLu8y7xZh+pkWu4CcgzT2fzkJVHJqB4/6sOkUDF
         l2Y/qevv+ESQj4pimGiOhR53vsK3bnXJw/FynimzbFPCKCVdme0/nqJ0fNrPzEQZiDhl
         K6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724420914; x=1725025714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwrD/lbeRNRzoVUmgjpRWde1MN0URKCkPBQFtW3a+vw=;
        b=Vr9QCh3nYzRRHTel2KNtz0iuTwUFw8tdxnj++wjhWSk1aho/hi62pjmo6nhapRoYH/
         iKFJnQQohg/olknd/nJIFqAQPmVFSuJgke96Eu5rXomdT9/2qBf/6ithPswmg1p6/q6R
         phLi38yl6DZEbo9bqkOwxvX+0G3pb7YFB54clfv7il5bk820Z6BKemvipBHjGGY9m0vv
         SgQ5COona8/njqbb3NzKLWtvMBFdg113eL01QyHgDZ/RnP+fezWhSPIAKUOW5qLn92aU
         jS8neO6Q/E6/IZLBqC/JRwKSo39WrLxFCMzSG0RxQYRxVwzznsWdxpyu90kcR/2O5gej
         fNow==
X-Forwarded-Encrypted: i=1; AJvYcCVLFB6uQKr3Zwrnz8AoGX/E39xBu8e5lS4B4Mi1mtM66oEWiDqwXi7TOBNrS7hA6mLRO1l/RPL+HHbDthxM@vger.kernel.org, AJvYcCWq7JssjmafJLleD/x8C1mffW/tLDn2lvGct3ZJxUnQ5jR7R05Vi692RtSR5wlk0hKtg1rM/SzyRLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQz2qpvfOJwapP/vQU+VitAHWatZu3xZ90+QXeDkeWCeZEgnoZ
	ArDtFg5QSsInVuqjGsOqHReaw0V0o7WtbhinSIojusYHETAA2did
X-Google-Smtp-Source: AGHT+IHd2Dy4icrEZJ3J8EXqviPjWTYhwIADABNxwIWTMxUTKe6s4D9yDboiSs3kZIrTIP397YtD6A==
X-Received: by 2002:a05:6402:35ce:b0:5c0:8ff8:d7da with SMTP id 4fb4d7f45d1cf-5c08ff8d8d6mr325127a12.12.1724420913934;
        Fri, 23 Aug 2024 06:48:33 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:48ba:80d8:cf77:1f49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c438fsm2110850a12.61.2024.08.23.06.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:48:33 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:48:32 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZsiTMITWF0Tj3o8Q@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
 <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>

Hi Andi,

On Fri, Aug 23, 2024 at 02:35:54AM +0200, Andi Shyti wrote:
> Hi,
> 
> On Thu, Aug 22, 2024 at 12:04:43PM GMT, Oleksij Rempel wrote:
> > On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > > Hi Andi,
> > > 
> > > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > > Hi Stefan,
> > > > 
> > > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > > >  		goto rpm_disable;
> > > > >  	}
> > > > >  
> > > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > > +
> > > > 
> > > > you might also want to add the multi-master boolean property in
> > > > the binding.
> > > 
> > > We discussed this internally and weren't sure when it was required
> > > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > > bindings. Is it still required if it is part of the dt-schema?
> > > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> > 
> > The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> > every thing not in this yaml
> > 
> > > If so, I will add it in the next version.
> > 
> > Yes, please.
> 
> sorry for the confusion, please don't add it. I had a chat with
> Krzysztof and I will quote him: "this is a core property, coming
> with dtschema, so they dont need to update bindings".
> 
> He also sent a cleanup to remove the only binding using it.

No problem, thanks for the clarification. 

Should I still separate the multi-master patch from the rest of the
series, even though it doesn't seem to fix the problem Fabio sees? I did
some more testing today and the workarounds he found do not solve the
problem I see, so they are definitely not the same.

Regards,
Stefan

