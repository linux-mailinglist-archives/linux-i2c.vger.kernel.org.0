Return-Path: <linux-i2c+bounces-12784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD430B497BC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 19:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E3664E201B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 17:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD666313288;
	Mon,  8 Sep 2025 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3etAJJK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5C23CB;
	Mon,  8 Sep 2025 17:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354374; cv=none; b=JbqsrSAi6IFaEe8gB6QivJ/vH5tA723xEcz8VvZmKa94heF4qzpppph5ql1QJeqUpOvFwx5GwjeAACVQYWQvUSO843f2mltqscDfgRSixUo8JNb2HsXgUk7Xaq0M3eNUr5k2Xu31L7sUFf9KHyksyfo1rqXMeyR4O88rgh0wfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354374; c=relaxed/simple;
	bh=auqdNvcI/5ojGOwKHNiDaiOc2qLaP8oHdA4Lo6T65LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCrgvmx7ssO/GW5U46KEBKLn2bdAX4x9maJVafS/QtzhtfrIL3QUV/1NP3g4k9YsuY6zoIXPd/94Kvrfr53y0wwb3iqH2V5r/SOhuhNqUZ3YghkRcm4m2bsIKHT1pkc7rTcrG4sLupJip+VoGqM6D2EIxtygEBaxOQmtP5wcmPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3etAJJK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7322da8so903385766b.0;
        Mon, 08 Sep 2025 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757354371; x=1757959171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLWDv0YZNJKrYSg0BC1r02s6XiM2ly0ghL5s6/pQnpA=;
        b=R3etAJJKdruwC8dvLwYdNsMzh3ZNzpGgzPIYhwjt4I1lhazXg1C5NO6dtxmL+8DR/z
         CLCAK3uV2/acjqtRkTPg1r6QjJiSAAjv5E8iCSR8fXTupN+KSuKLkWpEZBjPHD+/aWIm
         pzcPlDOFW2tftzfNNAB4KUlObGhsquuzub6ac5wYF+ACIYI/QGJqMK6RITyhSDYcthSH
         MmSUqFsxZW0MzQqUe8vGb0Esy22WtkG8r/uZcZtqv4yLKZg+po1d83XYqTSSnXip5tlv
         ZRTiM0z34bwLj3snnQfS61enGOr8jQUFXorfSTGwfy//O7s0fxLQPPEYXnrtP9yK2AAT
         73XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757354371; x=1757959171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLWDv0YZNJKrYSg0BC1r02s6XiM2ly0ghL5s6/pQnpA=;
        b=OljKC7PjolS+yG4HwY/kD+24U9yAdE2RHQoixcnGIJgh7TW9z/I6U5tRIB6+OCb3eH
         joRXxXB9puutXlu+IVbfRucrtiWvvsiCVZar+TKQ3a4bfQyh4CmrBPem3EXEElarrvut
         xjeavBpmgNnY+gmFyvi0K2N2Cez/viwLcmBIWrNEA1vioLKMRxtVZdR7K8FMPPGuHlFP
         LUVXx/FJMmXtpy71ObUajZM1+0Pixa3jrKvMyCyRZyGCnURpmk5FiSpj/kSDXWg4LT5Z
         NkzOD5pb9iJr0SesJWi582c5V/VPZibBTaV+gvlkPsrHAOgED7PTMV8+FcziG6GRmTVY
         2CEw==
X-Forwarded-Encrypted: i=1; AJvYcCUqkMYETsuWjGxA4aKC/fnRfsuYAhlJunuhzdGD7OPL9zww4OXQssS9BXOhTCOV1TsZ9UbA2sLvW+ic9iE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBhqWh9ue6WQYLsrwnJwxfSCbVRGybKhlZTuTZq4rBfUAQLf6P
	lk5lqvyRo2wlJgbnKsGBD2WgEvCk8rMF7fehOntfV6r2ZZk7wQmb9dkJ
X-Gm-Gg: ASbGncsKsFnRITFEf3E2AbnAOuX2Q8J8w33R1UnOpVIt+JPpkUrvnIAMfb5c5s9aFzX
	cZ/j0T6Gd8kynSQxCZsgDek0Zip90Y6DpLdmaCcFkfR/Lneao6XBHMSBMa5qbJ6HHn6NDusDK+u
	Nu16nbN9xkGYnIpGOhObO6S8wAgAeWvBpCuQB025VUOqQ4U7dTCd1kt1nrEWs84BLOS+wxMnCMl
	3CBXnakpcgNW7RXXy2XegXmAxbjhw52N6+aEEyUc9eYRRwvV47oq2+ASFJyiIsba6zJHP/XfhK8
	/TxV46SxykpDgCtiUNZLojUXNDy+/rgNcZwX+IkZ3mNP4a6bPhQ+i6blCuOcx5A/LnG95U92Vu0
	yZLs+3UcgxOokXaf8vTuPX0bkyOgt0XFjdNsdh5SS
X-Google-Smtp-Source: AGHT+IHZ+EsHqCIO23DTq9QLLi7cdpHpCAFRZuSfNbEGEHExvlqvoGGbjwX3ytiiPMuInYDE3VM48g==
X-Received: by 2002:a17:907:7ea8:b0:b04:10d9:48d4 with SMTP id a640c23a62f3a-b04b1663bb1mr851349566b.35.1757354370956;
        Mon, 08 Sep 2025 10:59:30 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041565ca98sm2158185966b.86.2025.09.08.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:59:30 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v3 0/3] i2c: PCF8584: Fix errors reported by checkpatch.pl
Date: Mon,  8 Sep 2025 20:58:59 +0300
Message-ID: <20250908175902.214066-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
References: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers,

This patch series fixes 18 errors reported by checkpatch.pl on
drivers/i2c/algos/i2c-algo-pcf.c file.

The series v1->v2->v3 is a response to the discussion on the mailing 
list with Markus Elfring that had comments on my earlier submisions. First
he suggested to split my initial submission in a patch series. Then he had
some valid points on imperative mood usage in commit messages, wrapping
commit message to 75 columns per line.

Here is a brief summary and Order of patches to be applied:

Patch 1/3: i2c: PCF8584: Fix debug macros defines of if statements
This patch encloses the debug macro defines of if statements in do-while
loops.

Patch 2/3: i2c: PCF8584: Fix do not use assignment in if conditional
This patch takes the assignement from if conditional and moves it by 1 line
up.

Patch 3/3: i2c: PCF8584: Fix space(s) required before or after different
           operators
This patch adds space(s) around, before or after some operators

Testing:
  *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
  top.
  *installed kernel and external modules generated by build on my laptop
  *rebooted and loaded i2c-algo-pcf.ko with param i2c_debug=2/3/9.
  *No success message related to i2c_algo_pcf was seen in dmesg but also no
  errors.
  *Module loading and unloading successfull.
  *No PCF8584 Hardware was available.
 
Patches 1 and 3 report 4 and 6 warnings when running checkpatch on them.
But the warnings will be fixed in a new patchset that addresses fixing
warnings.


Cezar Chiru (3):
  i2c: PCF8584: Fix debug macros defines of if statements
  i2c: PCF8584: Fix do not use assignment in if conditional
  i2c: PCF8584: Fix space(s) required before or after different operators

 drivers/i2c/algos/i2c-algo-pcf.c | 62 ++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 23 deletions(-)

-- 
2.43.0


