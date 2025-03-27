Return-Path: <linux-i2c+bounces-10053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B82A73EF4
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 20:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACAC43BBB6C
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 19:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4511128816;
	Thu, 27 Mar 2025 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBY3Z17W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F228EC;
	Thu, 27 Mar 2025 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104309; cv=none; b=DAWaZfE6U10HJHML86/pcTw/caKBRLDEm2uTb5mnjaOghXkRe7WZEu/YAg/4VVwLu5OcLGoB+YJQ5jE5AclnMuvkEIFPERTiEHFn+TUTv/t1yAsN7A2LWJ1RQHJL7y0QSAaxMnH0iZyGZAYvWTUJz6dqiUQBR3O/9U737myzTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104309; c=relaxed/simple;
	bh=K+zii6vFNHuzcOhQnw8D06g7wjPXYRpm/TPmJ7RXtwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5FFCX+EkPqk36fWQAK1fNPMJ006jGa/OBhRjHwHKIxvLjJ4WE7AluzO7TK17DgOt2IeOeArC7igoJqyo5HBiQi+ORZL38J7b/1/HtLsVJ5LSTrpM5QvmUzmtuFK7H2CkbX+Fm27Y+i46akZWvMQr4yp4mroHXpJiPR2PrigkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBY3Z17W; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fb0f619dso31105235ad.1;
        Thu, 27 Mar 2025 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743104307; x=1743709107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Guk45ESSBgglP7oC9x5RXoPVek+jweZ2GqnmOesu1s=;
        b=MBY3Z17W94OYnEOFAZxGK8xzT/LKUkJSUYTPpktzQFMmtg/61VUKEdrSRMxbcQx3Xk
         VinUxMhtuY52ZjAeHH6gm1MIrk2PWqP+tKL9oPQnc+Ayv+47SkRio/jqSADswHIIEF9G
         pRcgk1MjZ3btZESP8eI3wofWOxpkt9uxXXgGlQBvv8NtMy3rvXgDIl9qyBbYwYFSz1Fj
         Vu6c/AGMC4HRlYslS5cklAsTQYomSqaafZmHHSwRlX748duMYEfpY0gKsG1kc+IXdEjZ
         XTwmAMwN6WwwcFd303MelbHx0sDXUy4l5tgx2jNPbOyjN59Z1XfzhUuc7y1YfqXLW/d/
         +l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104307; x=1743709107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Guk45ESSBgglP7oC9x5RXoPVek+jweZ2GqnmOesu1s=;
        b=a1vNltFAqLoq+isIfX4QV8+Gn4lUk0YZMTuDNU3v0najjc9d7r3WPSOvZttN/Zo/ve
         OCw1Jk5BLv8MzU6ugfmFNRla4KIpxntB/Gu4hnQjKxnwfzwqRqTkalYy0tfpm1dtAzVs
         TEjPbMHNvt3GKjQcSPenwxe+duPCx2YqG2PcfKxUeqXnsl2yaoDazd5yU+8oHmKNGvwd
         tMGArIUkHRM1cNwXrmjk23fXOP/Y+L39RHjQN+XQp+Ga7AtrfJ/S68JkQU/MSuOsSWvM
         JCgibZgY/aWBXm4Nul4M7lGJcBjOuVXMQybUhHJ8OkE/BELJKUfn4O5xbSFhHGwltwkS
         PaMw==
X-Forwarded-Encrypted: i=1; AJvYcCWI4ANS3Nt4YLkz8HdCSLTbO2bSpoC1gr8SuIZ5vZUydNzj01RH8i3FZgJV6JdGHFKRV2UKZvLpFlt0u8vN@vger.kernel.org, AJvYcCWuqXZ0V5OCAr6OdA1wI0/hg+oBSfCgNg49SP5yIYKLPBXiNbpD5OiN7cIJijnPMOe8EA8aB1uyycw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyROHfmJ7rS3FFtT59aCFYgaPKebXe7z8RSTK0Fjh05Jnv0snzp
	/wExEaZiwExK+gw+YdiVTK2pjk8PQ2Qk9GT+dZOMxQbmXlpoa87x
X-Gm-Gg: ASbGnct5UKFKdWqoNUmJ+pRH7ade2jleXc0oPmwqxzdA/aCzEdrelXqW0quqGqn0mpc
	7GsN3ZMal85Atct2Nu3HyrNxziy5ft8xa5LfWv7ycSwg0cnKeTdpRRoXfsHS2TBTM+Z1KZtwUYd
	PLOsa369HaBxgFHmZVBKTSVwdcELvKJWFqMe9qOfIHCaINvA20IqOux3RsPNuxMbt6qBnMh79Zi
	C7Mqh+6LIYg3loQUGdHbTxqcNhqyfzg96uz67pDTFEM/XYEixVDPiZUYJ3a1dnE47uReWm0tNrp
	RQAgEVvNccQ/yefF65ExokZ/vpNNTJoqfXr4ftiIq2OX1DRmfTUpA0rwkbKtJ6dPIVWX4DfcBep
	L6/0L74Z/WSSLXX6MmmWiCnXPEJ6RAup2Onz98LRYgT5Kw+XoKp/K
X-Google-Smtp-Source: AGHT+IHAr+qKaoanlbTEnDzUYchwyOZbMxOmyJEyEdNMbiwlgJofBpIN7VftDJh4iPH8YZoVE5AyTg==
X-Received: by 2002:a05:6a00:b90:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73960e30048mr7325286b3a.8.1743104306977;
        Thu, 27 Mar 2025 12:38:26 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22496sm230943b3a.50.2025.03.27.12.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:38:26 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: avifishman70@gmail.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andi.shyti@kernel.org,
	venture@google.com
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Subject: [PATCH v3] i2c: npcm: Add clock toggle recovery
Date: Thu, 27 Mar 2025 19:38:16 +0000
Message-ID: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
In-Reply-To: <20250324205901.1274708-2-mohammed.0.elbadry@gmail.com>
References: <20250324205901.1274708-2-mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..f05cae20cb27 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: lines are low, SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.49.0.472.ge94155a9ec-goog


