Return-Path: <linux-i2c+bounces-5631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A295A315
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 18:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 787442816C9
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 16:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192F815C129;
	Wed, 21 Aug 2024 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFQw42YW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0631537DD;
	Wed, 21 Aug 2024 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258644; cv=none; b=eXR/MP0eloQswHndJA9auX+lFq4HCe3VQ/N2EZhBeH6kxfFGL2+GM5yVwIITr6uGZOdDmDXzqInO6Cn+VcZ+O8zK2Oyl31KuvfjWrr4dywOpbr6sBAjfURuyhlaS/Vsr3CQSbsCmiEQr73R8TEK2hTOKzqTla0+kSPdmTmTQn8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258644; c=relaxed/simple;
	bh=sEnyaVCxeTo7fogPBKiKimrrhQPVr0UrqigxywBdCqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Peeeaf2dsQrEs+5/Zz7tDvGbaQ9HpKrVN/VL2LbRlkAn/p8KI2+57yCdFoui0OM636xGUZqN43LIa+NEA4OfKNmgXoAcVtz28xLVPuJr4BXXbmaUjb/FOc83xIbk/0SG1rnPzP001FxY9AnCEH6JC5D0hKZIwByI9FsiBdE6Dvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFQw42YW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533488ffaddso1318679e87.1;
        Wed, 21 Aug 2024 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724258641; x=1724863441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEnyaVCxeTo7fogPBKiKimrrhQPVr0UrqigxywBdCqE=;
        b=cFQw42YW/Ab0xA1EFASfV3kG0jrOE+xt3NfUPR51xpQLYhOJbK+VyRWEQ42yQM9NVk
         mZ+Du9CyClH9CjwZjYUEWTeXjpqsgUjMByOB5Dmvjq2t7dSrk8sEeosBYW0cjsjan9dg
         SpFAN6T7DPRT4zqMxuPU0nqXHmCVGcYWD2b8YptMwAfNlNgdll6YNEU4Qf6UWp2ZeVTM
         CCSlVDxRqTDItaFthu1M8tcIjQW+fC2ueKTIAIXdnCc0051FnB64Ujv0+OtCT2olrcg6
         /MdD130mVNZIpsoe4PULnr9LmS3IzQdZKE3shhd0gm2TZfBtPe7749RnQEungH5QKM6p
         L7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724258641; x=1724863441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEnyaVCxeTo7fogPBKiKimrrhQPVr0UrqigxywBdCqE=;
        b=SILlxy/ONaHIXlykvTYzpUVYtM3flDA3PVpiakZx+haFEwSFOOVDuFmMY4ciYRSjFl
         Id9R8sOkHg8kiou4n3hbeKVnr1TPoJxSqb71h4/7lTOBN16Ztzt29T6vko/GQltzDd5S
         4PPMNFTmq3zh6aibxmb/rE5vMov5qiFH1RcwLVpEMIqC/PcWF6oZ4/UUxOlj+KrLamt2
         woVUhRyXCwLcIVEmKuD/BABQSdXxh1J7U19CUuZF1aHNZd/t9Mgehnk1WvSSJkCgkB8P
         /Xn5dbKbrRYUg5oj/ogysMQhF5q0ETs1zG8whX0dEWNj6KGHPHKvILRud3A/sni0VyzL
         bN9w==
X-Forwarded-Encrypted: i=1; AJvYcCV7qhNaZjQPD9vh6U1ZvQ8QqeqG+0hOavWeiZKw0gL4s7xF2NMZF1xiCmxZkb+dQgRlN2o97bH0FZk=@vger.kernel.org, AJvYcCWUGpONUGwoNVmQ86/NGGUL9L+KswMbGays6D/qYXKvRXkcqrN0wLm7jmhUiwcgn20zvESpuDZmCruuyNNa@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZylwXbth3E9zDVM4n4cNhU8CL0ct2RxnmL1zaz6MoIC4RRWq
	X84JIYnIe5F5D9d5Czird5KxjsFUwbs+U4mpHDCdFtiILTtNggQPvciC8wax04A1SZTV8B6BUf1
	vrqNER+fOJxf6su90Gos2MuWjpF2KqA==
X-Google-Smtp-Source: AGHT+IGc8rj17D69zG/VL5kmvymbTbJEZ+tI2QgUHXTXpBZk+e3xvP9nOTqIPmeJUEePvoo5TEkBh4VQJE2KqOlRF10=
X-Received: by 2002:a05:6512:3d09:b0:530:e228:7799 with SMTP id
 2adb3069b0e04-533485bcd97mr2196989e87.58.1724258640875; Wed, 21 Aug 2024
 09:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
 <ZsX8KzkQw0wJUCbc@pengutronix.de> <ZsYGbN36jwxyMAvE@eichest-laptop>
In-Reply-To: <ZsYGbN36jwxyMAvE@eichest-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 13:43:49 -0300
Message-ID: <CAOMZO5DW+Wz7AWPJCBXkdaMf3NRcZTAmj2Wo9rvwnH9pDGbSGg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan and Oleksij,

On Wed, Aug 21, 2024 at 12:23=E2=80=AFPM Stefan Eichenberger <eichest@gmail=
.com> wrote:

> Thanks a lot for testing. Are the other patches required as well or did
> only introducing the master mode flag solve the issue?

Only applying this one fixed the problem.

> > It looks like with this patch, the I2SR_IAL interrupt is not cleared.
> > I would expect some kind of interrupt storm. Can you confirm it?

I have just inspected 'cat /proc/interrupts' and no interrupt storm is seen=
.

Thanks

