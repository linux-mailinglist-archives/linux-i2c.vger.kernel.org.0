Return-Path: <linux-i2c+bounces-386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 040337F4D96
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 17:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A40B20CF9
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 16:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A084E612;
	Wed, 22 Nov 2023 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xb+zsQoj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BBA11F
	for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 08:57:19 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7c418f58500so768475241.0
        for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 08:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700672239; x=1701277039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cZB27VWkiR1n6T0R6xoyF5FkoYqj1JSNRWgLWoOfmVc=;
        b=xb+zsQojYgXnjepsFOshWRSM1TtsjS/iEoXDF2MOkle6oELVk4oqv0gF1TgrzjsQeD
         UX/bQiucCWdRLIv/ZDwt/pcSGm4lAPB14SX31PqD8wf/i31BLl6Nxrt56WcRDAWKtUd6
         IkqBJANeCiB82rcd4huTEDxNVEjK9nGVomK4nUqXowT+cB5d/SMB9dK+hcv3yg0ISEN6
         pjCeWRhO9CjBsEn1j8Hv7SHC/AUibAjG1rAFZidzg4yAbzWrPwsIrtkvt3k9qWInvd9V
         tp0lJ1zxlRg5EL6U4aP2lPsBWathHgehuy+dtaYeFfu4m4opE73HuIUuE36LGjqhnF8y
         qVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700672239; x=1701277039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZB27VWkiR1n6T0R6xoyF5FkoYqj1JSNRWgLWoOfmVc=;
        b=LY8yzTwny2W7xKYf1DB5HekvnnnBytNUxnlK/YYnC1qk/Q60KY7YC1SVaGQTWgGOEf
         z69YEV1HZ+rNp2POoAHjC5/6AG+P2VSL+xCc2LGpon3HZrXc5JTrELuBk01rsx65RoL4
         lXEE47kDH/Fp4kpESU9G8RMpWhSf9YEX87KRPqkL6eTTmRx7O2lgj4k6cyyAbalsOLbv
         Yamcv+tqkoMtQAzI+oirdAMgum0/eQbzhGuzlw+httH3J8QtW0k8hYd8lD+Q0CoROLPx
         6aOhQV8UcRx0UeP/zcfgOiwFzXyglYsPSjy5fDmkPnpkVvhVeH3kLni/tY4w7i7c9l7L
         azJw==
X-Gm-Message-State: AOJu0YyMcgFZEx1YOUcuziNJRkNHp3LpTUMSbyz2NQfiAA5eQ0nB6fHH
	7nD9Qx+6bsmj55WjCIksDxVQgGDrZZXc2AvTVFdJMg==
X-Google-Smtp-Source: AGHT+IHlP0thRJpP4ss6bt8AweGLOz+Xn6zK35geAVWg7incFTfb0O50sy2L4UTcUc6iNu8Y7EDoeeF6Irpfhg+mHrU=
X-Received: by 2002:a05:6102:4745:b0:462:913d:7c41 with SMTP id
 ej5-20020a056102474500b00462913d7c41mr2735425vsb.7.1700672238916; Wed, 22 Nov
 2023 08:57:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122155916.38037-1-brgl@bgdev.pl> <480fef02-09ed-9a32-d5bb-e7114381220c@axentia.se>
In-Reply-To: <480fef02-09ed-9a32-d5bb-e7114381220c@axentia.se>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Nov 2023 17:57:07 +0100
Message-ID: <CAMRc=Mc_KAX0QWSoL9UEwwjFCD=fHv6ydceSYwaY91C=RkURxA@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: use of_match_ptr()
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 17:41, Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> 2023-11-22 at 16:59, Bartosz Golaszewski wrote:
> > -             .of_match_table = at24_of_match,
> > +             .of_match_table = of_match_ptr(at24_of_match),
>
> If you do that, you will need to also add #ifdef CONFIG_OF around the
> at24_of_match definition, of you'll trigger a warning about an unused
> const variable (for some configs). I think.
>
> Cheers,
> Peter

Nope, no warnings even with W=2. This is true for unused functions but
unused data structures are just silently removed.

Bart

