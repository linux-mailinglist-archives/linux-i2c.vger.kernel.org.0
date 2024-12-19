Return-Path: <linux-i2c+bounces-8629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EF9F782F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7701B7A3D01
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 09:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F08221D94;
	Thu, 19 Dec 2024 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zcakyx+U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3237157A72;
	Thu, 19 Dec 2024 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599951; cv=none; b=TBO7tw4ic/yHH8hnfVAiv5mJpjf+T2dZbdx013ap7eetlUIdrIQypWgQNqNlBYv5QzhgJSBhljU6j6szU5yqbKEfq6fvT0le6GRMlb+icRN3rnnyLTBIB3amoSk7N0rgKIQpPqIt4nHF3dYmyJw2wQu5rBQnedORlCcU70Y38t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599951; c=relaxed/simple;
	bh=2pzXg6r8WcLgdnkjujmPrNasAAtlDRtHlv676oVeFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLpPpzBxALZ4e4wp1OPouH8NP68lvdt/vxzJVYfeAoc0xqH65MtHIU7s/baQBvtBQAXF4UhKN/xzwftpIZm9F01WHNvJUQE6SV0/mr9YwWdVnB30NG9veJuaVFZsjAlVQLivkxpfEgyEplz0TnlWcsd9XU5tu0HkTGesBvQ9lCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zcakyx+U; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361815b96cso3561305e9.1;
        Thu, 19 Dec 2024 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599948; x=1735204748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=euiOK8NNPzupxLdx+tbLr1TI8FnBjorvwfESAZao6H8=;
        b=Zcakyx+UW08xUtsV8zv/a7TTaBq2czmQx31MoAdnM4MbmOb72JIcZv2NBYT7ecq3D+
         rX8fhnodFKEahxb8VkmJ8rYBvxBxY6+d8/M6qD9Ormz6eucCsJdN31sGrs00SznCk5/X
         ZYNHrgD3rrmTKVaCbYgRhLK5Y/tHwlJpQQY5fsr4q+2NYhf8J5sBNVjjZqeD35mOOmbj
         g4gLh1fTimhbog1uZKEwTi1KXyt/+ZXkbkcSRHGo6mx/mWV/Oc7xcMR6QxiuNCEBK9Yc
         PJSeX+4H+OfqLrDB6F9ASMTxHpvoptD+coa3zmCvU2ZbzaA9uu4jVo8mmmPW4BmhU+19
         qVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599948; x=1735204748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euiOK8NNPzupxLdx+tbLr1TI8FnBjorvwfESAZao6H8=;
        b=Pxgc1VENSaBpi4UiHmhTyfLohwg5Lke9rctk6RYVl9Co5PqKnuvRD2//d50llJUBbu
         YytNNGbF6tVcrXh+67VXo4DfbptEiEruTVDwKxw4SR+K9BScbeHPmOkXKF8RiwLHAAxc
         2CAHHGVkVo9vMibeRyMttlj8c23PrOOgUP4iEFbvrEI2wrouHYay6WM+v5dO9n0cvmZb
         LIeTjkM54WWz8vNTuXefiUOKkyMLs4fvoTwv4T/IiIQ6n/fnsVYsS4s4jEmo9UgrUV4D
         IkRVFnhnpEpGgyk2B06cCSZPqmzin3rXqMYYHXcJs2kvPGMguh4bcj1Z5NxGigCVSzKV
         hxNg==
X-Forwarded-Encrypted: i=1; AJvYcCW642PpjlgabFRKNuRdtIcwq6u20He7o7C8qVVAzyNrerKiF/5Q0GyshdkpZSDPhdExetLhro+AENo=@vger.kernel.org, AJvYcCXKJK3kCNmfb4gHG5T1bW5Da7MNOJr4wPguEIDsaaTtGjiPb5/l4Z+PAHXAdX5garq0Rw3IefFIz2m6/rAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJl2KHjjDAuWT6CDKYFlkublSIuhM6lumPkSEd87Nc0paAt1bD
	wxwcFkO1cf/iRFFV7ytZVERXfyUwun5DMnTX/B7ik9dmQmw6gb6m
X-Gm-Gg: ASbGnct4FJ+KVMnPq3+t/69QH+OFwS5G6n3MCGi/c8XVr6OaSiNL+S8FPoMvk02qbYh
	qAjCDQ0oM/D1fBIGiACX1ZRVcp9qTH+ZCOXN0+GuIy20MnYqFehxNMcWemNLbTUkI3FgWGuXi0A
	1rVugxDRdFnM1cjlTQ1iBUk04PmN9HAtKuBXJGavjuhnzbxVcUZeaot4+uc32AkrJiCJb8+vppy
	pgkhNEO1ouh4bRH22ACtl0X93qG383IrJgGdcFIAG7lT/IJdv0PKw2r
X-Google-Smtp-Source: AGHT+IG0fZL5g+zEG/fpP6eHHf2IPe9NkoBsaKGeRiza0EwWdk6u44xsj9AYe2YdbuChkpugl2kmMw==
X-Received: by 2002:a05:600c:4f08:b0:436:51bb:7a52 with SMTP id 5b1f17b1804b1-4365c77e3e9mr18873865e9.7.1734599947763;
        Thu, 19 Dec 2024 01:19:07 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:7407:1f5c:37ef:e8ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm1056999f8f.92.2024.12.19.01.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 01:19:07 -0800 (PST)
Date: Thu, 19 Dec 2024 10:19:05 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <Z2PlCXSG8qt5_3ni@eichest-laptop>
References: <20241216151829.74056-1-eichest@gmail.com>
 <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>

Hi Andi,

On Wed, Dec 18, 2024 at 07:16:23PM +0100, Andi Shyti wrote:
> Hi Stefan,
> 
> On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > A regression was introduced with the implementation of single-master
> > mode, preventing proper stop conditions from being generated. Devices
> > that require a valid stop condition, such as EEPROMs, fail to function
> > correctly as a result.
> > 
> > The issue only affects devices with the single-master property enabled.
> > 
> > This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> > polling for single-master mode when generating a stop condition. The fix
> > further ensures that the i2c_imx->stopped flag is cleared at the start
> > of each transfer, allowing the stop condition to be correctly generated
> > in i2c_imx_stop().
> > 
> > According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> > 5270), polling the IBB bit to determine if the bus is free is only
> > necessary in multi-master mode. Consequently, the IBB bit is not polled
> > for the start condition in single-master mode.
> > 
> > Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index f751d231ded8..cbf66a69e20b 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> >  {
> >  	unsigned long orig_jiffies = jiffies;
> >  	unsigned int temp;
> > -
> > -	if (!i2c_imx->multi_master)
> > -		return 0;
> > +	bool multi_master = i2c_imx->multi_master;
> 
> with this small adjustment, I have applied your patch to 
> i2c/i2c-host-fixes.
> 
> The idea behind the change is that variables are sorted by 
> length, forming a kind of reversed Christmas tree shape. It's 
> not a strict rule—some communities enforce it, others don't, and 
> some follow entirely different conventions.
> 
> Since it feels somewhat arbitrary to me, I don't enforce it 
> strictly. However, I personally try to adhere to the reversed 
> Christmas tree rule whenever possible.

Thanks a lot for doing the change and for the explanation. I will keep
it in mind for future patches.

Best regards,
Stefan

