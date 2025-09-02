Return-Path: <linux-i2c+bounces-12562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2276B40D86
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 21:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FE051898C01
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 19:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E31341ADA;
	Tue,  2 Sep 2025 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSCtGTGG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A3283144;
	Tue,  2 Sep 2025 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839887; cv=none; b=izf0J+iSc+dHKegPwe4ezCmi/htv/cMq4YZkfJxbPFlqeGDGQjujfq9UKWFKZjGGDLbPZ3v6r7e/zE1kgpaG6p+jx7eXeX/z8MRAGBttZhsAeFsQZuzCP8Dgn7wFZQ3LtmQ8JZSmus8FzyMwSFEBp3cjOU978LN34LeUS2uEtwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839887; c=relaxed/simple;
	bh=Oj5aINhcYFtphhVdBKlH2bOKTsmvoHemm2/VjWhobyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qnngbyqyse5Qpx5LwUvwjs1O/QEmkGX3baoi1JA5xFFGGAx7Kc0G0tU2wiKNCer7Fstx7VYMrS1kFO22tDBmP33jbdVEx0TAXPRMVscbDIVMsR8yYfnNm907zTMn1MwlIFPDdDVoG7P1pkuvj3lmWdTIjjTx3oeQkxcgnxQ0Xcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSCtGTGG; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-807e414be94so62959385a.1;
        Tue, 02 Sep 2025 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839885; x=1757444685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxA8ht6qs1edRvOIC5vyrLYGDMauT5E7PcV0ybK3jyw=;
        b=cSCtGTGGKnu0EPzHy3CNSYP0A69xUnm35ZtDtEVeg56qeqk92z2PdsOh9118Eab9XP
         CI31huXp7JyBngEUUcLCoB8WJSZfpPYmUXiJRu/B31zSt0V+7yAphp6HuC+lgsW6uZkr
         0VZYOKF8h5AbBRk2VSO219vkh0maQwjhDLlFkrxFh8XT7ADm+cGv780gLheQ7Q6A/I/7
         tGUDYyKQ922/jIbIe9/BqRT5Rt1XNGa5ne0QsxAVcZHFi3VLqbKb/MsHkoYnKVYSQtsa
         2OIJAE1Wf4lsL38WhK9LNn9VBayzvsqABnsdQWIGGCpiVuOrBDQkEYZFjoEU01U7RjIs
         Ql3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839885; x=1757444685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxA8ht6qs1edRvOIC5vyrLYGDMauT5E7PcV0ybK3jyw=;
        b=CUA8+CytoIfeg6Q1NI2HjyBQfXR/2HDQPXIGYMLTlkn15E/pcDC9MwTzAFjmuYtz8B
         LAY4bW2lYdppXUz/JxiP5hxEsYKwXV8GyrtmJXsV0HfZy60oyufDl/dv6MmZIszPqlHp
         GfzQv1Qiey6R4SIcnuD/xR4jtNY6P3Cl72RLSyEQn6g6YfDzej8nH5BWRE7YH/sbDsWf
         7anrTPBP2e8nWIeQraYcEE/4xvnlUi7bqCaYmjjzJCSTs0DqlQsCRNb/yE3LVp9NsUH4
         eRv705/5NGHte/jRklqcXSzrGt36BP7XAewDOmapxHlJhApQtNmbJtqnPKEJXeXSvz6T
         AUAw==
X-Forwarded-Encrypted: i=1; AJvYcCVm7BzQnmnqbUmi/8vZIx7BInGMLgxcqPsmuh4vBCNELCPOL4YAovTcgaWeik3cbbePPU4yQZVdSocwJBIg@vger.kernel.org, AJvYcCXHWVo2K0yw4J0mIFwXx2W6/WoA+UnPHD9Ah9EFzx2hCk42yG49/G6RpFfh2I5Cpl6XUuf9wQBE7fQy@vger.kernel.org
X-Gm-Message-State: AOJu0YywcZzsR/zEnlgQ9oPvuC9O3+QSp2xEIk7UXy70XNFC+MU1qAZx
	vtWiRcMG7gGJPqeupDY51e2eqahHpFKTzK+1tkeGfvfcm43Nr89Z91hD
X-Gm-Gg: ASbGncscBv5UtpEHqHUv+an8BK6MY7bCJaj7RfAgyUilHBGQV7mWgrTyE5AiAt+cFWJ
	N8O4W8asKwnxjHHDgN13sL25cU9GXjgNQ6UpPgpBsEpX8kiAylsLESJDQR0hvvsrrP+HoT8J6bO
	38XOA/57RIDUKW0aJMcr4xCB8mbGelwmPuMDy8iFsJKSvzFHaWxsxX/2VC9xZzvMPgZ7cGcdt0Z
	i1crjNxaVnShGGr/4bzrBJBVt4au5iJk+RphvRW1BgmEZEMoBJvz7/qhMpYvzK3aVp2vqAYvh5m
	1ODmzzktmork4GoOBWzlqv+0zIK1kp+rnZ+ss8ogC49GkkiEjtrtjcbSQG+csPpLWGMkGnW2UGC
	PbHp81/P2LgGhNgR0PmPrk3SxKCibAUXu8Tg62AF/NeB9Ar+djKSZ3Diuhf2Coa6cIzig
X-Google-Smtp-Source: AGHT+IF++M/BTblPb1E+NQDMEm255XgVGxDzVpQn5QF87x6sD4jg9ME7z61kiRfWQlVMegCStoIUBA==
X-Received: by 2002:a05:620a:440c:b0:804:8889:7e9b with SMTP id af79cd13be357-8048889813dmr817397485a.30.1756839885001;
        Tue, 02 Sep 2025 12:04:45 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-806975cf406sm182379585a.3.2025.09.02.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:04:44 -0700 (PDT)
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
Subject: [PATCH v4 0/2] device property: Add scoped fwnode child node iterators
Date: Tue,  2 Sep 2025 15:04:38 -0400
Message-ID: <20250902190443.3252-1-jefflessard3@gmail.com>
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
for scoped iterators in the kernel. The second patch demonstrates
fwnode_for_each_child_node_scoped() usage by converting existing manual
__free() usage in i2c-core-slave.c.

This series introduces infrastructure for the TM16XX driver series,
being the first user of fwnode_for_each_available_child_node_scoped().
See the related patch series:
  auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver

Changes in v4:
- drop the fwnode_for_each_named_child_node_scoped() variant (no user)
- add Reviewed-by tag to commit message of patch 2/2

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
 include/linux/property.h     | 10 ++++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.43.0


