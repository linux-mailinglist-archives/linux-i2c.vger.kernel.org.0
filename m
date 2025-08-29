Return-Path: <linux-i2c+bounces-12510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168FB3B98A
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 12:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7C74189D9EF
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 10:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1913101DB;
	Fri, 29 Aug 2025 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bmlWzEjv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC230F540
	for <linux-i2c@vger.kernel.org>; Fri, 29 Aug 2025 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465090; cv=none; b=korqfBibMcDLo56TYVKAlPu9sS2YHhIyePXIYVC08CAUyWf35hSD9QL0It+7rZ5lVPJX3iov5Az7yd0tkbhEe53RTNLIjsm2RhW+LleLGmV4uYXg4xbpbEM45A1vIO2VKhvX6t4Wrv2K3qqnUY6N1L3cc9/4zNX6nhaoJZVuraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465090; c=relaxed/simple;
	bh=q/08LL+SXzR6//jDK7WpI8nzQaBvjLSRUy0vX6WfhxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTqBu5VBI/QupkKqALWgfEsUh6FOgu1UrI1B+EU87DYTZXjI142qn3Un/KMKmQe0Nyx//TRCGXrerMGRvIQJ4tUITOpmi7j4YXtsu3qc+v+opPaqvAPstkXT992YsdVhtkBwWkq1Kx9kHbddzLccmTotyWdkjYhCHEx5dusRY40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bmlWzEjv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=JvYspSjJqIX13ORpeSK/3a180T+CNY8WXnLqQrGrl
	NI=; b=bmlWzEjvdgk7JZx4qCDrT6KNbhqYchZLcyd/jIISoPHqgIo4UfnakMSQv
	+9vM7+7726uXmSg13Ji+Cb6l//0FoABIY80IUxjmcmHHBJOSGAGN4wupWQu0/DF4
	6mVvR6G0+jxz680FggV2yFj7fJ2aK1qFPcjHFzBwHfTzWYLnpd9YJwOfrMR/kj3e
	ukexWVHzePOPeJuzcQ7Ba10SyT4Uaq/2Pseaq7aS9DYNclr3q5WtakvySIbN4FUC
	YyTJy2N7qdijDaq6IxNIwtYXVazT2t51omfIJZJzx3B40Uct4slKCzEaCW/qayu4
	fLiTYvWm1xuiTM9+Fh9sJ5zl0IyIQ==
Received: (qmail 1426363 invoked from network); 29 Aug 2025 12:58:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2025 12:58:06 +0200
X-UD-Smtp-Session: l3s3148p1@OgmJ5X49Jq0gAwDPXwOZADQgI+b4m0Li
Date: Fri, 29 Aug 2025 12:58:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
Message-ID: <aLGHvqY6N5oI54eT@shikoro>
References: <20250618082313.549140-1-herve.codina@bootlin.com>
 <20250618082313.549140-2-herve.codina@bootlin.com>
 <CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
 <20250808180746.6fa6a6f9@booty>
 <CAL_JsqLxsfpaaCvV3AcniMYxAYVir7ddL4umCNY3u-ggVTiZcg@mail.gmail.com>
 <aK2-we94b-x2fgW_@shikoro>
 <20250829125238.4117947f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829125238.4117947f@bootlin.com>

Hi Hervé,

> the only solution I see is to parse the full DT in order to find extension
> nodes when we need to register adapter children (adapter probe() step).
> 
> A matching extension node will be a node where:
>  1) compatible = "i2c-bus-extension"
>  2) "i2c-parent" phandle points to the expected adapter.

Would that be so bad? It will not be done often, or?

All the best,

   Wolfram


