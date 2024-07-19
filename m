Return-Path: <linux-i2c+bounces-5037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B9937E1E
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 01:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0BFC1C2103B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 23:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D7714885E;
	Fri, 19 Jul 2024 23:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eEbVhdYV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D81487FF
	for <linux-i2c@vger.kernel.org>; Fri, 19 Jul 2024 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721432923; cv=none; b=bzJ6ZkUH5SB2OMKFFleJN7qO/LMw/osKkobVO7u2Sz7CL0znZHI0aXAsWybTI2d0j++Kdszke7nX8QrXWZuJSBBcLGeNZCIiprhipsGO1JOwhH64UF65Z5c6CldM8220IYBiTSR4JHwPhHsrDcIt5fYReL5uKOYp/sHCZSzvuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721432923; c=relaxed/simple;
	bh=Ab6RE9GbqC3T1133n8R4ZdDryTnA+UEpik+0gNQzPlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=kLLgzNeU7WMADPPNWAwWv2EfznDF878KIpJO0jsOwvRtPzABZebu7ubFBDX5PjUWzTBdn+7dBusQ+BMlXB+GyIrVohSjp7NbxBH9ggOHdpmhqWbvVOoHrDMXWwoAvXbScNFTijvgnVoBaFFGBPXna+ZCpo6YpqDCkvcAj3DwWUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eEbVhdYV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77abe5c709so241161466b.2
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jul 2024 16:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721432920; x=1722037720; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVJY6UcBnDOeBzsT729i8tru81f/9za3Grw++dfFdJE=;
        b=eEbVhdYVSiMxLcEO7UvUlVEdC8ZPxHeAUVJRTS34H9RIphrKeTmyDFHgjis2xNkOSZ
         n3DE4d+LYokYaHxiU2TIikKy6LOB0Gkoh/gwGoD6gmfHhAgWM1SQ0P89+CwrI8S+YuBG
         ToeBRFHM8aoDGVqwliYnVrjDj6Pmk5Lug6dQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721432920; x=1722037720;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVJY6UcBnDOeBzsT729i8tru81f/9za3Grw++dfFdJE=;
        b=Wik5XL0/MGOy9QPutDoEqbfyQTBZShegWUMmKIIeNnf+ITcF44iVTszPyz0vXEjIHW
         fZTh26MtRtNzXzErPCB2qe4YYKYX6mn+ZSmYTPJL4Hj9OquuLjR7a0gDL0smkeVnIP3Y
         juh8Pjd7+tHMASr7Xz6oh3u8zuDsLpxdHaI2zwE3JzA9YIWagquiVsj2BldrUV2EnPdF
         Hk5Vqyqe/NUSPGsL+vZwVX0npdIfbscTVpqUyq8ekQWHhx+qX38k1/W3H7/fuTUZ0hxa
         TXNFVPmWJRvvgAeoyt4W+Ns6Ygm+Q/vjVFf8PfvO/i8nrTIujCKpPMwAE6jESKcgI01A
         bnOA==
X-Forwarded-Encrypted: i=1; AJvYcCWJGd6RnThpz5EAfp47JOaqykJ6lUvjL6bTcrcSE4Zy4fEx1ZMGxBMAj6QwoeQmbAVnA0zM77EEyAx89hG6x12Pvvdf8DJwIut4
X-Gm-Message-State: AOJu0YxG7HdtM1T6s1xGBzRObpTYHGVF2DYCw0TfJ8reup+/nPSkjuwq
	Mt8cy+br/uG30fq1FdbQ3GbO/9qDDIKNQsWXq1Fo/+LgcQfWgHPBTcI7KIp23o5JQ3SOqPilLmq
	7al0=
X-Google-Smtp-Source: AGHT+IFUZkTTBGH+9a9cVVHCyZMB0rp8y6ZtJ51RrByQ2/1VtlIHaXN730jJO8Ib8LaohqNV3TgByA==
X-Received: by 2002:a17:907:1b26:b0:a6f:4a42:1976 with SMTP id a640c23a62f3a-a7a4c1244a2mr177066b.37.1721432919989;
        Fri, 19 Jul 2024 16:48:39 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c785b7esm87479666b.40.2024.07.19.16.48.39
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 16:48:39 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso1512360a12.2
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jul 2024 16:48:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2/KyHkKz3+6gbY69GfMwH2i2GLMPZn5Vn0VoN8aeegqysK6kYoiteJU1DmaZ0OjlSEej9ref6j3cUakFHqqCw4O2adT6/qRDR
X-Received: by 2002:a05:6402:35d0:b0:5a1:863b:e572 with SMTP id
 4fb4d7f45d1cf-5a479a6aa18mr25696a12.32.1721432918997; Fri, 19 Jul 2024
 16:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZpqCjrdsScuA7CgO@shikoro>
In-Reply-To: <ZpqCjrdsScuA7CgO@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Jul 2024 16:48:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJJSR5=1C4Vf6NRvE1Yp5-bFOvQVR3RCGYt+yYEF0Z5A@mail.gmail.com>
Message-ID: <CAHk-=wiJJSR5=1C4Vf6NRvE1Yp5-bFOvQVR3RCGYt+yYEF0Z5A@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc1-try2
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jul 2024 at 08:13, Wolfram Sang <wsa@kernel.org> wrote:
>
> Here is my updated pull request with the summaries of the included
> merges.

Thanks, pulled.

                Linus

