Return-Path: <linux-i2c+bounces-2359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2970B87CB69
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 11:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5AF1F22608
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1256318EB8;
	Fri, 15 Mar 2024 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQpLCfN+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A489F18040;
	Fri, 15 Mar 2024 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498693; cv=none; b=hl2ySdmxwFIKz9Xdizqu5dWwmY1HqarHWhjMaa3f3Z7lnGF2TfegFPzvOmCJyW5vcNiAfut1iIaariqjDMXcDss2WL7JU20aM/t+vzUE1f3EUerUvSf8LbgWioiGs/ZzvV09NzM8HGn+rYTf8p72CSR9YAU9A5Nw3z5B2cbiXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498693; c=relaxed/simple;
	bh=RJX4FJHlMm3oenQeaE386MoRXPyn2WHUWes6h41yR+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bYMqFUK1DKCZYEUcO0A47g9mEr2xQUAYqgCPEH6UijJGWZzDq6UQVaHeET/IlyrCGY3kPS9ilmNTYwXhN7geZ48esdoRXycZD36YSNrRsiv3Vwb9dFEMHRFgJcEDxHyRGVgewg94gPiObaCsCZzrh9F+rgjnl5Iq1DlqKLVmfzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQpLCfN+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-413f936a17cso7913695e9.1;
        Fri, 15 Mar 2024 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710498690; x=1711103490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcarFVU9V+h10+R9Y+pltNDAfj/DLbvuBUHZVFKImu8=;
        b=WQpLCfN+iaxt/ee87vafFJfKxNm3iz6d2SDFjQbVQ9XP759Xilpf17s5jIPXFg6hlb
         X5GswSalEjn5j7F9Em6H2pYAAtLooxf0V1HafwGjZ4k85AJFKrhiDoUwMY3u2zpbQyjl
         9j1gJrFxbWV66iibU2422l/TMq4cL7LtRycsgaZo/Vv7ok2d6fZ/frDl+fP8LoWo6Muc
         27/TCLc9VD4CsZ5UGVTZlurDJ3tZY/r6T71yzew/tEL6XK2JHkj8AAU0SD3xR5fe1bdm
         o9NjmEukAR1UPSLq3FLWUpZXmbooWUWx/r/ql3jgeEYqyVdcqAq58hVXJ91gfl/o1tlN
         DJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498690; x=1711103490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcarFVU9V+h10+R9Y+pltNDAfj/DLbvuBUHZVFKImu8=;
        b=YNRyTHVwbnlJMrGVFtw5EVTpTzrVlDdqysV3kNTTwUxYRRhsS0+psng6ip4f9nTuYb
         t66aYuX4ry383T/pAxpoXSLdfNpV9iNrPMnye5/zVl7ytyuiCx9kiSTI1szo8IPDbt+F
         hBNnWvLGS3b59vcLWdR92MAaLDAYR63/wpF+AUD3ysbjvGEGR+I7wI+LJzFf4RWVrIWX
         IRl0Z1xF51Mv9xGLYw7J9jhIa96OxzLwulRTO0DLGAXLjJa2huZnEnuvDBgRUjP4zfSW
         /C3rSD83MXcpcLdKgyTvAbjOln3NkMK56cAcJqSqRfQMQoub9U1yCh0ts6hlghlwohMs
         e81g==
X-Forwarded-Encrypted: i=1; AJvYcCUa+WnbBgS80GGBKfWyESF7iNJdDavlhZ78QaWxlFA6GvRPqmFbR+Lwq54cxvC6ta3tzxaINMmRB9IW9a+L2jlHml2zxVWsuRUFh9wQwrQj4RKeRXDHJEX2qmm1E9igLE2JdN/jhCGBYWW3Aw8dc8f5PWDTlirZH9fps/s6errIZqO1ww==
X-Gm-Message-State: AOJu0Yw/3VjaAcUITaRVghmUbf/S0hqD6vUGUlLcXgGPlgc1RF6LJHp1
	qys01PvMiKL2sTGEMhCo5LUX6FySHf6vhddld64R0Ql7JZLcCneS
X-Google-Smtp-Source: AGHT+IHgVYsh5iptX0jiwjtNaalLI8OCEKEflTEvzb9QsWn/ScXXUUC5F8WsdU04ZpxykUC+GpPzog==
X-Received: by 2002:a05:600c:5117:b0:413:fea7:bd19 with SMTP id o23-20020a05600c511700b00413fea7bd19mr1791964wms.15.1710498689705;
        Fri, 15 Mar 2024 03:31:29 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ae92:6adf:5cb6:274c])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b004130378fb77sm8676549wmq.6.2024.03.15.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:31:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add RIIC support for Renesas RZ/V2H SoC
Date: Fri, 15 Mar 2024 10:30:29 +0000
Message-Id: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add RIIC support for Renesas RZ/V2H(P) SoC.

v1->v2
- Dropped dt binding which update the comment.
- Used a const for V2H SoC instead of enum in items list
- Dropped internal review tags
- Renamed i2c read/write to riic_readb/riic_writeb
- Made riic as first parameter for riic_writeb
- Dropped family from struct riic_of_data
- Included RIIC_REG_END in enum list as flexible array member
  in a struct with no named members is not allowed

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: i2c: renesas,riic: Document R9A09G057 support
  i2c: riic: Introduce helper functions for I2C read/write operations
  i2c: riic: Pass register offsets and chip details as OF data
  i2c: riic: Add support for R9A09G057 SoC

 .../devicetree/bindings/i2c/renesas,riic.yaml |  19 +--
 drivers/i2c/busses/i2c-riic.c                 | 125 +++++++++++++-----
 2 files changed, 100 insertions(+), 44 deletions(-)

-- 
2.34.1


