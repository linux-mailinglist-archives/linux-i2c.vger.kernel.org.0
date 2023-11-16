Return-Path: <linux-i2c+bounces-198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8067EE757
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 20:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75CB11F25011
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 19:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F84B3FE5D;
	Thu, 16 Nov 2023 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWzekTA/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917A31A8;
	Thu, 16 Nov 2023 11:18:00 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d67d32adc2so638838a34.2;
        Thu, 16 Nov 2023 11:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700162280; x=1700767080; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
        b=PWzekTA/EMOnasKIkRbWSzZAKqRrhPMl+OcEVZmQhkJ18jzvYSU/OEHZFUuk4XKvOk
         qI74oPZB17SAUURlLVqxq/Y8ed3j1Mdd83FmpLR1q9oSE7PhrQi+Xq8fAd8vrU532iLE
         g5CHwDsHEQjmx5dcG9mya5TKGjhITcxalLoUKsl+SAjRrRYnEM0trCGeC42xl+JKmvTO
         O82FXXDfpXTwUaoFqODaMyJvHciuL4crs68s7APCOaG5ytW/Z3sryt2IhVgoiHYN8Ku6
         TNFr7AIYnV15QXdZDy3nfCFgT85bINY2QAQZnBKy7wbD+kfdGV1ONzvIXQ8zUycd5j0W
         pcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162280; x=1700767080;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
        b=Hm4lxXOa/WhnRtVjaMuZ5t4ILF3jQf1CT1fNnGKNH+InVn36ySAlKTKyXHA+t2AUOs
         iBRtVe+KY7qxDTIxBSZrHmMYa6cFkjdr7D2bahg+a8HonVvbAltPL6nxzunGxanjTOK9
         Um4xylC+Qtu73dT8A/j5g+DhB1xlKWzA7X+AvrPOZvKXU6uwCL6kSSWX3pVlw0hBN5zQ
         CcTAgzrHNqdUv192cBhP33VCL+dHBRmtAHnxu2edq6MAzhUDrFavlxpcL8gX0hJNFcVd
         sotBdygYSJ8MNeoVJDjTTxiWkZ+7VxogL4SmG8kna6loflMDVVVULP4HM813jx0zWHiH
         qujg==
X-Gm-Message-State: AOJu0Yw9fyvtg9bwkU3Slh/6THOrMwl8Gx9Q/vK9D44pU0WxvEL0OTeS
	HkVgtRlKt7S7uY39jjy1vQbTlCj2jdLDlS6eQn0=
X-Google-Smtp-Source: AGHT+IFchzrhEbVbz5AEifNKluJrx6zIDMG5gc5BfPiF7RMJY6+/+9azNscfVMvB74Y03sWBedUaDVz9bS5Uf4oPXtE=
X-Received: by 2002:a05:6871:2312:b0:1e9:cb7f:2287 with SMTP id
 sf18-20020a056871231200b001e9cb7f2287mr21389323oab.46.1700162279900; Thu, 16
 Nov 2023 11:17:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com> <ZVJhwSS16+/Zzt0f@shikoro>
 <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com> <ZVKNIn1eSlZ9yzco@shikoro>
In-Reply-To: <ZVKNIn1eSlZ9yzco@shikoro>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:17:48 -0500
Message-ID: <CADnq5_NgzZ+1FTzZObivnjJbbuYcafY-fbvgiGA9ryqA9wYedg@mail.gmail.com>
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
To: Wolfram Sang <wsa@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-fbdev@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 3:55=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
>
>
> > We're not in a hurry. It's just my experience with patch series' affect=
ing
> > multiple subsystems that typically the decision was to apply the full
> > series via one tree. Also to avoid inquires from maintainers like:
> > Shall I take it or are you going to take it?
> > Of course there may be different opinions. Please advise.
>
> Ok, then this turns out to be a negotation thing between the drm/fbdev
> maintainers and me. I *can* take all the patches, of course. But since
> the number of patches touching the non-i2c subsystems is high, I'd like
> to hear their preference, too.
>

I don't have a preference if you would prefer to take these via i2c.

Alex

