Return-Path: <linux-i2c+bounces-13214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EFBA4F12
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 21:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBA8C1B25FFA
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 19:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5D125F98E;
	Fri, 26 Sep 2025 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvkUy7jw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3C1FDA8E
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913510; cv=none; b=mA7Etj/+Auo8gfAuQpOUZz8QCKfCOIqmnUL2lGiOKynd6cHXxUUjLG3GRxMAojP5p4z2FxYq7lCUd92fP1TIFZ9m712rY+SwOFoDC5a49qfS4r6AXvH5+xwZ8zzvfQ/FJ2aH8lcK/ziiMGYXkAgqUtUebSPIgAUDqlipVVRc+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913510; c=relaxed/simple;
	bh=EhdMpJ1U+FHIoR7XZ/yj6clo2zTQ1p3YFH2wb3Eeqwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYmAmSu6FHAVYqg43p6kPhEYiYM7McJYz6yg0xDTve/iyYTqRSMEjy6d43P1mNtjSVOqm/K7hXYj18hxUBSStXWAjYORoIrsk5GyyWAH7vALn0+7jWRtkvwtn/bF8bKCtvLmheMwzsVEV2kE+AGn7uG4kD90p0L0XfCeIRtNwFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvkUy7jw; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-74435335177so50227707b3.0
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758913508; x=1759518308; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbJGmaLk3OZjl0R3kvAisn3ETboX9rQ1mi9qiGLk548=;
        b=EvkUy7jwEW5tK4FzbAXRdSvu5qm8M4nR/2vX/TKSEpo0UtfLu4OTewafGLRqCTfl+0
         EP3aEK4riTv7fITBbdpJ2ptCYjXVqnnFWKTYs94Gr9xd8G7rTRG5RhfB9qFNufuv4D26
         rP2niXgWw/DhraDIS1EcjyI81aA7uA1uIVQfYCO4E3cXYGI6ZPCCiHJgAMKE0mMUl5DV
         ar2eDSrdi25riL/rcL1n6B2TXd8cEG8RRnilBOMnPGBMyYI7ok8p42u/iLzfdPDJKIyh
         teF0KRfbL0zT4EUgCMCOAQH2uCVpYHMzKLGQfUqimVvvFnIdomEN5B6ry/SNrpKMkvhq
         deIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758913508; x=1759518308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbJGmaLk3OZjl0R3kvAisn3ETboX9rQ1mi9qiGLk548=;
        b=DRUxQLAJFQS6KG2cGaXYrckaEbjCIWKzRD3B15lg0krsMrWx4WmTncEhioy+gbFmkQ
         Tnqohq+Jc2lHbeKrYstFfzA+LTkWMUalvqH0jTUppwpLeXJxn0iHXr/ojJgcvvGKLS7H
         zGw434febjWtwhd22IhBWoQIZEeJ8gi8mXreZplDtMaipTxoaEwIRtltkyhiuRexbluO
         xskpz7ExEtjTI1Qi3oKiEJ0MBd5uE1KQW8OsgpJw+ZeWcEvSuwlIwZ75lIw84U7I9UCl
         SSfa5CGHmlauLOYLcxlfyuJn27nekqHAA/dPA1dcvlKZaqejuM6crMn05+7SZ27uQ8+D
         ZMWA==
X-Forwarded-Encrypted: i=1; AJvYcCXX+T8yVdLsv1So+WUB2A3aEraEra740mdrEYAU88lYRIaBlOukZnWupdHH8zL+AqpHrvpnx9g9Ls8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQRQCD67CqpkDfK8Q+eXUKKxGOLD0c7WHM9/U0mko3LQFxEDYr
	whyFW+hDDEsf7Qp4w4gcgXpHwmE3h0j3/+0mYP0uRzTD8f76dfnfxLx4L0RjN3GGosZbNvgd0A2
	L0fwJk1+Hgg3UStzzvcJFlMiADGoPB8JY/QcZ
X-Gm-Gg: ASbGnct6Xgh6t1pvoFwgPcTyR5GZl+rLwA7S2fDZ7nodhHcQVq3HQ+SW/1rqeGWUFG7
	rI11MQaAwjA5V+G603P4ZQjCmHspyeFO7hxQ6HQoxuI97h90hdVakmBsfr8jyZdr8M5x4L8cb0e
	qPfwksQ0HllvcJN6qHIp68k1DV9R/LgrAVXuFTts0vIXlcslVPPg+Xoscm7OSXpRiNg3YS5OomI
	BwxS5jgZzwW+Fh2EdVJ0IvE4hG3dA==
X-Google-Smtp-Source: AGHT+IEdkuUOLU/bW97u/TwPmWzVbg8Kn81lbFFHV1rxBnyGRe3t1U/lXJSGfVpY6D261qaGlOsT/kGC7v701jIuE+w=
X-Received: by 2002:a53:a80d:0:b0:628:9b73:4b16 with SMTP id
 956f58d0204a3-636dddb4630mr629935d50.12.1758913508118; Fri, 26 Sep 2025
 12:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNUa-9HcQzyjZkvE@shikoro> <20250926154520.40583-1-chiru.cezar.89@gmail.com>
 <20250926154520.40583-2-chiru.cezar.89@gmail.com> <aNbWejNZLYGuNvCI@ninjato>
In-Reply-To: <aNbWejNZLYGuNvCI@ninjato>
From: Cezar Chiru <chiru.cezar.89@gmail.com>
Date: Fri, 26 Sep 2025 22:05:19 +0300
X-Gm-Features: AS18NWB7zbZy6bRGc81-m4r9ucklfKIphtIWuq3OYuTt2vqQbhgiLEr2b2OjL3I
Message-ID: <CANvS2vXT5HMKmyHMnJ6sAc9s5b5PJcFGcW_qrcNLtJtLOvsmNQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm a newbie to kernel hacking. this is my first set of changes i'm
working on that I wish to go into
the kernel.

> > -     DEBPROTO(printk(KERN_DEBUG "S "));
> > +     printk(KERN_DEBUG "S ");
>
> Now you print the former debug printouts unconditionally? Why is that?
>

I thought I should get rid of DEB2 DEB3 and DEBPROTO macros. That was my
original understanding.
Should everything with printk be deleted also?

/Cezar Chiru

