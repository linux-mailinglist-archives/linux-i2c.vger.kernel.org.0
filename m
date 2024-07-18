Return-Path: <linux-i2c+bounces-5011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 861BC9345B6
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 03:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 128FCB20E13
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 01:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95ADB186A;
	Thu, 18 Jul 2024 01:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="zNgSSi6i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2F10FA;
	Thu, 18 Jul 2024 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721265923; cv=none; b=GMcS9IuCQnenzjkRZcVB9xv13nTNoKpIWbcXY9A+rwBlAoMONNwquLglz2XmoS+jNJeFQdGKzrMBIQD5YOCixloUtADfwsYbGhfty7YvH0AEgGJaJmy77cDxZZvhR2p+Nbjr/K2WKmfuuO29oGuOBwitTUjjX9NH4dBt2yTIg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721265923; c=relaxed/simple;
	bh=ToMXT8Hf3bXOS4rb9tjuA+dcjZqWXki9D94oOuilGS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WI/5qpGqacipkXXXbLZ7adVOH2KfMf0K5YESguVGY6at9I36LgvNqovM7RWc0PAF764I1awoZsq4SCbNcUyN65P62pHXa1+KNnqyFwoC3t5Y8G0bhQaIjOfVVxK/ODvs/vj+xOm+lBoSL/2pM9lmrBaPYKwvO81c1wshGSqNLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=zNgSSi6i; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 87D2440D7C89;
	Wed, 17 Jul 2024 21:16:17 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1721265377; x=1723079778; bh=ToMXT
	8Hf3bXOS4rb9tjuA+dcjZqWXki9D94oOuilGS4=; b=zNgSSi6ixLIxk6IlkB8Ca
	6YgpHI2jdm5mdByqq6Tu9zPYU/SWXVRn04iJ2E9I1SQdlqk7nnKNlu9rbxAklfOX
	LPNFjaopGbBfoFQ7sN8DwdsijOkZ69vVgsW9w1ZlEDu5lXQ6KjKofjE7n5LCrv21
	ZC4YoTX1covdyhsnCMlqlY=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zvkSNSZoemUH; Wed, 17 Jul 2024 21:16:17 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2F12840D7C81;
	Wed, 17 Jul 2024 21:16:17 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	linux-mm@kvack.org,
	lee@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de,
	christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Date: Wed, 17 Jul 2024 21:15:02 -0400
Message-ID: <20240718011504.4106163-2-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

After the ability to allocate PAGE_KERNEL_EXEC memory was removed
from __vmalloc, this seems like the least invasive way to expose
the capability to drivers that need it.

Exports __vmalloc_node_range so that drivers can use it.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
---
 mm/vmalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e34ea860153f..037b7e0fe430 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3879,6 +3879,7 @@ void *__vmalloc_node_range_noprof(unsigned long siz=
e, unsigned long align,
=20
 	return NULL;
 }
+EXPORT_SYMBOL(__vmalloc_node_range_noprof);
=20
 /**
  * __vmalloc_node - allocate virtually contiguous memory
--=20
2.45.2


