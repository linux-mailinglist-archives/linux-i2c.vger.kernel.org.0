Return-Path: <linux-i2c+bounces-10002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B728A6E482
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 21:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57AA3189622C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AA01C245C;
	Mon, 24 Mar 2025 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6SHkBB8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003E2E3367;
	Mon, 24 Mar 2025 20:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848362; cv=none; b=NxmMGOM0hMh9y0pY9pEXQCm4DPI9sQjeDOhZ7fWwmQhKIIufLCQOwUSklWm79Ny9c/qNXJyNCMlc3OvlDtG91nwB2gjIF2POInKqKH2cK5lGyEcVxF2xixrWVaS9GDc8U33gQqg66qd2obUoUUfOAxlYqh+KrLfZDfF8UU/nj18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848362; c=relaxed/simple;
	bh=m9qJ9hfcqsnhDr/y0t+0cgwjiivaOIccvHrnRP4/JvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJI1Vt+lTQETDPr0SVtYqhWbs0IsENY+wnvxHqvxT0nkX5rzEQI8PsQwMttXg3fwGroiC06qjfXC9hW1tyPc4OO40zL0fDV/RxOvt0mh9K1Hj2gVpoAcDXQKTDCRwXIG2YEKuxlE25V5R2t3SXaAT7f/VZqAqclEwBbi4zHvcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6SHkBB8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225df540edcso113916515ad.0;
        Mon, 24 Mar 2025 13:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848359; x=1743453159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4Ttsoo8OWelVr1FIAW5txkAjwug6YJv1rO6LqO2moA=;
        b=Q6SHkBB89mOoe9vq7mjhr+CBZBdpmUbQoEPZT3wjETPfKLjhS5E+SeJz2zUInkhYNx
         3PAAonib1ZQ9TJ4CHxyLAmZIP6UKoHiLdHMLO8hPPXJSNoIZNAD/fKGwS967qY0i+StU
         hfWnyRpNDJLMm9Mcl/SFEdGCg8xOkfrdV6/iduoezeqeSDtMLGAbN4BGGQ0mt5RKYOao
         IiomKaIPrhUr5D46ac4pTjRDLNiBDUtNyWtid6GW8HJBJ787jIBnvw+LKhA/00kgve9t
         759Ip2hOI0orgh6SyZWKhFSJRMmeENiOHpB+Bfcdgm4OmDMNjUb1SLf/dvPE37XAWc1J
         vqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848359; x=1743453159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4Ttsoo8OWelVr1FIAW5txkAjwug6YJv1rO6LqO2moA=;
        b=JXVdwkGOtTdPrm3Wpi6U3DRxVg12Ax6hiqr/BWaSQuizi5phx1UQVMboF/hEaZtVHP
         Lgk9jSqDMeQP2jx0qYZqSnlC2pnwkPrWaocd93j5pkOn3htCXye69sPjYJeACYJ+iJ3D
         ofQhFdRRxn7bV/nu+dEDw+S+t3sy7cXmbBpWxAwu75pDpjcZcz0DkjDk4E8qtC5xTCgV
         ve3nBZtg9AymQ0GqOWc6qZczwtBwbdb8rLRlLA/QMsKA8mPb4RjrYk72NCZqKdTc+YSX
         hWx5GLQy8EdWUUOJ7XUX9oT0HTTYiWO/9tAOuKGwuilGLp84Y4JH3sa4AQFGpVg7GZzz
         /srg==
X-Forwarded-Encrypted: i=1; AJvYcCWDFSkqSTFm5HBuwz3QlmsGPuSDbigcypD6xe9BI0W4DOtBri1BJR9oCNfL37LBJ/M8j9dTZNi+ItU=@vger.kernel.org, AJvYcCXBSrwbkRskMCZumOJF54OGkRm0syylNB+P59KG4HFo2PHoFc3To/kswY08Z7QpMbreRBspMCPP0jA5KaL3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jMeDcZx9zvWivmEjS158Jy8IMftUMnqbbwB53ajM/jQSmtam
	Ia7yr0WYnbTcXheM4q+MJUMXLHxHEoltbx3rxUjOJo+dW12Ng88j
X-Gm-Gg: ASbGncuy64dPd96v/R+Nh8VBYTcWzL7shOj+JZtrZG6X+XGAYVuBj4rluOOTHWLgLql
	xZE8dby0aLhz753lvtlzbaUZhy3Ro3pCb2YcYOMflRx//UOouBucdd/ptMtkmUXOfSKcJeICfww
	a2VvnVyN9+dK/eMukoBSUtzY/bsN8mpMjyZbyl+uAUyu3fwx3ikNT6WcOhFBGdursJmAfd/Vxf2
	a8T5RYuL34qvkKldP1krwI/f1n1MHYTexVAmuR7IBY8wqGyunu9/vO0qTkDl4znD+AbjVX+oDmU
	zlnp2Mmrxcsj1fZ10X5hAQCtd3dR8KFMhXgf/02U8kGyVa1kzCDfZP0HtQ+46QI4Bj9vME8hhp7
	/2er/pC8OcBiSkeOj+KLJCOS7GeKe+3k5jzSzpbeUMy2W7VkcUDVb
X-Google-Smtp-Source: AGHT+IHgGPWF0ym+Tv4mM1Xv5CI6iXbrMz5Man/ozAwwl2nQXmJ4AX5iIxyiUBChusXdPmM6oqZJQw==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-1fe4291df24mr23305567637.16.1742848358937;
        Mon, 24 Mar 2025 13:32:38 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a23c31sm7593981a12.54.2025.03.24.13.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:32:38 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] i2c: npcm: Add clock toggle in case of stuck bus during init
Date: Mon, 24 Mar 2025 20:32:02 +0000
Message-ID: <20250324203233.1266772-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <mohammed.0.elbadry@gmail.com>
References: <mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

Hi,

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to toggle them first.

Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---

Tali Perry (1):
  i2c: npcm: Add clock toggle in case of stuck bus during init in
    npcm_i2c_init_module

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1


