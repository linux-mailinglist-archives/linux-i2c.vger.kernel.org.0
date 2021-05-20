Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BC838B681
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236501AbhETTCk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236596AbhETTCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:36 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F796C0613ED
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:14 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id b7so9204680wmh.5
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mF+neKU2nq/1Cqlbfk4p91mZ7XsnhSwAAnZLGFP4jWc=;
        b=UO+ZfIg1/rbFgC/rxYs43xG92URmTgboCXxX4QkHVvyCJXxBea2TdOJaIacV1SvMyE
         kPZ/IXOmszn+XMPvv1Rj4J6huJl9VZBSuPbQy0Aubx9GP5yopCAokNSxXtHnIeX/TaxQ
         Jy45Uu8jNkeBK/d59ZTOgnCtqwl4OtKKenGs6pO1pSmaIMUGKgDlgXDNHD+CUkB4f0D9
         h1m9POgGbPolO2iaudn/w++yHMNGAyBfXnsGFbb5JZA6b1gUYyZl6Nx183uMjISWZWgW
         HzqG+3p6WSUS+EBn9AAD57M5+gX1hLFhpg5Dx8r/+KBeD+4qy9e5HfhN0spzPU5VlCOq
         /jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mF+neKU2nq/1Cqlbfk4p91mZ7XsnhSwAAnZLGFP4jWc=;
        b=otDuRVc8dSxC+kmGi5x5WVGxbiduC3pC7SlXvChRDDfOuDFmx8eQ9IvbfoKObZETAr
         DKl1CdvZPxUWagCS073kjwe6RXUZ0PsBCcSZxMBna5OqqjOdC3P+LCqZcuCwCt1Pjlav
         D7N+dZROdrI16Le07KIhOUJFvH/+z6HX2y4JBKmv2KpZpyXJHGy6WPrWC2pAeOVmSsAx
         Qh5dPwcRj3quQy8xFRaWqsk3w31rEWziRUwflKE3HsiFRAALi0huzAHzjU9VFDXvUG+F
         L6NzbUGwcl5lPF+jhGQkb98upe1V/x5tuK4Mnj2E5b7PRo7CC+W5XRnq9lo3Pit30LjK
         9+pg==
X-Gm-Message-State: AOAM5317WRUSwIANSW6RoPnuM9VKMNetHEDY6xah4X6G8bP2DXx/CzGJ
        H7GN8ArJbCjhmphTU0BrvMfDyw==
X-Google-Smtp-Source: ABdhPJyKdaLixRRCkMu5juEutDyMmkcIctbTLgtHpTAMBF4yk/PMJyNxmvUP7RtSWEPFOLFpYsEeVA==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr4973761wma.54.1621537273071;
        Thu, 20 May 2021 12:01:13 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:12 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rudolf Marek <r.marek@assembler.cz>, linux-i2c@vger.kernel.org
Subject: [PATCH 03/16] i2c: busses: i2c-ali1563: File headers are not good candidates for kernel-doc
Date:   Thu, 20 May 2021 20:00:52 +0100
Message-Id: <20210520190105.3772683-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520190105.3772683-1-lee.jones@linaro.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/i2c/busses/i2c-ali1563.c:24: warning: expecting prototype for i2c(). Prototype was for ALI1563_MAX_TIMEOUT() instead

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Rudolf Marek <r.marek@assembler.cz>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-ali1563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ali1563.c b/drivers/i2c/busses/i2c-ali1563.c
index 4d12e3da12f0d..55a9e93fbfeb5 100644
--- a/drivers/i2c/busses/i2c-ali1563.c
+++ b/drivers/i2c/busses/i2c-ali1563.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  *	i2c-ali1563.c - i2c driver for the ALi 1563 Southbridge
  *
  *	Copyright (C) 2004 Patrick Mochel
-- 
2.31.1

