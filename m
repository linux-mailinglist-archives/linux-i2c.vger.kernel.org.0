Return-Path: <linux-i2c+bounces-8364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B599E7FE5
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 13:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B097282214
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 12:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F65D146A6C;
	Sat,  7 Dec 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4/TgPP2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96C4E1CA;
	Sat,  7 Dec 2024 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733575478; cv=none; b=JP5gmyB2CjYHg9hExrkzHH4Xk/hO2J2WF0OVJDiLLvelsRFGpy+1XTxsEYojowYzez2lGyjvENwMj/ahG1UZxDEU9xjgBS0RiauzIwBNlN1OohO+dG7g3M6Q4ET6YpGqsd4dQb7RNOAb6vNuxwzFqUWNnUDqw/Al4KO3d+RaNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733575478; c=relaxed/simple;
	bh=mWAipSee6dJNe1XbDgYVM3k9SMzVbdxqa8PSFsoUKlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qY/EDQctU+9M2VKoN34DxguUmFeYmvqziMUiIXOib0dSFAPbR7JzpGn1HgwwtXv+4IOSdLGd1d3eAj/5ozcDEpgMIbfZFk4WvcI2HG1rrrhlP1t9wFK6OIjpUpz6IuEj/YOXb4bDv5YAAlKyZLchE9jk5Y1a76WDg1gF80MpuA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4/TgPP2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724d23df764so2917652b3a.1;
        Sat, 07 Dec 2024 04:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733575476; x=1734180276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXDYeaPIYjwmgZstndoNxUxCayVMTNi77ONF54lCqnM=;
        b=V4/TgPP203gkRsIoxujxRv3xJUU8uipg3YgpenTmENAruXhBZMqmfnymcusYlh/g9o
         +ZfC1gdACfkRj7QNLbQOK2GvQ48MZdBHWeSuy5UBQpGdQpP9p8+JMPTBO8zeQzEf6xWx
         uwoi8/3mE43wqBQpYQ6NH0kVbHo+oaittAldCe7qi52l0cqdgAcfXAX1DfpLCRZw445T
         gtcK9uUTvrAsgQBYRBWhS6/QuwN1UXANgRJqa7G+7zMlmiSWMyaNcj4vy0fxdgFcoVHd
         N0Ykp3+y1KsGruw1IcRwoMNeA23x/vu5eaa70sc5g3kCyXZvMZ9tB4a1DefNjl0Sjw3u
         YiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733575476; x=1734180276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXDYeaPIYjwmgZstndoNxUxCayVMTNi77ONF54lCqnM=;
        b=HHqNiWcmQMhTvks8iPwXiyZajF31Qpqnzt4GpdoKg4nJ0fZaEtRx0VaJ+5p9jTTkXt
         eIlRVMSn+JNjNBz/OzktUpSV3aJUDNq6BsHKWVSEFYUhQ2O4wsm5TdEjg+UnujznRdJG
         AgAzMY/FlcDHmmJTq7ToJ5yHLVQwJLVmQ/3XZhaXHKGSzANO71qUUUOZOZGTSKEfcHob
         KtFjuOeABi/sWpid4FbxZk2Yiws2FY3c05p7xez4zegmrW4FbJ8F22d2vFciX6BUT9eS
         rbalfTHxQu4t8g12Ya7sQctID9oNj2+/un+hHBE5EzDeDZlMkTOkxSA7AwfEP+vyTSt8
         dE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgsH/wdwZciA4sLzlby+5BOX8ia5OqcW8WUs8JkMC5NgrkTr4cOX0+pQsbYZj5m+ZgNATBKQFsMPE=@vger.kernel.org, AJvYcCXKsI1x2+MdP03oMIADvRpDX2GC3DFhDpPqt5WXzy+UXIRl4c0abK8W9QhzkimMJIRCTyZcd2tfFeo4yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCXPyN2PnsrbfFN+7T6bW8w48O1Kazn1W7E87TEcyrgHLpFWT
	b4LaYzmmh7fCclQfM9vaQZb5NzbOM7lMZK3eGPP+r7fTKOTAuFth
X-Gm-Gg: ASbGncvM21VPEhKYiNwtiiP6rkq65COgXlKaXd7T6/67T/WK355ZKV3e4cYmc1UeBI3
	Cn+lstzEOJLeoVFUElRNU2Mq9ncaRNfBZOBE3iuUCC6H/HyN2yw8UURJP8NzFRWKIEIJ3Tr+8Dt
	0ngkiJw4bDE0uJSCpfDNL0S/77PW+IaxdBYbDn7FAEu9/feHt/Nb38dfbOBN25RC+HyipUTrWsP
	6VNlQp1nOYbnZmjrdW87u2qkSz2/A+XJ+N+eqUe1SOWONlg2YeJAlU=
X-Google-Smtp-Source: AGHT+IEVFy08AW3DD7z6NKC8twNkuYVJRs3aIqJBl8Q7R7OtCjobG7pDgGR5EFaQT+W30hj8l4UD1Q==
X-Received: by 2002:a05:6a20:6a0d:b0:1e1:161a:fac7 with SMTP id adf61e73a8af0-1e1870aecebmr9858960637.4.1733575475767;
        Sat, 07 Dec 2024 04:44:35 -0800 (PST)
Received: from melbuntu.. ([122.171.22.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c82b4852sm1700850b3a.135.2024.12.07.04.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 04:44:35 -0800 (PST)
From: Dhruv Menon <dhruvmenon1104@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	vigneshr@ti.com,
	andi.shyti@kernel.org
Cc: jmkrzyszt@gmail.com,
	tony@atomide.com,
	khilman@baylibre.com,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Dhruv Menon <dhruvmenon1104@gmail.com>
Subject: [PATCH v3 0/2] i2c: omap: trivial code cleanups
Date: Sat,  7 Dec 2024 18:12:01 +0530
Message-ID: <cover.1733217877.git.dhruvmenon1104@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up the coding style based on different 
kinds of checkpatch complains for i2c-omap and removes unused 
parameters.

Changes in v2:
      1. Improve language / grammar for the patch descriptions.
      2. Removed changes related to ms_sleep(). 
      3. split the patch into two patches.
      4. Sending it inlined instead of as an attachment.

Dhruv Menon (2):
  i2c: omap: Clean up coding style
  i2c: omap: remove unused parameter

 drivers/i2c/busses/i2c-omap.c | 203 ++++++++++++++++------------------
 1 file changed, 98 insertions(+), 105 deletions(-)

-- 
2.43.0


