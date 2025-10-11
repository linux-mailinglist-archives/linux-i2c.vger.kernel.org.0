Return-Path: <linux-i2c+bounces-13452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F0BCF554
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 14:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9FDA3A3C71
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 12:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A4A2773EA;
	Sat, 11 Oct 2025 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihbjUS3f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874EB2797B2
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760185998; cv=none; b=HYEc0AmDbD8mieJrMjNlJR1ST+60xtPsbjwfuKKAYVWMbT3P8s70QrsXGyycinc5IlCk6Fm3IhQoLJVPVUTDxoUV2x5gswThiIqpCmQygJPjbJQ+ryLas7vN5Hj+MUijmcTvjkpGDRwDrtx2Pq+x9Rd5bZHlOS4oe+zeMKPok1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760185998; c=relaxed/simple;
	bh=aNcO3Zq+hsS2PiEH91c4KDEccsdjSLuz5yhz3qgS3Io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npDDFfEzF+2Gs4yGiD7dolJEOZL7qy6HIBnkx2C75YmJEFTY7rdudtSKGknjbnc9VYkfbU8wfIyWc44OeAmD4c8Wkr6/Gu/TW1fg0dHnq25QLBS/8wdl/DFYMwo5Na2bBbFZMvzjsBWQ7bQfKeVSIBEG2tLMM4sKaSbLtaIfu5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihbjUS3f; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so5685824a12.3
        for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760185990; x=1760790790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=roY7lFd25qLtD5Z/2Zew3Etpjy3Jp+ZltGeQ+K85E/Q=;
        b=ihbjUS3fwlZIepammBb4hq9mbTBTscjz5xLLzrVLYubdadc+W7EijkmDj3Zo1CWOgc
         sMpTCK9ReD/H28RkqfL8FdExDapqCMt4oB/wvl0+ovJ4ammfiXS/le4Aj8NIuLMmUcYA
         D4E8dDl5WnV+g3pCoDEaXUvAhkUlEtTu2RUDtHV/oY/Bna+oCV2XVL05N6pjn85H4wbH
         KIoZcyZgi9eH5iN/O9lcwc+yRtVcvYA04PAX0VoMIHJ9Hswwh617581nR6bEunvk1WIS
         xt5UxWvP/b0Wnr/zGfhrKB8nODxr65rQr2PYKeJvM0EVousD+s80rpuoOu/uTkqZ/d5s
         JOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760185990; x=1760790790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roY7lFd25qLtD5Z/2Zew3Etpjy3Jp+ZltGeQ+K85E/Q=;
        b=G4tXXi899m52AG9BiC+TJQgeQEpsVPF+KFddqwUC4GFfoDPz1Hj8K0fcSE2xpfR6QI
         +7N9Lt4K59In7IceS+lmQ1C3C8dSiziaZ7CHRZyCO70qrg6ZJepHQrOCOso4qcfW03om
         OgbQrtmXygi5ikKj5bdxPkt9n8CgHusQ4cDiQcSsJaY31G709yyCk0Tv5Z4hefq3uNJl
         KJXRsXkS0gcuIcqFtS7hBplLJguM+Nm9RwHXHkBRpi2R+XobE/EVqzJ174OPOulGgaX5
         UXp1Nn0y7xZxsWDG7j3BPTlCAS/oV5vfEIKHqaQ/PLf95sOiH7vJuGdmatlRKmbBeOMp
         64KQ==
X-Gm-Message-State: AOJu0Yz+RanNRadPeXS/oC88KCMSQCKvcsRm6QPpCS2b4OHTvcp6uj7c
	ddyq9106W6xKJ4H6i4u36M2spAQAM+TuZCO+Is0fgrneSiSiHK8LSBUD
X-Gm-Gg: ASbGncsmQhYVcGqk7yzhTz0WbRccSh+xu3BctOn3zueHPGcjnkukFWs5SxWYNOvk1ig
	rS999TkFgZ+wIJ6kRp20IbafPYsNjSPwSkaxVAUHO+hkZrx4Lj/iwQYtcPCZx1Rh1qNa33BIFht
	blBYgLeuwz1Eb4lrIo4jAicwa+rWg71ONkWnivz4heWV7wmW9b6gTlETfzFhQMyGDEKOiniksgq
	QtGUSMwU6zkMHjW00urEGUECbVNJ9XXNjxeq6dKmw7RopJ+iYTlifLt2PUJlDQkJKA9M9c52fVi
	gHUeBUUBGT0x3TMzufIGtiz6o1kWTtyX79p15U76zvtub3x6K5leXxLmIYSTMu5mVx5eN26m/M7
	VfuOxKVt/aOBiX1JptLblLrBFiDtOW5suH1o0iSFK1EehHofS1h8AkaFzPLkKA+EcGZGmFJFfBS
	eQj9mbXEHaHnkUqPJM
X-Google-Smtp-Source: AGHT+IHgiO5mra16DhJqRKb783PHjAnF9Odte2liv9FlgJK0mal+P51Zcz0bFpRXPeH3FqvARisrtg==
X-Received: by 2002:a17:907:86a6:b0:b3b:b839:577b with SMTP id a640c23a62f3a-b50a9d59a19mr1638649666b.12.1760185989629;
        Sat, 11 Oct 2025 05:33:09 -0700 (PDT)
Received: from DESKTOP-710073H (p4fe03c43.dip0.t-ipconnect.de. [79.224.60.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad80bsm470651766b.16.2025.10.11.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 05:33:09 -0700 (PDT)
From: "Blacktempel (Florian K.)" <florian.blacktempel@gmail.com>
X-Google-Original-From: "Blacktempel (Florian K.)" <Blacktempel@hotmail.de>
To: jdelvare@suse.com
Cc: linux-i2c@vger.kernel.org,
	"Blacktempel (Florian K.)" <Blacktempel@hotmail.de>
Subject: [PATCH] i2c: allow ddr5 ram page change with active intel spd write protection
Date: Sat, 11 Oct 2025 14:31:53 +0200
Message-ID: <20251011123154.2020-1-Blacktempel@hotmail.de>
X-Mailer: git-send-email 2.51.0.windows.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPD of most Intel DDR5 systems is write protected.
The write protection also includes changing page, via MR11 register, and prevents reading data.

This patch allows page changing with write protection active via a I2C_SMBUS_READ on PROC_CALL.
That is a, publicly undocumented, Intel specific way to allow page change.

Link: https://github.com/Blacktempel/RAMSPDToolkit/issues/4
Link: https://github.com/Blacktempel/RAMSPDToolkit/blob/9b2aeab9b7637be1874520c74c9873e174fe4947/RAMSPDToolkit/SPD/DDR5AccessorBase.cs#L237
Link: https://github.com/namazso/PawnIO.Modules/pull/19/files#diff-43cf449eaf4b834c447bc85ad039882fbd4fc883be00447908b94eb9cc8a9c36R481
Signed-off-by: Blacktempel (Florian K.) <Blacktempel@hotmail.de>
---
 drivers/i2c/busses/i2c-i801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index cba992fa6557..9d8eda8b3287 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -788,7 +788,7 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
 		xact = I801_WORD_DATA;
 		break;
 	case I2C_SMBUS_PROC_CALL:
-		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
+		i801_set_hstadd(priv, addr, read_write);
 		iowrite8(data->word & 0xff, SMBHSTDAT0(priv));
 		iowrite8((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
 		iowrite8(hstcmd, SMBHSTCMD(priv));

base-commit: 0739473694c4878513031006829f1030ec850bc2
-- 


