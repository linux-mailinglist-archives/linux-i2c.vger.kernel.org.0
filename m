Return-Path: <linux-i2c+bounces-14342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C23FBC944A9
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 17:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B06EF4E2EF9
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 16:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8AB3101D8;
	Sat, 29 Nov 2025 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f7NYHYXI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6323101A0
	for <linux-i2c@vger.kernel.org>; Sat, 29 Nov 2025 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435517; cv=none; b=o+kwUyCSGblg9cC/pt55cBlDiETQUox316zoaA696uky7csIKWX97vkdITaaqL1ti8WqmI0sXFtghELh33A504q0gKiNAURA0JSK+M6S0lnZuAwsAsHnRjQIpoggLeYwcM69+YNrIci2fxScMTEmNffvhp/l2i/knQxY3vAY8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435517; c=relaxed/simple;
	bh=1VfHxw2ik6pzPD8vLs+mn8BWmuJDAturdWzRRyIrqd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MFANOwPJwWuFH0VvIO0zHLhdexJfHaTX9ndfc1CsUrBIpKXYpg+dprbM+DqwQuGNorjghe+SVZSSUJaVgGm/rQS9Jq1hLAwXte0zF1cYv7VFUBv1aIbC3rOT1k+sudWDfn2oD+pdx1qheiD2BcFyt4iiVzEPt6pAPO/Hg7Syla0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=f7NYHYXI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b736d883ac4so299406166b.2
        for <linux-i2c@vger.kernel.org>; Sat, 29 Nov 2025 08:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764435513; x=1765040313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr1otfYaqpnm7bjSkZRheFMZkv0FIFM3TuO+TEbpsfc=;
        b=f7NYHYXIVF+qRK5HXZeSUpS5Dp4hNqsO4zS3xjXTUf0B+/uSv1atUzAwjA58sIIRDF
         qJa7Nub8b7y0fFZDKEUzCmgrehyiNsTFuqkLn8I5Vx7A7MAaY4CO+ZT44U2c20nLXW6Y
         mg5oNg7wEmXJPEHZYXOiWRqvqCQmaLERCd9C26lLCiPPwUohwQmBi2UPlo7p6M8p1Tvn
         YA3ze/Tlkcpcb7svir8hMkpsqdt0uBI0I9cwXHrcP9NYoeQC0iM5Aq2/zQaxXYFP/jJR
         qboz5I5LQL0B3nFZI9P5QbtHHD17kBLO6kw9pU9bM9Hnyq6fXecV7cDpVkdP0t/yA+N7
         txuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435513; x=1765040313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gr1otfYaqpnm7bjSkZRheFMZkv0FIFM3TuO+TEbpsfc=;
        b=eWQuPD7Bbs4oM93kD7zmpoMkpJ/qhq93sBRTSj31Piyz7YSpRi4bnjMil2Sf6x1cRd
         Ki7UqgrhMYuvm9pmt8D6PQF+LwXj5aHp0IoonuEGQiU6zA0XC1W89V5xI+h2IO8T0a8r
         KoV4sN3Sk/GFulvQwd3Nk8SntkLjiS58b5nFC8jKDgO3OxjvRxtyT4/D9C2vDWZ12WRH
         D8Zq8mxguESOHobOcgDiNM7txUHwxjbIWB3b21I5UgOmw0NrIfai1efvyuLfbZ0dkIIe
         6r8F4sIpvBS+5Ktp38GJHRm6U+nmaStHZ0YgxA8ONTGKqcnUy+JYLJvXGptHkenZg9zs
         jAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCPKXURKg4T91/q7vwgC/HCCvg6HiDkG7pU7lyGNOLOZDBE9vKwtYnnaCHVKu97gPftbu/aVSYGnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1ct/v7eTmYkxGos7SXz6sfdYiz/rYlnH93GimsPlkJ4izSf0
	Nqrqzg28aCvJvq+fRPxYJmdg3FPAHTS+d161vgQWG7kt4HpEI5viOPs/xfTmjUxU364=
X-Gm-Gg: ASbGncuoqOQzmnU+Xd30ve1xCZnEmwHdbo/WpIQGpmw3mfBhNnjsU07rxudz+Dssg79
	3CgS5V8JODhgFVLEzj4swkZSbYsfFTwRx9dXCZCtx31ltWZR7/RUPV8eH6U5W0gLom4Q1u1ftA5
	hnHSUQdFGyaQTB/HEwcLLHt9PFEkFW0AXWA21MZcUYtvongVXFHlih4yz05ZpNtHH/XrOpBp2bq
	9Im40azuCPoVC3biKIcQq6PT9/x+btjFRaY/DN4j7ZOTgKMCIal1hfLEWYyc1wolbS0JeCtZipW
	AFEvFvbADLdjPLn4206ta6KKQLCcV9jh8hesawYWNm8TfIZGqu/GRJdJ1Cjr/B1ADR1Jm4rH/Oa
	g3CkFxCm9aMxv/mjjMl0Dfr3X0a/UrCNRdgJYP4hoibnLdrhzFWXpXbqF836Zhi/KxD7+/UU9yh
	lfvaDpo8u5Bvh7eV48
X-Google-Smtp-Source: AGHT+IFKnLXqE8LRIlt2QVhHOKoMN+oTpxrL+57F7QBEnjRT27+V6LIYdrwq+mi99tb4ALfJSxXVkw==
X-Received: by 2002:a17:906:f34c:b0:b73:5db5:b6d9 with SMTP id a640c23a62f3a-b76718aab35mr2340211066b.55.1764435513394;
        Sat, 29 Nov 2025 08:58:33 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a4a652sm742627266b.65.2025.11.29.08.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:58:33 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
Date: Sat, 29 Nov 2025 17:57:40 +0100
Message-ID:  <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764434226.git.ukleinek@kernel.org>
References: <cover.1764434226.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=750; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1VfHxw2ik6pzPD8vLs+mn8BWmuJDAturdWzRRyIrqd0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpKyYN8lBrGJpOMDv2bj2UXkW6vOeHEDQSWIxFR +fQY+otSveJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaSsmDQAKCRCPgPtYfRL+ TjqhCACJ26AKCTEQ2AdYGn8TW4BjKP668+yBDwJOS/VEho+vaICy9AGZPulA2zsc7SyxgONX9UQ WByf2w5LQ1eNkxcYyKRqCPaG2XJZ3KrF93BTAD2LOt7OcwuD+1SDMMvoRY33JU8Lx9T8/2x7U2r dsLH9479cCnr9qM9gw+mt4en/auHBnxLEP1utO6n9UkLIPTFenquh2ydFCF8mRHq3082Lrd7G9B h8hvNdEtNYXz1+e3yguVT9Wl3I9PkXpl3/KPgqt6EXXKe93KiMjm9p685un7xZxJ8zpH/wdK18j n3RjFo1f2KA7qNeCBuBr/tdll8V4RQIa9tdBGt2eDa/BtZPv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")
module_fsi_driver() cares about assigning the driver's bus member. Drop the
explicit driver specific assignment.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/i2c/busses/i2c-fsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index ae016a9431da..e98dd5dcac0f 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -763,7 +763,6 @@ static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
 	.drv = {
 		.name = "i2c-fsi",
-		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
 		.remove = fsi_i2c_remove,
 	},
-- 
2.47.3


