Return-Path: <linux-i2c+bounces-12108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D371CB18446
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 16:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD83F5A12DE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 14:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDDF26E6FF;
	Fri,  1 Aug 2025 14:54:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from out198-174.us.a.mail.aliyun.com (out198-174.us.a.mail.aliyun.com [47.90.198.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425D2580FF;
	Fri,  1 Aug 2025 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754060090; cv=none; b=QbJsx+uDkUoE7yUCjvcfF31gfq+sBnomLuk84dbrd+aQdHYosleoarcA5mHUB5rOCr+ARteyn6ZVoal7bioNe2OZS2g7XD/z0JfanzFNqKGyHhOo8q4K5eBvZywCHpUnlBfuZvmgPBJozLlhoYeC+O5X7aPz68M86qROMVIHH0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754060090; c=relaxed/simple;
	bh=k0nPukyqI/+YbGU0IIJd2Bo6S0KMJre4cDxFQSxRA3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7KesiEBmsqHybx0KZ2T2U7Rrps8Bc0j6cnl8m8xwgYanRlTcBAJqwWnH+Wc6lD23szJpUIaX8jSgkPw5bcd9e2WIldz3dQdHZol38aD+/jJ6GVGNlG01xd/GgJVleRi2Cq6syB56ygEuE+8O77KMnRYbXeBDcvkPErF4I8hqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=myth5.com; spf=pass smtp.mailfrom=myth5.com; arc=none smtp.client-ip=47.90.198.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=myth5.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myth5.com
Received: from precision-5560..(mailfrom:myth5@myth5.com fp:SMTPD_---.e3U1xDX_1754060046 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 01 Aug 2025 22:54:18 +0800
From: "fangzhong.zhou" <myth5@myth5.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	myth5@myth5.com,
	westeri@kernel.org
Subject: Re: [PATCH] i2c: Force DLL0945 touchpad i2c freq to 100khz
Date: Fri,  1 Aug 2025 22:54:05 +0800
Message-ID: <20250801145405.11445-1-myth5@myth5.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aIc76DpLL28RLimy@shikoro>
References: <aIc76DpLL28RLimy@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jul 28, 2025 at 10:59 AM +0200, Wolfram Sang wrote:
>Please add a commit message indicating on which laptop you encountered
>the issue, what happened before and after the fix.

Ok, thanks for tell me. This issue happened in the dell precision 5560.
When the issue happens, the cursor movements become shorter, 
meaning that to the same input swipe, the traveled distance of the 
cursor is like half of the expected one.
It's also really hard to make precise movements. But if apply this 
patch, the touchpad still work well and have expected precise movements

