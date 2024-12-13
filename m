Return-Path: <linux-i2c+bounces-8494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662D9F147F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54EE0188CC0B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048F81E3DEF;
	Fri, 13 Dec 2024 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0P8p6oH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD6918873F;
	Fri, 13 Dec 2024 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112715; cv=none; b=NXiUZY8soAG/uEn8wkjTj/xw+L8l+ZZmRXmkW8NGoL1zbhxKwFyehdr2Rphshdiebu/HvPQDKb0H6ZLWE58VUJXSWbdZSp1jc3ovYM4HhXKAZHrMWF5xUyjOVQTeKWsOakzXl/o+1UVyvQ7zoyF9hLhtm9TscCInDWb/pdDyBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112715; c=relaxed/simple;
	bh=96AG9ze2118IHPx9v9xrbYLb5f4tMLmM08mDilOT0jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SK2axOJ6dWGKGbVzWgwbgJvuO5CFQNnvO3RiAqgsFdyS6+ZnRVYTNpO/RJEsolXUl1vYpFsxn/L3+4FPCLNlgvZGHhlO53b37VJffdTi4KZS1GaZoCK7TvdkTIvjRJ8uFU58QHs4TDAJGCM9u20CaW/EZtAzncgk/DBsxl9ldC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0P8p6oH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-435004228c0so24677915e9.0;
        Fri, 13 Dec 2024 09:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112712; x=1734717512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InLE83zTjQv9WyXKAcGkmHFfO1Avl98erQolvFBB3dQ=;
        b=Q0P8p6oHvqeozR8hQ9/jOMCYFIMJY3GKeSvG/q4UzD7b5J/ylNUIM4rVl2WkOYULl4
         CZ+c3AFfhARLDJw66sS0ojrQaN4q19ms+QBGb8sO52lV4gwH0+2Z+gISFQ+M1c5EZXk8
         moHOxDrQeevFh2mkXamm/wUBZ1h7gDoX6FBXZ+3VCEx3xlPlY6rUnyoUCv6mSJl8fvC3
         AX02bX4kKNMMYVrRMVqGI61K6VLvyDP6NUxDF/kVr77ozNi8oITJ1/8aUfuKqBW2zsSr
         zb4jik8M93nKVgrIKaBqCXQI7JqWlUSux3VREOv9eYu98C2mJKQSKtq3FkHyvEZ+LICL
         rUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112712; x=1734717512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InLE83zTjQv9WyXKAcGkmHFfO1Avl98erQolvFBB3dQ=;
        b=Ls6LMniN5J28bK7r3tabpBKoPjvLRGjO02t3vTa4uquKRoaDTEimRcLfcFod2cw5zP
         NCG+0BCQkNwdWCtCCtjTWd7M7W5jO7BpPtG2SM1qs5o9aSEQHRD2ZC0SefgD4q1vkQVd
         QjRkG/DfnLvlHNgyEz1bnFDk+d7A++5CNsaIfU42wPrvIUm/fUdPilpXEx3elD8xArZd
         blgshd/411R3sIkx0GVyabB54hUD3Q7qpuhcD8dt7ul4a3Fkh6v4GrclrluuW4zN/9K5
         hQBqlpBbOgLB6cb4FAurVO4a5HoSizwCM9k3Bss/z8EtyfGSke5dtDyd42tFMK41tmPP
         YlRg==
X-Forwarded-Encrypted: i=1; AJvYcCUXFmMb04z1KJPgeTxKEp0ydSI3USQ4V9v4GgZsklHWv1RNAaHbO8hYSLG6uIiVik/NJHMGpI5Cnb7KV/j7@vger.kernel.org, AJvYcCVNM1fnJd/4bnjsiz9ElO/OiP5C1gGH8OCwPYsdL2XDpL8hiyko6NaPZ0XKod4YHkYHHHHLSyOBUxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL8SnZDDLOq32F6o/u3Qmj8xoZepit2r9CQ0UQnPFh21ee8F/F
	tA+4ngrkyM5kY5rJ0BsfRCaZT9NDW277tuDR8NhkSolFd9nCkH9w
X-Gm-Gg: ASbGncsoh5VYz2XGK/gZ9YbgBeNG3A94VM9KDZLX0qD9y/qHc73pYZB160aquMgMccw
	qXjBEofpXDC2Up5SP+S4sy6BnNAYwA1Hw98rRacT3Zziomo3twrbOwWb34mHTfjWv2UmyX4mnSL
	aNGkNR6k3xM9beNS6xaJM0Eu5jojZ9cnuXwjP9+l4KdwuhPsYYxELE4xW663Y4HVfFs4j66qRIk
	7Ljtd92Pu5DkuirtLhIJ/tm202KGpWhORNNBnEArsybydpl+sbQknJ+KBjN1q0bwhlDFGrZB5mq
	hk3uHOGrEA==
X-Google-Smtp-Source: AGHT+IHpKNmrAEjUrylthYNcmHVvWJ3rk5LkuIHldklEZqKS8xK0v9EBQwgIMIoG6eebCW/Ln34pTg==
X-Received: by 2002:a05:6000:18c6:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-3888e0bfcc4mr2988867f8f.52.1734112712299;
        Fri, 13 Dec 2024 09:58:32 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:31 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/9] Add support for I2C bus recovery for riic driver
Date: Fri, 13 Dec 2024 17:58:19 +0000
Message-ID: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series introduces support for I2C bus recovery in the RIIC driver,
which is utilized in RZ series SoCs. The addition of bus recovery functionality
enhances the reliability of the I2C interface by allowing it to recover from
error conditions that might leave the bus in an unusable state.

Alongside the bus recovery implementation, the series includes several cleanup
and improvement patches that simplify and modernize the driver code. These
include replacing `dev_err` calls with `dev_err_probe`, consistent usage of the
`BIT` and `GENMASK` macros, leveraging devres helpers for reset management, and
improving code readability by marking static data as `const`.

Cheers,
Prabhakar

Lad Prabhakar (9):
  i2c: riic: Replace dev_err with dev_err_probe in probe function
  i2c: riic: Use local `dev` pointer in `dev_err_probe()`
  i2c: riic: Use BIT macro consistently
  i2c: riic: Use GENMASK() macro for bitmask definitions
  i2c: riic: Make use of devres helper to request deasserted reset line
  i2c: riic: Mark riic_irqs array as const
  i2c: riic: Use predefined macro and simplify clock tick calculation
  i2c: riic: Add `riic_bus_barrier()` to check bus availability
  i2c: riic: Implement bus recovery

 drivers/i2c/busses/i2c-riic.c | 222 ++++++++++++++++++++++++----------
 1 file changed, 155 insertions(+), 67 deletions(-)

-- 
2.43.0


