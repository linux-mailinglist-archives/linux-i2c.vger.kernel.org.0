Return-Path: <linux-i2c+bounces-11810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0DAF7248
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 13:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814285282BA
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 11:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0C8255E2F;
	Thu,  3 Jul 2025 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBKS4Rke"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17C1FBCAE
	for <linux-i2c@vger.kernel.org>; Thu,  3 Jul 2025 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542274; cv=none; b=cU5gDgsNjViMrOQalYDyqc9aSmqZ/CiUfJwxSVFR9HCugJkAzJrEOyUqVSKnwKrVRj40usypdR0Fx2jJLK2q4Xq80bzZAsAjJEf4qObiGYvAqOOgjVKmPSf/4n7XILRJQcHQM53SHyx4khKGfFLCITBrNHdQ6/Cj7ufcp8kA3hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542274; c=relaxed/simple;
	bh=51fwn9UR6sLo33WSntk5b8fVMnu6/RCpawuylEc4EYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iBqJZkHiyDm0zFZPkrvzH/ZczDZ9Ujbjnpbdbhkv6aJmdB7mV9UILf9XoshnbdI0LCKUkZt5w4XwicvYn+dOTbvw9IbUSzuvaCUGQq4p0ZAcybIAxiEO1kAHGFzsRh+YTaLWVNIL3Vyj1pq3ED2wPfuWX2Ng3sgIOlaOhwrbLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBKS4Rke; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso6735795a91.0
        for <linux-i2c@vger.kernel.org>; Thu, 03 Jul 2025 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751542272; x=1752147072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WcCs7vej7EmjlOgqSL2DpUmA/zZePV2jjeUjmDVA2Io=;
        b=MBKS4Rke/iaMAIf1WMrycjRYmqOpZrRV8X3eZBS8L4Vs330zK4ns8qECwZtXsY1jjV
         k4SgRGOGg+cjcx8p6gyi9arVaXyU87xZKCBerQzNNehHGfyolmunAYu4ne0PKcO0Ku1j
         jeCNdLRvjpW+4Ul+TRAQlO7pLnTs/vJtpFnIjm/aJtQAdvnxXNYoFdhykVEkrD2d5Ya5
         k8NjFdYDlhSaTA+JdEcdzGGvKJMfATEmPEaQuF6Du9SEsHgrRb56lrUdYFI9ZlGIo3mJ
         t3/JM8lI6ZWU88MngP11Zlm70/NrvLQZbg9Ul6FGYMZUgf//nKxxTOvkTCAaBb1dpZxJ
         KoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542272; x=1752147072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcCs7vej7EmjlOgqSL2DpUmA/zZePV2jjeUjmDVA2Io=;
        b=iv5YLIDWI3e9/A5oTbm2TIKLSRYjFtU9WcqQtUeT4oHeSKNSNtPyQAbFqNNNCkcTYu
         4Z8zJfGXurHVV1ZEKQxQ2TRQ3WwLaNbf+/aIzwdJqjsyiTcdoPWq+x3iD2D07Cftsxzh
         IW9mmMPHSaS7lVrGxMSjgBKl4CnqVuS4gXoKw0171/5mg04j9xl/eSmGgsy9SFe/tS2z
         36+cADkQRj1f0h2IOTrn5PCiXjHLJt11BYYNFz/6qz6ZbGgSSPe0PPfsUGcHsrgPgoxT
         Q/2WO4N9E/YAq0qDkzklzakeELAVOyNZEXefkjSY4lyWfm5XXsGlyMvUbFXE4TAtkoHA
         Eypg==
X-Forwarded-Encrypted: i=1; AJvYcCVnoOzpB9cS+yuGAbRkh0oizU0iVKL5jY74O7Ag+WLklE6epUBDPxa8UedX59kBTTQbsXNI5e3tbck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT5+LsJ2Hpx+HkqNGtFHXSnRSzL11lPJH17QaFeUMDWwW/AYkL
	c5z96pd0jyDDmccRK5dvNXp98YrR0macl9Jr9rLUWax1xO2urqn6qMDZ5UiyyfIRvaw=
X-Gm-Gg: ASbGncuc2xApZpr2ssLe3Ova7Lo/yXL2o7O6AZw7Gb+zR/RTUlaPYb9H07D3YEJJxQj
	DeiTpqoiawv3Cx2nAqhhlWczFTw5T0c6FZkbmfOzzcheYPmAmkt7rD+g7myAqwaviQbkz8PaHUW
	A2Pd8QdjTb1IqhDnr7V7f1yJfrijmcQsXPm2w0SSU5HA2RiQA00qPMs3UqcSZPeXmXdpP3GJlGv
	ZSbq3QDof10IhIQInym0lWw3SKPUSU1eZye9xbMtLI+ZiyWAZcfZXwcUr1+kMw0I2FB9fwCk7uO
	UE6xpkJ8RbryvVDOrE5M8njw4wD/bwK9eFwKlaArtcP/adCc9HmNJ0X+zNRyqNE=
X-Google-Smtp-Source: AGHT+IFhAcA3OhH5rYHEhAy0zGIw//i/uHwlpC2u5oxSV4TXYQftB+zfMaEw/b96QQcNkfPz/Z4ybw==
X-Received: by 2002:a17:90b:524d:b0:311:baa0:89ca with SMTP id 98e67ed59e1d1-31a9dfaaff5mr2743821a91.34.1751542271841;
        Thu, 03 Jul 2025 04:31:11 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc65bc3sm2166551a91.14.2025.07.03.04.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:31:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Chen, Jian Jun" <jian.jun.chen@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	linux-i2c@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: virtio: Avoid hang by using interruptible completion wait
Date: Thu,  3 Jul 2025 17:01:02 +0530
Message-Id: <b8944e9cab8eb959d888ae80add6f2a686159ba2.1751541962.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation uses wait_for_completion(), which can cause
the caller to hang indefinitely if the transfer never completes.

Switch to wait_for_completion_interruptible() so that the operation can
be interrupted by signals.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/i2c/busses/i2c-virtio.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 2a351f961b89..c8c40ff9765d 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -116,15 +116,16 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
 	for (i = 0; i < num; i++) {
 		struct virtio_i2c_req *req = &reqs[i];
 
-		wait_for_completion(&req->completion);
-
-		if (!failed && req->in_hdr.status != VIRTIO_I2C_MSG_OK)
-			failed = true;
+		if (!failed) {
+			if (wait_for_completion_interruptible(&req->completion))
+				failed = true;
+			else if (req->in_hdr.status != VIRTIO_I2C_MSG_OK)
+				failed = true;
+			else
+				j++;
+		}
 
 		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
-
-		if (!failed)
-			j++;
 	}
 
 	return j;
-- 
2.31.1.272.g89b43f80a514


