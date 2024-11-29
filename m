Return-Path: <linux-i2c+bounces-8258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD379DC1B8
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 10:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4315B2825E0
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 09:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF171865E0;
	Fri, 29 Nov 2024 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ExBQGBRU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26725179972
	for <linux-i2c@vger.kernel.org>; Fri, 29 Nov 2024 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873970; cv=none; b=ZwQ5Y2o/TeJjot5E4yCi7JhdHL6kqYDqjtczZaH2YH50Pbyqlt7uJI5nb/AwD0SbgfsWg4JG9+4n2j56FAv2bF2bhS6M/T+HunZ2nMbKRbFou9PPVqhOf+kZLDoPoaJsosVCZDoHySfiMIfSlh9I+s/VLsnLUJNHGp3z4CRGFUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873970; c=relaxed/simple;
	bh=SqmOT6iWjnt0mG+nwdZYca2nN237AFxzOVzsJfDWvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzHF2V1KB/Y82chtQlMTARtG9D4/A5XGYn2De8UXx7BcCZTUovCU8E5xwRXdyfu8sblARlarylVj5FGfJPaGfROqRsc0nNr+bMoUTTrHxUM+9uWG7mAQsGOSOlKvmx+P94z6ylXWzJUfesYpqhyqagGpXlFlJgmFk1ovmizvZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ExBQGBRU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732873967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u9pRkC1e52aumPgah0dPBX2kXf19ILENP915r5Qwrhw=;
	b=ExBQGBRUnQuImsPKzD3Y/8wMt1tjJ2i6BGYWhqrgo03VRsAqUKBrGk+6XasrAQqsHjE9uu
	NEEDqnoAZf3FDePjBMyGImRHBHpRbOKfa7gsGPbXG+nunhFTMuTcjgsXH7W5UIfelCH902
	rlb3UuuvzQrT1NxUqMNetNb2r4sip8g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-2GNjr4gpNj-mlCgcGFU5kg-1; Fri, 29 Nov 2024 04:52:44 -0500
X-MC-Unique: 2GNjr4gpNj-mlCgcGFU5kg-1
X-Mimecast-MFC-AGG-ID: 2GNjr4gpNj-mlCgcGFU5kg
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5cffb934628so999929a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 29 Nov 2024 01:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873963; x=1733478763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9pRkC1e52aumPgah0dPBX2kXf19ILENP915r5Qwrhw=;
        b=P4oVL/G6nMunrY+qHGhI1vaPe5yjQf3irCigHUWfwntyc6YP2/lZqbV8FUfEOU+1tq
         X1FA5A8wWK+Md4VZGYCctodoRN9zE9khOZHxadIaEIVh9wuCWTb7yp5rxZAHMcMYdGCR
         CRyUvyCga97rX4b4jPjVMIFyeaK0NkdVRozx1HPplrfjhLrSIODnJ+2/Z03SUkU+VuhY
         Bgi0AzTqK1dGX8zW0OUbG8lJCjX08DuNb7O8R/1NttR5uuhs25DEQQDpHE48YVgSjwFN
         Q+oOYf4zxiq2SV+YMF66lsPlr1ZR6ws2morKDKC02S8j8KvFyHNIx3BTISPB/0xLNwqW
         a10w==
X-Forwarded-Encrypted: i=1; AJvYcCVoCjneFHlLHQVKLx4TlM7kZ4clW/fZTfuDtJE1/IrPAMPVSrCvnmTP3AQF+wBrtZ9/IYbftkcG+hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFsPHg3SnNTgG13ozZpnkfeJuppQt8srWeOmV9NY/lBMQ1FTO
	+Q79DaGt3NzRWYdl9PnAM6PKjxcZO96mpIrOb2Y9oYk4j5EKNZ9VoutobRfBlDIhrDu5J6kXaN6
	RSIK8JBGop4OhqBhk2O4MyyJqO6AUp309NZortOBJPtkYyUiT8eT6ITVl0w==
X-Gm-Gg: ASbGncsW2+hBT0PQTxz7HYwlbHZsdRcxB75AjcJ9ud9bh/vM6K6PwoD97eIL5nPp3KM
	MYOjPSMoQk7XZgmONKsTqqnrFjjZrEa0PS36iymojEcQ/229bJ4Ci9Z2kKdeXZy/5AIgU4a1y0y
	OaLXFSIp6AYaSUvaJklPRbPdLVOmfvIx+u1+1LCIHpkAXxy9Z0sU2icPfsUJVVJ3k7kLMzaPRSI
	V4Nb0gOUlA5utVzzanbzdy/XWftJFoK7sukawkYSwq/DnZMgKEedXlrLcv1JOFV4uHip75c9Ync
	mCht6kpweF5sm7dkI8ufiw==
X-Received: by 2002:a05:6402:42c4:b0:5cf:f5fc:4160 with SMTP id 4fb4d7f45d1cf-5d080c69119mr7901100a12.34.1732873963450;
        Fri, 29 Nov 2024 01:52:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1x2CcmMS3DDHYn2ZMvn/87pV8k//bJ2vQzTxS8d5iTD5KADjFjqrm1NCoFWK+kP+P/4M1Eg==
X-Received: by 2002:a05:6402:42c4:b0:5cf:f5fc:4160 with SMTP id 4fb4d7f45d1cf-5d080c69119mr7901082a12.34.1732873963145;
        Fri, 29 Nov 2024 01:52:43 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097dd9b7dsm1728078a12.52.2024.11.29.01.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:52:42 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: fix typo in I2C OF COMPONENT PROBER
Date: Fri, 29 Nov 2024 10:52:38 +0100
Message-ID: <20241129095238.51748-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 157ce8f381ef ("i2c: Introduce OF component probe function") adds the
header file include/linux/i2c-of-prober.h and a corresponding file entry in
the newly added MAINTAINERS section I2C OF COMPONENT PROBER. This file
entry unfortunately has a typo.
Fortunately, ./scripts/get_maintainer.pl --self-test=patterns detects this
broken reference.

Fix the typo in this file entry in the I2C OF COMPONENT PROBER section.

Fixes: 157ce8f381ef ("i2c: Introduce OF component probe function")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1240e75ecf4b..d1b50664b5e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10765,7 +10765,7 @@ L:	linux-i2c@vger.kernel.org
 L:	devicetree@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/i2c-core-of-prober.c
-F:	include/linux-i2c-of-prober.h
+F:	include/linux/i2c-of-prober.h
 
 I2C OVER PARALLEL PORT
 M:	Jean Delvare <jdelvare@suse.com>
-- 
2.47.0


