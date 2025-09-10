Return-Path: <linux-i2c+bounces-12828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B33B517BD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B942F54831D
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED801DC994;
	Wed, 10 Sep 2025 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dDeqcri2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF7F1BCA1C
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510301; cv=none; b=RHDiij64xvtx76Rz/VAJT/tagAJTQrC/de6zU/g2K3kseSLtAvtckSYCpRJYBT+b3GmSzmgLy3GGSJ+Hwc/aYWVbbxTiPYHJNQzir0yDAaiMUUGDQ925n3Df6ySvOfGLvuFg06osgLzBLKEcMhOV0SrtmoC7Lvt3HPn0a38zRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510301; c=relaxed/simple;
	bh=WqnILu0cK9Pt1nTcaOj9OS489tPHVa27cWzbkKlbjLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/DkJlBB3bcMsvSbopmWHt2y0dE804LPXX0IkIcLDnmJxocOkMZ6pVzmPwTJTu4MCHSXS6tf7MxTZp1YveMTt8SYipMEEKVhhzYvR8TwB8U8SiIcTD4CTAXFW1iotSs/rRiMW0in72t+TddkGs+ZA42c3Jsla04ryKLbVjjWKFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dDeqcri2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso2025407e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757510298; x=1758115098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqnILu0cK9Pt1nTcaOj9OS489tPHVa27cWzbkKlbjLA=;
        b=dDeqcri2B5aiq4zY3kndINVe7Iur47TlayD4Oo3bt1vwKz0VzFFTU+8XTXzIk87YO7
         i3/HSNGiM7H6mcgASpUmCbA3jB83H+Sk2UFDjktucJLB3xvf4HXQO5otxDOKU7KPSezn
         ZF9L/xAIRoBatH/GrvS+idD/618DbUIUQvZy4P8KazSIpHGXcf9BeojMrZgkl2wgB6L8
         0GBDqdyqHzluPr1ufw00dC7qanav3qMYtFUk+mYYoh44/k5w5zR1B3tuAMoCOIbK+1D4
         KRWCB1Cb7s3EHkZcq48MgqRd8hAIbgg6Q18W/toNtTihi406CSd2NYjTPnTPV0n1yu2x
         ptrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510298; x=1758115098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqnILu0cK9Pt1nTcaOj9OS489tPHVa27cWzbkKlbjLA=;
        b=sWpRB4N+8pf5oDlJeZOp20uwXB2TbiiYne3SdU1aSAFI399FUC3Zb5GjxPAn9rnytk
         IZbJvR67XcMZkvToSHA0B1G2y3FVhzEDPTueIlNALiQZpZ2x/HOgz9dQkIS2DiNTyAUy
         RG1Qs93xQE3sf0NvJNiFXWdCoxsMVQ04VWTXYP9NF10I6+9Z7qqMmrgy7XHZe+qbb0SP
         S+rYj4ScAZu2L4xDzS2HCpL1qydporrWhS3+4V1AjCV92DP6YFkV58BiA6cJL1xiya4b
         mwjGdKsQBYv99pBTneWM/Yo8PdheLibMH4g8EFAvAS5oVNsemwxzBMs7uxgyivFdwWmq
         ePDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpDcocVKi8kiSGqIbuvnM69HPD1vxEEJ6XaK7mCTbZ/XUItvMHTg3eUYb2eZwNuK6HnGDCLMmSVno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUtYGT3tGIEwiCHHqk6WNLMe+f7lF9nfsc4ga9dktV4fjqEvGP
	DfO0yk0k5AcQv3edJA+lbhYNYwC/9Bf50E6t4DrlqBhN4D7GVrY7TiqwvXlQMM4XVowO0Kb6CFh
	ThzyGsO70pfrmAnil9/87jvoG/aRRzHrzJ/SlUHhgbw==
X-Gm-Gg: ASbGncsAaLmVvSD8sMGyOyGRhJuIBl5+f6y5xa4w9kpMJGOtTSvCFFsCDfd54sC/oKu
	xYbZ1nItrO7pVixteD2xY5hQzvJDjUSO5AN2uzelkBpVZW+q76Zs6IjhxKywWG688fPg/RsEglS
	axGZNnAR8qMjLsOUFCR1GtZalA+zn+VgJFpt9t8gm/iifCR3/jSZVhn+WQYd/ZW8vAGIFT7UlVX
	9804oigRdjyuL9CqR3Xcsv5HPcCKYsDsjnzbh638a+G/4j6ow==
X-Google-Smtp-Source: AGHT+IGPnsIvAHQ6X8OaQzgCeZ1+Ksn9h969q91MyXkDth9edmLspz1OjaaijysqOdw2Th6pkgZbD0Bn+w+7F3Y4z2U=
X-Received: by 2002:a05:6512:140d:b0:568:d6b6:b12a with SMTP id
 2adb3069b0e04-568d6b731c6mr1753800e87.21.1757510297762; Wed, 10 Sep 2025
 06:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907175056.47314-1-hansg@kernel.org> <20250907175056.47314-3-hansg@kernel.org>
 <CAMRc=Mcwez1bebe4KBxh2V23+U3A6Fhz3q_dC1XmnT1DfD2Yig@mail.gmail.com> <a77d0593-4001-4315-b8de-22c4b85f213f@kernel.org>
In-Reply-To: <a77d0593-4001-4315-b8de-22c4b85f213f@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:18:06 +0200
X-Gm-Features: Ac12FXwK5WtqrcTVPQlmOKeQE41FP2d8FM5zoSikqdemlUwZTgWnphwPSKcS6rI
Message-ID: <CAMRc=MeHefqC-8qY3SZNhXSjyu9VnMnx-N5bWeBxVh0TpwAUOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:34=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Thank you I'll go and preparare a standalone v3
> (since the other 2 patches have no reviews yet).
>

Please, don't do this. This is a great way to confuse everyone involved. :(

> As mentioned in the cover-letter it is probably easiest
> if Greg merges the entire series through his usb tree
> once everything has been reviewed.
>
> Once I've send it, can you please ack v3 for merging through
> Greg's USB tree?
>

I would prefer to ack a patch that's part of a proper series, this
split makes no sense.

Bart

