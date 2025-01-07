Return-Path: <linux-i2c+bounces-8948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C79BA047A2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 18:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBA291888DB9
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 17:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0DF1F4293;
	Tue,  7 Jan 2025 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhH616F0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8D719D8A0;
	Tue,  7 Jan 2025 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269708; cv=none; b=F2oaNp4Ex+QRI0mD5xlfH5SgTcOjynxl735yriIU2YUG0k3lvc21SXRuQwvoXnClJaWOaeKoXKSfqpy50bf0fAKVaKcgc3tgwq9iNZGdxDFA/4vkkgq7aZ/R+TPU3aDkXBFP60eG6zSSqzQanbXLYrRUWKrEgwQWCOKv7UeDO9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269708; c=relaxed/simple;
	bh=5BiLod8fo2Z+1bMUdZCcPAot9zWqVgRsSfhLhhBb7RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WF65CRuu2CgZLnem2TN1KxzUeGxgCXMo9SVz5LiUuU2/NDYe6PJQK+9ncMwfBxeaKBveLuvhU4bywGi2KTrvo8SPCSy624CSq9z8BrI9pOUeF21jd3TlINGrXOHH8mMKz0vCbFTIsfsL9u2T5OL+pRHZzwPMuZYka9oxD1ShzUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhH616F0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216634dd574so153953785ad.2;
        Tue, 07 Jan 2025 09:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736269705; x=1736874505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXZU79WIoGNt7SyXKwZ7mdaE/L/ztf4wKB+Jbm762BE=;
        b=nhH616F0fC8n8CjBekPtlUizd41F37S2EhZuuVVrYzhyY4Ra7Lg2me2b/OVzDN0/B4
         xraqAAJtyq8Ja5drDCXAkdwNG8d7VfLYvga2GvV7kh+Mr7T4B3fjaXelMpQdHmapIkxB
         xPl1GO83gB9CVCVJmP7QPdgZFQSdx/G9wOmafEAHZ3bT2wDfHy1/aO49NVJ3QGdBQ8ey
         5nEpV5Bfkr63WUWgTRmevqKJsxMtYxYkaWDmtdlUrtPMoIkf0xqKyJNocoOUlb9CMzP6
         PgA+DOKTH0vxCFQMARmd4ReT9u6SRpoXnBlnrsz3LH8DLMiVw5ncDc55N2SoHcLLawTr
         PMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269705; x=1736874505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXZU79WIoGNt7SyXKwZ7mdaE/L/ztf4wKB+Jbm762BE=;
        b=pEo2bH+Iq0VDDkc4cIKeKGlcy13w+1zLs5vOKm0T+iqZsC1tGdYbP9+V7slrh5f4q2
         yTav6NQVW1napdNdNFLXnPQQjOhSNUqmHaupNi7UoNG5/fe39RZ+Bd4caABvSoAmM8FA
         Ta5WaVgyP3QBkE2JPjl+EbzM08djU17YaNrlRsWBev1KgZ92j6qwitbD72wcAxi4JV7K
         210ghk07/tKeSkNGZ1VHES/kWVELE3RhGluWGiofJEmbYQdHZpaoCNpsqotipNxSjB3D
         tKGJ1N/KGZGzpatbiPUT6VDxn0c6NEwCjGvhfos3S9i2wR2dhNpFZyKLkz3LNzKPIyYq
         m1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVx5DDWbKyF324MqHS4WCBj6o01TIAYP2whAvwx4uq0Biw+9HerJveNPVhVwEdFYREubwFrgRhpJyIt@vger.kernel.org, AJvYcCX/HxglRB0iC0KNSrrUzjuqEN5mgIaRxLhUejCMbKoXkLljPtb3gVSVBwTWYaA62ww+xtoLBu/8NFoGWKJQ@vger.kernel.org, AJvYcCXDQsHbItL6D4Cumua5QYzNvn0E3+7UDSQg9XGdHHjxg/EX9Rgl/JO7IjSFZSueSG3j9Y9AMu8qhWfP@vger.kernel.org, AJvYcCXXBJA/75ngMKUdZNjny1vrwuOAuZHQ2yt9yjnzwGafy9K5SiSnL8C35MTPX7QfBGZMUARBv+6B7ZmZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpD2fgmHY/PWzjhnPDXK5qbgSdP8ouQGj8ttru30C7y6PqIhlj
	LADpnm5YlGL1phic4k0Sa7j7Dk5D4mVCjahf81zcwJJ8G1Sd3CCTwH6r+w==
X-Gm-Gg: ASbGncs+rZfhClwSfjSI55U4TVfBSMXX0HFM6mNF0Xzuc8XRldeM0WKthzcJJuhUtuT
	zqciP0Q0vLqNC4CwoABMzqAIcG/8GotrRk0rpzremNnhDjguJfcYR4C3YUOSugpRzwOqaueZ8ME
	QpYRl/bOVCtaOrdpXjLXPwiRImZBqTxCha6/das9YrbvpN999DLOkYz1rihE0fVWvEj/MKhHdj6
	0qVX6PCRWLruUcPX8mqq7oMm4+ijLlYwU7mGxQsQZbPgnYVzjPU2GmJWf58K9gLadfXTg==
X-Google-Smtp-Source: AGHT+IGpCS/mMfKd032Vs6k7Vroab/6z+GlJ/DB28xQzalUJFVsBhrLFETrXiZENSifN2zZyJM+E3g==
X-Received: by 2002:a05:6a20:7fa7:b0:1dc:c19c:b7b0 with SMTP id adf61e73a8af0-1e5e080042cmr89903889637.33.1736269703291;
        Tue, 07 Jan 2025 09:08:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm33558318b3a.153.2025.01.07.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:08:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Jan 2025 09:08:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adm1275) add adm1273 support
Message-ID: <1527b5cf-5d23-45de-9340-d1af4c5c18e1@roeck-us.net>
References: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
 <20250106131740.305988-3-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106131740.305988-3-johnerasmusmari.geronimo@analog.com>

On Mon, Jan 06, 2025 at 09:17:40PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for adm1273 which is similar to adm1275 and other chips
> of the series.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks,
Guenter

