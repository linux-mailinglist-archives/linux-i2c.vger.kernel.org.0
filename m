Return-Path: <linux-i2c+bounces-11183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 612BFAC99B8
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 08:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D24116AC91
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 06:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A82207DFE;
	Sat, 31 May 2025 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNrBWQ71"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC421208A7;
	Sat, 31 May 2025 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674664; cv=none; b=jtXSY/8oinxZrV4x+Dn6ioFdry/xgpEpzLNCuSvJokF1o0o7+3zsoSsvT2OLAqz4BOYF7GwD3fCUaEHrkGc8bXMGlxbi5ABIU8G73sxolDMZQvoBiOhhMwzoOJBUi8rvs08iw+pHEhjPNpXgDt8TrGkfyrUmzIw7Uj2qWtOtpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674664; c=relaxed/simple;
	bh=7XrLppQO5qB5g9WEeeWY3UVbzJBtnah+myNv+a9FfF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z5/irCYqg+pJBL6XxLe4qFWboLYEca35UefjVICyx3/4CYTZ0XsKfSl79kE8q/0r658pROX9qJVaYbHrJPc0OAcbCZm0E4VU6SsqJ8RAaivBOgdqHVHIcqnYOq2XutblDchX5gre0EPY1EjRdvOV/RrXgyT9NcXy/eAL3CqEtiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNrBWQ71; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-23228b9d684so30704535ad.1;
        Fri, 30 May 2025 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674662; x=1749279462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qcHiI82/LFv1dYpB1HoVb5XMF47rsmDr7PMAQ9iF1c=;
        b=lNrBWQ71V8bni2iL9cBxvIXmUqR7GOCqC8HMmF+3PFcTUwd0HMpN6Ik/FHvJtUfGjA
         jb3lbCO/e+HDh3dtVQv9FnMQqDmIRNFwBs+CUx+8yUvsjg+HC8KmG8dC0Bun134QyaRK
         fgoDSsFtMmiaWkuPCuI+hQkIXK24vEIOHzXxHV956Ohs9eXDoSBO1bEudQjvo56nNlT6
         5P9rBhEA+DngammomUsykzACMxvJKQKjiZMgAML2eHeUN5xVwomI6NJvjk/W3njTO9Pc
         /GnF6cg3q//31d71FVuSVTRPsP4bbQ+e6cf0/cQgHXmPKxqcCX339I+sAJkdPVQ0ijUe
         pOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674662; x=1749279462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qcHiI82/LFv1dYpB1HoVb5XMF47rsmDr7PMAQ9iF1c=;
        b=VMy8y7DHjGwIGcjrNdGOlmty96vR8d1pc1RujF8ICF6kDCEMvIwHS5pMiM58xKh1Zl
         HsXUnqXJjm7b/NDzluqjC6c81U6S6MWiFNNdgCHznwnOrK75LgvpXbAU3PzUnwLdLYK6
         X1p5DQIljeM3c3uJoSi5R9SpnRZHkMprElmSKt09oA8wxpmi4PIBnXh3h4vEy0fsigrn
         CIJh/WqllI7l5xzn8Q2kSztbmnk/TXCB2Cd/wVTZPlBnDB65nbbe3pkNFA97NYTs2rZL
         B0hPuMAIuxSB7adFMjgyymy/k9kabMPHLG5EJ89zYg487ex9Di/CHCgcwLtX4xyATwZO
         hnbg==
X-Forwarded-Encrypted: i=1; AJvYcCXIsLs2T+K5cA8+mJpBoEJTPqziQFa4mIoW/yZlX/pWJlPkGxGCTsGQNXd/Aa/GVMjaE1g4UwdKCeqQs88=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3T+jYFCZxBcnDVv29Cywh2pxhnwLN5uBm+9N29codCucO7PjW
	v7DTRuVSBoa1UhFAUiZi+k3HyGSaRGYgKCbFNoohXtxYvgz3NTSbFQQ4hW1mRKLAjz14ag==
X-Gm-Gg: ASbGncvt8WTIjbCBIfW9VdMpeBWWaX1tMzJEnANMmx10R4OIBT83qYUW9XTWvLvkMmU
	2CYUIQLsO5wDkFkqIAnsGG7X1x7p5t4+OXjnfQh+4dtbYJyyfJBZVWapE1Z0DSwIryGHjV3sMCY
	b94Z3fu33gqhKH4ujsPdk+nwWERwayFvIoht+0axdPJUQyEbSqY+zALYQmr6fYPqh15v9atwA/9
	e76QZ8/Ypw2KEZD1rFCrqXiSPwkwkhUfiMaG/y5R9CBD/luTts6K88nqjZPlSJ/pvxTuSXK3VzT
	lekVfuNpANS49egpYqqzBz8gMvECpmVIi8o=
X-Google-Smtp-Source: AGHT+IGGhT3HnZACqSoO0BWBt2NHArRjjRnsN6QNso3lrv38ZJCqSmd60+cj2QxJNX1QE7jAAytsCQ==
X-Received: by 2002:a17:903:b4e:b0:235:1ae7:a99c with SMTP id d9443c01a7336-235395b2408mr63803315ad.32.1748674662034;
        Fri, 30 May 2025 23:57:42 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:41 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v4 0/2] i2c: imx: guard and drop prefix
Date: Sat, 31 May 2025 14:57:25 +0800
Message-Id: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWoOmgC/3XMyw6CMBCF4VchXVvDdChFV76HcQF0gEnkkoIEQ
 3h3CxuJxOU5yffPoifH1ItrMAtHI/fcNn5Ep0DkVdqUJNn6LVSodBgpkKxyyfUkX51NB5IWwMa
 xtYmhRHjUOSp42oL3h98V90Pr3lt/hPX9mxpBhhIATQEFarT6VtYpP895W4s1Nao9NweuPLcIi
 vASZdrgL8cv14AHjp4nYDITqTiNDe35siwf+D109CoBAAA=
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Carlos Song <carlos.song@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=1377;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=7XrLppQO5qB5g9WEeeWY3UVbzJBtnah+myNv+a9FfF4=;
 b=yNqJnBELWXIrnWc0OTDAapEeh0k2sIvvzRqEwsOj6o/ZZMXsWmRcGtIy1Okf8MET6yz0doUaX
 iHpUyHvR+vFAe3WpHJ7EZbP1jUaz9rAUzUkR6viFFygw06souqRcV2j
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Changes in v4:
- Add Reviewed-by: Carlos Song and Acked-by: Oleksij Rempel
- No code changes
- Link to v3: https://lore.kernel.org/r/20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com

Changes in v3:
- use scoped_guard
- Link to v2: https://lore.kernel.org/r/20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com

Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


