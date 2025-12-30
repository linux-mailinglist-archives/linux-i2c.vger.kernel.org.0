Return-Path: <linux-i2c+bounces-14881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFACEA043
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 16:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A93D3004862
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 15:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C107A23F417;
	Tue, 30 Dec 2025 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abQNjyij"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2208019F137
	for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107224; cv=none; b=kiurQhqnTNEf2qHqHDsl7VUGNIpnhNsxqDYON2f6vUwKIfB21ro28dPFLe5njtDun9blvPLWuylJOis0yfdayyRIrfmoBEUTyf2Mh9bXGLljAz3gJp8JC+T1SpN1UxVSDeytWHW7Mj5cpNZ6H/jgxNjtaPiount77QjTfFn1gMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107224; c=relaxed/simple;
	bh=CCIkxtH/rocO+zZRCAtuXg5JuC2j3kYenNoG5NxM7vI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gESlyYLlzMBM4C5uQx8/S62uHXtvNx4hct+2zgOVl/kp/ubASHxU9311FHugX3OTGlBEv1WcR+ahcR3m+ogbBpqWdrTjG5SIJI7BbMkhQfBrxQUL3MoT0TvT0H9qeRBVQnTqs/zfgpuExI0SMaJjHKjXk0o84nIjLUtTfMc/yNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abQNjyij; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0833b5aeeso136665645ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 07:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107222; x=1767712022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIBqKSox5UwnVaoV8Kjau6whEf+LnmnAR93Js9qWwVY=;
        b=abQNjyijQAxO2jXgqxHOoz2ro+PY0ANdTBunwi93pkgXds0IJj1H0Rf5fdkS1T7HMQ
         4FlNXsx3eMOO4ZluPxGX4yWQIzbxmADzWZbqEFz1xaku0QAPiRr7ve5UFvwyxkdM6txQ
         DmwgXlyOCCjTHp0dgeGgfLGzEO9tXgwuy2SwZwHtyYyr0iy8clBbUPe+LSgwfjMseWRf
         TmmjBn4OcI/dwY9vLtkKqPwhZI6yv69kViMW+HGNRPN/yEfHzzozcMYAb93Z86aWY0x/
         v/PB68EzMSWyZcW6PiQqhVOdFJVGLFDvP3eRzjCPB17Zs9VEsL8SHnNSK4lG7IPOyTfM
         DbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107222; x=1767712022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIBqKSox5UwnVaoV8Kjau6whEf+LnmnAR93Js9qWwVY=;
        b=W8HRI+Q4eAsjNXBtghogu4CRBhSxQpgAUdPFStuZ0Ki1bOTq5FZAmsbsswT5MoKkvR
         dTz9xYx3bqpRBf5xith8FaYEAPyoJiTxBmOfag+Usu6bxSs3ZgePaL5mEJAdu386Hg9a
         wPNrkKBbmBRIXNASJPkL3QllQFUexo2XmljTXoSycsNEj85764Gdg0+/C+j8EmyBtNXP
         l5+4rbjmKZRPrtMJg9TYJu6zSi6pemdaNTDgn6MoTZyQ0l7lXF0jFbXscgtLBS5YY+TU
         acDv+/iCg2vN5j1wudsCM+CGJP/eaCb5OkyhznSKxk1m7vM2wlmky5JY1xLyiyXC3RWV
         RCjA==
X-Forwarded-Encrypted: i=1; AJvYcCUXD/QS6oGPBHI4/COKmygz1ZiXc5vxDcAgB6SjVIQgcyFdypYOdA+s7rTdsLaSMFDJFBDVSggtNAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnj/oAKjfW0Cu69Cedwkv7Z9I2C5tZYe7ia/twFJGnLpZaO32X
	vgLL3I/qM/Vl/r6+g6jaKy8s2UNdJkN6GH1PuGt8QBzDbC6J+g9D5wjM
X-Gm-Gg: AY/fxX4ww3bUno52vue9aUpBFtUs+cCNYoM/GQrwt8IOKS3ZEOB4afNkkUmpCbNsg4P
	MklpR5lGvulpjdSNudlmwAC7iaT+JxJAe3GecDQIF7HhgJ9LiBsqxkf2fxizdsCCU0+nmnHcJ+e
	KWUIrl6VoMoR957lzczyIS6XjbjZfiYkWaqlGdU0vUo6v9oto5g46z1pn0Tr43TO+/kdjz0Tedf
	x6pZm7HdKy6oz7/W76kUj8UY1JOHhmV3RdDwVcks3t718QsjQPTvkLL91IdZI1lQpXj1M9LHavV
	sqRq2zUNAMfTNf9yk5T02wz0vU8o+ykRb35SmF/CTMF3WqiOCPiV35ZRhdSDBZynSQE1nmDQif2
	PrecdrTKKibGgy0tzjPmSYHYEpoM7dTkHnKfizz/e2BuIR5Sie0hnBp1aC04v3ClucQZbhUWsyY
	ypzkl7
X-Google-Smtp-Source: AGHT+IF4mlQHloICVoZ4fRZRB5k6TueSAxDDvE3GQmVRBYhsflqEoWLyLFOrsYFcTTyvrCL2lLxibw==
X-Received: by 2002:a17:902:e945:b0:2a0:9081:8a6 with SMTP id d9443c01a7336-2a2f232c8a5mr357039835ad.20.1767107222036;
        Tue, 30 Dec 2025 07:07:02 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm298919885ad.40.2025.12.30.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:07:01 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Date: Tue, 30 Dec 2025 23:06:51 +0800
Message-Id: <20251230150653.42097-1-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C controller requires a reset to ensure it starts from a clean state.

Add the 'resets' property to support this hardware requirement.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..5896fb120501 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -41,6 +41,9 @@ properties:
     default: 400000
     maximum: 3300000
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.25.1


