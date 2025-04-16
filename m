Return-Path: <linux-i2c+bounces-10378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03850A8AD93
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 03:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70D201902D57
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 01:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0A2226D1E;
	Wed, 16 Apr 2025 01:39:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6A1A2658;
	Wed, 16 Apr 2025 01:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767553; cv=none; b=nNLyayMDDabuOXbwGoL6xqCoOAmbgd6PE7zASTvks6As7HREEC80BbuUioB8YfVjCFjCgWIJTatlb1xVAXCDu4kF/6wwtf7WDqb5GOc/F7UaMRohxye8KMG1jb1kShsRq6zi6OMFsCI2g10g1eevSy2PaEj8tKYDtOZxy7EtpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767553; c=relaxed/simple;
	bh=splohQJw8U1XANtyUsXhKKF8Cy9tRT9Bwe2SzN0BEbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2A6Aq6j++MSsGD/eEe393o5NCTS0w9yzUbU95mazJDBQE5r8Eel1wxV+LCBEGAVwekjE8wPGTFAQIrP8va1Jp4vRrK7Mp5dTIBP55+gHKnG1clAT0kUfrIYmeQTuhrVMUHjwtI4Jb5w0RNhIcJsymU+lOIjUq75bFhe9OxmPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac73723b2d5so1232528866b.3;
        Tue, 15 Apr 2025 18:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767549; x=1745372349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1HXQ+Xi113ayzUNabjj8NTshwQmo5mZvOv0N53Neb4=;
        b=lPQ3rHdCNWMHKTTnhsyr9fS7wdwlWVywIOFL56A/N8Cu1/gYuNCwLrhIoHEIFsqhlT
         SYq+hleAsBnBeQc46oJTVc8Q2Byd0FiC8mfWoeVEAoFNuJdJ7ieq9chRTXo/xD0aSriP
         kielyulv4q2wJAzjtQ+w58LLvr3HwAQ1+oTnidteckRSuQx+2aYcc10A3joiNAlqBqgE
         XDLjhcvQw4puIHbXNFNLShqCvSquAbkld7P7fZ68EMQDOl+OIhj9NaA+gbrdEabq8g76
         xgKcrhK4nHu64n+oNcr22w5g+1QuRO52X+fxFLW7ROxYsQx5p+8KGPpnPg06ankoX/AO
         iSSw==
X-Forwarded-Encrypted: i=1; AJvYcCXjRs01epEeNSPkExnt7kqlcRdgxuJHOeUr9A/VemkNJ0MqU4m3npz0XP23ZYiXXjISYENPE9yHN0U=@vger.kernel.org, AJvYcCXyJSBRDtiSdFSfaOgjCcyS+uDg2cpM3SgCUQ6KkA5ET1b5tmD/2UE5bjlztmJMglrlXU+V6563pXacGzhK@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGbJbGERD9cNKFOpOoEZWXWfXqVJ+VqVq9eY78/eFcRZZspK1
	igk5CEUNYRwpu7ADZoaLZ0h5J+8KZIcINCVR0ESlHClm40mVPmSNVua5bXs0/hg=
X-Gm-Gg: ASbGncu7pj2z1x11wPDHy1NoxyY8+Mh4aNlA+Ni+7DxqRAK27/Kk7DG8LFEHoPaFHzv
	wp97U/BfKyLZLThftqYaZj0LJWm2Gtn28+VX5Rpl7fco5/DK1rWzTXB8vLXgAVTDwRn9UmCoA/J
	vXUwiZWquFQrDNv6MY5uQRbgZnvWBISDKCC883a0mWNw8BHUw1qcyShE39NdiOWholgDY9Qcpxb
	IwUosN+vkU4Ba05cCpFky2BgLEst3xhxvdvNK1TVkmxsQGZ08b2aYxO8NZN7aLxm28kVZRZ3Hra
	uYfXH3IeyPA0EzxEPXk58TLNjPTBhrbpBciFRmvGQJgcl5wrU3DevwavhyJypbCiHTpjGJM=
X-Google-Smtp-Source: AGHT+IHgHIJADHseDzKH72XvS0TxfebXufKy/lOPcvTeaf6MAdKq0tS9P7LMI703Bf7LGTq+x3OIaQ==
X-Received: by 2002:a17:907:2d27:b0:ac8:179a:42f5 with SMTP id a640c23a62f3a-acb38222672mr89261966b.14.1744767549076;
        Tue, 15 Apr 2025 18:39:09 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d349d24sm27776466b.182.2025.04.15.18.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac73723b2d5so1232522866b.3;
        Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIH/UAmESSo2GHgUqjkmj8/H0dMxDN6uJ3IOQrd8D0Fz6er1ycu9H/SRNwAGrxwtkvKl7wy3XPm/YspbSV@vger.kernel.org, AJvYcCXEe+TMjDitnQu6ZB5VEEbFXJE4tPRUsq3+/R0LL/neN6qyovaUHo7tiuxI3q0bxWicHl9t40VdXDc=@vger.kernel.org
X-Received: by 2002:a17:907:6ea1:b0:ac6:e327:8de7 with SMTP id
 a640c23a62f3a-acb3849df86mr88724666b.42.1744767548484; Tue, 15 Apr 2025
 18:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Apr 2025 21:38:32 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
X-Gm-Features: ATxdqUGM2YL7UPwB2q8EHrpPvcO9cfPSM4k-2kB4UVuY2Jof3nZs232BzqVAc98
Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:37=E2=80=AFAM Sven Peter via B4 Relay
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
> Changes in v2:
> - Added commit to use the correct include (bits.h instead of bitfield.h)
> - Added commit to sort includes
> - Moved timeout explanations to code instead of just the commit log
> - Made timeout recovery also work correctly in the interrupt case when
>   waiting for the condition failed
> - Used readx_poll_timeout instead of open-coded alternative
> - Link to v1: https://lore.kernel.org/r/20250222-pasemi-fixes-v1-0-d7ea33=
d50c5e@svenpeter.dev
>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (3):
>       i2c: pasemi: Use correct bits.h include
>       i2c: pasemi: Sort includes alphabetically
>       i2c: pasemi: Improve timeout handling
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 114 ++++++++++++++++++++++++++++-=
------
>  drivers/i2c/busses/i2c-pasemi-pci.c  |  10 +--
>  2 files changed, 96 insertions(+), 28 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250220-pasemi-fixes-916cb77404ba
>

The series looks good to me, especially the new patches.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

