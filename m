Return-Path: <linux-i2c+bounces-8595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAFF9F658B
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 13:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 615D9188919D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 12:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A3819F49F;
	Wed, 18 Dec 2024 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QG6Mx5Ip"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0B215957D;
	Wed, 18 Dec 2024 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734523685; cv=none; b=DQdZiO7c36eB2DZ7d30fT8vVZ/YGBH17olQPZT8Az64CGYTVctNp52THrxLCK9yx8CiH8vfe+9qR52dsELFlcyOPbVdYHFEH6RK2N9OiPW6/Bp/tSFzFKcpOxSy0SwxE5p737Tc0D9n1fCLhGiseNKuyms4w44OnQntE0gmU9e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734523685; c=relaxed/simple;
	bh=Z+2yFPrzaSadXkNEy1r9XKtC+SX+xEW56p81WI9GCYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XXXLbmXOiIAZv4UuPMwe1IkyVQc0kqaYmtjK+eSlT+S5bOokxqnbiBWXmmsxl4KeiD5tbF60f3ATyCnEOfElKLHEM8yNroXTA6KT7grUOiAQxpCbkw42yyUg4Cm+HAkBOILKj47J5A5sb1HzwU+puROQKEw5MQg9tnarTiJSiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QG6Mx5Ip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC6BC4CECE;
	Wed, 18 Dec 2024 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734523684;
	bh=Z+2yFPrzaSadXkNEy1r9XKtC+SX+xEW56p81WI9GCYA=;
	h=From:To:Cc:Subject:Date:From;
	b=QG6Mx5Ip0q7Cl9ui5q/C0OOu/YS1AjzbrOlrS0gxz6Au4+Tr2Ng1uRdLtcdT8kWei
	 UNnvN4rdSYCYQSZxsD/dXYDtTihQcB/WyXekC4UUnDgYUlBNu42Cc7/GMSpyvDzN+v
	 sD9uRJzLE3R6+pZH0urcVaY6St+rCVRggmaqQN8gkBL/Hba64/RZQ3ZLgl38X5h1RV
	 1IrgItnrHfsEPSDpNXKqQcJH4Zr/BLnM4BK1fNK0ngkNDDMdKQOS5XSQTR/t9pV7Eu
	 U2FsBHw4wCKgrL9gP6m6mgXHXJ8enn7o0J6+X3lXxV6bxicDD+JoMdB2+46rUR3M7E
	 V29zIost150Nw==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Microchip CoreI2C driver fixes
Date: Wed, 18 Dec 2024 12:07:39 +0000
Message-ID: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GkdzysDT6A8rvdwD6ioxMopMwV7YP24rQ6Q26+goPsE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlJu7lfrWnI/tZ5Ie4LU9ARvkKxOV+qZ0//f2gRkxHLo hlbZUuPd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAioWGMDHtOGBZVCN2Lnvu+ ssxOQf/Z5gVxgpuy/Uq9Fe/ZzGTY3crIMCfKbjJHxTnnPWf8lopXBbn1NBSVXz8gt5Vl4Tan83s 3sgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

Here's a v2 with one of the minor items pointed out by Andi resolved and
a new patch for an issue fixed in the months since v1, plus some minor
checkpatch things that I seem to have missed on v1. On v1 there was
unresolved discussion with Wolfram, but it has been two months without a
response so I am sending this v2 in an attempt to make progress.

Cheers,
Conor.

v2:
- remove extra () Andi pointed out
- fix some {} use that defied the coding style
- new patch for "ghost detections"

v1: https://lore.kernel.org/linux-i2c/20240930-uneasy-dorsal-1acda9227b0d@spud/

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Wolfram Sang <wsa@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  i2c: microchip-core: actually use repeated sends
  i2c: microchip-core: fix "ghost" detections

 drivers/i2c/busses/i2c-microchip-corei2c.c | 126 ++++++++++++++++-----
 1 file changed, 96 insertions(+), 30 deletions(-)

-- 
2.45.2


