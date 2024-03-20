Return-Path: <linux-i2c+bounces-2422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A0880A47
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD114283FEB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 04:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D2811C92;
	Wed, 20 Mar 2024 04:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="eSacToBk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827711CA0
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 04:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710908406; cv=none; b=FPPfrwvoHQpNbMYzevuDwB/cn1ttrpv8njg+qYiCxsOqNocI2HhJ/W2Gp981hap/3595KMx1cAagKH2eLuI8ZheyWc9F/Pi2jfGA7xLGGCiAHOF4/MoOKOmB5zbJI4V+Up/7VcAgccwSBktlMJ6OFyyGuv8H/OTYdqn3+7vwWBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710908406; c=relaxed/simple;
	bh=a+lyfj6zeTwlOIWPD4BenCcLHO+vHC6TPolOl4FzFoM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tWc0TNva1iGqhp75vnY4kVPS3eLrpTEsT5SrMVqKvUOKTWZt/GygKfuYLO9h4aDNX51vOylHygG4Ip2h17KMC+tvwS814GIL9j6todbE7BUr7PUFgYv8Xih3dOPxzNFjt50y12RXnZWBkjckr3mET5pn7Mr83wGB7VSdHRO9rKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=eSacToBk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6cadfffdbso5808153b3a.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 21:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710908404; x=1711513204; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=guY2KM4DsbdsXz5uu7iJDnaLW29Dahcuc+xgvO6JLxI=;
        b=eSacToBkG7M5Fh7SSvrJR8m/Y04obM0pOhhwymQRm/PXLUHuDhLkXgKN69uVUmjCVs
         niPzeyANZ7cRGRPspkeLkoLXa93N9zNYUt6FTDG0r9GbDmTU/mADkFKJ/CQo/AllQmoM
         AuTkWweiNwaan8sRpkArF9yb6fqaQ/aQsDU9HroEBL+TkRMRm/6yLA8/5lrg1WKhrmfb
         eByrECt3HfHqbBW42IaO3SJ60+IBDAWBdUo9M54uHlk+f7BZlz0ekd6xHhGt+RTpIH5x
         BR9J5NvkCEmz2wzKK8VOPCCSiL2wbnZpOgAINelcNNRi2sI6HY8jKU8pSyXc7R+KV1Ti
         W1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710908404; x=1711513204;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guY2KM4DsbdsXz5uu7iJDnaLW29Dahcuc+xgvO6JLxI=;
        b=KhZW0vQm/T3yiem0T9ufo9ihlSzKuz2P2RUkv+foCHZNzjjC0qrRv9LhUFsdEudUtm
         UhBiQI+JjNqTFRVLB6Bn3cLymcllRDJ4Lw1YbJsHudaJzcYfSySSCZmMlEl/3OSRkc8o
         uIYJadb/G/XNoToy0VUDeBYr+XfHVgsTRrY6PDPSvcPhIc8B6NcE4tWGpmbGOHAoYYM+
         scPHtBY4j+55LGYtXTyFL1BB6CHpQij4J0pOaWunPs+6WMIxNVKNy3f/MbD/ODsWTRBW
         5l/VFgBNPEga3B/6mankvFtzEvEYvYPBcvWQifbcTwz8RXYPQL+Kq64ft6I+Et0lBAdb
         eLUQ==
X-Gm-Message-State: AOJu0YzcKLSVET2yrTQII6XIoRIF1LJaYWHx8zigSJ06rz13YAmB33Yn
	V14BkduQY2+K1lkCn+4CeRhL90Fv2r1wvl3sLo+NVH9+dsfyyxIqk4uKAhZGuDi6UJcLVM5w2Fs
	0nXsLid4AI8LuM9BQCxWjd+5mULp0Pwohkm2/Qd82Bg7J4fjWXzA=
X-Google-Smtp-Source: AGHT+IGW0qUS/trpEAYa3MLlIWx9ApWjKgdJY2CL/NKVnVVBCvEDzMxShnrhHLrfqbVQSeTeRCdxn7LkBAh/+5qxRe8=
X-Received: by 2002:a05:6a21:1798:b0:1a3:6fe9:4060 with SMTP id
 nx24-20020a056a21179800b001a36fe94060mr5194683pzb.17.1710908403659; Tue, 19
 Mar 2024 21:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sam Edwards <sam@turingpi.com>
Date: Tue, 19 Mar 2024 22:19:53 -0600
Message-ID: <CAF8uH3tYaUwhkkeFuY+PdsnSPqeTtWtOsB_hy9oOjF=f-2Hdaw@mail.gmail.com>
Subject: [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Salutations, Linux I2C team!

Sorry about the resend; it seems my mail client "helpfully" swallowed the
newlines on any line consisting only of whitespace, garbling the patches.

I am working with an Allwinner T113-s3 based board; the internal I2C bus of
which has a Realtek RTL8370MB-CG Ethernet switch coexisting with other I2C
devices. The RTL8370MB-CG deviates from "conventional" I2C read operations
in that it expects the hardware register after the addr+read byte before it
turns around the bus to send the value. For this reason, the `realtek-smi`
driver currently implements the protocol via bit-banging. However, I am in the
process of developing a separate patch series to promote this driver to a
"full" I2C driver, leveraging I2C_M_NOSTART to support this odd read operation.

In anticipation of that, I am preparing this series comprising five patches to
improve the functionality and reliability of the I2C adapter enough to support
this kind of device. I have heavily tested these changes on the Allwinner-style
mv64xxx core, but not the Marvell-style, and have not been able to test 10-bit
addressing. I would greatly appreciate if anyone here could test this series,
especially on non-Allwinner boards and/or boards with 10-bit devices.

I'm a bit skeptical of using I2C_M_NOSTART for this purpose. The driver does
not (and cannot) support "just any" use of I2C_M_NOSTART, so it may be
inappropriate to claim the I2C_FUNC_NOSTART capability. On the other hand, I
searched high and low and couldn't find any use of I2C_M_NOSTART that
*wouldn't* be supported by this change, so this could very well be exactly what
clients understand I2C_FUNC_NOSTART to mean. Given that the alternative would
be inventing a new flag ("I2C_M_READEXTRA"?) and figuring out how to supply
input bytes and output bytes in the same i2c_msg, I opted for the NOSTART
route instead.

I look forward to any feedback, bug reports, test results, questions, concerns,
commentary, or discussion that you can offer!

Best regards,
Sam

Sam Edwards (5):
  i2c: mv64xxx: Clear bus errors before transfer
  i2c: mv64xxx: Clean up the private data struct
  i2c: mv64xxx: Refactor FSM
  i2c: mv64xxx: Allow continuing after read
  i2c: mv64xxx: Implement I2C_FUNC_NOSTART

 drivers/i2c/busses/i2c-mv64xxx.c | 430 ++++++++++++++++++++++---------
 1 file changed, 302 insertions(+), 128 deletions(-)

--
2.43.2

