Return-Path: <linux-i2c+bounces-11398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8BAD7EA9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 00:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3222E18919DF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 22:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5992327A1;
	Thu, 12 Jun 2025 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TidBy6iv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3662231855
	for <linux-i2c@vger.kernel.org>; Thu, 12 Jun 2025 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749768993; cv=none; b=Ch1VsGUpvWPbqN4PUauM1PJHFyQRQXrc1GBO0Yp2g91i9p4ryS9pinOVD5/ItZk7pcwYzSRTHSUJ4UrrESfXAmzvztth3gw66EU7HTFvgBXIqcQlSQkkhNVPQkzJ7kubo8zc3ZcfgqmpcyviYT6O3uJwDiOt5RQbigBDp85cEwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749768993; c=relaxed/simple;
	bh=rzO2vUG3qFvZz9nVJkEDXegLFrtHvbT/BioXWBPlI5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXfU3iZbNxAEE7HXsVMS5CZE+gpImDsHMA+lNu8K2BM7N+a1Efd7ZG8KwtU0ZqIsFYNFIkRlF35yCrb/GDU2xy4MVwJzPutC+Oj0hx3+imJT2x3OFqxaOosBTx8LSTPqdB/hnH1OokPdLk+/6K1wgr/ITu/wjbg2XzKKtm0/Ypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TidBy6iv; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ddd38ee5b8so12005065ab.1
        for <linux-i2c@vger.kernel.org>; Thu, 12 Jun 2025 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749768991; x=1750373791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=TidBy6iveGvZoJ65T3YqYJ4/Ryr0IkwmVBLPo+0oBBwqPPYZk28JnmVBBWc4bnEiTU
         tMS49PFVNh5Hjg3OABx70YCMx1gTypm1ETF3mw5dQkxPnc4NXfAvgqLz6mwTYjJqE47w
         yMxZrPY626qnJFLudWQrna6LoZhmMEj93GJ0KA0wj5QFS7Iq7yUD+y1l8dUcyfYow/L6
         11sRT5scTK6zb4/c0mqzNHP3tPJTO7MPSxOIjMgYQv810Z5HRHixSXB8OmHtTJ3+EsXe
         f2W7+QnmPKQwTeO5qPRC7JOW1DoIvRm89VLI+9YwpgWIy7tjjn8v4iEVZDwJ+cnOYQQt
         39wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749768991; x=1750373791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=hWB0FcsUwZ4a/blSnu2BERhp1NDppqo5uz9OVwiFvMC41HkWS0MQ1iizsoN8EkSOrA
         mQeXQ5A9l1HduspN4jJel0VgHUZAL4f57jl2fqREzsf6xoI9LnemtfLdaE3CJhgIK8QO
         RDdbyvwcdKNruq44t/KuSnz00Skp81gbtaIRBi06swv+SJfPTPt1Lg4FrVvmnZY6Oa6a
         nj1nkprS+9YcDPWeENBAFetEFxZRpo3OVfsRw1mOyl6lGoifcVOcz9yAFi4r6WtbZ3bo
         bqOyKj/HVeUsE/7AU94Xk0cBsX77juNkPZbRO7x1aZauXk+qGWpl3CgqoJ9vUxucoVc5
         1Oxw==
X-Forwarded-Encrypted: i=1; AJvYcCU+jbd32RhJrXiNAes6TfjnVMqfhR+eDWajX/c4B6vSwhb/MKKVQuchGHr7Ie3pmC6AvJoBF/ESMdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GpCAl8ZfrPVSNqRsKTKevWME/zbnBLJ4J3+FYFMGDnRSox4Q
	rKr3V7i6YYYrnk3Afq1GemnKD22DVR3mLsn0cLebixSyt5AqQM931RT0Eh5bUni0SDc=
X-Gm-Gg: ASbGncuk0CRW+tNK2u+zkx8eOFrSnEFWaIuDfrBjt9fl1F2SHIL0vUYVxn7vU87PZIL
	4Cmj14NNKxyqpk23/O7JFM5T/dQw7qv7jfsX/pr/Hw9vYCu3214p8yNxhi63DTn1rnPu7HhKSgp
	hv7ojld7kbht3z/BP6zunjs1uAqD0pBxpoJc5dljBlBBlN6v9Hbhs/bNNS4XE5euL/BpcmGCSkW
	lue8n+qw0uzFSOGLR3ARYgrQkW42sLu5yu+lpNDPwMUdvRK0CiTOJviX/8evdpUDFQU8ixODIP1
	W42R/j7IehayOeBfsdhhqV5lHN5DfyXzMiSXvzOW/FHMHxJ3sfsI2MMRaKB01yTbhDi9kkyAHgW
	WsL8T6nSU85RauTQykJKUwZ47lBppIb7XDi005U74Ng==
X-Google-Smtp-Source: AGHT+IFl/qtFDEOg7fq5AKLUPKjkJzQ1QBSvDDw3zCkODT+b5Ce6LNmP5J2eqcw2VDryqjSPHaqh3g==
X-Received: by 2002:a05:6e02:184a:b0:3dd:d6c0:cccd with SMTP id e9e14a558f8ab-3de00bd309amr7524375ab.13.1749768990866;
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019d0c4bsm209125ab.28.2025.06.12.15.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 12 Jun 2025 17:56:25 -0500
Message-ID: <20250612225627.1106735-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v2: Added Troy's Reviewed-by

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


