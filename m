Return-Path: <linux-i2c+bounces-9552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA93A42F78
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 22:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE7B07A6EA4
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 21:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7B71DB122;
	Mon, 24 Feb 2025 21:49:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9401A2397;
	Mon, 24 Feb 2025 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740433766; cv=none; b=M3V/sxOs2GCMymDt6MfrB+ODvThxggxNbTfFR3VuuD4IcI9HKy0gPVGVNsnUQeWofpEmvaDYz71Anlg6xfG0estmDuI4EoZZUZe2zR+bPEPZ7QNkA/JqH76vfZ9x2xYPKrvZWm1gBbZoTwvnLbA5dc1Vv9+cKPN7+U9wxtWWdIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740433766; c=relaxed/simple;
	bh=J215scXfZhnZlzH787iKk4vILxSSZ4u+BZkCxzcaCgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuvSctqtlCToNvfcOI5uY96vcPuWPcZCks8ZDkPgRneERuN9eqix4NnyaIkWXZ7NyAyCfV4Xf+H/omlNKuH0U5VaydCPLRYfJmABmAqwZ+rI6JvhAIWKH/hBonYNZD7wosM1pE997f3FSKfHlrQx2UE4dZ4mcspmedQbiWnINHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb8045c3f3so606863366b.2;
        Mon, 24 Feb 2025 13:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740433763; x=1741038563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P47b/dtjhtFriTT7t5XplkIRw7292i/HwH3cMz65lgM=;
        b=OFwW/B2GCfewgxadinFJAO0b78tRfRGEugqyljVpEOFQ0X+NyUGrDrJnfHtvhUlKRZ
         kOUthAMg/UsXXAF/7ZDPwMNlAR/G6uvU801WYi0W2sMNE30gafMgWqfmbUNoS3qlvNx5
         8GCDqxF4iwtxerq07m0k60EkwyyUgVUbGkgArkO2DJw60kHFar/PWgO9H45isCK3owCi
         TnbRPTulVIQqWe5Aiwv/DpP2hgj2BXiOFJsURGovue785h6cCFQVPW8ipw9x9zq4IIW4
         OhiJ2wuesezuXQXZIoaw02oSiPbkgqW8hxdhUHqNlQztGk1563cFj7X18jdYf84ngMbb
         VdNA==
X-Forwarded-Encrypted: i=1; AJvYcCUWQ5rMRPRWcg+tcCjyi9ADyc8+hA6Rz1CCKw/1iud3oWjPq+a4jmEYXemMUJ3w1wpY91+EPTRhBB0=@vger.kernel.org, AJvYcCX7YlAYIVtBOhBAFMQQKWPiAyhSsMKOLsFoBdlIiVBo5NupfzITkMsh+LKT/BJ2QA4rY/6pncRtoCYHoxu9@vger.kernel.org
X-Gm-Message-State: AOJu0YymEz05IJAYoYklcBidz2Mh5f9jRyv7BZopZA0SXhYqzpln4Nx5
	mZ0ly/jtkvaj9o1tqr1GJaNt4QUp2wS/ZMFLTryc1SUUX9Havv5kS41RCJpSVV8=
X-Gm-Gg: ASbGncvRsBL+Hke+cAVBY/AADfYawwZsxGNnIqPRTbvzx8NZAfhW6XJXyaCg3QAZ+1j
	gjk+Deaqf/+FGLMgfkPlLw4skKAZxG5PqNll3zZYkEIjDTcjxabJRSwvEAwDFQTx6TWyKCa9CWh
	dvE9iUYbUudeKxwauUrhfQ8a/MRR7rNqoaefM7ZBx29TPFXEt/C9T5RvRszOEULH6BsNHIWFPeH
	yqjb73MBVQirRct5ZTbtd7I5GUKcweXWf6GbTdKHUcz+jts1aU3mCrQr6Nsy2tj9YH81OLljQei
	T4HEmTT580XiGNiQCfBc4Mq2Dlkd7WEofgendEva7RQt10MeeFIXsBKC
X-Google-Smtp-Source: AGHT+IF2pJopgg8oYXS8jbwX7b21UOjvD0SwbBFmDfaRfq85QBgjcfgrbqN9jyHh9ZPCKGSL/tq12A==
X-Received: by 2002:a17:906:6a0a:b0:ab7:e1d5:d0c3 with SMTP id a640c23a62f3a-abc09c28bf6mr1691534466b.51.1740433762447;
        Mon, 24 Feb 2025 13:49:22 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201215asm26222966b.116.2025.02.24.13.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 13:49:21 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so807154666b.3;
        Mon, 24 Feb 2025 13:49:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrtgLO9DaJQwBh6uBnwJrPr0mcqkL3fSadl3I8281TEwaEoSc9lPeXR5V5Z7pFP7ES+Oa0YeDd8Wk=@vger.kernel.org, AJvYcCWUMbxqBDJ8nZSHEFfFTMfuykKvxDbhYNBio3WPhf94SeCRNN95VcT2IhW8n78pfyzFjD1NX+TPInP9JRgx@vger.kernel.org
X-Received: by 2002:a17:906:308c:b0:ab7:ec7c:89e4 with SMTP id
 a640c23a62f3a-abc09a0a2c1mr1144051266b.21.1740433761758; Mon, 24 Feb 2025
 13:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 24 Feb 2025 16:48:44 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
X-Gm-Features: AWEUYZnTgmy8Wh3cNs6Z5TiDd6mBDwseYtK_5ZJpLXo_D79Innf9WD-b_IfXjLU
Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 8:38=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (1):
>       i2c: pasemi: Add registers bits and switch to BIT()
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---=
------
>  1 file changed, 92 insertions(+), 29 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-pasemi-fixes-916cb77404ba
>
> Best regards,
> --
> Sven Peter <sven@svenpeter.dev>
>
>
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

