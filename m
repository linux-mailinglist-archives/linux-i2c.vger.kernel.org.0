Return-Path: <linux-i2c+bounces-13207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EDBA4785
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 17:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D35741B25
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 15:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD6C2264B9;
	Fri, 26 Sep 2025 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGBMSQSO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E46A2253EF
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901576; cv=none; b=XAGr9H5+Pi3+6yWDxYQceD65Qt/E+cdHeaA6HzQp/d86geCX4+GL1GsDqb8xTZ7WbyEGsvD1lfEcVCsfIjYFcF6HnSrXEuKikqmETEqscoqT9TTp5oy4KAGmMC1NrOt/A0LYOQFy3XNaBtwGWJ7qGNSzhFHHQCrkmOaDsJqSd0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901576; c=relaxed/simple;
	bh=gTCVWNzZzqPVINBCtaCUF392SAVoDb/SnXht4q/0pjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwK4RmnaLCNINGUV99sTAH57N9LBZMiSMBo9Xp2Nua8PT6MKspuwv0PM/mEM64qGBDww/YQTfbFkOWNlO0RBrUg6xscw/2fSqRJbbOlvmt4IxZjfDVnPWHItX20jknF6ZuUscsq6HxCQtOe0G1J3cttWqoip2OX2CXeePR8y+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGBMSQSO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f2ae6fae12so1284198f8f.1
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758901571; x=1759506371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEaF8vHW/fFjgdR+m9ikivvc2BgrqxtOA483ukp3KGY=;
        b=dGBMSQSOPT7ZxOZ39vv8dcpcPvrWmgIZ6CiXrjKsdY3Yuj+UAK9BMvflj6PtioCTRI
         v9VtZAGFg1sK0Zy7A6eeUhlWz8Ox8WUT5X8vZHdNh/QwegUuwMJr/6/Kmy1vluyPnnPj
         2o7zYn7sFPlqklPoI3ieqfHTrfr0JmzYqsmMnhML/3XyKrGoH6/JO03HlfvzNIvamE7V
         rT/Jp2fypugmzu5plR2Xy4DcN+YSGYTw2vo4qVQD0+pUY8QsMUYhNFR4UC1ylLBHVYat
         xismNN+gWxyhYhExJw7lvoOJL3EmPtc3PpirSuLOjIiE21YqnG0HAGR1l1o7R7FNzaB7
         YbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758901571; x=1759506371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEaF8vHW/fFjgdR+m9ikivvc2BgrqxtOA483ukp3KGY=;
        b=Ify+yvpMRqdj0MG8Ue2EMm0pyCVPfrhneacDFOSVd55Cq+ex5OKK5vPh0mxhZQy3ng
         XAdGaIhELt5PEZCwqd/pfl2Jk7zPulIVn+yqS3A0ZcMRe358tAcfK/Ko6EQhC6mbktH4
         bsMl1mq6kKJOwzFKj5XdOTtnpohJkZB5I/mfW2Zbzt2cJ4YQF0DpEM73fGzwpMEU03sG
         9X+gz7WT+FJPSKkWoGvCaRFZdgNyxJBfP8BiPQUTUhAVW/4ObAqYD7xn85zX/VkcelLG
         uIgYLWSBckzJ6PkRBFOLAEHaCBb70OgcHT6bA/PM0aaOLKgxEoslOXzkdnO9ypBh/psj
         7kpA==
X-Gm-Message-State: AOJu0YyzBY6Nvi+qrSdwcSOB2XBcN0e0GFI6dAOdSrxnqyc7z5NxadGZ
	yaUCNJHdO1QUsyJr3wpggC2c6c0KDxakG+2AnFQd+NQQTMzFkVfLKslH
