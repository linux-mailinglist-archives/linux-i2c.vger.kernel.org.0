Return-Path: <linux-i2c+bounces-2428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB7880AAF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 06:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521F41F22BFB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD35014298;
	Wed, 20 Mar 2024 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrJfgeez"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1248711CA0;
	Wed, 20 Mar 2024 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710912924; cv=none; b=ewjMcXJPgB5d/1tqw6Jks6Tvwz8f0WKkwf7zdzLizV34K6yra5UVpgM/VIknATCT8TU4MhVOkYOJqQ1+GED6jf1V+7/bVJyTSm/ykQrbko6KkILlT2hvj/ZUPR7F7TxRaQLQETVJYiL1FOtNXi9slcj7FZnIK6xU6MT/VAJsOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710912924; c=relaxed/simple;
	bh=lDj3f+rosht0VqTqt50FoOoChvKBoWe9AFsZ3Vs1g9E=;
	h=Message-ID:From:To:Cc:Date:Subject; b=kh8e2TMNIQ/SmcQuwyk01i7VoNMk6NomYOhAFsIb58RSfXShPh8Y5wdq3uuQvI+rHz3+Cqa0uYNQ4zXXtNeQPcVN98ApsjOW8g0Yxi7n0FjYOnWK810/TrvXZsHEjHTK6arHPJ8sNOFsduHNlXHEf65nYvnbhXnNVDAXUu/l1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrJfgeez; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7cc133f431fso140582939f.1;
        Tue, 19 Mar 2024 22:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710912922; x=1711517722; darn=vger.kernel.org;
        h=subject:date:cc:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqLWmso6Y8KzrUoHr+D43ypcjGVE/fKJMDs7/9zFkg8=;
        b=OrJfgeezcCqks0c5Bez1juvIWePEB4WYhaF5aDtgjC/VlMFAqOn7hqKj5J5IDs18yq
         Rr9u71uSwGt5u1ovPFv/2YjYbL6VE1OywzffOx8e7N9ytOVe3ksmLY5RphpZ6dpxiztr
         AOMDY8OKcS5CQMYcz4TxvEzU1ZiZBnbXPvv9SvXPfNqNNHrJEiiaCCKWnq6cHvjlGi+X
         T7UZHV761Z3q07r2phFTrKn9evaO0W1EC2UoP/amHbYEgNCiv2/O8ha9Wu9GNJtkkWGi
         bFTnxHTKuzjdFVhSwZ5+T3Ahs5nYQjGB2Jqi+BrFnkj7wWt2ZEUU/0F4VqVmpLAOeKJF
         TpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912922; x=1711517722;
        h=subject:date:cc:to:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqLWmso6Y8KzrUoHr+D43ypcjGVE/fKJMDs7/9zFkg8=;
        b=EEXFbS5xGK6GfRV5RUl1B0v1c7JJ1hDJsczJ+zYah+bzEipSp0T+oz3nEkMUN60k43
         DtYYZ/KJDfsxGlDH/sfkUdJ7AEUGLTBOTXqjAfJ0ZRKYp3W4iD3zz2IdbJguNRUc7kQe
         nYlmgVapDY/MBJBw/cKqcLwGiH+ef1jnk4g93lvpCYcBOmNFvAzMqr7eaLKV85co1Q78
         HOcvghXTcnXAltiE6lQW06ctiB7qvRfSzoEGToT/W9GTOKK0TS5/dY0EztemDyLJMwc6
         5BLxcfN/g/615d4VRZzUvXS+KeWUgggMEhmpJzmgfzNfH2yfBdDIxFyVvARRzQGBvjNg
         Qx5g==
X-Forwarded-Encrypted: i=1; AJvYcCWFtrgYD1Y4Mto8a/akWmD+1q8Fi+cJANoAWrxEf0XYKXK40xLkXhnVQcuFgMRHVcKDSCFa6NVcMpo1rUA9/F8Og3Y13CfbFLdUVV9L
X-Gm-Message-State: AOJu0YydqeoJR1QYMqEKKs8ZdAtyFn6Azxtg1UyoUtfwJwUjQyDnOQWK
	ElSX3Pcmhi1Fbmfr4HyG5NDP95nkAZNIbKIjnINCBwDUfqSpzaAf
X-Google-Smtp-Source: AGHT+IFu6nIGdKYxiSoz2hiJbrNhzoghyVc6FtBMJ/NcPQ7yAZlTdzvzq99+SJFVMCXcQ/ks5jpcdQ==
X-Received: by 2002:a6b:4f17:0:b0:7cb:f1d0:a1cc with SMTP id d23-20020a6b4f17000000b007cbf1d0a1ccmr15941653iob.4.1710912922150;
        Tue, 19 Mar 2024 22:35:22 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id q6-20020a5d9f06000000b007cc6af6686esm1679597iot.30.2024.03.19.22.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 22:35:21 -0700 (PDT)
Message-ID: <65fa7599.5d0a0220.fe5f7.1f9f@mx.google.com>
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <sam@turingpi.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Mar 2024 18:44:56 -0600
Subject: [RESEND v2 RFC 0/5] Enhancements for mv64xxx I2C driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Salutations, Linux I2C team!

Apologies again for another resend; I'm just as surprised as you all that
modern email clients are so hostile to sending the exact byte-for-byte .mbox
given to them. Really wishing I could use git-send-email and be done with it.
But, third time's the charm!

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


