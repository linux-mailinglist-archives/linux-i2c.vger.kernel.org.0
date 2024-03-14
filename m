Return-Path: <linux-i2c+bounces-2351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F987B85B
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 08:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893EF1C20D62
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 07:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B330F5B5B3;
	Thu, 14 Mar 2024 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkjQXhTP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E315A780
	for <linux-i2c@vger.kernel.org>; Thu, 14 Mar 2024 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710400375; cv=none; b=gVzyJ3jLt1vzfp2moPTE2L7ILwFDfKfuPckVTpd5Q3sjKl6a3Nk11F6HMumvM18iwB8WY1lufUUbSlCuvw3wAu/ANYxqK9wqZiQpkjpsHbCeWqpopk0cjMOSf2jkHj2AJ96El7wdkw0s+mPxONWZIZ722n+b/+FEC5Gy8nm7zlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710400375; c=relaxed/simple;
	bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UtyrDWqumw1hMZrltrc7WTtAO9oklG0C4q3q0w2heOAOh2bW3kkK3ipZuqsoLRbFOu9HTbdfrBukxEyOh9R6kIW6YthP/bfbLtczUc8tCBiwmSodqQGqUJ0ArFS6avmeSXnTYlqsnImIv9wBck6L7XaMGDQpToI2/YLKWq+nnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkjQXhTP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5101cd91017so1095505e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 14 Mar 2024 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710400372; x=1711005172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
        b=jkjQXhTPr8dq/WlMEFka35kTuowzug0fc5oNppZd6FFRhLp19pSdw3tbodAgI6eoov
         OzjcDU8aP6iNjBro9sZ3dkUPW0Sap1K+8Jsoo4PohjZuCVczAQ8DfdO2I3KeGwu6b9IQ
         95jWpGHVIcX06FDaOUzgPjR7pgd9w7/LHUNn7xeHLUuFVoO0XJ59aVVInXzUcai7tLxI
         3rAeSe6CnvhUFPXY8exG2d/pY/WqpHun55FGe5PIKzs/b0+/0OM+Uv+6HnIhC/9e8q9e
         rABH5EC2pGliB9sz/aFjPYK/ktxTSfhfY0mw3i5TvGgLlZCiV8GiWEsApTmrlDvKz7q7
         EhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400372; x=1711005172;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
        b=iag8NlLEUV5kGRVwSyjBycs7SRxYyccn9HSmoJoXv1Oq66SizMq/7Xly1/kMPJy0iR
         QXnaELlhtdUnQtH3qAOxSQC77e1wE4HhioVBzQMdnqUvO7tJc8/7Z6+XJhtRmV2qpJU8
         8mO6XNW0o41qYbcrT+DjERcVsja7HtG+Ii7IQOFg/zoWpgEWyLyCRN0/se27aOPavFaa
         IuR3rf6J4jDLwuVkxHTWLqBaKqK5DZpiPosx6C3EimsDe+K7qMDgBrUT3ceBTCCtyQAE
         5aeGWPlLMZDeAs7AKK6tQwuwAKqjvWuiu6WgH9SZtpbqaE46cnFU1eTUD548beTKUNx4
         Y/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWLAQIkz2ACTwNBACb3zMr0S2JyiVJe0yUiWSqmulB2gKo2zvxVNkja4e8zPgPb7nfw2HBT52gsOG2SB9SP2Xkwn2mrvCUMDPhc
X-Gm-Message-State: AOJu0YwNZI9z4Ru3lcDuX+ewkP5NsLrkKN86y5WuK2iljoUcdFbNVUPw
	o3qCJjnreYspkZxyf9xrtn8S6mYqG2rmtC/vaa+L2E07P6wO91aqtpHx1IJVXp8OfVhOlDdSgJK
	IvQfdOyGXFqb4TAgpAZYXoO0REPE=
X-Google-Smtp-Source: AGHT+IEjO0Hyfm1GpeQqIONHtbOGa0mptX9W3GQy+Ipj2qrV4B6RTZ/CC8T3ekSQf5mvanAUzJbVm4HTTSvON2LyJH4=
X-Received: by 2002:a05:6512:3e1e:b0:513:4fb4:5388 with SMTP id
 i30-20020a0565123e1e00b005134fb45388mr670738lfv.41.1710400371789; Thu, 14 Mar
 2024 00:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Thu, 14 Mar 2024 09:12:40 +0200
Message-ID: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
Subject: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: bugs@lists.linux.dev, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If an I2C-HID controller level-triggered IRQ line is routed directly as
a PLIC IRQ, and we spam input early enough in kernel boot process
(Somewhere between initializing NET, ALSA subsystems and before
i2c-hid driver init), then there is a chance of kernel locking up
completely and not going any further.

There are no kernel messages printed with all the IRQ, task hang
debugging enabled - other than (sometimes) it reports sched RT
throttling after a few seconds. Basic timer interrupt handling is
intact - fbdev tty cursor is still blinking.

It appears that in such a case the I2C-HID IRQ line is raised; PLIC
notifies the (single) boot system hart, kernel claims the IRQ and
immediately completes it by writing to CLAIM/COMPLETE register.
No access to the I2C controller (OpenCores) or I2C-HID registers
is made, so the HID report is never consumed and IRQ line stays
raised forever. The kernel endlessly claims & completes IRQs
without doing any work with the device. It doesn't always end up this
way; sometimes boot process completes and there are no signs of
interrupt storm or stuck IRQ processing afterwards.

There was a suspicion this has to do with SiFive PLIC being
not-so-explicit about level triggered interrupts. The research of this
issue led this way: There is another DT PLIC binding; a THead one,
and it has a flag `PLIC_QUIRK_EDGE_INTERRUPT` which allows
to define IRQ source behavior as 2-cells in DT; and has some other
changes to the logic (more on that below).
When attempting to mimic a THead PLIC in kernel DT, and rewriting
all DT interrupt sources to use 2-cell description, the hang ceases to
happen. Curious as to what are the kernel side implications of this,
I went to see what `PLIC_QUIRK_EDGE_INTERRUPT` actually does and
bit-by-bit disabled the actual differences this flag makes in the
driver logic.

This return path in irq-sifive-plic.c@223
(https://elixir.bootlin.com/linux/latest/source/drivers/irqchip/irq-sifive-plic.c#L223)
is only enabled for SiFive PLIC, but not for THead one. Removing
those 2 lines of code from the driver (whilst keeping the DT binding
properly reporting a SiFive PLIC) fixes the hang. I am not an expert
on the PLIC driver to debug further or determine what would be a
proper fix to this, but this probably gets more experienced devs
somewhere (I hope).

This is reproducible at least from Linux 6.4.1 to Linux 6.7.9 on RVVM;
Affects any hardware that would have SiFive PLIC + I2C-HID combination;
Most likely this is reproducible on QEMU as well if it had i2c-hid emulation,
or if we passthrough physical I2C-HID device & inject PLIC IRQs from
it's IRQ line.

