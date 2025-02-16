Return-Path: <linux-i2c+bounces-9464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00DA37607
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Feb 2025 17:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC7C16BECB
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Feb 2025 16:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00AF19C546;
	Sun, 16 Feb 2025 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVPi8agk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DC199FDE
	for <linux-i2c@vger.kernel.org>; Sun, 16 Feb 2025 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739724677; cv=none; b=CrmsUv53FyDTu14oYuApUcrZvcPch7DpU48GnAVesZKe06Vn8aHQNuT9VTsOwcpHKyb8TEZWOPkdvVtWzorms4co31Lm4iZb4c02QvRl9MSPf5KnoQ1bl+mOTK+9yFjs/mJYsRG7dTYNN3ZZlfWh0upMImLX1yGxavtgc3R8zAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739724677; c=relaxed/simple;
	bh=O5LWncXqMGhNBqCSpMrkDb7CcDcJljEg1ZoT4TBKW78=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bQn4r7xDvn0QrWx3uoQehE1GyL9cqSguMCmtjklSJYOB+SsMUFtn5NOF/sM5Ctd4C1Q3kmr3bVhv5n6OEM0p9lrPa88nmaCVDqPYi51MO9ichERor8iFF5k7/r/EpWu0iTX8HiL/bMhUwffQ8oPC/RSfyAZOYiQQi/6SrbhmZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVPi8agk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb90c20baeso60574966b.1
        for <linux-i2c@vger.kernel.org>; Sun, 16 Feb 2025 08:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739724674; x=1740329474; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O5LWncXqMGhNBqCSpMrkDb7CcDcJljEg1ZoT4TBKW78=;
        b=VVPi8agkdIeNP90xGhbdL34hAaqVczKCfMLORuNnC4+h/lO7k1LE57ZNkWySc0SVlw
         smGVWVcPMxR8Twj50Xfz1Ki/Jf9NARdLxzPP4gyd3flj2gN2+Q/D80ZP1UOfCh4Zc23M
         oHAVkOMv9OcF7ewZj4MWaTEdz+CXJ8Zkoq0kJyxmAteT5ghCW+BtUSrhaPQ3fVZFj/AT
         N8ZNAlLVm6ZLzlWqZ6iLDcI/boOQQVdIqmGxCBZ8m4RsFy3bj1iPoP2Agrr6inKPOxcW
         MEYn5dbpXG4Qb4qkX0XYnfjRietG41WeiCK2ziYHtRft0o7nbrpk5CQd8L70SxQGXwCQ
         8TwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739724674; x=1740329474;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5LWncXqMGhNBqCSpMrkDb7CcDcJljEg1ZoT4TBKW78=;
        b=I7hmv5m6MDAYP4d3hkwEH0NeFyZJoT2437lgkSxcpMXSz+lHzp07N1BG3oiXDM+8Pd
         e2MMdKCnh/qzijdf9/z0xR58oatCqMHXV4LFGFoasBU/s4mG5xqTVoavTHA5FICIcDXR
         DHxELvJJoeWIYw/V4zc776lYxlAj9ZA1VAoGs+netxVI1S03UAvUfcpon1TbjzPFwx7K
         8Pkbn65aOquA8Hb64Z/damFZjNan1h6RAmdbSW4b0/xs0621J6nVXialSjHnqJw7zcLC
         yToL/nHBV7PC25sixKHexrscY1PJLRyj/Na0dq0Nbp7l7CwpIANoRT5msbnj31WZRNvX
         bgBA==
X-Gm-Message-State: AOJu0YyxiacNl5aW5PxTP2nDj3Srkox1fxIiU3mjYbccVZbaPAWQ55ys
	7vyRF1k+k1TkdkexqyCDDHuPAxug1RMBXvDStH4jXcj9gRpkoNy5ARolUUd6JMsJLrmiAZxFHvD
	8TvRpkHsNcU1iV1cdQ7GWErvBgbfrLnrbMiYxeg==
X-Gm-Gg: ASbGncsw3x37Ep85x5qHieWHmKGF4dD5k3kPI/5Ex693t3LOgoOEwI2tWq9dvfjk128
	UvwLTY/WxQ+r1JZ1VkE+dIh6cI01xAjdh3jTPujKqKT92zKzGjaIVk2ttK3XSFXjdCDwZHrsI
X-Google-Smtp-Source: AGHT+IGS0pIgYVAHulL7hyEdHKXu74y2v/06eIZZ9yLXtxIbdmycAcVVViTPAFFvbjfTJJxSAgOzPJIWuwUBiD1GDTk=
X-Received: by 2002:a17:906:c154:b0:ab6:db3e:2649 with SMTP id
 a640c23a62f3a-abb70a95729mr662636366b.14.1739724673917; Sun, 16 Feb 2025
 08:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Frederik_Br=C3=A6ndstrup?= <frederikbraendstrup@gmail.com>
Date: Sun, 16 Feb 2025 17:51:02 +0100
X-Gm-Features: AWEUYZkUA-JMD6bsHVdTzBDR-W7MT3Ux1Sy2cZ6ud4Y8NGcKS4-c2LOTCgH2_R8
Message-ID: <CADs2FCF+v3g4V4cfNREFm6KZ_LAHB0vCC2T2PcHjNO4UHq_atw@mail.gmail.com>
Subject: Dynamic address for an i2c device
To: linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello!

I'm starting to mess around with linux drivers again, and made a PCB
for controlling some stepper motors and I chose the TI DRV8847S
driver, as it has an I2C interface for controlling the position of the
connected stepper motor.

DRV8847S Datasheet:
https://www.ti.com/lit/ds/symlink/drv8847.pdf?ts=1739724138814&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FDRV8847%252Fpart-details%252FDRV8847SPWR

I have been trying (and failing) to understand if it's possible to
make the arrangement specified on page 45 regarding "Multi-Slave
Operation", where each device address is configured during
initialization, by first pulling down the nFAULT pin of all other
devices and then writing to the address register of the default
address, which the remaining device would then ack and use afterwards.

Is anyone aware of other devices using similar schemes, that I could
maybe draw some inspiration from?

Thanks
Frede Braendstrup

