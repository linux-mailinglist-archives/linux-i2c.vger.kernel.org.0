Return-Path: <linux-i2c+bounces-9329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0045A2B8C8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 03:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFA021889670
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 02:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382531531E1;
	Fri,  7 Feb 2025 02:19:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3B2417D3;
	Fri,  7 Feb 2025 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894783; cv=none; b=hLNFQLcKvtTTm4XvgTcy3RgFry8ElhyGLfu95/+H6KvwoPWOBLkU0f/RL0dlnJFFXuQvvsU5XHFK+sN17GtlqA+ckSLUzcPQG8Dms5qcFABdqbDvYFU7hLwMGQ1Jz+LOe0I58No9QLA3/ek3+Objzs0FyuwgK6/nOg/dycAEeX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894783; c=relaxed/simple;
	bh=xw00Ibda1+JvV1FhEklR8e92CI+093a51UNxYfQGgB0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EjkPE9u1FI9aUP/HW63uPIg5TlIrJrOzP80zF6jFcquoekHMoQ20cWXCu3agEJWHGFhugNBn+oOJ090IUfQNS4DZhDtMxI++NoEesa/FqsK47x3/laeNl0PGfbZFRLWQKepo3EaPpfaPJaqTSWbGTFdRC8J76oX10g8EPaCeLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5172JRpm093058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 10:19:27 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 7 Feb 2025
 10:19:27 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH 0/2] i2c: add I2C driver for Andes atciic100
Date: Fri, 7 Feb 2025 10:19:21 +0800
Message-ID: <20250207021923.2912373-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 5172JRpm093058

This patch series includes DT-bindings(1/2) and I2C driver(2/2).

The atciic100 is an I2C adapter/client controller. It can act as either an
I2C adapter or an I2C client depending on the control register settings.

Ben Zong-You Xie (2):
  dt-bindings: i2c: add atciic100
  i2c: atciic100: add Andes I2C driver support

 .../bindings/i2c/andestech,i2c-atciic100.yaml |  40 ++
 MAINTAINERS                                   |   6 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-atciic100.c            | 346 ++++++++++++++++++
 5 files changed, 403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
 create mode 100644 drivers/i2c/busses/i2c-atciic100.c

---
2.34.1


