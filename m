Return-Path: <linux-i2c+bounces-340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E727F1F73
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C96928223B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3952138FBE;
	Mon, 20 Nov 2023 21:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFr6AH5y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E12CA;
	Mon, 20 Nov 2023 13:46:33 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32fadd4ad09so3655589f8f.1;
        Mon, 20 Nov 2023 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516791; x=1701121591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=SFr6AH5yRMa+JGHGFnzXmNMWkRHXufcNClfUffYuSlkjNAa3Lpme65FwhdwCrN7Goa
         dwt5s4Z9LR/y353YyqLyy0/NopOhHIUwxVFU8QoCv8wte+hM9bXg36OGv17wBDF7KmrH
         i3VCUx5V852o/mi3JpetMGNx5cTNWTKk9jRRuzfJmf+hUxVgp2I+3bPbJshmP8OI3jyc
         NWX/pLnqzcMiskJlHvhdH1LYuR8EFVOF9fPkFQo9M3xpKYf7r5W1QWwSvhqYT1WrTWGV
         fp7ElUKd12wfmmev+Pqlv2PvFaa63RYR84sCkF087kjZ5vbiJ2IO/0mRmM4WTIdFObGh
         s+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516791; x=1701121591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=WNqv+xuP3oZhQXGhudrsoNNE8uCQThG7hm9tptO5NZpJO2hdwb6rWzHgMxLdKpWZCP
         CrXKDz7EWyKcSZreAjzoAqILdcU7q418y7PLfJGHUdGf26t/TfvTsM+5in4ZHlkuOWn+
         haStrxuV7Xcp/1lXN6hfnZVbRXunCg0ZGe8OnWkPi2Ct3qguatoC9dHcW5AWR0XyrX8K
         5FRtlg5nW/fW56lsk4l6yC3wLZzcgD895YVRc0OZ0t+wowM8HG9xi5VKWLyYJYz+2NQB
         phQ1sWaDJXLhWZlmnSuxyiSvg2Z2Mb3VtzHm+K+eIh5+WsUvW58yYg3tAyi8NvhTym/9
         NORw==
X-Gm-Message-State: AOJu0YxfQYzpshwMpW8vp+vjsfouOnNOLu+6E26JPA4HQqegDo1Ridg6
	8lU2ZvI3nOijUDgch59npMc=
X-Google-Smtp-Source: AGHT+IGIRCD7UdLrZN9lSzHXmAgpmrQY5+HhoNLOuQvKT6vBAsOc+D+u9/DgXsMWlG54R5krCGbd6A==
X-Received: by 2002:a5d:4151:0:b0:332:ca69:2fb5 with SMTP id c17-20020a5d4151000000b00332ca692fb5mr1904733wrq.11.1700516791362;
        Mon, 20 Nov 2023 13:46:31 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:31 -0800 (PST)
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
Subject: [PATCH v4 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:07 +0100
Message-ID: <20231120214624.9378-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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


