Return-Path: <linux-i2c+bounces-108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF497E9AEA
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64C9B280D48
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894151CF86;
	Mon, 13 Nov 2023 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zgl0RgZm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F121CF87
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:07 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71D6D5A;
	Mon, 13 Nov 2023 03:24:06 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so58452501fa.3;
        Mon, 13 Nov 2023 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874645; x=1700479445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=Zgl0RgZm1zg5ZrtBDdqq6rKgTpcYXtEj7eZmgmb0xiFhQ54mG2sjU3ZPfaJjFADDO1
         7I5Lfg+fCpLEozEDdk/DAOBmo23dY8RqZPaaxsG9+6oVNtK3B3wbvUu3+3HPK/iYLc2Z
         ZUH1qf0EBlgPkRP+/kJKkT5Iuuar6Muw4lG0YkKlnkKSpfjUNbYtelsGUA7rJhgNj+MU
         NxMf13AR4KVOmeyfMVHIIFROQcIqDyzro+f6SPyUVs1NjvpvFcdvrjlhO9tutlAI7q3V
         I8lVAlY8nAcVfEmI2hYO2J6EJ3lzpdas16abKUVna8f8u3YFfSdLDSdAtLrDMNojzoPO
         Ersg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874645; x=1700479445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=tT7z+CWfwjPgkyEGkCQBXqq4bFm63aTkjxR2LtAfxTAcdSwpqwXOJCfPPdOFSRc5Vv
         jr531VJOka4Z2JmUnyt1ovSs0J1+mdeBghd01GqeEiQlLWC/khkMNS1MNsR23AmLSU78
         4UdNLTF/G1WQROKKw3xaI5PpQ8/zdNT/qwNU3b5FCndSLJBDj9F1JGzp3hpJBDvQdukL
         hv2arwJvH3qU36gLEOom3w5jbfVqNGIiKLbGmR9ShXA0VKGFiAmgE2rnzCTQ9LJsoL4i
         DUAg/kPI0oEegp99KgT+ladzi0HryGuyxYUtAPc7LQ/YIhoBdW2+sYbq+EvnehwRImVj
         XfRg==
X-Gm-Message-State: AOJu0Yx/mHfv+majKdSoEo9KbDljfy3G2I5v1Are8UxAQGuLEv4ae0oL
	4IfXFf1HjHQajl4UrmC2aFU=
X-Google-Smtp-Source: AGHT+IE/vWt8sIluAJGbzp4DA3YgSD9QnVjHE9gZQVa6sNYXW8a/yNVaWFtAUhPLeeYxcoE+kXqeow==
X-Received: by 2002:a2e:8954:0:b0:2c7:7b65:60b5 with SMTP id b20-20020a2e8954000000b002c77b6560b5mr5041996ljk.30.1699874644560;
        Mon, 13 Nov 2023 03:24:04 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:04 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:28 +0100
Message-ID: <20231113112344.719-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index d1a65a921..f5f62eb0e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
 		return -ENOMEM;
 
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DDC;
 	adap->algo = &sun4i_hdmi_i2c_algorithm;
 	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);


