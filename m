Return-Path: <linux-i2c+bounces-9531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA068A408BE
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 14:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23AD1893D8E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 13:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CEF126C17;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhE5nsTR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A827453;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740231522; cv=none; b=ImdCaoBDRea0MJanu3xulcB7M3cni5ghg9m7xGGMW7oV1fvH6vHWHHwtSijpaGL467RFVJ9hMBPebEd7/+P3pHDwKY8PEKKlQ+Hr5efFzStKhCBukWTPqtAmmrAtpUMGcL74ey5DFSREtKvUibL7UAoGHDR0r0qrkSL5baNAQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740231522; c=relaxed/simple;
	bh=YvDVaUlNxk0FFYVh0Uih/QBxDdTXOT7A8XEjDIMtIh8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ILiffb6Y45glbkDFxceSd9rsrngb4xSvKinGadEutm1REISEdcLqvQEi/ca9NYk+j17fjaSBypPE/DfPNZaGdnMLuj9+61neQ2ghqbePUTdHI5Ee1rbtmLbRYKG9rWY/wyowQCzdtiY7xBd5gi6bunURbcQMJ3Tp7zGKOXDayV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhE5nsTR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45F11C4CEE2;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=YvDVaUlNxk0FFYVh0Uih/QBxDdTXOT7A8XEjDIMtIh8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZhE5nsTRYzQ+xatxbsjltkmXjh4yz5WSZQT0ORjz/ia6DJh/+c0KCvrgkMHMyfvyU
	 bXNgj/KMZL8hfTAfvtWD5nWhDyjoN3LUGVlwwPKv/fkxV8gAcp4vtjWk2Dfa4HLGgn
	 4h3Q2Y2F7/0SwRmqdCJVR5zQ1UPd03x3J0uol3c4L6bbbUwBYTbKGW4/iANsTgpi/R
	 tzscufz5qnk6PQ3YazNK7IIvefqcVF7qgsUzqjiVNW3zC0wDff35tKvJFhYzgw/Ru4
	 uOOl4hdcJIjtWojAHSS7G/G4ZxjdwyIKk3P96DzWVYRUaM4FyJuOah+KTjxWqFDHnj
	 yuLhSTAtwKpEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD68C021B6;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
Date: Sat, 22 Feb 2025 13:38:32 +0000
Message-Id: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjTuWcC/x3LQQqAIBBA0avIrBNULKmrRAu1qWaRiQMRSHdPW
 j4+vwJjIWSYRIWCNzFdqUF3AuLh046S1mYwyvTKGCWzZzxJbvQgy1EPMThnlQ0e2pIL/qEd8/K
 +H5oY4NteAAAA
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=YvDVaUlNxk0FFYVh0Uih/QBxDdTXOT7A8XEjDIMtIh8=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy5HrJq+aLtY2ozoptL78762o7OM1P5+2PDjD8rfuR
 uLhdnuWjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEPq9m+B8UVsSsKB6l/aLM
 SGmO1TO/xDc3TO5efhvyobe+eUXa+heMDF84zpXYKKjnr520yNlii5XDksSac68jXTJCt34JMb5
 9nREA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

Hi,

This series adds a few fixes/improvements to the error recovery for
Apple/PASemi i2c controllers.
The patches have been in our downstream tree and were originally used
to debug a rare glitch caused by clock strechting but are useful in
general. We haven't seen the controller misbehave since adding these.

Best,

Sven

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
Hector Martin (3):
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Log bus reset causes

Sven Peter (1):
      i2c: pasemi: Add registers bits and switch to BIT()

 drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---------
 1 file changed, 92 insertions(+), 29 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



