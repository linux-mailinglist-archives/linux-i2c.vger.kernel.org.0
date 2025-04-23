Return-Path: <linux-i2c+bounces-10591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 604DCA988DF
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 13:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146205A43CB
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 11:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9677211A21;
	Wed, 23 Apr 2025 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKjUEUC3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A31A0BC9;
	Wed, 23 Apr 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408948; cv=none; b=rc6dYzkFqpFeEMsnAz2Xu3u+4+SgnIEdkf4mQXTc0/cfaTmYqfvC1Y/JATBmlm6d223nztV6X/ysT2aD9fuYcFxlWzT758MGVdQS5iOMGvQWRPPmwIZNBVDYNbJxtVTZP4cSoqSDSXIfkBcyO1s87Jatg/DVJLBg/m+gnPzJNgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408948; c=relaxed/simple;
	bh=u0LgC8gSz+tklwDIqWGRQhJySM4mq9FQ9FoeMtLsrls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSWY8dp4XPv9bt5nkOTU0V/mgLlGuTr2Hg0TvH6OTs8pH08DclGxeq3JWqy81fbnI5oYx0rHiFy1Zu9R0xtbjBT8NsRS2A+Kxbuhk2PVN3SMrTeRVbz1BcSC54cyuCs+DiaTMf7HWUFTqek5nOr4ze464rkj/uriJYUDienZc4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKjUEUC3; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476f4e9cf92so46977181cf.3;
        Wed, 23 Apr 2025 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745408946; x=1746013746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh30CCw7YMNuF2HgMY+MTEvAKCGP+j5wjDlIx45ktn0=;
        b=iKjUEUC3Xp2FrHluef6CySd+1rQaiyfii/evqyu5ltA8zk0CQqxjA0dBcO8Sj4FFUP
         dgq+7UAHeSTmoVDudmXAnN1Av1o+VP1OZm0Go505G/M6xMv/0gdLM1Kv9P4ZBMdeEzYD
         ec7REEzJcQ12LuTkYLoN9hFq5ns2DE9ykAKHEtS1O8f5G1VCmdi/1lD+3A/4eTWxyiqU
         tccMuwNsOGld6CRq3tDegBM4WdMNkKRU7oUjr1M8S+eoA3EHJDj5Z+Jen7WNxFcijEB1
         V45tIYPeHYH4jUAGBfyk9LOAZT+dUO5U58faJCLlSnm84pIOqs2nYcTcha7lAoErJnL7
         btHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408946; x=1746013746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mh30CCw7YMNuF2HgMY+MTEvAKCGP+j5wjDlIx45ktn0=;
        b=dIB6nmXnBFhDVlIxgKkYGetcbEzF4HCU9qTnTpsaZBf0xsB3bO9wqpUlxE0a7lcf50
         djWeqiJHnXnGc6gO0T/w8VsQGGSnZjFPqLOhkhrtciSuC2iqGpu1vqP3CK2HAFGaYtgt
         JVHN09agu/mDcDizii9Gh4AlCr22PlGIBTvq4mXE/IXOXi+b7ebTR8y3rIIvxK+H0EPS
         pgEscYaMkmIjWbimuyVI1kBOn1oybRKstQBBfbmfVexhEZXqsO25vfor4BnxXZBN3dzX
         83Yl05oMe1nV1MyuVrHGWTxoljgRQfCEhc8NMcIUlq/mnVmUbch4AR4A/6QvHLyUzCeY
         ZwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCXZjuHyCZwyCyo1BN9AP4yeJ6ylqh+7sdZFWXlzHirjIF7nCb55mQOnpmJZ2cJ1EuY9FXb4whDd/S@vger.kernel.org, AJvYcCVlLpFpufx9UaOMc1irUIH3moL5QW/fb2Ehxkgz1SZhzW7vdAbyIhcl8NjrlgwkOWbwtqF1XEl8@vger.kernel.org, AJvYcCW6paHTbsuoikC8S7M/JO4jG3m8YphpRilds33mMSOmohZqwP7CgQ4GA4/HOR+9wK+XUsLvpPqhZUCY@vger.kernel.org, AJvYcCWVX3PWVtCfbo2CkidDPLBPfyKOf0t2klensUxFpz+kBJQp+xwKJz3YVp1vcLCfk2btixuJCKpSSfo0@vger.kernel.org, AJvYcCXr+JgemOXNKDxZZ5vwP+97mxjfLh4KYaCZvnX4Ai0cohF+RqUAfIybBxeTeEUBbDsHaiFyEUP4+2kk@vger.kernel.org, AJvYcCXxwLV63ZarwPDEEi8EqDXFlGTT0eGfEoy+aOsx3sHpqdjTi8qpSues6Eq1Mm5q4WwbEZH8AGyAat+qN9HE@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvvG/MgGu+rSRyjYvAS45SdMaM/sNM+vELq5FOO+zrHS2dser
	DEiYxrxe/Hq2EiR8Y3QDzIHU5wl1KejD9SkuY61nvSk0E3Cpz43TaDLnV6ftGKK8K8IccFm2QJ3
	QNNglNni3LWsXFMQXBJ2OigABybs=
X-Gm-Gg: ASbGnctsr6R+J7a0hYnmtx5Z6pAG3IOX7ftm4E4/4XRv2YFw13y+6gZjBgIP8R2DOMU
	BDv59Z3knAX6tUee5aiMyvmAWxeFfW4KYSaNLr/wIQviiNj89EReVSuM/p8h37gJ2P9bj771t+3
	dmXW8HacWt0GsLJieKe/Ks0fCKFQ0nUt1KAx+FL1rf3Hp/xCTDNos=
X-Google-Smtp-Source: AGHT+IHnmHVj6mrD4yULm797iJp2Hge3Q1/IoUPfy4o1SBoGiTD5PJbKw40s+FG3p+g2LQD2zcyNiHAKlhiwni4/o0A=
X-Received: by 2002:ac8:5d09:0:b0:476:8eae:3366 with SMTP id
 d75a77b69052e-47aec409d6cmr327008441cf.30.1745408945916; Wed, 23 Apr 2025
 04:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com> <20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 15:49:12 +0400
X-Gm-Features: ATxdqUGsZKSYp_qBuVFzW8QPobruMrp4O3AQIQ9bZeUJ2Rcu3zjTKfwK4KpQDLQ
Message-ID: <CABjd4YyXf=dO-GqVJ4sacbdiTTh8uyPUpe4Q68L0tMg4RYyRVQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: net: via-rhine: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 12:22=E2=80=AFPM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> Rewrite the textual description for the VIA Rhine platform Ethernet
> controller as YAML schema, and switch the filename to follow the
> compatible string. These are used in several VIA/WonderMedia SoCs
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 ++++++++++++++++=
++++++
>  .../devicetree/bindings/net/via-rhine.txt          | 17 ---------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 42 insertions(+), 17 deletions(-)

Dear all,

There haven't been any review comments on this one. Shall I resubmit
this patch separately from the big series for easier merging (perhaps
also dropping the MAINTAINERS update until later, so as to minimize
conflicts in linux-next)? It doesn't have any external dependencies,
and the binding itself is rather boring/trivial.

Best regards,
Alexey