X-Gm-Gg: ASbGnctNx/H/glhqmMNkhpEOxYtkaI/2EpMYTuTrA1wsHA4bq18Ccg0RGPsMWNw5XPQ
	WVY1dXY2tOcCbDEHd531es3T+4+1qCYvB2314Rmut0yxDpZBG4GU+mb5OwlS53zA6qDahPKav4a
	HgfP1zkHFo2JBSfkNE2WzSWtTYUEDIf7DTsGtrwiJieyeqUUPvgBixFKi0nCOqsuWsos3HqIAew
	v3zNJDhYqNZ2Sh+X6lFORqy419hA7xe3KdS03vs76XUtgUWQcRe38kSS/0jlCazDqmhZ3Loi6AV
	5nadD34LGQvzuMREasSpbjOSvDnCqubMllVlz30NhIZSFBIJ6yYiCdv0MfMeX3tuXpNkH0yHn3p
	VNfHoctmaGGEZ5sPZIH0hFee3D1bYnxg5OFsKmGw3
X-Google-Smtp-Source: AGHT+IENEMK9kpLMxQq8pmOuFGX/dY92eFwCosnaUm3Qx62oygZQfT4phIpm94oS4dQtoAcsNk3egw==
X-Received: by 2002:a05:6000:2509:b0:40d:86d8:a180 with SMTP id ffacd0b85a97d-40e4a71159emr7420745f8f.20.1758901571324;
        Fri, 26 Sep 2025 08:46:11 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32bcd016sm41680005e9.1.2025.09.26.08.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:46:10 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v5 0/3] i2c: pcf8584: Fix errors reported by checkpatch
Date: Fri, 26 Sep 2025 18:45:17 +0300
Message-ID: <20250926154520.40583-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aNUa-9HcQzyjZkvE@shikoro>
References: <aNUa-9HcQzyjZkvE@shikoro>
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

The series PATCH v1 to PATCH v4 is a response to the discussion on the
mailing list with Markus Elfring who had comments on my earlier 
submissions. 
He suggested:
 -to split my initial submission in a patch series
 -had some valid points on imperative mood usage in commit messages
 -wrapping commit message to 75 columns per line
 -change some of the commit message to point usage of checkpatch.pl
The series PATCH v4 to PATCH v5 is a response to the discussion on the
mailing list with I2C SUBSYSTEM maintainer Wolfram Sang who requested
some changes:
He requested:
 - to remove debug macros from i2c-algo-pcf.c as no code change was done
 for almost 16 years.
 - remove wrapping paranthesis from value assigned of '(0)''.
 - resolve conficts caused by debug macros removal.

Here is a brief summary and order of patches to be applied:

Patch 1/3: i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
This patch remove the define of debug macros and also their usage from
code.

Patch 2/3: i2c: pcf8584: Fix do not use assignment inside if conditional
This patch takes the assignement from if conditional and moves it by 1 line
up.

Patch 3/3: i2c: pcf8584: Fix space(s) required before or after different
           operators
This patch adds space(s) around, before or after some binary operators
and punctuation signs.

Testing:
   *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
   top of 6.17.0-rc7.
   *installed kernel and external modules generated by build on my laptop
   *rebooted and loaded i2c-algo-pcf.ko without i2c_debug parameter.
   *when loading the .ko with i2c_debug parameter an error is seen in dmesg 
   and this is expected as the parameter was removed.
   *No success message related to i2c_algo_pcf was seen in dmesg but also no
   failures.
   *Module loading and unloading successful.
   *No PCF8584 Hardware was available.

Patch 1 shows multiple errors and warnings reported by checkpatch but they 
are solved by apllying patches 2 and 3 on top. Other errors and warnings
shown by checkpatch on file will be fixed after this patchset will be 
accepted and merged in other commit.

Cezar Chiru (3):
  i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
  i2c: pcf8584: Fix do not use assignment inside if conditional
  i2c: pcf8584: Fix space(s) required before or after different
    operators

 drivers/i2c/algos/i2c-algo-pcf.c | 105 ++++++++++++++-----------------
 1 file changed, 48 insertions(+), 57 deletions(-)

-- 
2.43.0


