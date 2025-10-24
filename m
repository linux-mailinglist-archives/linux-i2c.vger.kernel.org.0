Return-Path: <linux-i2c+bounces-13788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4886FC0695B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CCB250051E
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 13:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FCC31814F;
	Fri, 24 Oct 2025 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2AXO4Gr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25463019A7
	for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761314143; cv=none; b=lRnx7Xt5AVoKLBN2dQ8rNgBNyBJowdwl2Q7j1kWR4PFod1N4PKcp3EGy2uOGmiTK5Q6drLxM60THFuN17DqXfSLZYg+OOOpxdTUvjVt7BJkSGJhg/atd1pvlRd4H74jlHCEPAEIEYskXJFT4r5CpCGKhBTdkyyfoEWYttp96dFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761314143; c=relaxed/simple;
	bh=6EDKzmWA6vlmVD1ip5IeawW7yR9cxhaXiCEY82LwkFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqUDRkO7fzrv5NNP9IftnPRiOhBxR5QWqkIfNOxchX2aqGUOLND1qWX7AE/gxIWF9TnoLSzaAGeFOpY4VQrkSj6+1mtKMEPmBX+J3dEEUYrGp4jjIWnorKVqJBfVRqX11CcdTHU5rJ1hgYNnsXMp4/v8Y7l0ZlrQ7oRoY/Q0NJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2AXO4Gr; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-781421f5be6so23867507b3.0
        for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761314141; x=1761918941; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6EDKzmWA6vlmVD1ip5IeawW7yR9cxhaXiCEY82LwkFc=;
        b=m2AXO4GraD+3/tTI7p3vm8xmrmWaW0J5KoRgQjV+l4m599SVSJ/G5UW1l5/J6iZU6F
         lGuBZEZmiVr8lOQhSQewXC+9T2W2yvgUkOE6QEHjCk10eIm5Iudv1WpeS9tidKTIHEDR
         xvMVXMxidzbkXz96jyh3TIKSXyAuwaNM7eWFrxUJf3biQGn9TAAzD6QecCfpg509JGv+
         c16zW3cpCF9Z6JaQqhgxq86jwJHRnPZ34+1UAf9+XyAI1iahJaQumiZfM5mTanL2od3W
         yJRKVn1O8cWQRR3I2+yaXOZ2YEAWeiGddkUK7dC9hPuzmiTHoCde2k62Lmc7BS1Tubwj
         S/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761314141; x=1761918941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EDKzmWA6vlmVD1ip5IeawW7yR9cxhaXiCEY82LwkFc=;
        b=DqKDVVF1lH06jXIrfiAyr98ta0ZQx+pkSnYu96sz3FIQSk4ekYkMVx9UB/uGJzNFUE
         jXByD32gmFhB7faLz5ngRjSbzDJWC44Skn89/nK/agTpmsUHlBkzdYyxeQpFZE7DKfmC
         8NqRknEQsrkNp3nIUntDu/guTHaut+y2mBunnUk5rvYbbcg7JHjObpcRKBQxRDK/OaiU
         h1HpqGMnOsrjUKxSNqQfpmkq3Bm5Bh9O6lRSZg1Re30Xr4ztKyrSt5S2JNG4NYPTT04E
         phoOIkNo3nI2L0QgfnLu72yrlVt+bqEsl6g3tj57U/wHeDQNUINQiq++Qkhx/nG/LMRh
         Gb7w==
X-Forwarded-Encrypted: i=1; AJvYcCVbH75t4s5trZ1zbVjUXpB3hLlKZIkAAfgziHJ1W8N+LGk77zdyKR/CDKKiqsftSXFg+9uaMi59m1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2GWobt6E6Kf0UaAsgROiSna4zOatRLHGdZPTeXUmAf4C+pFy
	uH119Y7AdFsTC7beDIB6Bye6qTfe/UfH0S3A3gSwsO/mxUEJMRX5NLl/PIdBsWuW0ydRfpOMvGf
	oNuKnyFf1Kb7896/+CJCw0Njm/TksL7A=
X-Gm-Gg: ASbGnctY6k7k0+Xm3imykK5Z4Amjj/MwUeaqIZlZ8J8VEJK1VWjYoERw/0yxCZ4B05l
	ZQ2TmXlycJkEnQD2nzWkxocbX9ttAwr5CjuCpckWjlerTb6EwVvTcNINU9OBzVvMziTSFmxdkgc
	o9cSny2OWsE1LRN7TSNogdR2aMmurtU/n24j7DbfQgeYsL2KWW5ctM/FhC8XKrUkb3W6JL8R+Yj
	UrgultWFcLr5arzSFAXVlkDiaR3Xjfw0IiwDiJDJI3PxmdvgZqGT0nBZpok/83A
X-Google-Smtp-Source: AGHT+IF/XZ65Pa5ogx5jpJPpOQOF+uykXf1zGnLo5yZ8TjK2GtNnECR7Tf/p1bu6J4Q696ZSiZuDwQwkYbc7ilxvBfU=
X-Received: by 2002:a05:690c:4b81:b0:781:64f:3154 with SMTP id
 00721157ae682-785e0267968mr21092467b3.64.1761314140636; Fri, 24 Oct 2025
 06:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023120043.8661-1-chiru.cezar.89@gmail.com>
 <20251023120043.8661-2-chiru.cezar.89@gmail.com> <dnjved3kd3awdseclr56mbwxkbuysxcezzbebrk7fjpuq2kf2p@rhat4xhdao52>
In-Reply-To: <dnjved3kd3awdseclr56mbwxkbuysxcezzbebrk7fjpuq2kf2p@rhat4xhdao52>
From: Cezar Chiru <chiru.cezar.89@gmail.com>
Date: Fri, 24 Oct 2025 16:55:28 +0300
X-Gm-Features: AS18NWACFyo8Vn7Z2PSDhb0T1yGH6jRvkczpxV8a7BTlO5Ni_PM3zGeBqde_w1M
Message-ID: <CANvS2vX2+ZRA_sT8gzmLmw9r7Z1aPEn9d+c=0QigPpeUYb3=sQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] i2c: pcf8584: Move 'ret' variable inside for loop,
 goto out if ret < 0.
To: Andi Shyti <andi.shyti@kernel.org>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andi,

> > Require spaces around '=' and '<'. Add spaces around binary operators.
> > Enforce error fixing based on checkpatch.pl output on file.
> > Move 'ret' variable inside for loop. Then check if (ret < 0) goto out. This
> > improves usage of ret variable.
> >
> > Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> > Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>
> you don't really need to resend patches for updating the tag
> list. Anyway, that's OK, better to send than not to send, when in
> doubt, ask.

Anyways I had to resend as I grouped 3 patches into 1 patch series

> For this patch I think neither me or Andy have been suggesting
> the change. The change came from you, we made observation which
> you applied, this is the normal review process.

Can you please let me know the process of tagging with Suggested-by
without resending the patch. I don't know how people add reviewed-by
or ACK-ed-by or Suggested-by other than resend the patch?
I've seen it but have yet to figure how to do it.

> If you don't mind, I'm going to remove them when applying (let me
> know if you don't agree). No need to resend.

OK. Do as you want and think it's right.

Regards,
Cezar Chiru

