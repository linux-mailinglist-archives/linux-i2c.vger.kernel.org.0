Return-Path: <linux-i2c+bounces-12546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF44B3EC47
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 18:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB0891A88001
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 16:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7233064BB;
	Mon,  1 Sep 2025 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjjtUWwy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70763064AF;
	Mon,  1 Sep 2025 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744612; cv=none; b=ZzsyeIk022EJUYWFOM4RLJBOuvi8JhYcg+8qKk1DnxBzPTMREDje5Rz+gWb8+cRKNd10gXGOVukjt1s5O/SrAwTU1pBhoI9MYy/frL7i8wbhsq2KFpaFNNR6g60hU6HQgdRPyc+zLumnCPk9pJCIbfqQCAquCN27S7hRUsb6sJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744612; c=relaxed/simple;
	bh=zaXmFjo7kjsLo8szfZKhyM3I0AVew3MYvbBzY6VYu0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SAspfpl85/BZ2+TEVEMfS4zehI3KJHg7q0psDcGdzolsrGQ9T32MpMj/mZvvqChJ1fPaGNjvnPo62ukpKdJRcPeLXIiLvaByQ+Z45FEhlPVolh5IAAMuuuKRDd1ZvmZQD9M6JytYn2yS1F9e/Bvgqee3M9QaJPC1XVJ+XodubYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjjtUWwy; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-71a7108d992so7164106d6.3;
        Mon, 01 Sep 2025 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744609; x=1757349409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrKcqq4TZY5082V4jwIS/kUCd1JM3B3pXkEVST586bc=;
        b=BjjtUWwygybKRBWRnzMcVd1bxYxxV2ba77qGFv6sEY9dxvw2xzl6A7bZv2U502yUsx
         mpwk6VyRYGlKvgoDvHwpl2BIBnsTikmDacZ7CgeEVpLhMWFiWFSBodvVPU2rz17TSWKE
         GH8wcQeGhC2XMLZ4Xd8qsaZMOFqhl8On2nNRZXwqCOk4xlI+w8xaXCum1m6EMB04Un3l
         V2YT3mZiLebOyHsG8F4ERgtxmK+cwVNrbvnK4t17/kccwKvfO01pc+iKYQleYc7njcq8
         sYS4aFD3/UIqnMlL2TUZqLhiTHp8f/3TzXAJcXtuS3MUCH6cpvxd7hY8TulcoV6EZ+L0
         fBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744609; x=1757349409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrKcqq4TZY5082V4jwIS/kUCd1JM3B3pXkEVST586bc=;
        b=rdU9bZ8SNfF/9EXPGfjEqr8bgCSBIov+yogA7vcV793S0b+G4GjyvGYTcbl8hyZZDd
         jn23u3J7EnnLj5MvV1d+OAMlwT7sCR/OL5xdMoDLLnhfkEVhz1wdyMFPuH4e0ODtmGbk
         lJMXhiqJ/SgH8JmHC37q0ErzTvMEjIk8spn0DNEcF1opIp+5shADhGjoHV8jMw52oU9c
         Y+M5HzmvzN7cvPpc7aVmm1/VPe8jA370M5QiYZZJZrHgzA16JO5DU8Baoy50l2fr7d7W
         qBY6SyIlOkYWs4iaZ9hWs3OOAl4nCv9XoW7CxT7YtLOPFOPrgyYwO2SHTxZ2gkSHrmIq
         2YLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMZkdehgqkeAQpYZCEWVtFjA6TeH97O4KwpJvaD+kj7gfdRHUoaz8sTVzN4A9zDn7NUVrh/7rVqKli@vger.kernel.org, AJvYcCWZfevUCCbqmsbZKSUWtAIOFn2KKlogg6ZZiPO7HZlzcorMMK4lU/dkdYuQ+wAVAkAEV4qSryBSqzSDC/Pv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ObCWkJ7T0dQz44SFVgjZE2inE5E5K+ymcyvZOjtpAOs26RHT
	Y208V6D26DztUX3wisbikVF9AmG3K2w2ZPhn4tBCmlGjTtZVCXYRPhvp
X-Gm-Gg: ASbGnctZJB6NP5XCEbKYG5N9yfh+yxaD9Y7Q01RCv3mCKiRsh9y6sexX0+h5vL1wQdY
	TeXbgbpsBsqdPiwu9xtSz4NLMvfnRmkE9OVShnHkqnlCTufsvmTEky0fWLiX8IE1S6F8rU1e8KV
	vqP8nUrcoh32SFOGAVYRJ6CB+hy92ZAxfIsVjiveYNW1gLu8RnzahfRYdKWRJgSCMhhU049iOOz
	MQd9OSeeMvKdFl90PkmdJfB11Cxu3l5wrO5hXG+R6gm2b2T3RKm+vbzuoFh1Dijp3/4TcAnnB3a
	mRjkeeirlRRRLXAh4sgTebG3ocR+ESgVC/qdFM37Vp1127ClVIncV/hzLk0298bcsjcn40SpfVs
	89FV/bw49aP2YORd4emNIZLTiW+bo2x+9vy5IvGvGoTNV1uQHwgC5MV63DdaPQB06kTiWrcq+IG
	UjwZY=
X-Google-Smtp-Source: AGHT+IHf3CL5OzMbAfIuCkb3j9PHfLlHpvX2/6r9BGRu+dFGei6Wp9zn80Gs1bX1kCikT+7+HZ/hIg==
X-Received: by 2002:a05:6214:230d:b0:70d:e984:ba54 with SMTP id 6a1803df08f44-70fac912d73mr96771656d6.58.1756744609386;
        Mon, 01 Sep 2025 09:36:49 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b93a4sm42394916d6.66.2025.09.01.09.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:36:48 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 0/2] device property: Add scoped fwnode child node iterators
Date: Mon,  1 Sep 2025 12:36:43 -0400
Message-ID: <20250901163648.82034-1-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds scoped versions of fwnode iterator macros and converts
existing manual implementation to use them.

The first patch adds the infrastructure macros following existing patterns
for scoped iterators in the kernel. The second patch demonstrates their
usage by converting existing manual __free() usage in i2c-core-slave.c.

Changes in v3:
- Split into separate patches as requested
- Infrastructure addition in patch 1/2
- Usage example in patch 2/2

Changes in v2:
- replace manual __free(fwnode_handle) of i2c-core-slave.c with
  fwnode_for_each_child_node_scoped

Jean-François Lessard (2):
  device property: Add scoped fwnode child node iterators
  i2c: core: Use fwnode_for_each_child_node_scoped()

 drivers/i2c/i2c-core-slave.c |  3 +--
 include/linux/property.h     | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.43.0


