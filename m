Return-Path: <linux-i2c+bounces-1609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8D8468E8
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 08:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946D928C850
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 07:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D3618C08;
	Fri,  2 Feb 2024 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgQF1an7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9718AEE
	for <linux-i2c@vger.kernel.org>; Fri,  2 Feb 2024 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706857303; cv=none; b=HWznp3EXm4XYNHqmfqQHVldzLcHc2W9jy5rx3pHQTGNR9ArMwP6sgd8Q/2JUTUAU6DXA/PZY/oZ/1YX8rqvqTkQDJdvD2eDCSNUxleu4rywQpLpyjo5D3+YKxGHTczIksBk1rXM6EbavbRVH7zWFj7GuFzgDV/4HA5GyvxOTyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706857303; c=relaxed/simple;
	bh=owVQLKr6rpnxB3Phw+LfqRTsk/Ggy2NJGYylyhXqk3k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cznzjiHQfVy8Ror/8JQivDWeZzd82OaSS/th1W1Fnwt4HNdAgVvhIJlXZANCbN9HNRoDkc6vOtx5E4pbCqroWROc1oaxVD6QGPtyq4wKWmrjHAvASOg4W2yGmZeRDiC+iYDtUvx5fMfctpETwe7kC1KqyJOn20QJ4a0MvSv72Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgQF1an7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55f15762840so2128339a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 23:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857300; x=1707462100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0HjmSHBbMzkUICJtwESwKX7/y9Aw2qA4XC0RG+MyGE4=;
        b=HgQF1an7NOZIPjHdJVgrjrHcmj4dZnyxRCAFMCDplWDOV1PnQhpio9uX90HG1UGkG7
         3V2pzaLXddsNxFG1vuKH/f+rE8ATyOljRQ5Uirx7zd2GdSuKv7YxC8z/jtblBzpgvVuj
         Nx/rQ5pl6veu/z/ri90j6w9mZqQ/Il6N6W6TQ7SEplc3fEh92xZ16oighKFrnGwGL869
         kc65l7oZHTjrd4+26bfFmXeytt0IjBGeteEef/u9Nen4A/4kwaQlhJ0VVtUqdyQhsTcs
         kDywgu9pgIsa8CFVCfXoaBhzLvyPlD4m5v7faVL/tCn26uCAm7+6K9KE1+WU2jb/hqyA
         Wa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857300; x=1707462100;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HjmSHBbMzkUICJtwESwKX7/y9Aw2qA4XC0RG+MyGE4=;
        b=jFYA7pKqsYlylMJ4+6YLDXDvoGqIpkjAZwcuNY120tH0SjQZtP56reLwNiFI+UsXY+
         xSWAnXCYa2whM+t8bJxF1XJf065j4GDkIduFddI5MtR12Pnemih8twUKJ/FQLV+OcO52
         uZ2onn8qTSRpfeaacF8a+ol7ggOvRqpANs/TtByhcc8tYQ3cWMfT9t9GMF5pnIkMe9Wj
         3SBhZu8+Mo3OfEHt7E2foBsU/sG5gBLrgoJ1EXixmrYtO24zalhUhtSxYI8Gv3x9mV8Q
         yw6458lPofy+QuHEsRCTxJp7a0zOBRVd78AK3pyNNqrbiDI9J7eDAYCsK2Ze5kA/zvAu
         u2gg==
X-Gm-Message-State: AOJu0YwesgOUd0Go+LJ7lnJNYY0SeUku4FES5V5WA75AUGbVKWv3WVD/
	9wOtpAYKuFzyuqdwF41aqKiwRqnO12hWHryeI2+AxyI8raph85rGJgFdNq2F
X-Google-Smtp-Source: AGHT+IEZLEjTBVJtEy4LJ0UkzAMZmIgehOE1sZPx4F8glLhU881knXD73IaVBJpLSJvBtZbIVGKMZg==
X-Received: by 2002:a17:906:e0d7:b0:a36:1240:71d with SMTP id gl23-20020a170906e0d700b00a361240071dmr4851282ejb.53.1706857299586;
        Thu, 01 Feb 2024 23:01:39 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWNQWEuIyLrnF4cTZVlJViV3CfkpMfeFDYoCyJkjYJun6fzDR6griguflHoqeV04KJbcSkTGP1N/EPpGTL5BQ9hx/wVRf6lhB0WOg6ztIYiJmq5049ulDliy+WrKW9ihajbNn31mM2yPg==
Received: from ?IPV6:2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea? (dynamic-2a01-0c22-7392-d000-5c1a-bcfc-a8a4-5bea.c22.pool.telefonica.de. [2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea])
        by smtp.googlemail.com with ESMTPSA id c3-20020a170906340300b00a35a659cab5sm563728ejb.179.2024.02.01.23.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:01:39 -0800 (PST)
Message-ID: <35e178dc-120f-4035-bbb2-85417d2f2c4d@gmail.com>
Date: Fri, 2 Feb 2024 08:01:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/5] i2c: i801: Define FEATURES_ICH5 as an extension of
 FEATURES_ICH4
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This change simplifies the code a little and makes clearer that the
ICH5 feature set is an extension of the ICH4 feature set.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-i801.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index b9b850b69..44ae6326d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -969,11 +969,10 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= i801_func,
 };
 
-#define FEATURES_ICH5	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \
-			 FEATURE_IRQ | FEATURE_SMBUS_PEC		| \
-			 FEATURE_BLOCK_BUFFER | FEATURE_HOST_NOTIFY)
 #define FEATURES_ICH4	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | \
 			 FEATURE_HOST_NOTIFY)
+#define FEATURES_ICH5	(FEATURES_ICH4 | FEATURE_BLOCK_PROC | \
+			 FEATURE_I2C_BLOCK_READ | FEATURE_IRQ)
 
 static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, 82801AA_3,			0)				 },
-- 
2.43.0



