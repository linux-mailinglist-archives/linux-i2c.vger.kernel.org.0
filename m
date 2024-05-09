Return-Path: <linux-i2c+bounces-3474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 353068C0EEA
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2024 13:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7A111F22049
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2024 11:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2F413172A;
	Thu,  9 May 2024 11:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jy1JpXs5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7091E868
	for <linux-i2c@vger.kernel.org>; Thu,  9 May 2024 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715254650; cv=none; b=AcFlXZqWXr6B2OnnLu8SBVIqER3CI0e0YshD3vo5qbscZynBluOIBuQW8oSVHLOtG80oQymbplBui4I11hptTjHLijWnN1XwU9Wtxmu3JUQStArelfGx4EgKCP8dODTYgHJgRtDI799CIqxiCq18LaGimkgfunrv9G0GH8Bubyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715254650; c=relaxed/simple;
	bh=p/mGE0YCcCGwO1alYE1Kc/lObOmlz3BakHNwLTjZPIU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=QsKzQOYuO4dvXHkmnk1SpnkqpDmJkyqgS+R2eFlNjjmST4RQeP+IkYntSYwspBuC/tqeBbs/VqhTBnYD7Ji+vSn/opWfwaLxbLtpQ5dzVNwH7IqaAgZTJQVz8KeSO+CqUj1NI/Oyo48g5xFdR1CgUe9lv0EEK7zsvmKbOLpkzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jy1JpXs5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a609dd3fso135237566b.0
        for <linux-i2c@vger.kernel.org>; Thu, 09 May 2024 04:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715254647; x=1715859447; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sJO0ha/IpUMXR3M9I8iD91SRJQAVOnLtMhPNZZSqbE=;
        b=jy1JpXs5btlGvmw6bKbeTbCmqIBxaCDLK6xV7/YjEWz4EYvWfVXNVen1cq+iMPp4H1
         yMNjlP9Gek82EO8bh7KZ5bcwiJ9ofjr/fdbPjZ5aEOy0rbpgx7jnyLbLZyepkMMZuDoo
         qjgXOPYpNpE0LLMZUGITCb7x2htkB0+j8+Liuq22TEIWz99A4J4C24MoWThmCLF0hsE6
         igRBIvh93CQgZlW5YvC5I1lh8ik/Oo5mm7Kht6+X4qXsLCJ5ajGkW6VvPA7Rzh/63a6I
         Pr0f/JBoWh1feunqZCg2xsHs8Hvl4D4BW+fMESqQJUD4N9VPxHntBOo5UenR9ulFmZ7M
         hsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715254647; x=1715859447;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sJO0ha/IpUMXR3M9I8iD91SRJQAVOnLtMhPNZZSqbE=;
        b=oU8lY0D6eK47W9b1EbgBCH5+yQX0HCkWYLTh8rh8C5qyEtsKne/FB3LRQmrO1KzJMa
         CFF50cTw+TPIUTqXXuHZOhoWKSYe2cmxYKOOFsiFoxKmDzrPCmP4WANyUlV9FHJQen+s
         0FrrBa0Cy0ajjBzumsRJgyB54XKcPUqylY2yAlwaEbPNVZ3alpJSDcY1VF45TZKI/O1S
         Vp7B+e12NBsRyGGIP9gnN1+JZ02+ED8HhsCRJEY+O2npVu1b8PkzhJfV2qf1nbBZhho/
         oLb8wWxv2GjvJgC0vQU2S9aO5BxL2jcWnwngtfp2Mqb7BmPdqm94EhDmopeqPtoQqOPl
         RgzA==
X-Gm-Message-State: AOJu0YzhCfSiiExoBWK9NrLFlo39Hqu6VVrrs+U/Bka2L68KysrMgIWd
	Q9cYqkNdo48qAcs+5YtLMHg8hb67kfSfAzVi0yHu0YgTg7BfK8vk
X-Google-Smtp-Source: AGHT+IEJMVbfWbIECiB1m4q9jDyJBW03yKh+urci0R6eeDqcrkjOxFH0YIxtRZ9Sbl/uDWKGUH8wxQ==
X-Received: by 2002:a17:906:365a:b0:a59:a431:a8d6 with SMTP id a640c23a62f3a-a5a1181b82fmr166525266b.38.1715254647067;
        Thu, 09 May 2024 04:37:27 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c00b:2000:7de7:eaf2:2b3:3589? (dynamic-2a01-0c23-c00b-2000-7de7-eaf2-02b3-3589.c23.pool.telefonica.de. [2a01:c23:c00b:2000:7de7:eaf2:2b3:3589])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a5a179c7f3dsm63984666b.123.2024.05.09.04.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 04:37:26 -0700 (PDT)
Message-ID: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
Date: Thu, 9 May 2024 13:37:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Support for I2C_CLASS_SPD  is currently being removed from the kernel.
Only remaining step is to remove the definition of I2C_CLASS_SPD.
Setting I2C_CLASS_SPD  in a driver is a no-op meanwhile, so remove it
here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
index 0d5ad531c..fb6f3bbe2 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@ -1616,7 +1616,6 @@ static int smu_v14_0_2_i2c_control_init(struct smu_context *smu)
 		smu_i2c->port = i;
 		mutex_init(&smu_i2c->mutex);
 		control->owner = THIS_MODULE;
-		control->class = I2C_CLASS_SPD;
 		control->dev.parent = &adev->pdev->dev;
 		control->algo = &smu_v14_0_2_i2c_algo;
 		snprintf(control->name, sizeof(control->name), "AMDGPU SMU %d", i);
-- 
2.45.0


