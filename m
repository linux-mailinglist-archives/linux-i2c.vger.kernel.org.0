Return-Path: <linux-i2c+bounces-9503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC2A3D043
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 05:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E32D67A9257
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 03:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171551BF33F;
	Thu, 20 Feb 2025 04:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCPV1DVs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD51D7E5B;
	Thu, 20 Feb 2025 04:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740024047; cv=none; b=Di8s2zcd4ICoaF5A9nSUf9poA1mQ+s75bmsqMrHeHCqugKChJ+sik0hUteS5aNVliveCmLeAFw9J6WHzhN3z8aRTj6LVcv401px3+sdYvsBmyTtv2qTzmIeY258UwJ8rjOBUztuR2MU6LOqF6ALB6WLLA6XNxVNV0bP8I2tec68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740024047; c=relaxed/simple;
	bh=Xa5NjNFTirM4cwNDxz5SLaF0X0QdlYFsNJAgPdYkwz4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MBMw1IFbUxossb26nvIAo36Nv9aCZGbzgJHGRAEGlAUYPwrv5OjxBqqq4gND4y8xt0gJ6gg/Cd6J+DU4/8lSSyMnzKhuJ060LvLUpUKHvXoty5mDm52t1eE3SFe1hhgr0y4SDS2iN+G/L1Gq/p8I0u/DPuT6YNWDGy69rasKC7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCPV1DVs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220e989edb6so12169555ad.1;
        Wed, 19 Feb 2025 20:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024046; x=1740628846; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv3tZqQaWCjcD6PO3eDwpFBkA9euhFlwIT4UxpHFlTU=;
        b=ZCPV1DVsNlp76UVueVdVfJT3sHUA5GQviST0+T78U5uuNpJ9H17Qkl6pFlxfwARhqV
         ip1+Y7akAM4PUa2wPKBkVPO2CwWcQTqikDFKU2dJTLpOZyhYDo/j6GtShC+9UrSPhDrJ
         e2/IdePXQtd+X6KrjWfqhFr3wph+7nuUrEv9V8hLcA9BFHCnv1zJGOOQj0WGhB1dHKpN
         gLcLgyFWXKrWCcAlzOM9JP+bWau4AGBaxFtBcsuGClMFcEqgDSe40haI7I/lCQYvBig6
         toRLXNBYeoEUvx8bA53iPeW5xlImAzFLwo9v+WezbwmKm8Xk3rgMJed3yRdGYu+pIOq3
         ag3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024046; x=1740628846;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv3tZqQaWCjcD6PO3eDwpFBkA9euhFlwIT4UxpHFlTU=;
        b=h8h0YrNbfMrIofseBqisxOQbZroHG8EAyLSjvFGQ94Hn58y5H2XFN6QPJ1hJPf6CGZ
         svLf7TXUtG8rKfAs+QVGyjKIIe76HqS96scInL4mGQHqBAcjaNXCxetXDdFsQ4x7Z6jk
         9hqd3IW+MnObLYk4xd5daQKXtaVY7niOMYJ1+QMMcVqS0Pw493+Ff1TzKG08YI+OOtur
         2P2NZnUSzcq3W6FSa6JE679LpPe1NjDwxFU/6OLnhYbQJvl8H8SmFykMvxMOcUFdxPn4
         c/bo1fNY1xOH/7sZWkm75gnSkazzSwuahhXmSnn5byjQ7Xzh0WJcR0JZ99Yh50qIwWII
         ZVFg==
X-Forwarded-Encrypted: i=1; AJvYcCVNtxzFg4gzCeVO7Ubkx50WwpF4nOiPR1u62Olh+zy/MZimsEojnkw29w4s0ofvWlHZLwbWpERJdJbcMvke@vger.kernel.org, AJvYcCX8CmgH8QuHCzF9F/lXxcKDJtIMeTjdSj0uo+WJU5u0epiDdaAeo1d3XNn5LFMbjhwHYFRwDuoJ+n8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1M/PX9+TZxMWPMwO6SEfTlYU+KgsUqirTJF177h49b7bX4lM
	rovLzxatv7nfKX8uyhJoC7WeT40Z3WD1WftujCSAl3n1Cz70LIbONQL5rzE=
X-Gm-Gg: ASbGncviQ9om/ZlRzPYu2tCfugvrYsPH1PWt98CE7ZmOiFyHlEOZtfI5SBEZlEdbXqg
	ELz78Z9Ju6bUS+nARXS4eJ8ViuaXselo0jzqOMGG/p3WeX64eIPu6N6Kn63PNcdtKtlRblLYT8X
	X37Bux0uth9FR/iQ6coEWuCl2pqEeoKZyne6aMyNWrbI0xbkjqkGIxuHZha8HSIrBE59y+yVrBT
	4kPLzRAd4/3UkIMGNNyZlrpdDuw20RZCL8Z/WQzF5SQTJl/uI5cMWHNsnFwq4XgQbM13k1RaTMI
	3PLBr/HdrzyVGr+Ph1GqESe5KS/7dhFGBnWcl/AAFBQPMzxnWUzwWurvnD0zMV1Ob88vzCv4hZa
	2xUEq/ls=
X-Google-Smtp-Source: AGHT+IHhgygbVKUP14J9iJrQW7688uwtCOUG7BC5yeECXStlcnjspZZNlv6/TkWbGHer0YMEczqlCg==
X-Received: by 2002:a17:903:1c5:b0:215:72aa:693f with SMTP id d9443c01a7336-22103efeec8mr337742115ad.9.1740024043346;
        Wed, 19 Feb 2025 20:00:43 -0800 (PST)
Received: from localhost (2001-b400-e386-8f50-c5f8-9184-9e47-206d.emome-ip6.hinet.net. [2001:b400:e386:8f50:c5f8:9184:9e47:206d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53491ecsm111768555ad.9.2025.02.19.20.00.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 20:00:42 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] i2c: npcm: Bug fixes remaining interrupts
Date: Thu, 20 Feb 2025 12:00:28 +0800
Message-Id: <20250220040029.27596-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

This patchset includes the following fix:

- Disable the interrupt enable bit to handle the asynchronous smbus/i2c
  interrupt status after the machine reboots as the interrupts were not
  handled in the smbus/i2c transfer session due to the reboot.

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Tyrone Ting (1):
  i2c: npcm: disable interrupt enable bit before devm_request_irq

 drivers/i2c/busses/i2c-npcm7xx.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
-- 
2.34.1


