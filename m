Return-Path: <linux-i2c+bounces-13651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65BBEF24E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 05:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABEB44EAA4A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 03:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089F8248176;
	Mon, 20 Oct 2025 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSt4y6gb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C54E1B87C9
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 03:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929630; cv=none; b=cPkVlaGd1Jq1lfELHD1sPLE9HjIjO9HmRGOPMuUKpoHghup/Pg/eR3p2FM02ZNix71Jl/FgspVJsxNgTPpAwFNkMJ19x9TxJtV0iHVe6kL5b0mZ2Nqtyw+iuVcivAc9r/QnscsuR/08BiOSukaa7py++8CEAgBMcxu8xVS73sEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929630; c=relaxed/simple;
	bh=62CZS3Mnhs6KiGn+uc9ThB3o4cJtU1xkwvV9CLAmJ/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El3DBqqqeq5jbnujGa64uIFRIvJwJ6+aS+UuuNcV+iJA+lVfsEafVBfH0/aYtRttaFgv3jjDqHiNTKc8WWyuzx+NU72dssP6ZJ//73ymzpemyJaBqesEuTLXbv6Tb5rN+AbWC7BurCGzZ54MUOIvYYJnw1vyNhAOV2G35PR7Ka8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSt4y6gb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3d80891c6cso933742966b.1
        for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 20:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760929627; x=1761534427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdEInNnnI8mUaV9oHcjuBVGjC97eLQH2pPXt+cVP+WI=;
        b=RSt4y6gbzTDAV5+so7O77AM/cqfXn/ffJfxrJl4UTHtV4EIpHVEeMj4hWIo54g8nb7
         7cu15SpTE6EqqJ8Zo3qemoP0RT76Ly+zE5xCPkYtvu+GBpABlEmQuRIyI2MeJhn8NnDx
         zFxeHbPMx7+XuK/jHoz+nDvGSPMsTJScdNMUJz2dYL2Bi1PZvljZhATCvzIh8N7QF2RT
         DWZ0K6FY2wDORlhUIu2rIewi+8rYaVRAhuSCYWBo4u9jXsfn2UUqeumyL0OzKg7H7DD2
         0BEKsDwJUsT4j/+bpmL6Xf4T3aJk5ug5dyHkMcGc8LhDOscmHG/WFuhqov3PQnHL7Dtp
         xeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760929627; x=1761534427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdEInNnnI8mUaV9oHcjuBVGjC97eLQH2pPXt+cVP+WI=;
        b=ofQkvN/jK4cA5CMBKDicAPC1f1HqC21Bdr+dMLjsUciVoUpSqtVhspMVDZELuIrpft
         M90PMBVzhMjaGkMjSRe2cbp0G1t8nLaUxxI+ErcGKL4Iw2gMI9Nrd3dIx3yY45wjzAqm
         qE/nMIrHm82CvMDwxzxUiAE+AAp5we+coX6ojoHikU3nuKv5AM+Umvei5EOnf8aaHjm0
         TSHpfeiCHdJPS197gXF5+ANCkvADLyfBJX4ecqR+KgBO0kitIDenVGuewZPRe52nU441
         gYyR+/iXaQgedq0koyKmAcWJWTqR+WQlB19/Ve6voxOfMIOH6PyJM6ekf+Q923UJYGwH
         qjsg==
X-Gm-Message-State: AOJu0YyB3uqqMZfUOq4Lo03J03WYGDEqYhAFpQWFcN4rVKuWR5CNWkpC
	acPl+MVrPGO2mkXbNbd34nq8+gAVIhvMwmQPz9HC8UZbVk0H6o2tZg2u
X-Gm-Gg: ASbGncslRYQgM8hOtotkMN44xDUmrIfFzAxglFraDozBTUzav9935Am9ZUaUPtByivi
	pwfTL9AAOgrflPiuo92kJ93Y80O3wY5k6THk9WcQM5XqXuNzvwqzUlej9pIFf3Tn6R5GYQtddFk
	ozt9CC2Fwz2agPqfC4K5kSe91ZXJwjUsDLg6yxhBrYcaDdt/OSp3aB/1x/bMQJUy00OW2pj3h4A
	wZoS9Gg1R3dDAZGEB2DmujhQYABe+G5sLRwICPqxk4OD+Hk7TcLv6b+kUhqPxYPmVi3P53tmpzK
	g5Lxfk5I7MMKJu4yw2F9misCTUpXlMs0puB5/nJv9dLAgpNDynEhubrN8wGrQHJGjZO2U823azQ
	Cbf2xFelZYm0lDloRxuSxAPHqv5d4iesn3Exl5EfvjsuYMyFhX8lrTjf0k0pb/7So7AJDKAzqq3
	o0
X-Google-Smtp-Source: AGHT+IHzTVc3sIuoUUpDNIz4MDhtAuQXWOAHI2hiEQDwV1qeN2gWXxdUl9PvarxzCGNo6SLdmYdZOw==
X-Received: by 2002:a17:907:c786:b0:b4f:6d1c:6f4d with SMTP id a640c23a62f3a-b6051dc37f8mr1718239766b.5.1760929627290;
        Sun, 19 Oct 2025 20:07:07 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm668375866b.11.2025.10.19.20.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:07:06 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v8 2/2] i2c: pcf8584: Make pcf_doAddress() function void
Date: Mon, 20 Oct 2025 06:06:07 +0300
Message-ID: <20251020030607.10219-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020030607.10219-1-chiru.cezar.89@gmail.com>
References: <20251020030607.10219-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change pcf_doAddress() function's type from int to void as it is always
returns 0. This way there is no need for extra assignment and extra checks
when the function is called.
Remove assignment of pcf_doAddress() and replace it with a simple function
call.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index d1b0e55fd871..7e4a6d19494b 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -253,7 +253,7 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 }


-static int pcf_doAddress(struct i2c_algo_pcf_data *adap,
+static void pcf_doAddress(struct i2c_algo_pcf_data *adap,
 			 struct i2c_msg *msg)
 {
 	unsigned char addr = i2c_8bit_addr_from_msg(msg);
@@ -261,8 +261,6 @@ static int pcf_doAddress(struct i2c_algo_pcf_data *adap,
 	if (msg->flags & I2C_M_REV_DIR_ADDR)
 		addr ^= 1;
 	i2c_outb(adap, addr);
-
-	return 0;
 }

 static int pcf_xfer(struct i2c_adapter *i2c_adap,
@@ -288,7 +286,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		int ret;

 		pmsg = &msgs[i];
-		ret = pcf_doAddress(adap, pmsg);
+		pcf_doAddress(adap, pmsg);

 		/* Send START */
 		if (i == 0)
--
2.43.0


