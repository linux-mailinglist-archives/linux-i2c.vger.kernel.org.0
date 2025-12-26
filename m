Return-Path: <linux-i2c+bounces-14781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031DCDE4B7
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 04:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFBA4300F305
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 03:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62351154425;
	Fri, 26 Dec 2025 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="LIV/3GBs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C8B28E0F;
	Fri, 26 Dec 2025 03:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720021; cv=none; b=SyP8LSRCA/yLu4U/MxKl/PWS+qQqvI6TGNzKQ6jP3sW/rbnrdo9qw/M8/xaHrOSadHfM5QFl6EsOiXNmfaCVf6G6aNZltin7JJAZMD55l6xKrz7Gg19GxuqBHYYjAASyEfOy9lG8+1dxl+VAtv7yRFziQOVRwqBlmY77loIy9t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720021; c=relaxed/simple;
	bh=Kmj7kza3loEFGMSkqc/gxZgNsE6AP5OpWEy/KU79XYg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N/sgFIuvBuWoV6+kIn42b6MBJVJVoDkBw0LV9IVbRtwEhA74etN5dnWEUJfucsTgEm21kn8P7ezIVVTc7umlxMEujBsWiAsphQ+fIj+vqfYkzU8rlv9nAoxPlmhReWnvSMBrxWwskMzGtTzFCDhQjUNkiB9eOcth2YUJOsY1VP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=LIV/3GBs; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719882;
	bh=4G898/TytwWeDsBTfk/Jr2w3MTgrtRAcNQGtcA6BRCA=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=LIV/3GBshsHzYKhk68zXvzRzw6Uja0JdF62PEtZxVpjgnL4bMNlKDHKxLHduqfYEK
	 NeEQp7M6TErNkOlDHw1MtAtDsXX0JykQUAjdx6EUGD3GXqlloxvCJUARHNUIkuO0vG
	 ZiHyhwjKWkvRZLlRGBis80ouz9GsQgOvL2VIa/PU=
X-QQ-mid: zesmtpgz8t1766719872ta0a08439
X-QQ-Originating-IP: 2ZRT0Vzzq8tXbh3T6RdSk452eWXEivfl0DGUAeiOMg0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:31:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16197927595669781183
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Date: Fri, 26 Dec 2025 11:31:09 +0800
Message-Id: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0BTmkC/3XMQW7CMBCF4asgr2s0M3Ycm1XvUbEwtgMjmgTFI
 aJCuXsNqtoqwPJ/0vuuIqeBUxab1VUMaeLMfVeieluJcPDdPkmOpQUBVWBRyyNKpiD92LccZIP
 eQYhKK6NF+ZyG1PDl7n1sSx84j/3wdecnvK0/EtULaUIJMlVulzxQNBbeP7k7X9b55ENqeVyHv
 hU3cqI/xlG1ZKgw2sSASiGG6F8y6j/jloySKJs6GQNFsjvzktG/DAI8MLow3jplalsD2efMPM/
 fp2HTIIgBAAA=
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766719870; l=610;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Kmj7kza3loEFGMSkqc/gxZgNsE6AP5OpWEy/KU79XYg=;
 b=vvBcdNpH7OiYwvJTmzjugqmBgV39sCJeIn6zteoGLf3iXenQGIGreeplrCiNAsmhC5R5yrd55
 oaIwvja6eT3BmBGEeNpcFD0dw+S7RgeLafTF8uaY5d/Sv+lL3/CPjGP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MH0lMfdEGk359Dds6svjm9DXMtDPej8dTxZIn2aMWwJ0+KXfqBEyw7RW
	+kvZ/hFxwzmJNJ7PJZCKOaVEGZHOOLhSf+onFu34uNxHK+zySqjs5Fb/cM3KwYxjNymcDTU
	WkX7LgdN1XLzbuRY56YCKl/jPZP1eXvwCqKrQ7dSr51bRgQqXu4mkAm7I78Ftm/VOolBVM3
	U8QeqaUTjH/tI6G+s8h9QbjdiEjqOdVy3JD4YEeWtsPo+v+b2FH1356aNWrojq3QAeOVGM5
	Uqap0/9gKlik/LwqDKoPMqn/E5eAuJ0d4jkp0a4qbDiVE+IJ7sx0ugvuafS3f7z8czJ7Mqu
	jPO9Ksu0XRhdiBo3gGSr1UMjsaRoVLXoU6R9rUg0vjUaSvIuRI7LW/YjNEMcIdLrBT5f39l
	1zoLnqvUMAkMcJIS3PfSWPP888Lnxrsomt03On35JYBKK6TvrVSBED0CpqpCp7oBz+x5M7o
	UHzflTFowS54gE56i4o1s8MlcpwwuqWVUyAFZ2Cz983mk4fLVARCt44IWeQRpfMfc4kk+i5
	ez2MdPBS8iwewN1JlSai5TrE0jfIB/t92ZMRpYXGlOn9X2M/folwFPtPffho6EqWU1KV89f
	CVT6Y9X3u0Kscui0lRsIZdpKPGD6cumpfl3usLPCaP/jvdTanjsdOh9dBf9OXKh40qAxRnI
	foMZvcePBNoY8xocauJG9D6gpCpLZP7lpb94cTq6LogKa/OW6KcKhSDI9MSiEE7Vf4InQyI
	k+xSVXXuFsZluJl80wj36emT+Qjt9NUVLDNp2khhHw7EjuWAgVTVjH1vjeBiljSc3s7UPw6
	9wUCSqlLcEbnBfUHFWC8SnW34CEtsiWnHtf4iaqppqIweQqeCquR8x6wD2PBhRzKjDf1gbU
	XzNMsXFzxD/x9akW8hmAK/B/1dVqQ63PYRHCnFwfYaSqR202v/gReWhm5NCPlJyAKnyMBg+
	TWarzjOQC03vVGqAbv/h8xATVpVpDMowX4twYtCJH9jlyN91XS6s/C06L98Nrm3ZKfnmV1v
	1hzWHR8QdUjI+co0GyJs5RysycnalRZlHgyPaUqwZrfIPw7Oi23ZvWtpwLD6JpUcf7hoFhR
	r4baHAXHj+IQl0FgtHlEo1dz8IDh8mZ7i5VkWDOn3w9tsJBG2EhRPEC2NGbkQE1xQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      i2c: spacemit: replace i2c_xfer_msg()
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 307 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 230 insertions(+), 77 deletions(-)
---
base-commit: 8dd7d777904fbe2e684d1f1942f81256ca6fd312
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


