Return-Path: <linux-i2c+bounces-11415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE73FAD8AC6
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AF35189E8EF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087992E6115;
	Fri, 13 Jun 2025 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3Etw7Lj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6032E2EF9;
	Fri, 13 Jun 2025 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814836; cv=none; b=P72Wl/t4VaRunUAzkRj51vt/H1PT5iNUS1xl/omFBPUQ6+SE0nxh2KfLwyUhqaI+zrORGqRiaLu7LJPHfora7nekHe3x52Ay9A3AOp/M5+c1hNBEi6u9IfGJ+RtSHAhVM4GZGvpRgXmdjZCjh9IoHJ8CHj6XdrmrO+CIHu4niRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814836; c=relaxed/simple;
	bh=bj0AsExdym+9XsHx/CCblHwGlzHY0Yhmv2gJfJPk3v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1iZmd3+En1rsnsJe7pskFnnG2PCdgPNV/cyB/bq18PK7MqX9X+U+a+A3kHfftawSmNBCBj1ioLkR4moDWeDD9opLjnh/XaPzzGYa93LX3b/96wjIfj9OMb9BD22xMLvFONTm3pELUSS4h5hlb7be+OnT7lVt2rGN+JoI5zJQhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3Etw7Lj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a35c894313so1916458f8f.2;
        Fri, 13 Jun 2025 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814833; x=1750419633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej9U22XWtaQCzEMSTHGSUWLr5Jugi0YBf6oBseCqa2A=;
        b=U3Etw7LjHgN/EbWgDyDWH7VIsG3QyFqRGBGKEF53NCDjM4NsnpzGnVOlHJoybaTAHY
         cc91Ms5eMBEQKd70OHLYRFsVDdgHOSy/OR9e+fhmnRwB8K9jFCkvkEl7Xyeg/a/H1Azv
         h5k9OumYA5FmupZGUtrXDDQwxZSTLECcIGE4eNzMBtaxr8gPGgENok0LETSsC1oNTi+z
         PB/uqDmyWPE2UdFebfsn8iM5VN57yDe9AegDhEm9KNkpW7Eahn5A5C8MV78DUohZIkFS
         DYSSXYhtJG8hwdQlIRfXt40USXwpgBZqGghB8UqYa73yq3DeNDguj3Jn8MKc/Spn9WAe
         Kh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814833; x=1750419633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej9U22XWtaQCzEMSTHGSUWLr5Jugi0YBf6oBseCqa2A=;
        b=GGAi5TN1nsoH9zXVGcPwa/LUa9eWNaKKi6h2hB7oOri7zOoXO+dEOm5OFD6P/yjAUn
         FE3eF4oMczMzoeUcjE9Lbw/3NeU39u7zj2WwS5sKJetFt4fzize/1sUC+Eos4ZNpj1Mx
         SziF6dZMk3U7jU9d98j2IupE1gINUeQhAaP+SMqO9+5bjeqS21ru0fftnlfBwteNLjyf
         zasXwAzLTfsDjEl8bJD3rHTWDUDaS1sZaD/DB07YiFc9MbiKD0ESjbyz8Uas3U5NBuut
         xtAJ2s1CCcNUyy6oqLoL266wfP++qwSBoLBacpK5QhMzFLAplW/2zHEpHOt3HPR4Dc/k
         DVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHMebX/+vktAalXJXKsMtZYVh/UuSYZFyE8uBs8by6QQ5zGLptisTCA1Im1vWtxYLH/6kiDlBtYan3@vger.kernel.org, AJvYcCUN2j/sX2PtR9mOnD1XznDcMMS0Ht6BTUYgY7Csgak2SztibXPJ/Vj2Otn0YDSPDMir/ZyAFeX7puLucmXL@vger.kernel.org, AJvYcCWyy5LzlbBQH9COyhLb6f8muGfzynNW2zhChfQ+mbl4mBpGQ4DeMzN0di9cRHJPHvrmF6LrNl8nJvdU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzy/FSC8mdgdFu0rl3Xia8l7d6tPVzQ3ZKVHmxe52/1m+yU06x
	avZd/GNmqnnQRadxpU/upd958wMvhqAWPFkx1IyoA++Sp+4ik3FlEDDa
X-Gm-Gg: ASbGnctC17BCB1NpXCzqc2Wh+jzVJdAqeJr8+iCWrvLEmpyW9FZsZTLuFdP4MIeKio9
	qLPmmjofUGjEim3hNG2cxTdP0vME38+4CtVXMb7heKzMHC9Baq2ijW4sQ/vMlZVOQAYM6VPApPi
	lXxueAgTD9y3cbsHMkGN7YXRkX4yhb/uDUc/2aI49dCsFC1Tk8WfNcF/eD/I8eQOouU5Pv/YkAb
	aJRKAoJOceBm46t5FeWY4X29/DXlhQsg8PYaThqu7dQGO+EYvX1M1oeeSV9Y5+cskUA50DwolZK
	M16lLPe/TgbLJDOYFSmmuKkxpWxH2YdE0tgglopVVc+GpcuGEWKJ0YJb9W8X1DLjgc3PufoM01D
	JmJS91RU8cg==
X-Google-Smtp-Source: AGHT+IGAC/0KlxpTib4AhQGoAlXzBMU+8zNtsrTY9ndO4huofFn7a5dt/p84HD7rEP9RsF2uAJKNfQ==
X-Received: by 2002:a5d:5888:0:b0:3a5:2e9c:ef0 with SMTP id ffacd0b85a97d-3a56874f557mr2764369f8f.46.1749814833184;
        Fri, 13 Jun 2025 04:40:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm2171519f8f.14.2025.06.13.04.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:40:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/6] i2c: riic: Move generic compatible string to end of array
Date: Fri, 13 Jun 2025 12:38:38 +0100
Message-ID: <20250613113839.102994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the entry in `riic_i2c_dt_ids` to place the generic compatible
string `renesas,riic-rz` at the end of the array, following the
convention used in other Renesas drivers.

Also, drop the unnecessary comma after the sentinel entry, as it is
not needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v2->v3:
- No changes.

v1->v2:
- Initialized the members of `riic_of_data` in the order they are
  declared in the struct.
- Added Reviewed-by and Tested-by tags.
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ecd1c78eecfd..d0b975e45595 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -693,10 +693,10 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 };
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
-	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
-	{ /* Sentinel */ },
+	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ /* Sentinel */ }
 };
 
 static struct platform_driver riic_i2c_driver = {
-- 
2.49.0


