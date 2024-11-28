Return-Path: <linux-i2c+bounces-8249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D59009DB24B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2024 05:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79556281FD9
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2024 04:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDA213B792;
	Thu, 28 Nov 2024 04:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MnRha1rq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036641386BF
	for <linux-i2c@vger.kernel.org>; Thu, 28 Nov 2024 04:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732769844; cv=none; b=nrBKLCtekI0L8xVl9KafDnQy6nWfm28XJfyF5XjTrgz1/bOQ8Wu0wc1z2W49Ve6dF5xKEet0lhbCStyDBwQzPppKWEgD5Oqp1e5IxiFR2VfcTUHLrE4wfgBrADEwto8uIaigeI8jt8G28FzK+J6FoJ5+prIPECF5SCPF/tRUIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732769844; c=relaxed/simple;
	bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qnngsqDvrzFaN1y26k1ACg5wBQQgCeSlz4pexpADY/u2XmPjA60lsuiDWFMkQMh2+1nigiHpvKeO5twkWYjTdx/d2sTgfNDICZPAbzqGl/BFArPTlMQsAOCYDynYlAI2IMxMs8rs1SD/cKQaSHOy2KZbzpBppBMAYkNNl9kVQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MnRha1rq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd8b7796dso354289e87.1
        for <linux-i2c@vger.kernel.org>; Wed, 27 Nov 2024 20:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732769841; x=1733374641; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
        b=MnRha1rqwe9Qo12ksrkSlyOH208sj7TIddzIN0Fm3PrYrsvbBpikOlhD/L66VqvJiU
         ilhUzMDYCX6Fyx19HKelSA5UOWzwRgsehnM49nbd9kshNr6BPGrJMvEaXf9x2GWKXmFT
         5FZtphIJJ64izl0iePBVagXfVvHBn4A/LSIEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732769841; x=1733374641;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
        b=jsFhR1sHJ8rMCgorlDXE1OqHzmay+10rggXztpddOQv910TRwQf945twY5mZM1k81w
         +EPTw3c07Jw5zRhDBXxtR80gjJRsx5+deDsemsmjLyy2H1U4P4drObaQPBR+HhIA5r/Y
         dqHs2XpsPvM6hjX5V/+I9NGIyYQMdQXvNWmrK17MNyRm6QgHk8Wy+Rxr3bRrpCv00jaW
         y6D0q3AxRKb4DkaeNesGqKeGM8OUEEb21+FGiUnLFPEx91Zfdub/q0OMQkMavg6tH+1n
         L2D9gaHcHWkzWd99EPjnXbZOVR4PZ7jfh3w8H4pnpAbgxhJ2RNWM9K2SkNrxBPq9VvfJ
         7x5A==
X-Forwarded-Encrypted: i=1; AJvYcCVqxdWAB3jOtMdI5oQ7QhI44OMqbg3sClL8IhvzPykhejYBIM4wNVxVfGLmt0hIAG/bW85M7JghTZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKh0WQtDIAPsiozw1+P3sfIJqyi5gYcPFYZgd6j+b3xFFt2tU9
	fUfZO9qf1VYbT40DCvLQn606Rm7pX1ywoj/+ncHULYn6f6FbNFFisi53q+lUXq+r04WAiJgi6cm
	qKO7zUMkImZYvTDD0QWC6XWUYw12Zf786ikgmi13QI+3HkSI=
X-Gm-Gg: ASbGncvpm3czsaO+3X5D5PWsgFaqaFzMB8bVwcJBSECCriV1eb9+V8GwSoMbu3zpWIJ
	yoYK9POeh8mOfsM/en91NH+0gWVoI91C8p14ceG3PA4o3zhRkW7ThUmcEDPU=
X-Google-Smtp-Source: AGHT+IG7n8N4nAMz6o9K2XahUaKaMVFWZxqJsiGFCbLs2B2ko1EorvcGfAfKGctbegSVwAcOe4uRUizxkULBFWIPM2Q=
X-Received: by 2002:a05:6512:23aa:b0:539:ea7a:7688 with SMTP id
 2adb3069b0e04-53df00a9f35mr3140014e87.1.1732769841115; Wed, 27 Nov 2024
 20:57:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106093335.1582205-1-wenst@chromium.org> <CAGXv+5Fzrz9sBvE=FpV6URpcZtxvchxfY9WE4k4s+S3BzMWw2g@mail.gmail.com>
 <Z0b_f0gg9KgSozPH@shikoro>
In-Reply-To: <Z0b_f0gg9KgSozPH@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Nov 2024 12:57:09 +0800
Message-ID: <CAGXv+5GUGwqEGpyJptAUc7aqdGAeFP=-um4=EfUNzxkahiXB9A@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] platform/chrome: Introduce DT hardware prober
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Wolfram Sang <wsa@kernel.org>, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Just checking in. I just wanted to make sure that this is still on
> > track for v6.13-rc1.
>
> Eeeks, not only Andi was so busy that he lost track of patches. Please
> accept my apologies, I was under the impression that this series was
> still under discussion. I sadly missed that it was ready for prime time.
>
> That being said, I applied it now and will send it to Linus by the end
> of the week. Sadly, this series was not exposed to -next before, so I
> hope a few days of -next will work for him.
>
> But I will surely try. Sorry again!

Thanks! Fingers crossed! Hopefully Linus sees that all the stuff is
just new symbols and pretty isolated.


ChenYu

