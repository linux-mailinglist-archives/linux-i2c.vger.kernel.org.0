Return-Path: <linux-i2c+bounces-3274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C88B4CFB
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 19:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907B31F212F0
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 17:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C607316D;
	Sun, 28 Apr 2024 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL5DRFa7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390A671B49;
	Sun, 28 Apr 2024 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714323744; cv=none; b=RL6Q4LFZ564TsNA7f9kpJ9a/hK00D/rHU4YukCOPZOYDipQDKWVOuLYtdIxMYPJC7mSSKBwyvCjUbSjCrrq6m1G2EunT1Lc+uK/2/dmGaNE24GCCIaO87VqGpFgZAtPCcpKEicRrVyNntORJ5Y3rPicz6a5fyd67mjFkyXAM7rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714323744; c=relaxed/simple;
	bh=Pp5xineCHUmqekoQLWtdIlRJ68sa9cPR44y2JZZFrPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyKa/FWnmpVYIfhLrVqbfQR7A1qcO4PNh1N31KTZjPl3MaatHaSFmRL3OZox5NiM6BfrxPcF0NQDR6zr7hMuUkzZGFZph3SdCSCtUDGQpKL5DOp2lONeWuM8LITf7Fh2u9tHnUZEXUdy+IWSHdr6kA8bHs+agxV5WDF9WWdHqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL5DRFa7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e65b29f703so33131695ad.3;
        Sun, 28 Apr 2024 10:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323742; x=1714928542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1T3Hr1w32v0VXEXybJj/Hj7SF5hFewnPOJ+Ox/8LCk=;
        b=fL5DRFa7+zvW1MV5hJ+KOjVE8Ozd1bPBwvIl+gv8BJVrpeo1vngo/PX8sUWz2JtP4T
         d7TxyIsvz506f7Swn419tJO4ypaSYlkAfBGn7T0bWgf9qZaKUye60xMxjQOT6O3cLZZz
         Xy20N72E/uMxKiMDRIkNHwJde5Nl48fX8u1qGbX8fy8Dm3fL3BqU1NxVOfmy1w+vZn32
         9zyfPqhVEraZ4DBpMzl96i3qjj6UcF8TIHuKQx5tqMpXj+ZgV/fZEKbj4tQgOMOyS/Ar
         Qc1OFR4C/byTceuzKEP1RdmC5aKwnefHuhpKI9IwSsZEPK2zlcYVYrk846smxX6dhH8w
         lqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323742; x=1714928542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1T3Hr1w32v0VXEXybJj/Hj7SF5hFewnPOJ+Ox/8LCk=;
        b=oIW90PasjzXRtZqtwKKCvG2SOr5XOLMxCDWQo2RqK3RWZzepvAGp2WWaiB1Iee/3Tp
         CLe/275jP2lmS/wWakZp5Rqd/2bPh5OQZ/zfvWF5j9Kne84NYltq5R5txM/0na+KCVa1
         FQ4pnwLS25cFYJQsDzfvCX/9l60u7dT0R/fceQz7iqhtyG3kI7uVUSxjoathX8sz1N8Z
         CFHzfzwoqn7QQz1dQVecobFd+wqncmcRNVFzganchLNFq5u4OIUA6pA+6JsLMk4iEaIW
         0KykUgImIHgmnAg4eI5cdG/RiWK8cmFOHmdnW4NIH8sHsgROucsl8FuhpVkS30gC1eoN
         0RpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXOmb92AvCfU0GfiSp/TB6eSxYJ7gYoEHdM3g+66op3m3P8vnq96PLxZ8ucWf516B4GCVDuVscYlzGCs/j9L9CO3bKEWxCnAGBvPkgbIPcJf33hE5bRRhYMOuDXr/7DYUt4hjnO63cSyYUtcX1FpTX5yQMcG5uhaEkO0MNl+S5vTppiMnmyBwM3OINTavxR1j727PeEjB7YzL5DH/mWw==
X-Gm-Message-State: AOJu0YxOg3NKNejJOjQz9t5tAbELSaSpc3K3LDYgiGty0pjY1TiJ7IM+
	0qmxohHdJnmhQIwEeBD9aY29+3cqeLO7yqb3pMhGhLa/c89b2ZQo
X-Google-Smtp-Source: AGHT+IEdftkXZBXxO2TZ48Tfy3JvvIaqRTrgDySRxV20fxHJXBJ4e2U/qL5PCUHq+NmstbjbOJpArg==
X-Received: by 2002:a17:902:7c8f:b0:1e0:bacc:9977 with SMTP id y15-20020a1709027c8f00b001e0bacc9977mr8074575pll.59.1714323742509;
        Sun, 28 Apr 2024 10:02:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709026f0900b001e20be11688sm19027806plk.229.2024.04.28.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:02:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:02:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: adm1275: add adm1281
Message-ID: <e5c0bfd6-495c-478d-8473-c90420f322c2@roeck-us.net>
References: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
 <20240425070948.25788-2-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425070948.25788-2-jose.sanbuenaventura@analog.com>

On Thu, Apr 25, 2024 at 03:09:47PM +0800, Jose Ramon San Buenaventura wrote:
> Add support for the adm1281 Hot-Swap Controller and Digital Power
> and Energy Monitor
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>

Applied.

Thanks,
Guenter

