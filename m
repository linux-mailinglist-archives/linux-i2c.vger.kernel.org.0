Return-Path: <linux-i2c+bounces-12511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF54B3B9B2
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 13:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7358F188AB3D
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 11:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC768311C14;
	Fri, 29 Aug 2025 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qmzm6zVB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890430AD0C
	for <linux-i2c@vger.kernel.org>; Fri, 29 Aug 2025 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465715; cv=none; b=Sc9SAer8PPJHKe4Jn59PHkJ/FjMIfK6tzI4xLaFqpjemBgeKQaahwH2nk3CuhnbCV5/0uqXrSl8rp6ju2meczGHfWRW8Tipj8jgvcPMvLwxAeXjy3heiGVhKaXsG28cNtcQmYDXZlJyn7bF9c24UQXP/VoBNSOVnJC6USLVa+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465715; c=relaxed/simple;
	bh=vYp1GJUgd0jvWoYxmkF2wAdQScdbtSOlmuOcuwJ/qZg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5ZqVD7gkCe1+afetff6iL615cq2aW2y1ME+5Mu/6k1aKtt+nVpMJ98o05JYlVGEbQCyG2RthFmF1bD4gpgtB/WF9iJocKkU3t6v9czFG6etveHB415oLp6OnqqFGeqDU0Fzdz+Bcs8DgDsgaVxNHhtucPF7ow7d0tI14YOgdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qmzm6zVB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 548271A0E12
	for <linux-i2c@vger.kernel.org>; Fri, 29 Aug 2025 11:08:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F0A9606B9;
	Fri, 29 Aug 2025 11:08:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6BD31C22D962;
	Fri, 29 Aug 2025 13:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756465710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R6yBXaQXe2oIXf/DQf9Ce386Jx+9APGT/J/ebwN0uM0=;
	b=qmzm6zVBnsoG+Pob4yDIgmvkx8TGiac+/mO4nsCQ3BvSrWO50YEmBpKQRRuXEJ4LxVS0lM
	0lH8g3gNXoHrREa0XTXSB0aqhF+/4LjjiQNRpoVi5AvPadCRRgIgF6RDkK6z+Rb/ActnVs
	0SVnKTdoQV2DYS1jzf12QVtOpE2+LdTWAQ385zulknQp+KDihidM8PsytgOomujCFyWcmk
	ETw2MY9mnZsUgH6JnD4ZWYFLihs9fk3Aq1UypVUQmKGx6g1MM+Rpx3nY9yrQQee9y8pOyS
	il1Uvi5ERIh+TUpoe38LSYu06vgJk2ApIGx4E/Q/+WyRGUm5mL/YWEf5HPgbgw==
Date: Fri, 29 Aug 2025 13:08:21 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Rob Herring <robh@kernel.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Ayush Singh <ayush@beagleboard.org>, Andi
 Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
Message-ID: <20250829130821.472a96dc@bootlin.com>
In-Reply-To: <aLGHvqY6N5oI54eT@shikoro>
References: <20250618082313.549140-1-herve.codina@bootlin.com>
	<20250618082313.549140-2-herve.codina@bootlin.com>
	<CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
	<20250808180746.6fa6a6f9@booty>
	<CAL_JsqLxsfpaaCvV3AcniMYxAYVir7ddL4umCNY3u-ggVTiZcg@mail.gmail.com>
	<aK2-we94b-x2fgW_@shikoro>
	<20250829125238.4117947f@bootlin.com>
	<aLGHvqY6N5oI54eT@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Fri, 29 Aug 2025 12:58:06 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi Hervé,
> 
> > the only solution I see is to parse the full DT in order to find extension
> > nodes when we need to register adapter children (adapter probe() step).
> > 
> > A matching extension node will be a node where:
> >  1) compatible = "i2c-bus-extension"
> >  2) "i2c-parent" phandle points to the expected adapter.  
> 
> Would that be so bad? It will not be done often, or?

Ok I will propose a binding update in that sense (dtschema repo) and an
implementation (kernel repo).

Best regards,
Hervé

