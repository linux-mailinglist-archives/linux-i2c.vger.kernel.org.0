Return-Path: <linux-i2c+bounces-7999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3529C9560
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 23:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C89B282F97
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 22:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFB01B0F0E;
	Thu, 14 Nov 2024 22:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/Vgn1Ju"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8E18B464
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 22:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731624756; cv=none; b=cvcbTu8q2h/BXahkC0KVh2wTZf8QorAHJDROKtUUQp6KmFx2ZBSzmaGxxgDGJEr0LhNcKBox1Q55l07tRlcUllAvo5F7ABcbmqJuuOGHOZbvMjlyCqeRkIuTaBefL2lCE+mYUvq4gBCVd0GbJbEYeyA9bgAGTcen6kiYie5VOwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731624756; c=relaxed/simple;
	bh=m7oPMa5p3+A3gTDQzbTb0wlLn1g0hZsNiZTqmAqcIHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgUeoNhjfGvVut3v4oNu85vYnORqOwOh2qqQdaEAaPWgkG5IL/6peT7kwQKY/g18XhM+TssF96s+ucLAxtH+BZ2cHIFVzRcIXlOy8FxfVEN58xsC3lGts6b3SqqiWPTGsd1V9rMm0d//HoCFkgx+9OCkjdpl7GWC/nKY4ndbTP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/Vgn1Ju; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1150086e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731624753; x=1732229553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4NDs1P9XbNpOqNm+yiQqI/JC4xjIru8KSYOpS3Yol4k=;
        b=k/Vgn1Ju5yJb+XQ7cdh4eDRzjXyWa+VSDT/J1+wxv7zJuXzcTOwc11TyAn3ruQxIZx
         TTIke5NrCsSrZhG7w3+5fqmiSzgh0pmJ3T5P4lcoRsLfoWjjsTnZ3zZaTMP3Jy3F6ZeW
         eqIZ09+HUI2YcFYS/OXwqNBC9UvZEjhWzeDlL2xgcE9hWM8bDbJ9J76k2lZXgtt1KGxu
         M/BpxBWCaeACOVzNQxpEfwWvFklFmelK68oNr7IqPfveIpvqyP8wHz+t1wQ4eFGHLvNQ
         B7tbVeArQYJ6fId9x0xeCDmqMthkrnCZHPojHsD3aAnDbPQbm1Ldn8g9bdOJVJoNcY9l
         Cc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731624753; x=1732229553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NDs1P9XbNpOqNm+yiQqI/JC4xjIru8KSYOpS3Yol4k=;
        b=JneFCL4HkG+lTQnHsgz5dNa3svaMA0PElJ8Ow00EHfMFBCtQwPOmoJGg7Dx5Xko9ij
         etiq5VBeY2gt/9gsEsSQwmnUVtw5Sn48sy5cmCDGPYzQEw1EbE60CpySBY3LHemMLXOI
         4sp+WwJAtqqgb1t+fdiNVTXH40nWspaXzg6wiPNZEvN7AnleAsBQGjbCXipfqg1YvDkf
         p1imZlgsmF3cIuRPxFSCy8mP/3VsrV5WXC0bPztnFu5+9/SmnP9yBnQd0vNvRGPl69mY
         gpeviHTQ+MMuuCxOpHIwD0iarhYXnKqhEYB69L6aiUUPk42yEmXhNr8l/o1nu9x4svs6
         r5cg==
X-Forwarded-Encrypted: i=1; AJvYcCXkxsrypU9tym6jKYAlykdgzhRBysGvQeLi6I48GF+D+pTxAyv5sJc5S9/fjx+OM3aYMwi4tsMl3zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGsOuQqB7zx9x2DuE8AyFLhiiuydeg5Uk6AFBdttipk02tnKE
	5WGvEMsJJRH8oRlQd1Rr/7ebz+qbqFOdSEszge0TNaolk0BjIlKUsVq1QNDdGoY=
X-Google-Smtp-Source: AGHT+IFuC70u0clLXzI+efCQgj8/nhkMPYj+HkxNyQR/JxhH3/4SZl0J6nunyzypEY45VN+oypMVNQ==
X-Received: by 2002:a05:6512:1149:b0:539:fd10:f07b with SMTP id 2adb3069b0e04-53dab3bf0a2mr191638e87.55.1731624753180;
        Thu, 14 Nov 2024 14:52:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6500e39sm337161e87.93.2024.11.14.14.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 14:52:31 -0800 (PST)
Date: Fri, 15 Nov 2024 00:52:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
Message-ID: <yce7vswjat2bhda2l4c4ji4idtozo24c7tbmpahz56tmedmpw7@fn2h2t4hv7dd>
References: <20241008160947.81045-1-brgl@bgdev.pl>
 <173151232541.92239.8233789832026323394.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173151232541.92239.8233789832026323394.b4-ty@linaro.org>

On Wed, Nov 13, 2024 at 04:39:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Tue, 08 Oct 2024 18:09:47 +0200, Bartosz Golaszewski wrote:
> > There's no reason for this driver to use OF-specific property helpers.
> > Drop the last one in favor of the generic variant and no longer include
> > of.h.
> > 
> > 
> 
> Applied, to the GPIO tree as the maintainer has been unresposive for two
> months and the change is trivial.
> 
> [1/1] i2c: qup: use generic device property accessors
>       commit: 400913bd4edd76ef1775bfd95543846bd6f5ed71

I think it's a bad idea to pull unrelated patches just because you have
a GPIO tree.

-- 
With best wishes
Dmitry

