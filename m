Return-Path: <linux-i2c+bounces-11750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1382AF0465
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 22:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E311A1C05496
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 20:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024EA283FCC;
	Tue,  1 Jul 2025 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="kon2QaFn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1423B60B
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751400864; cv=none; b=BJx/LrTzRDY0H0GU7c79Hxj9YCFJ9Hl9/AwXqyMu8R5biWoSUH+0BM+JKSCFDJfCIu4hzQ5F5W3O0if0qqfzlMC2xrDz9LZ5w5MK1paCgaTfFMAl6PY5eTQKBd67X9vnpP2ChVg8xcDrhgZ/HZe7gezli6uF2t4We5NcExQrh8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751400864; c=relaxed/simple;
	bh=E44vz52bygok5XjTMIUNBlKZvOqQO16UokfoLAlVR7s=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=guY85Ul5p6L+Thb52gihfGLnn9KfOxlBixH29Zwj0tPoTCFjrO9ORkxKkcQjX+1qu8RUpb9vQI2cfqA0hl5URvhBxdKWeiGihHYEZMmZRnL6bqTEjnSS4lk/te0hm/ugg3mNSGNWdJyJ3tyl2ohLfUyQSzQtwojB1++3Dvll0R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=kon2QaFn; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751400849; x=1752005649;
	i=markus.stockhausen@gmx.de;
	bh=GrusLsT57+IiwW3mXGsIdXcyFAaRZzzBzidWklkLX9g=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kon2QaFnsGsO/OW4jfy5Gcd8XkrklngMqEn1t7X0gGMZLjnu/zr3lMfq+8YMuhEz
	 DhFVyCmjizQYdzFdlj9yvzRlIVJEGQ6aJ0bJAUWUPS0C7OPGROlC7cHlLU23coZLp
	 L8khp3DkzOGblGf70UrroNYjv6+4N+flcQK3BUfM2Pl+asNpIOg07NzSfX/qP9Mc5
	 0U+FruKd05cWBng//3/UtBsRKM5Fk9pSjhD3bg1XiDy/zW9nb4lxMH1HJR1+W3lFN
	 nD7GjppZGaWLBVMfRfXAjBJjHyDCMXJyeWCKbzjsfc3fqas6j43+lsy7wfNKMiOdv
	 MYXd7BM7pULvGCff0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpnm-1v4Rh43nfW-00hT5X; Tue, 01
 Jul 2025 22:14:09 +0200
From: <markus.stockhausen@gmx.de>
To: "'Jonas Jelonek'" <jelonek.jonas@gmail.com>,
	<linux-i2c@vger.kernel.org>
Cc: "'Chris Packham'" <chris.packham@alliedtelesis.co.nz>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com> <20250701091737.3430-3-jelonek.jonas@gmail.com>
In-Reply-To: <20250701091737.3430-3-jelonek.jonas@gmail.com>
Subject: AW: [PATCH 2/3] i2c: add RTL9310 support to RTL9300 I2C controller driver
Date: Tue, 1 Jul 2025 22:14:06 +0200
Message-ID: <1adc01dbeac4$b3d482e0$1b7d88a0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: de
Thread-Index: AQHZ/URKehGc6KSMpNWKrYi5TFWNAQJwUm6ttA4KwCA=
X-Provags-ID: V03:K1:WPPNE1TaldybfKGBxVO9GGVLYtPavfkGt0aD5mibOrf7H+dGYNU
 RWmfyGbgg3f91Wx2TIYTyq7N2teHiHIqiffC9ds/U6Iq4rRsp3Ac+ZR/c91TFEdkCfFSQCg
 zZeQloc3Tr4EP+Yz7Va/O/AxnFTKU8uea8l6C9469W6asrAUDrRzeq3CRZO9qv7NNj52+yu
 v2wWrIbEAm3vbji32udyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bC9zvmMw+sU=;ODrusdPguPuBBaSiUzbTkzzfoJk
 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

Hi Jonas,

> +	ret = device_property_read_u8(dev, "scl-num", &i2c->scl_num);
> +	if (ret || (i2c->scl_num != 0 && i2c->scl_num != 1))
> +		i2c->scl_num = 0;
> +

if (ret || i2c->scl_num != 1)
    i2c->scl_num = 0;

should be enough.

Markus


