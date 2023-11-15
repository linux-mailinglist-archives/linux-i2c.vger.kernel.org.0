Return-Path: <linux-i2c+bounces-160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6397EBC74
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 04:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147671C20A64
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 03:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE951FD8;
	Wed, 15 Nov 2023 03:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="n7qxPWtY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1788801
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 03:58:03 +0000 (UTC)
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C080CA
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 19:58:02 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 255F92C018D;
	Wed, 15 Nov 2023 16:57:59 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1700020679;
	bh=uA0rlb6Ck8yhsN/S3XkQO0YUcaI5j9KtFBfH6I+NaZo=;
	h=From:To:Cc:Subject:Date:From;
	b=n7qxPWtYjW1Wj2ip0rg6lHeDSRcFSnbVa1U6mjbn964MFmC/zQW9qqT1uRF2P0C0V
	 4TiAaYWKj9TBc+KzR21B28aPdOWvP9gzBjum6ckMuPm5K34vL6d1DuPT9xaDmN7AOT
	 LXS+wIUpXN3+EndQcqJJ28rPqGHrsa8v6+evvorWGjAf974t3O3LmQaXvpHLPT12/k
	 rM/ezjTtiihfFdYBHrqcXdL9rX6zqG3RBdXX/DsJCqf3elv7qK6FNQ7IzU4nBcwQHN
	 I/DNjJaMkwGueIFkuxfjARRGJvB9fTTtUSCL5jiXGvsfkCkhCdeOYkU2d2Y59wCQf1
	 uk/GCopvXAOoQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B655441c60000>; Wed, 15 Nov 2023 16:57:58 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8827613EE3F;
	Wed, 15 Nov 2023 16:57:58 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 7FFFE280590; Wed, 15 Nov 2023 16:57:58 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: wsa@kernel.org,
	andi.shyti@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 0/2] i2c: bus-reset-gpios
Date: Wed, 15 Nov 2023 16:57:51 +1300
Message-ID: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=BNY50KLci1gA:10 a=VwQbUJbxAAAA:8 a=DIZWHGWb_bPM9LNtZTAA:9 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds the ability to associate a gpio with an I2C bus so that
downstream devices can be brought out of reset when the host controller i=
s
probed.

v5: https://lore.kernel.org/lkml/20231027033104.1348921-1-chris.packham@a=
lliedtelesis.co.nz/

The conversation sparked from v5 was heading in the direction of this nee=
ding
to be more generic. So I've moved the changes up to the i2c core, which i=
s
about as generic as I'm comfortable with.

Chris Packham (2):
  dt-bindings: i2c: add bus-reset-gpios property
  i2c: add an optional bus-reset-gpios property

 Documentation/devicetree/bindings/i2c/i2c.txt |  8 ++++
 drivers/i2c/i2c-core-base.c                   | 39 +++++++++++++++++++
 include/linux/i2c.h                           |  3 ++
 3 files changed, 50 insertions(+)

--=20
2.42.0


