Return-Path: <linux-i2c+bounces-7299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F69968EF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8C91C22EC9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 11:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87861922DA;
	Wed,  9 Oct 2024 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zRqDbGRF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46FD18E343
	for <linux-i2c@vger.kernel.org>; Wed,  9 Oct 2024 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473778; cv=none; b=sbSunhXC/fMM7cuslj29lXQ2SdEuZlagXE/kkryOvIG0JxyiSy+Qsft1p9scydwnGK8p0/6/88XXZPwLkMCP7rW0O9MzKz4daCl/2+0Z/wveKacw27EhQx4kuJXLVCPYLypLBQ5DRsBtrESN5PdHN7rWoCO2XrV8lvwwy1wa2FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473778; c=relaxed/simple;
	bh=BSKbXKJqzTsd3uaOfVQYvC+3CVoZeM7xAmzIRqlfg+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzZj4I7xz76+O/w+m36UUafyqV1T42k9cfadUZIOkNtt3bWDBMRgNpRPzEK7BknOyZkXucZ8wx6Mf8IrEi/1xMWhKAd2xqTQ/Ay84pTZ2tg7lw0PfVX/qQbauR0T1yGfwHgrrj1AihRwC7GBGCG0f9DuH0TZkdx6ESUQOYNFrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zRqDbGRF; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fad5024b8dso77132061fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 09 Oct 2024 04:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728473775; x=1729078575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulmNMFxv/3Cp2Bz+2y+sXqWfdub8KWmBh74jTPivB+s=;
        b=zRqDbGRFNFVjsQ8hwHhadNeDsvl94ICaQBMvDrTDZ+Ur3xPKEkRECBRj/2hdsvA2Mi
         QK5Bp7Wk23fmFLqB1gUWy2X74pGAz5A4d3VMU8EtYM96K1Gk+OSMp4CQ+hBjUQiEoK6b
         PLC3xcDh1gp64Evmm43NJL311zdJiD7v37phi5kUieYc5OEGFw8mI3cxpgbfaaNb4B5d
         thFDftJ+YBVRWBSYhsOertMVD/u/9M7W1toWa7Jq54R8K3rAWiSBE6VWdJuygrkjfQTl
         oLLiS7O/BYeODxoIpsBvs/pPX0m3p/+1/mahogA3yc0DVcEpUHQccEZxgGwdkQ64h17A
         /gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473775; x=1729078575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulmNMFxv/3Cp2Bz+2y+sXqWfdub8KWmBh74jTPivB+s=;
        b=sQ6cgemMskok2XNKEAvojlEeTbKFLm76z2dingmxMdMfkpFJ1Qmb7KeQ683UsH5aPs
         /x3fPpscgrEV4I1C4YRRs01KLvp1EW3agBq6KRd8OBq4QZOBNBubO0JPSPzwdx7upurw
         bU2BACVuM+xHz2+IpxVLwZaje4M25K0hNE2cZH/LQIdvQIbNykpdHSAf6IUhM+CduO6e
         VaL5wQ3Z0iYwyQFlnMf+EEnhNRAVyf+YEwGTBLnfnwdFKL1vbZguJJNI6mhcBjPGGbcI
         OaRD44cMcL32ukAd7N2164bcSCljdh/ZtqsuO95SkQVi4lRm7CVLLB/vMwEpiXRLsMLX
         Hfog==
X-Forwarded-Encrypted: i=1; AJvYcCVfnZiECj8uDV+p2sZL2YYeO9kcVs4mZbGAnwlZQe8QVpN6ss2TWNQ3XJrYKyMo6HHiqLIz6X9rWcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2OFX/Aq+AcjbxXO7N6pTO9UQo0viBafsvAZufDRsAUAeh0ZMi
	seyJ97RaHdI+t5nyL/IgeEuidSDhs+kldGKDU94a5mIWIvzNWF7Q3ER+Y9Mfy/caGIQDZSkCv3C
	aCAIoVnObbXtu7TyF3Mxq+a1iKs1fiHWrVeBkAg==
X-Google-Smtp-Source: AGHT+IFQL8HqNRjIVR+UudCx6cwyjDEbayIZi+vVchkMN2pOXLQmyPRZirCYhwW99AJa3LiMKdJ1kZ/+fJRKckyit7k=
X-Received: by 2002:a2e:a582:0:b0:2fa:de52:f03c with SMTP id
 38308e7fff4ca-2fb1871b375mr13956081fa.5.1728473775033; Wed, 09 Oct 2024
 04:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com> <20241009-mbly-i2c-v2-6-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-6-ac9230a8dac5@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 13:36:03 +0200
Message-ID: <CACRpkdbqPMb7MSnEeK4vADrfeZD=dk6GA=A_i2M-53eGmJkTag@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] i2c: nomadik: support >=1MHz speed modes
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:23=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

>  - BRCR value must go into the BRCR1 field when in high-speed mode.
>    It goes into BRCR2 otherwise.
>
>  - Remove fallback to standard mode if priv->sm > I2C_FREQ_MODE_FAST.
>
>  - Set SM properly in probe; previously it only checked STANDARD versus
>    FAST. Now we set STANDARD, FAST, FAST_PLUS or HIGH_SPEED.
>
>  - Remove all comment sections saying we only support low-speeds.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

