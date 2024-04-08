Return-Path: <linux-i2c+bounces-2820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995589BA68
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 10:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86CB11C2190D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 08:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F3039846;
	Mon,  8 Apr 2024 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsabOnJL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E8034CDE;
	Mon,  8 Apr 2024 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712565328; cv=none; b=OpeySaG8s7djHZ0yVZIo443yE/0VG+h1x++YonwhT9FxXv/b7kSQjUpsP0mBftY3f0KdRwMxwtf/YG56Muk8gvuQUESG0gfDjVa0nOHnUlVUSNHm6P0/i1TAYmuDKorRGFSnoKeZYVK0iPOoXdYQCN6K3P21IdL9P2IjlWRryX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712565328; c=relaxed/simple;
	bh=fDIFzq2+GjeMRLsPFfkdydig1/xFOVehlykYBoiVtNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpbLzUtcFjgl932o87j3mYngN6ajCg5i820hNjD+EkJJPzlxRM6dwCRVE1rYp5sTQKxg0vhTJIr+ukI7/Urfxtg72CIt7L4rIqiOfXETRsK+LqiwjWrpCart0p8jVE3DnT+P1qFm93xGqkjETjF5ZtdocdaEdjFwe309avRLun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsabOnJL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4166ccac75cso5386245e9.0;
        Mon, 08 Apr 2024 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712565325; x=1713170125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYeAXyuKGODULO+FbNEaQzDLowkIhH9uCziDxOY+3pM=;
        b=NsabOnJLVkWksOwd3uRRxlAvCgmqFTcbIM5CIHm9ToZ/VgoQ893dJP2Ekg/wz2nDjV
         gs5E1t1nVoODaamYzuUigtryT+0uMi1PzSSGes1Nm8pahHo9fVvQzCv2naLz0bGI/UHz
         +pw1ezTaUYUeF9fKw34gJya+4KYVZZ4Zz8WApL2m+2z8Ily74ufC/7MOk26p9ZhyjXln
         ILPbBeiNoQ4lJGt9HezDQBEdtdWKoNs6hy/LdpKagYAoW2zId9Z//L3FpBOR3fn6fi7E
         +1oyyX3zeUd33pCujGy3mQsty4YluTYI59atywKZUJN2nZnvtq8W0geOixsarZy8e09n
         Ot2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712565325; x=1713170125;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYeAXyuKGODULO+FbNEaQzDLowkIhH9uCziDxOY+3pM=;
        b=wPs+kft9EvsKmrZyODhvsT2QHWMklUp6WVji+Rs/qUKAg0oJza6dY8Kk8+pHBXSm0d
         DDoZrJuIeUoQCAfAI2qi/+r7prTFa6NH18mYcGGwSYxzO0EMh/ZdyLPiVDm7dEQ+riPU
         MqIYieuFgwJQ6ytCEA2bX8ye9reb7zheEIF4ewcrVL0uIvVo0u1DKk3OtX/iwHQbBWpM
         ZDuxQ/NIf9OftxUwfUrjE//UQT7fo9NTAvoEL4677tt1GNpeRsGBGnvk/K8J8fvpNWTT
         QUvBHloX0UkEaQEUyT4cT0NNrn3Ry4a/JwWZHQjlrqreWChV7dkKkBvw48nTkfnnYJns
         ojjw==
X-Forwarded-Encrypted: i=1; AJvYcCUZS45wn25kmQ3qiYKFLmgPfx3kKEzzrRl2b792x2zFzsAXzzTbPOOT3JlQRiDi5ByeiLEaDJlUYtD6NwR0VxiRQFEgZvmch7MUzJSbtOfAhmjIX4nq1ZLG7tHfZY3PZeMJejOgMbb+Y8I/ngN2DTyi4wJst3ef5xzAIgZ3xQAWWrJIOpi0cHTZyDJpTUnXWgaHvP6X22RWupeOFv42xlJEsSBLPfw7osuBp1GNEso6K0qQVih2dAim2g==
X-Gm-Message-State: AOJu0YxjaSCMswK2C6vdsnx0GBHymFFBk47pseh6EYRdj+SEjSrpxQxX
	v5GPvkkg++krIRsFYTbGmdT34P9gD4A6dv+yA91/StwN5Fb6RKv0
X-Google-Smtp-Source: AGHT+IHU5k1SefaWsJ4Dm8FLb/xA0Oa19OOVbWsUeKtS2E4eDYDTEpvWcL36P791FhCHmqL0tKsDyA==
X-Received: by 2002:a05:600c:468b:b0:415:6dae:7759 with SMTP id p11-20020a05600c468b00b004156dae7759mr5328190wmo.19.1712565324886;
        Mon, 08 Apr 2024 01:35:24 -0700 (PDT)
Received: from localhost ([185.57.101.252])
        by smtp.gmail.com with ESMTPSA id be9-20020a05600c1e8900b004163ee3922csm7570545wmb.38.2024.04.08.01.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:35:24 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:35:23 +0100
From: Martin Habets <habetsm.xilinx@gmail.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
	"open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
	open list <linux-kernel@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
Message-ID: <20240408083523.GA5341@gmail.com>
Mail-Followup-To: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Edward Cree <ecree.xilinx@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
	"open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
	open list <linux-kernel@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
 <20240402090028.GA1759653@gmail.com>
 <0c6ff90d-0709-4fc5-951e-1b0f0b1273dc@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c6ff90d-0709-4fc5-951e-1b0f0b1273dc@linux.microsoft.com>

On Thu, Apr 04, 2024 at 12:18:06PM -0700, Easwar Hariharan wrote:
> On 4/2/2024 2:00 AM, Martin Habets wrote:
> > On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> >> with more appropriate terms. Inspired by and following on to Wolfram's
> >> series to fix drivers/i2c/[1], fix the terminology for users of
> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> >> in the specification.
> >>
> >> Compile tested, no functionality changes intended
> >>
> >> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> >>
> >> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > 
> > Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
> > 
> 
> Thank you, Martin, for reviewing. I believe that we are settling on controller/target
> terminology from feedback on the other drivers in this series. Would you want to re-review
> v1 with that change, or should I add your R-B in v1 despite the change?

You can add in my Reviewed-by.

Martin

> Thanks,
> Easwar
> 

