Return-Path: <linux-i2c+bounces-14481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA15CB190A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 02:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F2A306DC8C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 01:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9065218845;
	Wed, 10 Dec 2025 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ri/GDVTu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF842213E6A
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 01:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328740; cv=none; b=P6eC6dHvABrEjiwHFwKM9r0d01aZr2NkDEFu4L6Mv0FGTbIE+dt00D5q1l5FyrBEJLf9YYr40sMHX3cYQzKdBIC5cW+4y0DmPw2sXZof1SnEuJ5E8nnCfRmWl5KbkUfMXJgTxioA4mAwh/BiyR/YAp3gzG8iHiPdYcaPKesK3Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328740; c=relaxed/simple;
	bh=+i3BTfPhsLE8GEo/94/1SE3mgTKecjalY7mtMdqKORM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SHyAaaQrU+5yc/G1+wZ2ru1w/J+ZgHRBlRi6aQr/qXNegacX7V7uQ6pA0/l90mKuq0CcMHM/+dGih4dq4X5U9HShQ3hkHiToD9v+I5WFzqZbmsYUiBGN4Jj8RKYsDU+wObbTpsiSr9ZBAh2XMuruQhATEd3j+v3i8HxvnOCS70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ri/GDVTu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a1c28778so77755805e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 17:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328737; x=1765933537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHcSDCZPYXhd26Yn2LSvoK/Mf/qVpncEW7C95ovxbvY=;
        b=Ri/GDVTurLUN3C7rCjTK7gMxfgCFTeAyd+wgZf3VlOWirmins7VV96LR0XWNU8Pcbk
         KPcZNfqm/TTxCZ5W/4NoVrVzpqoTMk2xGaec8Uq/UEUdQjZBcnXLj0fFQDfFVRcsLu4O
         3d9u4Cek1OvQq15QHkhWoUuk/JsCinEnOQW9fH/A5RhJbVXmDMrVVvFvUc7Tsrm+rcZI
         x52DwrDBDD63Y+6YAFMqyybxi3f8ZOnA3PsCJn4OIO+o38haM6oJQtSDgkl5mzZ7Wux1
         4LuksXWI7P9BzNESHVl9gsM9LUBvRtSrTDnAfnk9S4M024XaaiC+3uPsydu5XsZBP0a4
         mPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328737; x=1765933537;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHcSDCZPYXhd26Yn2LSvoK/Mf/qVpncEW7C95ovxbvY=;
        b=QTMpU12o4OH7Od9adgIrN0hR4azk1ZDZaGvQoQ5sL916IU9RCkGDz+AHk1yDApEbN7
         e3cuABoDboifzWU2mN/8q8ahKZD96JBMWEbm0eoT+rldBMHWmKYcKbvBNW3ztQ1N8IWL
         WYxRRkRyhFFzhebq0Z2X6/CU5/Nyrk7G/8YxneC46vMfa9CEOefHHa3lbyaIdYSFIRSC
         qqOCibtbsOC5COJ2SbMFjzT3eMEMKMcufgJR+XfykLJEY0OyTtorHJeY6TKynGA/+qYR
         w2aPdyxUA6T4n6XWn/8sVO07cJ8ZkMfsJCSLibYBNM1eqiKDBgWwDloxRZTfU/lAB+0a
         aO4g==
X-Forwarded-Encrypted: i=1; AJvYcCXBora7KIBS/FdKUxmG7CO8S1XbxKyKmxrNtvJoJUvL8kqCMWPliHDjcOkW9uG7DXU8ajbqEBHD1T8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvKPLaQcoSUV8bd1plN/pOIIaMBJfQHvpoOFsxMQ5YK+xKRC6
	M0VAARZHmjUpwWy/d11h7qZiyyMX3zPnsU96ClEp8s/JxKh043LzVSLECX0hgL4c4I0=
X-Gm-Gg: ASbGncsEIKKFlqaRuomfwfOqYFk0pjwE5zvZcxNuRZlvcJSewSbdZ5SSo7e0vvmptvy
	Bc3LTilyllc2njaVk3TEQdI+mlRk0nChmz5TOlv0dLA/Wd0PPRUrKkysKGdCiWgHE7mlw0v1KaP
	AYIlITahiqZuQTMB7DTJsIEBpmHvW14ozXE+Efb7gw4wwwbIeGQCVa5kCg4TjqXejS23vfe9YUT
	2Bpt0QfSOqt+XJXcaRnmkATc2pqAs7ydzP1vSKb6tRy+duiDi0FEtu9XfIqVZdgkVqU8nN+ORu+
	TKzVv5UB7zncapo/QbT7Youd8DJ19XC9BGXwlXmWJiPw2wYI2wCbnc2ADNKG2VJxoMawFpl1LLp
	Qai1mwKK+rc2f+2Ru/VhxRRq637U2wz5EHHZvg6Za/uJocrIfMv778fkOKe/t1VY4DPV3D1avuP
	ZgFKNlqvM+Cm/6z3fU9MIpof2SF8F0P+iMlX/8q0HBNQHUvMdvia6odDjH7rJf
X-Google-Smtp-Source: AGHT+IG0T6nWXe3W7j54A4PIsvvrJ8+7alDZyq2DAzB8aUB31Ina+UJT5hJjNMeivMH0tZ/Ul8SsHQ==
X-Received: by 2002:a05:600c:528e:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47a8378c79emr7622015e9.17.1765328737169;
        Tue, 09 Dec 2025 17:05:37 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:36 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Preparations for camera support on Fairphone 4
Date: Wed, 10 Dec 2025 10:05:26 +0900
Message-Id: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfHOGkC/x2MywqAIBAAfyX23IKvIvqV6CC61h4yUYhA/Pek4
 wzMVCiUmQqsQ4VMDxe+Ywc5DuBOGw9C9p1BCTVJJQWGZNDZC1OmhLMR2igfxKIN9KTLwO+/2/b
 WPvs3PC1eAAAA
X-Change-ID: 20251210-fp4-cam-prep-640342df0834
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=883;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+i3BTfPhsLE8GEo/94/1SE3mgTKecjalY7mtMdqKORM=;
 b=WYroaOjCibHjE0paBIII6ZqmzENJydkJRzz6ylokmPfmofZB4qZ4I1nlYmOCU7+MSpxAM7NY/
 udMRwR5fT0lAWBhaWZdjprM3ucYrMDCO5qetfjwrRt2D/WWahkT8brU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Start adding some camera-related parts which can easily be upstreamed.

This contains the EEPROMs, fixed-regulators and enabling the CCI pull-up
voltage source.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P64A
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera EEPROMs
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera fixed regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI pull-up

 Documentation/devicetree/bindings/eeprom/at24.yaml |  1 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 72 +++++++++++++++++++++-
 2 files changed, 70 insertions(+), 3 deletions(-)
---
base-commit: c75caf76ed86bbc15a72808f48f8df1608a0886c
change-id: 20251210-fp4-cam-prep-640342df0834

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


