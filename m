Return-Path: <linux-i2c+bounces-7432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906469A0E5C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 17:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C20A31C21D4C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AAB20F5A6;
	Wed, 16 Oct 2024 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PkhxgrJK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9220E013
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092863; cv=none; b=Lt86lX/tdhaz+xFoeLMThr9PBqcARA3TG50V/QfzJkhzoMncJExRufRICqMJ5Ty7jAMXkbFT20YwRSs6pqkD5XrPGxX2y9SYRK7iMmxdQSqiILhkw5RGxPdg2enBBdQvVPmL5ioo/zmW+9o2ch0SGrYPdn/4nOY3dce2NA4NwI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092863; c=relaxed/simple;
	bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDerAq17FMNln/FPH0FQI8/Gr2bQh57WiDrxFpjeuU1DYwGDLsAddaQzWwbaRo6Al0avNJlVPhiMnXDl3kpeJEwDwCGAnrL4eTeHlSpDAmiJl0LWh+mAsyANeVbekfjFs4W3YtMTISvZomkjoLmRnNfSYZIIMim/tf1Zg3aAoqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PkhxgrJK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so3882591e87.1
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729092859; x=1729697659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
        b=PkhxgrJKAAKaQi1ZrJ+13rtKhDEDPdQmCpTQEYTy386pXMrgrcJx+YBRHsd2LUtIBt
         YuWG+3RmWwjCpfqiMDp4s1Ha8HPX5Dw6El+Gp+AymdvMp97bfs5l+DqKM36gj0ayDyco
         H7eTahPRjXeL3OcAKqGZ9Cexw0wfMzFa3Aucc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729092859; x=1729697659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
        b=v9TNb2PYYC2KISnO/kPO/RJg4SXh1Fnu1VzYtHqyNufB/RwyDPIbyzFXND236YrYrl
         CnIHtWyNKbAfEHxHJe8Sa4RA9h3kyxHgYImQ6sRV5GmSrWKje/hZvnnUcNbZzf3q/JV5
         fFI8qM8/i9miEbxQakAl8gxaC/HxenZU86FAW1YSo2aY4adGEg7o1oGcR8OvrE3EJRQy
         SKGCuRowQrhioEbhhNu1WiVckN+E3EB79g4kGhFZNCgDgsM0B6mGjX8DAqUhQlAyEMb3
         bDHB5pawGGR65V5gZDlGCT05jw+Si0TRg6zMb780Xyjg7HCbOgar4Boqv3f+hoGyHWoM
         V/AA==
X-Forwarded-Encrypted: i=1; AJvYcCWBERwgFWoSwyMeXTkTqjSfEuQmVxaI4iKXL9i4s0W+xA1YNQt8kMwpWQELN7ASP1p2AeFpMwSQ1KM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIu8GQ+pQcVRsysYPy/jxIRUbOmEG28rHuCchUu6saxqksYGMc
	rxB8gT3vkW+aH5vQwB4Kp98ID1Hpebl4AjefOh/3ZN2VVS4QaN7y8FoU8aBxOxfhZVrxBmBPcuT
	EOIUc
X-Google-Smtp-Source: AGHT+IGQrMdUFyc4kS9pkekLvp8nVKUr9I78J3FesuVpuQHcxVnpeaBIGjwFVCjrz5MhLBLLvWOyAw==
X-Received: by 2002:ac2:51c7:0:b0:539:e428:4ed2 with SMTP id 2adb3069b0e04-539e4284f9emr8886561e87.56.1729092859071;
        Wed, 16 Oct 2024 08:34:19 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb2317sm480042e87.107.2024.10.16.08.34.17
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 08:34:18 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so48619671fa.0
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 08:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwQA6npgZ03nGPW8nMhOu74gkYMvd/y97auougnshIP5puQBEZ5NRTkK56mO6QNTwezFMZ6mdxxjs=@vger.kernel.org
X-Received: by 2002:a05:651c:1509:b0:2fb:6465:3183 with SMTP id
 38308e7fff4ca-2fb64653a19mr17100581fa.3.1729092857448; Wed, 16 Oct 2024
 08:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com> <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
In-Reply-To: <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2024 08:34:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNZJ82e2rfMicAiXmxAx5hwydsnMVO8naaakRfroyNow@mail.gmail.com>
Message-ID: <CAD=FV=XNZJ82e2rfMicAiXmxAx5hwydsnMVO8naaakRfroyNow@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 16, 2024 at 12:49=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> > Just commenting nits, so:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I assume this stands even after Andy's suggestion to drop the gpiod check
> is applied.

Yeah, sounds fine.

-Doug

