Return-Path: <linux-i2c+bounces-10000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F16A6E474
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 21:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8F103B0E6F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF23D1EA7F8;
	Mon, 24 Mar 2025 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xs2q3z+U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9A1D86FB;
	Mon, 24 Mar 2025 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848208; cv=none; b=odyQvhHYZIBpx8kb44DWtU7J7BZ0UD++Hat6KWwLODDMMJG+tGvuUoyNW/cT2+cnYRh4UfxQ8QSiZwMRSX9CxKJH9Ulvqjas+NdTaaG9DLmoslruy7+OhYEGNiES6UmlIBLfw2yiGi6dc/TxrslCewlQhC+TA7inCIkqoO4TBdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848208; c=relaxed/simple;
	bh=0RSfI3Mzakz1MMAxfNbVFrCt2GjqHeze6EJDxR5cW30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRBDsfkxp6nX1HVvbccRNLISSqE+w3qHtFjSBHKo00F0xVIIwbnJyY4g+KcfJ7b9yZZEnu/tzMHbFVht2TtWn+tPm6MvKzlmJ6uSMMhtEBJ/17Utx31pyx0g3kwk895OD0r72TaBBjSh8vdquB/v4wsMYEflf9rSrZjk2iSGHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xs2q3z+U; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227914acd20so46381745ad.1;
        Mon, 24 Mar 2025 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848206; x=1743453006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRcFQxxl9+AzhZySlV5tIixacXs3JWBmTbDcF3YmTTc=;
        b=Xs2q3z+UcnYOCQyZuRBcxXMMc6NTKvqEa4x/Yy6KAe9pda8iYSs1X96O1WO6oNNcdJ
         oXE+E8gDyc2uZDM6IMflxRu2vZ4ZL2gNwC2Sv13HFjniGC41vYa8iLE4fAbkq3yekAZX
         84MnXC9E4Zmt7KfookICtyYU1FFYv2BSzM4y5jNuy8DicIo9dQrbvdyM78yj2B571ky9
         BtsFLZ2Qe0inZf0t7KQi6oGiQQ598kKUuY9ZryP83qNcTlZplR/z/B1dCvQDwq+/6frn
         1sIQn2HfGldPz7X2L4QSG7pBv3lNAbcfJSycbO1EF+mnP72FQI7UB7r1607o+vIl/vtL
         IhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848206; x=1743453006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRcFQxxl9+AzhZySlV5tIixacXs3JWBmTbDcF3YmTTc=;
        b=lb1jPlb20cMTMmhiDMqCAyi5tQ1bufXPLyOJg8ziH+vclJLrv2Ef65dLODb3sT0H9K
         MtTsr72opGM/mZKlaHY1whYiV1qep0OjDo+HGip2rx8nuIQDaMJqcYt2G+AZSoc2QOo1
         goUGvk7+qBXPZ/rwhLryQ7YxM0QIqQJowBAxZRXcnE52IsZQk8lFFfb4TDKRsDlUvJYD
         MnhQatnKt/SnP3b/dQUNoRlhg+/XMzts+fdqOnkgcPWW95waDhKvwl6bLV6wCyEkWBwt
         g8x5frmAtBzV5vvU/dtEYEO/DGY55vokGnOIkmTi3u5MYR0KdLMFOQekfsdukt5hAa/G
         4QWg==
X-Forwarded-Encrypted: i=1; AJvYcCV2BWnYveCbXDIGV83BOvkmwsHQmM+Xx/BY3IPZ2yFpXltLECczChzs1GlT0zEus6i4TVazPTFwLZB3TCWB@vger.kernel.org, AJvYcCVaGkDLF5fqWXlZ3I3OiYVBq+l/SqVOH/6W6MeT8mN/vXKaTTRqAa2X/l1UGSNVVv6rpG6zoEiMsCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVZfHCfA4fkhwdg9mKXAGPMoU+4kXh5B7jxw7+VKao6Rm+b22a
	sIDoqDCX/QxSEbfnFsphmT/qR12NskjyMMXTWj5BvQ4Xag5WGk0i
X-Gm-Gg: ASbGncthVobv3DYrKBy/TP6WbU6cMqiFLbu72NTNhQDdkLvfTWjK7glTDmYYFhMH2IB
	nQZvblW2/ryizt+jOO+smXfW4HaBY0MXSWg8lZygHOmfdA6g9wBp1CDBo7togAqnXLmF0Eq8suh
	G5VcAKlagx7izEUREotGnYXAveUzvtisuCh+aGtLDUStthdwmuVuEvpeKoU+CajhOWDEClmTqke
	rmzhc3IZDicW4n+fmv48YLAerdXJfpHmjN94vH9ainci5K7EUSDNVYPKmeYIMAsPVvcuGhgEoVy
	/aUfpswVxFHnOP0pyAE9dexoePyCvgsk4t+tgi1nifMDpl5L13kTSjr1qcnscceF12SfTgjnsxQ
	JKHoK4lqUGZ2xB8pyG0T3I7UyanALHP7blzY35HHCig==
X-Google-Smtp-Source: AGHT+IEZwK8be9b2VlvRv6JaIxJpgDZ1FlvCx3tp6BCAIFtG22i8iMZ6KxxUOscvHsIlGWgX4GnsuA==
X-Received: by 2002:a05:6a20:2448:b0:1ee:d19c:45f9 with SMTP id adf61e73a8af0-1fe429608d5mr21930991637.19.1742848206370;
        Mon, 24 Mar 2025 13:30:06 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d212sm8771886b3a.95.2025.03.24.13.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:30:06 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@google.com>,
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
Date: Mon, 24 Mar 2025 20:30:01 +0000
Message-ID: <20250324203005.1266044-1-mohammed.0.elbadry@gmail.com>
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
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>
---

Tali Perry (1):
  i2c: npcm: Add clock toggle in case of stuck bus during init in
    npcm_i2c_init_module

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1


